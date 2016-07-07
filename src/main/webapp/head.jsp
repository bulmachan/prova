<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="it">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta name="author" content="Servizio Geologico Sismico e dei Suoli, Regione Emilia-Romagna" />
	<meta name="keywords" content="suoli, soil, pedologia, suolo, unità cartografiche, delineazioni, aziende agrarie" />
	<meta name="description" content="Carte dei suoli, con diversi tipi di dettaglio" />
	<meta name="robots" content="index,follow" />
	<title><%=title%></title>
	<link rel="stylesheet" media="screen" type="text/css" href="css/style_suoli.css" />
	<link rel="stylesheet" media="print"  type="text/css" href="css/stampa.css" />
	<link rel="Shortcut Icon" type="image/x-icon" href="images/favicon.ico" />	
	<link rel="alternate" type="application/rss+xml" title="RSS" href="xx.xml" />

<!--[if IE]>
<link rel="stylesheet" type="text/css" href="css/style_suoli_ie.css" />
<![endif]-->
	
<% 
boolean highslide = true;
if (highslide == true) {
%>

<!-- Highslide CSS -->
<link rel="stylesheet" type="text/css" href="highslide/highslide.css" />
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="highslide/highslide-ie6.css" />
<![endif]-->
<!-- Highslide CSS -->

<%}
%>
</head>

<body>
<!-- Piwik Prod New Tracking Code -->
<script type="text/javascript">
    var _paq = _paq || [];
var index1 = location.href.indexOf("applicazioni.regione.emilia-romagna.it");
var index2 = location.href.indexOf("applicazionitest.regione.emilia-romagna.it");
var index3 = location.href.indexOf("cm.regione.emilia-romagna.it");
var index6 = location.href.indexOf("localhost");
var index7 = location.href.indexOf("//10.");
(function(){ var u="https://statisticheweb.regione.emilia-romagna.it/analytics/";
if (index1==-1 && index2==-1 && index3==-1 && index6==-1 && index7==-1){
    _paq.push(['setSiteId', 82]);
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setDocumentTitle', document.domain + "/" + document.title]);
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript'; g.defer=true; g.async=true; g.src=u+'piwik.js';
    s.parentNode.insertBefore(g,s); }})();
</script>
<noscript><p><img src="https://statisticheweb.regione.emilia-romagna.it/analytics/piwik.php?idsite=82" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Prod New Tracking Code -->
<script type="text/javascript">
/*<![CDATA[*/
//funzione che apre i link con rel="external" in una popup javascript
function externalLinks( ) {
 if (!document.getElementsByTagName) return;
 var anchors = document.getElementsByTagName("a");
 for (var i=0; i<anchors.length; i++) {
 var anchor = anchors[i];
 if (anchor.getAttribute("href") && anchor.getAttribute("rel") == "external") {
 
	if(anchor.title)
		anchor.title = anchor.title+" (il link apre una nuova finestra o scheda)" ;
	else 
		anchor.title = "Il link apre una nuova finestra o scheda" ;

	anchor.onclick = function( ) { window.open( this.href ); return false; }
	anchor.onkeypress= function(e) { k = (e) ? e.keyCode : window.event.keyCode; if (k==13) window.open(this.href); return false; }
 }
}
}

/**/
function toggle(tagId, title) {
	/*if (document.getElementById(tagId).style.display=='none') {
		document.getElementById(tagId).style.display='block';
		document.getElementById(title).title="Chiudi dettagli cartografia";
	} else {
		document.getElementById(tagId).style.display='none';
		document.getElementById(title).title="Apri dettagli cartografia";
	}*/

	if (document.getElementById(tagId).className=='cartaChiuso') {
		document.getElementById(tagId).className='cartaAperto';
		document.getElementById("box_"+tagId).className='carta_tematica_box_aperto';
		document.getElementById("spazio_"+tagId).className='spazio_aperto';
		document.getElementById(title).title="Chiudi dettagli cartografia";
	} else {
		document.getElementById(tagId).className='cartaChiuso';
		document.getElementById("box_"+tagId).className='carta_tematica_box';
		document.getElementById("spazio_"+tagId).className='spazio_chiuso';
		document.getElementById(title).title="Apri dettagli cartografia";
	}

}

/*]]>*/
</script>
<% 

if (highslide == true) {
%>
<!-- Highslide JS -->
<script type="text/javascript" src="highslide/highslide.js"></script>
<script type="text/javascript" src="highslide/highslide.config.js" charset="utf-8"></script>
<!-- Highslide JS -->
<%}
%>


