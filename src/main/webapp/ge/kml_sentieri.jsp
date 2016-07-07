<%@ page import="java.text.DecimalFormat, java.text.DecimalFormatSymbols, java.util.zip.*,org.apache.log4j.Category, java.io.BufferedReader, java.io.InputStream, java.io.InputStreamReader, java.net.URL"
%><%@ include file="params.jsp"
%><%@ include file="kmlConnector.jsp"
%><%


StringBuffer textLog=new StringBuffer();
SeConnection connSDE=null;
Category log = Category.getInstance("cartpedo");

String percorso="";
if(request.getParameter("percorso")!=null){
	if (request.getParameter("percorso").equals("")){
		percorso="AVP01";
	} else {
		percorso=request.getParameter("percorso");
	}
} else {
	percorso="";
}


if(!percorso.equals("")){



 // PARAMETRI FISSI CARTPEDO:	
		sdeUser="ESC_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="Rete Escursionistica Emilia-Romagna";
		subNomeMappa="Percorso " + percorso + " e punti di interesse";
		descMappa="<![CDATA[]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://geo.regione.emilia-romagna.it/gstatico/documenti/escursionismo/kml/stili.kml"; questo lo togliamo perche' prendiamo il contenuto e lo scriviamo in ogni KML
		stylesPath="";
		output="KMZ";
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=0; 				//scalaGen

		
 // FINE PARAMETRI FISSI CARTPEDO:	









try {
	
	long dateIniTot = new java.util.Date().getTime();


	micSpatialEngine mSE = new micSpatialEngine(connUser,connPw,nomeServer,portaSDE);
	//micSpatialEngine mSE = new micSpatialEngine(connUser,connPw,nomeServer,instance);
		
	StringBuffer sb = new StringBuffer();

	//response.setContentType("application/vnd.google-earth.kml+xml");
	//response.setHeader("Content-Disposition", "attachment; filename=\""+nomeMappa+" ("+subNomeMappa.replace("Scala 1:","")+").kml\"");
	
	//response.setHeader("Content-Disposition", "attachment; filename=pollo.kmz");
	
	sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\r\n");
	sb.append("<kml xmlns=\"http://earth.google.com/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\" xmlns:kml=\"http://www.opengis.net/kml/2.2\" xmlns:atom=\"http://www.w3.org/2005/Atom\">"+"\r\n");

	kmlConnector kC=new kmlConnector();
	int scalaGen;

	
	// APERTURA CONNESSIONE SDE
	long dateIni15 = new java.util.Date().getTime();
		connSDE=new SeConnection(nomeServer, portaSDE, null, connUser, connPw);
		//mSE.apriConnSDE();
	long dateFin15 = new java.util.Date().getTime();
	textLog.append("Apertura connSDE: "+((double)(dateFin15-dateIni15)/1000)+" sec."+"\t");

	



	
	sb.append("\t<Folder>\r\n");
	sb.append("\t\t<name>"+nomeMappa+"</name>\r\n");
	sb.append("\t\t<Snippet maxLines=\"1\">"+subNomeMappa+"</Snippet>\r\n");
	
	
	// prendiamo il contenuto del KML di stili e lo scriviamo nel KML generale, altrimenti l'include non funziona bene
	URL url = new URL("http://geo.regione.emilia-romagna.it/gstatico/documenti/escursionismo/kml/stili.kml");
	InputStream isStili = url.openConnection().getInputStream();
    BufferedReader reader = new BufferedReader( new InputStreamReader( isStili )  );
    String line = null;
    while( ( line = reader.readLine() ) != null )  {
       sb.append("\t\t"+line);
    }
    reader.close();
	
	
	sb.append("\t\t<styleUrl>"+stylesPath+"#rootFolderStyle</styleUrl>\r\n");


	sb.append("\t\t<Folder>\r\n");
	sb.append("\t\t\t<name>Punti di interesse</name>\r\n");
	sb.append("\t\t\t<Snippet maxLines=\"1\" ></Snippet>\r\n");
	sb.append("\t\t\t<styleUrl>"+stylesPath+"#nodesFolderStyle</styleUrl>\r\n");

	colonne=new String[] {"SHAPE","OBJECTID","TIPO","NOME","DESCRIZIONE"};
	
	/*colonne[0]="SHAPE"; 		// CAMPO SHAPE
	colonne[1]="OBJECTID"; 		// CAMPO ID
	colonne[2]="TIPO"; 			// CAMPO TEMATIZZAZIONE
	colonne[3]="NOME";			// CAMPO NOME
	colonne[4]="DESCRIZIONE";	// CAMPO BALLOON
	//colonne[5]=null;			// CAMPO LINK NEL BALLON
	*/
	
	scalaGen=0;

	long dateIni1 = new java.util.Date().getTime();
		kC.toPlacemark(sb, sdeUser, "ESC_VF_POI_GE_PUN", colonne, connUser, connPw, nomeServer, portaSDE, connSDE, scalaGen, stylesPath, textLog, "se_num = '"+percorso+"'");
	long dateFin1 = new java.util.Date().getTime();
	textLog.append("toPlacemark Sentieri punti: "+((double)(dateFin1-dateIni1)/1000)+" sec."+ "\t");
	

	sb.append("\t\t</Folder>"+"\r\n");
	
	
	sb.append("\t\t<Folder>\r\n");
	sb.append("\t\t\t<name>Percorso</name>\r\n");
	sb.append("\t\t\t<Snippet maxLines=\"1\" ></Snippet>\r\n");
	sb.append("\t\t\t<styleUrl>"+stylesPath+"#linesFolderStyle</styleUrl>\r\n");



	scalaGen=params[0][2];

	colonne=new String[] {"SHAPE","OBJECTID","DIFFICOLTA","SE_NUM","BALLOON"};

	/*colonne[0]="SHAPE"; 		// CAMPO SHAPE
	colonne[1]="OBJECTID"; 		// CAMPO ID
	colonne[2]="DIFFICOLTA"; 	// CAMPO TEMATIZZAZIONE
	colonne[3]="SE_NUM"; 		// CAMPO NOME
	colonne[4]="LOCALITA"; 		// CAMPO BALLOON
	colonne[5]="PERC_LINK"; 	// CAMPO LINK NEL BALLON
	*/
	
	long dateIni12 = new java.util.Date().getTime();
		kC.toPlacemark(sb, sdeUser, "ESC_VF_SENPERCORSI_LIN", colonne, connUser, connPw, nomeServer, portaSDE, connSDE, scalaGen, stylesPath, textLog, "se_num = '"+percorso+"'");
	long dateFin12 = new java.util.Date().getTime();
	textLog.append("toPlacemark Sentieri linee: "+((double)(dateFin12-dateIni12)/1000)+" sec."+ "\t");
	

	sb.append("\t\t</Folder>"+"\r\n");

		
	kC.appendLogo(sb, "http://geo.regione.emilia-romagna.it/gstatico/documenti/escursionismo", "banner_reer.jpg");
	
	kC.appendLicenza(sb);
		
	textLog.append("Download KML"+"\t");
		
	
	// CHIUSURA CONNESSIONE SDE
	long dateIni16 = new java.util.Date().getTime();
	//mSE.chiudiConnSDE();
	/*try{
		
		if(connSDE!=null)
			connSDE.close();

	} catch (SeException sExcConn){
		//System.out.println("Errore di chiusura connessione a SDE: "+sExcConn.getMessage());
		//sExcConn.printStackTrace();
		log.error("Errore di chiusura connessione a SDE 1: "+sExcConn.getMessage()+ " - " + sExcConn.getSeError().getErrDesc());
	}*/
	long dateFin16 = new java.util.Date().getTime();
	textLog.append("Chiusura connSDE: "+((double)(dateFin16-dateIni16)/1000)+" sec."+"\t");

	sb.append("\t</Folder>"+"\r\n");

	sb.append("</kml>"+"\r\n");

	
	// COMPUTA LA GRANDEZZA DEL KML
	String bytes="";
	if (sb.length()<1000)
		 bytes=sb.length()+" bytes";
	else if ((sb.length()/1000)<100000)
		 bytes=Math.round(sb.length()/1000)+" Kb";
	else if ((sb.length()/1000)<10000000)
		 bytes=Math.round(sb.length()/1000000)+" Mb";
	else
		 bytes=Math.round(sb.length()/100000000)+" Gb";
	
	bytes="Size KML: "+bytes;

	//textLog.append("FIN QUI ARRIVO 1");

	if(output.equalsIgnoreCase("KML")){
		
		response.setContentType("application/vnd.google-earth.kml+xml");
		out.print(sb);

    } else {
		long dateIni17 = new java.util.Date().getTime();

	//textLog.append("FIN QUI ARRIVO 2");

		ZipOutputStream outZip = new ZipOutputStream(response.getOutputStream());
		
		response.setContentType("application/octet-stream");
		response.setHeader ("Content-Disposition", "attachment; filename=\""+nomeMappa+" - Percorso "+percorso+".kmz\"");
		//response.setHeader ("Content-Disposition", "attachment; filename=\""+"REER"+"_"+percorso+".kmz\"");

	//textLog.append("FIN QUI ARRIVO 3");
		
		// Creates an InputStream from the KML StringBuffer:
		ByteArrayInputStream is = new ByteArrayInputStream(sb.toString().getBytes());

		// Creates a new ZipEntry called "doc.kml"
		ZipEntry zipEntry = new ZipEntry("doc.kml");

		// Add ZIP entry to output stream
		outZip.putNextEntry(zipEntry);

	//textLog.append("FIN QUI ARRIVO 4");
		
		try {

			// Transfer bytes from the input ZIP file to the ZIPOutputStream
			byte[] data = new byte[1024];
			int len = -1;
			while ((len = is.read(data, 0, 1024)) != -1){
			
				outZip.write(data, 0, len);
			
			}
			outZip.flush();
			outZip.closeEntry();
			outZip.close();
		
		} catch (IOException ioE) {

			textLog.append("ERRORE ZIPPOLO: "+ioE.getMessage()+ " CAUSA: "+ioE.getCause());
			
		}
	//textLog.append("FIN QUI ARRIVO 5");
			// Complete the entry
	//textLog.append("FIN QUI ARRIVO 6");
		
		// Get the size of the output Zip
		long zipSize=zipEntry.getCompressedSize();
		
		// Close ZipOutputStream
	//textLog.append("FIN QUI ARRIVO 7");

		long dateFin17 = new java.util.Date().getTime();
		textLog.append("Zip: "+((double)(dateFin17-dateIni17)/1000)+" sec."+"\t");

		String zipBytes="";

		if (zipSize<1000)
			 zipBytes=zipSize+" bytes";
		else if ((sb.length()/1000)<100000)
			 zipBytes=Math.round(zipSize/1000)+" Kb";
		else if ((sb.length()/1000)<10000000)
			 zipBytes=Math.round(zipSize/1000000)+" Mb";
		else
			 zipBytes=Math.round(zipSize/100000000)+" Gb";
	
		bytes+=" - Size KMZ: "+zipBytes;
		
	}
	long dateFinTot = new java.util.Date().getTime();
	textLog.append("Tot: "+((double)(dateFinTot-dateIniTot)/1000)+" sec."+"\t"+bytes+"\t");


} catch (Exception e) {

	// CHIUSURA CONNESSIONE SDE
	//mSE.chiudiConnSDE();
	/*try{
		if(connSDE!=null)
			connSDE.close();
	} catch (SeException sExcConn){
		//System.out.println("Errore di chiusura connessione a SDE: "+sExcConn.getMessage());
		//sExcConn.printStackTrace();
		log.error("Errore di chiusura connessione a SDE 2: "+sExcConn.getMessage()+ " - " + sExcConn.getSeError().getErrDesc());
	}*/
	
	textLog.append("ERRORE GENERALE: "+e.getMessage() + " -- "+nomeServer+ " -- "+portaSDE+ " -- "+connUser+ " -- "+connPw);
	e.printStackTrace();
	//System.out.println("ERRORE GENERALE: "+e.getMessage() + " -- "+nomeServer+ " -- "+portaSDE+ " -- "+connUser+ " -- "+connPw);
	log.error(textLog);

}

if(verboseLog) {
	log.info("IP: "+request.getRemoteAddr() + "\t" + "client: "+ client + "\t" + "Layer: " + sdeUser+"."+ layer + "\t" + textLog);
	
	/*SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy (HH:mm:ss.S)");
	
	PrintWriter pw = new PrintWriter(new FileWriter(new File(pathLog), true));
	pw.println(sdf.format(new java.util.Date())+ "\t" + "IP: "+request.getRemoteAddr() + "\t" + "Layer: " + sdeUser+"."+layer + "\t" + textLog);
	pw.close();
	*/
}

}
%>