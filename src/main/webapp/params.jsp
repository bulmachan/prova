<%@ include file="c_java.jsp"
%><%

//String Link_CatalogoPianura = "http://gias.regione.emilia-romagna.it/suoli/getfasesuolo.asp?fase="; // CAMBIATO IL 16 maggio 2014
String Link_CatalogoPianura = "http://geo.regione.emilia-romagna.it/cartpedo/scheda_suolo.jsp?id=";

String Link_sito = "ERMES Agricoltura";
String ipSvil = "10.10.80.35";

String path = "";
String ip = request.getLocalAddr().toString();


if (ip.equals(ipSvil)){
	// SVILUPPO:
	path = request.getScheme() + "://"+request.getLocalAddr()+"/geologico"+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);

} else if (request.getServerName().equals("geotest.ente.regione.emr.it")){
	// TEST:
	path = request.getScheme() + "://"+request.getServerName()+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);

} else {
	// PROD VERA:	
	path = request.getScheme() + "://"+request.getServerName()+ request.getRequestURI().substring(0, request.getRequestURI().lastIndexOf('/')+1);
	
}

// Da modificare se si spostano le immagini ora e' un path assoluto calcolato dinamicamente
//String pathImg = request.getScheme() + "://"+request.getLocalAddr()+"/geologico"+ request.getContextPath() + "/immagini";
String pathImg = "/gstatico/documenti/cartpedo/immagini";

String title = "I suoli dell'Emilia-Romagna - Home Page";
String pageHeader = "Home Page";

// PARAMETRI PER ICONA NOVITA:
DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
dfm.setTimeZone(TimeZone.getTimeZone("Europe/Zurich"));

long oggi = new java.util.Date().getTime();
long dataCarteSuoli1=dfm.parse("2012-12-31 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche
long dataCarteSuoli2=dfm.parse("2012-12-31 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche
long dataCarteSuoli3=dfm.parse("2012-12-31 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche
long dataCarteSuoli4=dfm.parse("2016-01-27 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche

long dataCarteTematiche1=dfm.parse("2016-01-27 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche
long dataCarteTematiche2=dfm.parse("2016-01-27 00:00:00").getTime(); // data ultimo aggiornamento carte tematiche

String immagineNovita="&nbsp;<img class='icona_novita' src='images/new-icon-p.png' alt='Novità!' title='Novità!'/>";
long giorniNovita=90; // GIORNATE DI COMPARSA DELL'ICONA NOVITA DALLA DATA DI PUBBLICAZIONE DELLA CARTA


ArrayList linkMetadati = new ArrayList();

linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76861"); //0
linkMetadati.add(""); //1
linkMetadati.add(""); //2
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76859"); //3
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76860"); //4
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76851"); //5
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76826"); //6
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76827"); //7
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76825"); //8
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76829"); //9
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76830"); //10
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76831"); //11
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76832"); //12
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76814"); //13
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77126"); //14
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77127"); //15
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77128"); //16
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77129"); //17
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76964"); //18
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76963"); //19
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato76975"); //20
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77131"); //21
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77130"); //22
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77134"); //23
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77132"); //24
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77118"); //25
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77133"); //26
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77257"); //27
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77258"); //28
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77479"); //29
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato77616"); //30
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato78055"); //31
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadato78056"); //32
linkMetadati.add("http://servizigis.regione.emilia-romagna.it/ctwmetadatiRER/metadatoISO.ejb?stato_IdMetadato=iOrg01iEnP1idMetadatoXXXXX"); //33




%>


<%!
String aCapo(String s) {
// In a string replace one substring with another
  if (s == null)
	  return "";
  
  if (s.equals("")) 
	  return "";

  String res = "";

  res=s.replace("\n","<br />");
  res=res.replace("\r","<br />");
  res=res.replace("\r\n","<br />");
  
  return res;  
}
%>