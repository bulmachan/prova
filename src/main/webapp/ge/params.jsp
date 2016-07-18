<%@ include file="classes/DesEncrypterPhrase.jsp"
%><%


// PARAMETRI CONNESSIONE SDE:
	ResourceBundle connectionConfig = ResourceBundle.getBundle("connectionSDE");
	String nomeServer=connectionConfig.getString("server");
	String frase=connectionConfig.getString("frase");
	DesEncrypter encrypter = new DesEncrypter(frase);
	String connUser=connectionConfig.getString("username");
	String connPw=encrypter.decrypt(connectionConfig.getString("password"));
	int portaSDE = Integer.parseInt(connectionConfig.getString("porta"));
// FINE


String tempVar;

String client="ge", layer, layerlin="", layerlin2="", sdeUser="", nomeMappa="", subNomeMappa="", descMappa="", descEtichetta="", balloonWidth="", balloonHeight="", bordiRaster="";

int liv=1;
if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv=Integer.parseInt(request.getParameter("liv"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
			response.sendRedirect("../error_message.jsp");
			return;
		}
	}
} else {
	response.sendRedirect("../error_message.jsp");
	return;
}

if(request.getParameter("client")!=null){
	if (request.getParameter("client").equalsIgnoreCase("plugin")){
		client="plugin";
	} else {
		client="ge";
	}
} else {
	client="ge";
}

String output="KMZ";

Calendar cal = Calendar.getInstance();
String DATE_FORMAT_NOW = "MMMMM_yyyy";
SimpleDateFormat sdfNow = new SimpleDateFormat(DATE_FORMAT_NOW);
String now=sdfNow.format(cal.getTime());

boolean verboseLog=true; //true: viene scritto il log
boolean showGrid=true; //true: viene generata anche la griglia
boolean startup=false; //true: mostra la mappa allo startup

String path = application.getRealPath(request.getServletPath()).substring(0, application.getRealPath(request.getServletPath()).lastIndexOf('/')+1);
String pathLog = path + "logs/log_"+now+".txt";

String servletURL = "";
String appPath = "";
String stylesPath = "";
String ipSvil = "10.10.80.35";

String ip = request.getLocalAddr().toString();
if (ip.equals(ipSvil)){
	// SVILUPPO:
	servletURL = request.getScheme() + "://"+request.getLocalAddr()+"/geologico"+ request.getRequestURI();
	appPath = request.getScheme() + "://"+request.getLocalAddr()+"/geologico"+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);
	//stylesPath="http://"+ip+"/gstatico/documenti/cartpedo/geStyles";
	stylesPath="http://mappegis.regione.emilia-romagna.it/gstatico/documenti/cartpedo/geStyles";

} else if (request.getServerName().equals("geotest.ente.regione.emr.it")){
	// TEST:
	servletURL = request.getScheme() + "://"+request.getServerName()+request.getRequestURI();
	appPath = request.getScheme() + "://"+request.getServerName()+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);
	stylesPath="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/geStyles";

} else {
	// PROD VERA:
	//servletURL = request.getScheme() + "://"+request.getLocalAddr()+ request.getRequestURI();
	//appPath = request.getScheme() + "://"+request.getLocalAddr()+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1); 
	//stylesPath=request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/geStyles";

	servletURL = request.getScheme() + "://"+request.getServerName()+request.getRequestURI();
	appPath = request.getScheme() + "://"+request.getServerName()+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);
	stylesPath="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/geStyles";


	verboseLog=false; // IN PRODUZIONE NON GLI FACCIAMO MAI SCRIVERE IL LOG !!!!
}

String fileLogo="images/sfondo_ge.jpg";
String fileLegenda="";

int[] xDivisions=null;
int[] yDivisions=null;
int params[][]=null;
int levels=0;
String[] colonne=null;
String[] colonnelin=null;

switch (liv){
	default:
		layer="";
	break;
	
	case 3:
	
		layer="PED_VF_SUOLI250_GE_POL";
		sdeUser="PED_USER";
		showGrid=false;
		startup=true; //mostra la mappa allo startup

		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Scala 1:250.000";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=3\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Unità cartografica";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/raster/limiti_250/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ETICHETTA"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=2500000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=1000000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=500000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=250000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=100000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=50000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=10000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
	
	break;
	
	case 4:

		layer="PED_VF_SUOLI50_GE_POL";
		sdeUser="PED_USER";
		showGrid=false;
		startup=true; //mostra la mappa allo startup

		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Scala 1:50.000";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=4\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Unità cartografica";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		layerlin="PED_F_DELINEAZIONI_SIN30_LIN";
		layerlin2="PED_F_DELINEAZIONI_LIN";
		
		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ETICHETTA"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON

		colonnelin=new String[2];
		colonnelin[0]="SHAPE"; 		// CAMPO SHAPE
		colonnelin[1]="OBJECTID"; 		// CAMPO ID
		
		//stylesPath="http://"+ip+"/gstatico/documenti/cartpedo/geStyles/nuovi";

		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=2500000; 				//scalaGen 100.000

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=1000000; 				//scalaGen 40.000

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=500000; 				//scalaGen 20.000
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=250000; 				//scalaGen 10.000

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=100000; 				//scalaGen 4.000

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=50000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=10000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
				
	break;
	
	case 2:
		layer="PED_VF_SUOLI500_GE_POL";
		sdeUser="PED_USER";
		showGrid=false;
		startup=true; //mostra la mappa allo startup

		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Scala 1:500.000";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=2\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Unità cartografica";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/raster/limiti_500/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ETICHETTA"; 	// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=2500000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=1000000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=500000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=250000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=100000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=50000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=10000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen

	break;
	
	case 1:
		layer="PED_VF_SUOLI1000_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Scala 1:1.000.000";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=1\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Unità cartografica";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/raster/limiti_1000/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ETICHETTA"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=2500000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=1000000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=500000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=250000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=100000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=50000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=10000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		

	break;
	
	case 5:
	
		layer="PED_VF_CAPACITAUSO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della capacità d'uso (scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=5\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ETICHETTA"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=1000000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=500000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=100000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=50000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=25000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=10000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		
	break;
	
	case 6:
	
		layer="PED_VF_C_ORGANICO_P_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-30 cm (scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=6\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1;//3500; 					//maxLod
		params[0][2]=0;//5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;*/			//scalaGen
		
	break;
	
	case 7:
	
		layer="PED_VF_C_ORGANICO_M_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del contenuto % di carbonio organico nei suoli dell’Appennino emiliano-romagnolo tra 0-30 cm (Scala 1:250.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=7\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;

/*	case 8:
	
		layer="PED_VF_ARGILLA_P_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del contenuto % di argilla nei suoli di pianura tra 0-30 cm (Scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=8\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		
	break;
*/
	case 9:
	
		layer="PED_VF_STOCK30_P_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm. Seconda edizione (Scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=9\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;

	case 10:
	
		layer="PED_VF_STOCK100_P_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm (Scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=11\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;

	case 11:
	
		layer="PED_VF_STOCK30_M_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del carbonio organico immagazzinato nei suoli dell'Appennino emiliano-romagnolo tra 0-30 cm (Scala 1:250.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=10\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;

	case 12:
	
		layer="PED_VF_STOCK100_M_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del carbonio organico immagazzinato nei suoli dell’Appennino emiliano-romagnolo tra 0-100 cm (Scala 1:250.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=12\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;

	case 13:
	
		layer="PED_VF_CROMO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale del Cromo [Cr] della pianura emiliano-romagnola. 2a edizione";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=13\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;

	case 14:
	
		layer="PED_VF_NICHEL_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale del Nichel [Ni] della pianura emiliano-romagnola. 2a edizione";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=14\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
	
	break;


	case 15:
	
		layer="PED_VF_PIOMBO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale del Piombo [Pb] della pianura emiliano-romagnola. 2a edizione";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=15\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
	break;

	case 16:
	
		layer="PED_VF_RAME_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale del Rame [Cu] della pianura emiliano-romagnola. 2a edizione";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=16\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
	break;


	case 17:
	
		layer="PED_VF_ZINCO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale dello Zinco [Zn] della pianura emiliano-romagnola. 2a edizione";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=17\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;*/
		
	break;

	case 18:
	
		layer="PED_VF_LIVELLO_SO_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della dotazione in sostanza organica dei suoli di pianura tra 0-30 cm";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=18\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; //3500; 					//maxLod
		params[0][2]=0; //750000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
		
	break;

	case 19:
	
		layer="PED_VF_SALINITA_0_50_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della salinità dei suoli di pianura tra 0-50 cm (seconda approssimazione)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=19\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON0_50"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1;//3500; 					//maxLod
		params[0][2]=0;//750000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
		
	break;

	case 20:
	
		layer="PED_VF_SALINITA_50_100_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della salinità dei suoli di pianura tra 50-100 cm (seconda approssimazione)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=20\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON50_100"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1;//3500; 					//maxLod
		params[0][2]=0;//750000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/
		
	break;

	case 21:
	
		layer="PED_VF_FNA_CROMO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico del Cromo [Cr] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=21\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;

	case 22:
	
		layer="PED_VF_FNA_NICHEL_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico del Nichel [Ni] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=22\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;


	case 23:
	
		layer="PED_VF_FNA_PIOMBO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico del Piombo [Pb] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=23\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;


	case 24:
	
		layer="PED_VF_FNA_RAME_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico del Rame [Cu] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=24\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;


	case 25:
	
		layer="PED_VF_FNA_ZINCO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico dello Zinco [Zn] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=25\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;


	case 26:
	
		layer="PED_VF_FNA_STAGNO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico dello Stagno [Sn] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=26\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		
	break;

	case 27:
	
		layer="PED_VF_FNA_ARSENICO_GE_POL";

		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico dell'Arsenico [As] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=27\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;*/			
		
	break;
	
	case 28:
	
		layer="PED_VF_FNA_VANADIO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico del Vanadio [V] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=28\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/	
		
	break;
	
	case 29:
	
		layer="PED_VF_FNA_ALLELEMENT_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del fondo naturale-antropico di As, Cu, Cr, Ni, Pb, Sn, V, Zn";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=29\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Griglia";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE_GE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=0; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/	
		
	break;	



	case 30:
	
		layer="PED_VF_GRPIDR_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=30\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		
	break;



	case 31:
	
		layer="PED_VF_TESSITURA_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della tessitura dei suoli della pianura tra 0-30 cm";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=31\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1;//3500; 					//maxLod
		params[0][2]=0;//5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;	*/		//scalaGen
		
	break;




	case 32:
	
		layer="PED_VF_PERMEABILITA_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta della conducibilità idraulica satura (Ksat) dei suoli di pianura";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=32\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";//request.getScheme()+"://"+request.getLocalAddr()+"/gstatico/documenti/cartpedo/raster/limiti_50/doc.kml";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		
	break;





	case 33:
	
		layer="PED_VF_IMPERM_COMUNI_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta delle Superfici impermeabilizzate della pianura";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=33\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="http://"+request.getServerName()+"/gstatico/documenti/cartpedo/raster/impermeabilizzazione/doc.kml";
		//fileLegenda="images/legenda_impermeabilizzazione.png";
		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="ID_COMUNE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=3500; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;			//scalaGen
		
	break;

	case 34:
	
		layer="PED_VF_C_ORGANICO100_P_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-100 cm (scala 1:50.000)";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=34\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="GISID"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=8;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1;//3500; 					//maxLod
		params[0][2]=0;//5000; 				//scalaGen
/*
		params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=5000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=5000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=5000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=5000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=5000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;*/			//scalaGen
		
	break;

	
	case 35:
	
		layer="PED_VF_VANADIO_GE_POL";
		sdeUser="PED_USER";	
		startup=true; //mostra la mappa allo startup
		showGrid=false;
		nomeMappa="I suoli dell'Emilia-Romagna";
		subNomeMappa="Carta del Fondo naturale del Vanadio [V] della pianura emiliano-romagnola";
		descMappa="<![CDATA[<iframe src=\""+appPath+"balloon_home.jsp?liv=35\" width=\"300\" height=\"570\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" name=\"balloon\">balloon</iframe>]]>";
		descEtichetta="Classe";
		balloonWidth="300px";
		balloonHeight="570px";
		bordiRaster="";
		//stylesPath="http://10.10.80.125/gstatico/documenti/cartpedo/geStyles/nuovi";

		colonne=new String[4];
		colonne[0]="SHAPE"; 		// CAMPO SHAPE
		colonne[1]="XID_DELIN"; 		// CAMPO ID
		colonne[2]="CLASSE"; 		// CAMPO TEMATIZZAZIONE
		colonne[3]="BALLOON"; 		// CAMPO BALLOON
		
		levels=1;

		xDivisions=new int[levels];
		yDivisions=new int[levels];

		xDivisions[0]=6;
		yDivisions[0]=4;
		for(int i=1; i<levels; i++){
			xDivisions[i] = 3;
			yDivisions[i] = 3;
		}

		params=new int[levels][3];
		
		params[0][0]=1; 					//minLod
		params[0][1]=-1; 					//maxLod
		params[0][2]=5000; 				//scalaGen

		/*params[1][0]=700; 					//minLod
		params[1][1]=2100; 					//maxLod
		params[1][2]=400000; 				//scalaGen

		params[2][0]=700; 					//minLod
		params[2][1]=2100; 					//maxLod
		params[2][2]=250000; 				//scalaGen
		
		params[3][0]=700; 					//minLod
		params[3][1]=2100; 					//maxLod
		params[3][2]=75000; 				//scalaGen

		params[4][0]=700; 					//minLod
		params[4][1]=2100; 					//maxLod
		params[4][2]=30000; 				//scalaGen

		params[5][0]=700; 					//minLod
		params[5][1]=2100; 					//maxLod
		params[5][2]=10000; 				//scalaGen

		params[6][0]=700; 					//minLod
		params[6][1]=2100; 					//maxLod
		params[6][2]=5000; 				//scalaGen

		params[7][0]=700;			//minLod
		params[7][1]=-1;				//maxLod
		params[7][2]=5000;*/
		
	break;	
	
} 

%>