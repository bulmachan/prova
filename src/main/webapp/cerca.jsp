<%@ page
	language = "java"
	contentType="text/html; charset=ISO8859-1"
	pageEncoding="ISO8859-1"
	import = "java.io.*,
	java.net.*,
	javax.net.ssl.*,
	java.security.*,
	java.security.cert.*
			, java.lang.String.*
			, java.net.URL
			, javax.xml.soap.*
			, javax.xml.messaging.URLEndpoint
			, javax.xml.transform.*
			, javax.xml.transform.stream.*
			, java.net.MalformedURLException
			, javax.net.ssl.HttpsURLConnection
			, java.security.cert.Certificate
			, javax.net.ssl.SSLPeerUnverifiedException"
%>
<%

try {
	String wsUrl = "https://search.ente.regione.emr.it/solr/rerweb/select?";
	String xslLocalPath = application.getRealPath(request.getServletPath()).replace(request.getServletPath().replace("/",""),"")+"styles/";
		
	// PARAMETRO DELLA RICERCA
	String query="";
	if (request.getParameter("query") != null){
		query=request.getParameter("query");
	} else {
		if (request.getParameter("QUERY") != null){
			query=request.getParameter("QUERY");
		} else {
			throw new Exception("Parametro QUERY non corretto");
		}
	}

	// Create a trust manager that does not validate certificate chains
	TrustManager[] trustAllCerts = new TrustManager[]{
		new X509TrustManager() {
			public java.security.cert.X509Certificate[] getAcceptedIssuers() {
				return null;
			}
			public void checkClientTrusted(
				java.security.cert.X509Certificate[] certs, String authType) {
			}
			public void checkServerTrusted(
				java.security.cert.X509Certificate[] certs, String authType) {
			}
		}
	};

	// Install the all-trusting trust manager
	try {
		SSLContext sc = SSLContext.getInstance("SSL");
		sc.init(null, trustAllCerts, new java.security.SecureRandom());
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	} catch (Exception e) {
		out.print("Errore generale3: "+e.getMessage());
		e.printStackTrace();
	}

	// Now you can access an https URL without having the certificate in the truststore
	try {
		URL url = new URL(wsUrl+"q="+query+"&fq=url%3A%22geo.regione.emilia-romagna.it/cartpedo%22&hl=on&rows=10&hl.fl=content&hl.fragsize=500&hl.simple.post=%3C%2Fb%3E&start=0&version=2.2&hl.simple.pre=%3Cb%3E&fl=*%2Cscore");
		String loginPassword = "UsrSolr"+ ":" + "c5U4qQn4";
		String encoded = new sun.misc.BASE64Encoder().encode (loginPassword.getBytes());
		javax.net.ssl.HttpsURLConnection con=null;	
		try{
			con = (javax.net.ssl.HttpsURLConnection) url.openConnection();
			con.setRequestProperty ("Authorization", "Basic " + encoded);
		} catch (IOException e) {
			out.print("Errore generale4: "+e.getMessage());
			e.printStackTrace();
		}
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String rlInput;
		String solrResult = "";
		while ((rlInput = br.readLine()) != null){
			solrResult = solrResult+rlInput;
		}
		br.close();
		solrResult = solrResult.replaceAll("&lt;b&gt;"+query+"&lt;/b&gt;", "<b>"+query+"</b>");
		solrResult = solrResult.replaceAll("&lt;b&gt;"+Character.toUpperCase(query.charAt(0)) + query.substring(1)+"&lt;/b&gt;", "<b>"+Character.toUpperCase(query.charAt(0)) + query.substring(1)+"</b>");
		
		/* Gestione della risposta */ 
		InputStream readerResult = new ByteArrayInputStream(solrResult.getBytes());	
		Writer outWriterResult = new StringWriter();
		
		// Transformer with XSLT <GetRisultatiSempliceResponse>
		Source sourceXSLT = new StreamSource(new FileInputStream(xslLocalPath+"cerca.xsl"));
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transformer = tFactory.newTransformer(sourceXSLT);
		transformer.setParameter("query", query);
		
		Source streamSource = new StreamSource(readerResult);
		Result streamResult = new StreamResult(outWriterResult);
		transformer.transform(streamSource, streamResult);
	
		out.print(outWriterResult.toString());
		
	} catch (MalformedURLException e) {
		out.print("Errore generale2: "+e.getMessage());
	    e.printStackTrace();
    } catch (IOException e) {
	     e.printStackTrace();
    }
} catch (Exception e) {
	out.print("Errore generale1: "+e.getMessage());
    e.printStackTrace();
}

%>