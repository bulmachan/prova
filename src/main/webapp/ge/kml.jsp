<%@ page import="java.text.DecimalFormat, java.text.DecimalFormatSymbols, java.util.zip.*,org.apache.log4j.Category"
%><%@ include file="params.jsp"
%><%@ include file="kmlConnector.jsp"
%><%

int level;
double xMin, xMax, yMin, yMax;
String number;
StringBuffer textLog=new StringBuffer();
SeConnection connSDE=null;
Category log = Category.getInstance("cartpedo");
try {
	
	long dateIniTot = new java.util.Date().getTime();
	
	tempVar = request.getParameter("level");
	if (tempVar == null || tempVar.equals(""))
		level = -1;
	else
		level = Integer.valueOf(tempVar).intValue();

	tempVar = request.getParameter("number");
	if (tempVar == null || tempVar.equals(""))
		number = "";
	else
		number = tempVar;

	tempVar = request.getParameter("xmin");
	if (tempVar == null || tempVar.equals(""))
		xMin = 0.0;
	else
		xMin = Double.parseDouble(tempVar);

	tempVar = request.getParameter("xmax");
	if (tempVar == null || tempVar.equals(""))
		xMax = 0.0;
	else
		xMax = Double.parseDouble(tempVar);

	tempVar = request.getParameter("ymin");
	if (tempVar == null || tempVar.equals(""))
		yMin = 0.0;
	else
		yMin = Double.parseDouble(tempVar);
	
	tempVar = request.getParameter("ymax");
	if (tempVar == null || tempVar.equals(""))
		yMax = 0.0;
	else
		yMax = Double.parseDouble(tempVar);

	micSpatialEngine mSE = new micSpatialEngine(connUser,connPw,nomeServer,portaSDE);
	//micSpatialEngine mSE = new micSpatialEngine(connUser,connPw,nomeServer,instance);
		
	StringBuffer sb = new StringBuffer();

	//response.setContentType("application/vnd.google-earth.kml+xml");
	//response.setHeader("Content-Disposition", "attachment; filename=\""+nomeMappa+" ("+subNomeMappa.replace("Scala 1:","")+").kml\"");
	
	//response.setHeader("Content-Disposition", "attachment; filename=pollo.kmz");
	
	sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\r\n");
	sb.append("<kml xmlns=\"http://earth.google.com/kml/2.2\" xmlns:gx=\"http://www.google.com/kml/ext/2.2\" xmlns:kml=\"http://www.opengis.net/kml/2.2\" xmlns:atom=\"http://www.w3.org/2005/Atom\">"+"\r\n");

	kmlConnector kC=new kmlConnector();
	
	String northString, southString, eastString, westString, minLod, maxLod;
	double xMax1, xMin1, yMax1, yMin1;
	int scalaGen;
	
	// parametri per la direct connection (26/11/2009: si rinuncia perche' da errore e non e' necessaria)
	//String nomeServerDC = "vm109srv";
	//String connUserDC = "cat_reader";
	//String connPwDC = "geo01-catr@GEO6402";
	//String instanceDC = "sde:oracle10g";

	
	// APERTURA CONNESSIONE SDE
	long dateIni15 = new java.util.Date().getTime();
		connSDE=new SeConnection(nomeServer, portaSDE, null, connUser, connPw);
		//mSE.apriConnSDE();
	long dateFin15 = new java.util.Date().getTime();
	textLog.append("Apertura connSDE: to "+nomeServer+" "+ ((double)(dateFin15-dateIni15)/1000)+" sec."+"\t");
	
	
	if (level > -1){
		int i=1;
		sb.append("<Document>"+"\r\n");

		if(showGrid){
			sb.append("\t<Style id=\"gridStyle\">"+"\r\n");
			sb.append("\t\t<PolyStyle>"+"\r\n");
			sb.append("\t\t\t<color>ff0000cc</color>"+"\r\n");
			sb.append("\t\t\t<colorMode>normal</colorMode>"+"\r\n");
			sb.append("\t\t\t<fill>0</fill>"+"\r\n");
			sb.append("\t\t\t<outline>1</outline>"+"\r\n");
			sb.append("\t\t</PolyStyle>"+"\r\n");
			sb.append("\t</Style>"+"\r\n");
			sb.append("\t<Style id=\"sn_noicon\">"+"\r\n");
			sb.append("\t\t<IconStyle>"+"\r\n");
			sb.append("\t\t\t<Icon></Icon>"+"\r\n");
			sb.append("\t</IconStyle>"+"\r\n");
			sb.append("</Style>"+"\r\n");
		}
			
		if(level==0){
			if(startup){
				minLod=String.valueOf(params[level][0]);
				maxLod=String.valueOf(params[level][1]);
				scalaGen=params[level][2];
				
				long dateIni1 = new java.util.Date().getTime();
					kC.showRegion(xMin, xMax, yMin, yMax, sb, appPath, sdeUser, layer, layerlin, layerlin2, scalaGen, number, 0, level, minLod, maxLod, connSDE, 1, colonne, colonnelin, connUser, connPw, nomeServer, portaSDE, textLog, descEtichetta, balloonWidth, balloonHeight, stylesPath, ip);
				long dateFin1 = new java.util.Date().getTime();
				textLog.append("showRegion RER: "+((double)(dateFin1-dateIni1)/1000)+" sec."+ "\t");
			}			
			if(!bordiRaster.equals("")){
				sb.append("<Folder>"+"\r\n");
				sb.append("<name>Raster</name>"+"\r\n");
				sb.append("<NetworkLink>"+"\r\n");
				sb.append("<name>Raster</name>"+"\r\n");
				sb.append("<Link>"+"\r\n");
				sb.append("<href>"+bordiRaster+"</href>"+"\r\n");
				sb.append("</Link>"+"\r\n");

				sb.append("</NetworkLink>"+"\r\n");
				sb.append("</Folder>"+"\r\n");
			}
			sb.append("<Folder>"+"\r\n");
			sb.append("<name>Piramidi</name>"+"\r\n");
			
		}

		int numTiles=0;
		long dateIni = new java.util.Date().getTime();
		for (int x = yDivisions[level]-1; x >= 0 ; x--){
			for (int y = 0; y < xDivisions[level]; y++) {
				numTiles ++;
				xMax1=(xMax - xMin) * (y + 1) / xDivisions[level] + xMin;
				xMin1=(xMax - xMin) * (y) / xDivisions[level] + xMin;
				yMax1=(yMax - yMin) * (x + 1) / yDivisions[level] + yMin;
				yMin1=(yMax - yMin) * (x) / yDivisions[level] + yMin;
				
				//textLog.append("Tile "+ number+i+". - ");
				
				//long dateIni11 = new java.util.Date().getTime();
				//	int nPoints=mSE.contaElementiPerBox(sdeUser+"."+layer, xMin1, yMin1, xMax1, yMax1, connSDE);
				//long dateFin11 = new java.util.Date().getTime();
				//textLog.append("nPoints: "+nPoints+": "+((double)(dateFin11-dateIni11)/1000)+" sec."+"\t");
				int nPoints=1;
				if (nPoints > 0) {				

					minLod=String.valueOf(params[level][0]);
					maxLod=String.valueOf(params[level][1]);
					scalaGen=params[level][2];
					
					sb.append("<Folder>"+"\r\n");
					sb.append("<name>"+number+i+"."+"</name>"+"\r\n");//" - "+minLod+":"+maxLod+"</name>"+"\r\n");
					
					if(level>0){
					long dateIni1 = new java.util.Date().getTime();
						kC.showRegion(xMin1, xMax1, yMin1, yMax1, sb, appPath, sdeUser, layer, layerlin, layerlin2, scalaGen, number, i, level, minLod, maxLod, connSDE, nPoints, colonne, colonnelin, connUser, connPw, nomeServer, portaSDE, textLog, descEtichetta, balloonWidth, balloonHeight, stylesPath, ip);
					long dateFin1 = new java.util.Date().getTime();
					//textLog.append("showRegion: "+((double)(dateFin1-dateIni1)/1000)+" sec."+" - "+sb.length()+" bytes"+"\t");
					}
					if(showGrid){
						//long dateIni2 = new java.util.Date().getTime();
							kC.showGrid(xMin1, xMax1, yMin1, yMax1, sb, stylesPath, number, nPoints, i);
						//long dateFin2 = new java.util.Date().getTime();
						//textLog.append("showGrid: "+((double)(dateFin2-dateIni2)/1000)+" sec."+"\t");
					}
					if(level < levels-1){
						minLod=String.valueOf(params[level+1][0]);
						maxLod=String.valueOf(params[level+1][1]);
						//long dateIni3 = new java.util.Date().getTime();
							kC.cNetworkLink(xMin1, xMax1, yMin1, yMax1, level, sb, number, nPoints, servletURL, i, minLod, maxLod, liv);
						//long dateFin3 = new java.util.Date().getTime();
						//textLog.append("cNetworkLink: "+((double)(dateFin3-dateIni3)/1000)+" sec."+"\t");
					}
					sb.append("</Folder>"+"\r\n");
					i++;
				}

			}
		}
		long dateFin = new java.util.Date().getTime();
		textLog.append("Tile: " + number + " - Tot tiles: " + numTiles + " - Tot: "+((double)(dateFin-dateIni)/1000)+" sec."+"\t");
		
		if (level==0) {
			sb.append("</Folder>"+"\r\n");
		}

		if(level>=0)
			kC.appendLogo(sb, appPath, fileLogo);

		kC.appendLicenza(sb);
		
		sb.append("</Document>"+"\r\n");
	} else {

		String extent=mSE.stringaExtentLayer(sdeUser+"."+layer, connSDE);
		String[] extents=extent.split(",");
		
		xMin=Double.parseDouble(extents[0]);
		yMin=Double.parseDouble(extents[1]);
		xMax=Double.parseDouble(extents[2]);
		yMax=Double.parseDouble(extents[3]);

		String[] nsew=kC.trasformaExtent(xMin,yMin,xMax,yMax);
		double northDoub=Double.parseDouble(nsew[0]);
		double southDoub=Double.parseDouble(nsew[1]);
		double eastDoub=Double.parseDouble(nsew[2]);
		double westDoub=Double.parseDouble(nsew[3]);
						
		minLod=String.valueOf(params[level+1][0]);
		maxLod=String.valueOf(params[level+1][1]);
		sb.append("\t<Folder>\r\n");
		sb.append("\t\t<name>"+nomeMappa+"</name>\r\n");
		sb.append("\t\t<Snippet maxLines=\"1\">"+subNomeMappa+"</Snippet>\r\n");
		
		if(!client.equalsIgnoreCase("plugin")){
			sb.append("\t\t<Style id=\"folderStyle\">\r\n");
			sb.append("\t\t\t<ListStyle>\r\n");
			sb.append("\t\t\t\t<listItemType>check</listItemType>\r\n");
			sb.append("\t\t\t\t<ItemIcon>\r\n");
			sb.append("\t\t\t\t\t<state>open</state>\r\n");
			sb.append("\t\t\t\t\t<href>"+appPath+"images/sgss_mini.png</href>\r\n");
			sb.append("\t\t\t\t</ItemIcon>\r\n");
			sb.append("\t\t\t\t<ItemIcon>\r\n");
			sb.append("\t\t\t\t\t<state>closed</state>\r\n");
			sb.append("\t\t\t\t\t<href>"+appPath+"images/sgss_mini.png</href>\r\n");
			sb.append("\t\t\t\t</ItemIcon>\r\n");
			sb.append("\t\t\t\t<bgColor>ffffffff</bgColor>\r\n");
			sb.append("\t\t\t\t<maxSnippetLines>1</maxSnippetLines>\r\n");
			sb.append("\t\t\t</ListStyle>\r\n");
			sb.append("\t\t</Style>\r\n");		
			sb.append("\t\t<open>0</open>\r\n");
			sb.append("\t\t<visibility>0</visibility>\r\n");
			sb.append("\t\t<styleUrl>#folderStyle</styleUrl>\r\n");
		}

		sb.append("\t\t<NetworkLink>\r\n");
		sb.append("\t\t\t<name>Cartografia</name>\r\n");
		sb.append("\t\t\t<Snippet></Snippet>\r\n");
		sb.append("\t\t\t<description>"+descMappa+"</description>\r\n");
		sb.append("\t\t\t<LookAt>\r\n");
		sb.append("\t\t\t\t<longitude>"+(westDoub+((eastDoub-westDoub)/2))+"</longitude>\r\n");
		sb.append("\t\t\t\t<latitude>"+(southDoub+((northDoub-southDoub)/2))+"</latitude>\r\n");
		sb.append("\t\t\t\t<altitude>0</altitude>\r\n");
		sb.append("\t\t\t\t<range>300000</range>\r\n");
		sb.append("\t\t\t\t<tilt>0</tilt>\r\n");
		sb.append("\t\t\t\t<heading>0</heading>\r\n");
		sb.append("\t\t\t\t<altitudeMode>relativeToGround</altitudeMode>\r\n");
		sb.append("\t\t\t</LookAt>\r\n");
		kC.cRegion(xMin, xMax, yMin, yMax, sb, minLod, maxLod);
		sb.append("\t\t\t<styleUrl>#bal_style</styleUrl>\r\n");
		sb.append("\t\t\t<Style id=\"bal_style\">\r\n");
		sb.append("\t\t\t<BalloonStyle>\r\n");
		sb.append("\t\t\t<text>$[description]</text>\r\n");
		sb.append("\t\t\t<bgColor>ffB1CBE3</bgColor>\r\n");
		sb.append("\t\t\t<displayMode>default</displayMode>\r\n");
		sb.append("\t\t\t</BalloonStyle>\r\n");
		sb.append("\t\t\t</Style>\r\n");
		if(!client.equalsIgnoreCase("plugin")){
			sb.append("\t\t\t<gx:balloonVisibility>1</gx:balloonVisibility>\r\n");
		}	
		kC.cLink(xMin, xMax, yMin, yMax, level, sb, "", 0, servletURL, 0, liv);
		
		sb.append("\t\t</NetworkLink>\r\n");		
		sb.append("\t</Folder>\r\n");
		
		textLog.append("Download KML"+"\t");
		
	}
	
	// CHIUSURA CONNESSIONE SDE
	long dateIni16 = new java.util.Date().getTime();
	//mSE.chiudiConnSDE();
	try{
		
		if(connSDE!=null)
			connSDE.close();

	} catch (SeException sExcConn){
		//System.out.println("Errore di chiusura connessione a SDE: "+sExcConn.getMessage());
		//sExcConn.printStackTrace();
		log.error("Errore di chiusura connessione a SDE 1: "+sExcConn.getMessage()+ " - " + sExcConn.getSeError().getErrDesc());
	}
	long dateFin16 = new java.util.Date().getTime();
	textLog.append("Chiusura connSDE: "+((double)(dateFin16-dateIni16)/1000)+" sec."+"\t");

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
		response.setHeader ("Content-Disposition", "attachment; filename=\""+nomeMappa+" ("+subNomeMappa.replace("Scala 1:","")+").kmz\"");

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
	
	textLog.append("ERRORE GENERALE: "+e.getMessage());
	e.printStackTrace();
	//System.out.println("ERRORE GENERALE: "+e.getMessage());
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

%>