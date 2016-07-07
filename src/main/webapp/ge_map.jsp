<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="GoogleMapsProperties.jsp"
%><%

int liv=1;
if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv=Integer.parseInt(request.getParameter("liv"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}

String scala="1:1.000.000";
String pagPadre="";
String tabella="ped_v_province";
String cartella="province";
String campoId="id_provincia";
String esempio="un numero (ad esempio Unità cartografica 3)";

String pagPadreTitle="Torna al Catalogo delle carte tematiche";
String pagPadreDesc="Catalogo delle carte tematiche";

String GMkey=key;

switch (liv){
	case 1:
		scala="1:1.000.000";	
		//pagPadre="scheda_provincia";
		cartella="province";
		tabella="ped_v_province";
		campoId="id_provincia";
		esempio="un numero (ad esempio Unità cartografica 3)";
		title = "Carta dei suoli alla scala 1:1.000.000";
	break;
	
	case 2:
		scala="1:500.000";
		//pagPadre="scheda_sistema";
		cartella="sistemi";
		tabella="ped_v_sistemi";
		campoId="id_sistema";
		esempio="un numero ed una lettera (ad esempio Unità cartografica 3A)";
		title = "Carta dei suoli alla scala 1:500.000";
	break;
	
	case 3:
		scala="1:250.000";
		//pagPadre="scheda_sottosistema";
		cartella="sottosistemi";
		tabella="ped_v_sottosistemi";
		campoId="id_sottosistema";
		esempio="un numero e due lettere (ad esempio Unità cartografica 3Ab)";
		title = "Carta dei suoli alla scala 1:250.000";
	break;
	
	case 4:
		scala="1:50.000";
		//pagPadre="";
		cartella="";
		tabella="";
		campoId="";
		title = "Carta dei suoli alla scala 1:50.000";
	break;
	
	case 5:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta della capacità d'uso dei suoli alla scala 1:50.000";
	break;

	case 6:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-30 cm";
	break;

	case 7:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del contenuto % di carbonio organico nei suoli dell’Appennino emiliano-romagnolo tra 0-30 cm";
	break;

	case 8:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del contenuto % di argilla nei suoli di pianura tra 0-30 cm";
	break;

	case 9:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm";
	break;

	case 10:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm";
	break;

	case 11:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del carbonio organico immagazzinato nei suoli dell’Appennino emiliano-romagnolo tra 0-30 cm";
	break;

	case 12:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del carbonio organico immagazzinato nei suoli dell’Appennino emiliano-romagnolo tra 0-100 cm";
	break;

	case 13:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale del Cromo [Cr] della pianura emiliano-romagnola";
	break;

	case 14:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale del Nichel [Ni] della pianura emiliano-romagnola";
	break;

	case 15:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale del Piombo [Pb] della pianura emiliano-romagnola";
	break;

	case 16:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale del Rame [Cu] della pianura emiliano-romagnola";
	break;

	case 17:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale dello Zinco [Zn] della pianura emiliano-romagnola";
	break;

	case 18:
		scala="1:50.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta della dotazione in sostanza organica dei suoli di pianura tra 0-30 cm";
	break;
	case 19:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta della salinità nei suoli di pianura tra 0-50 cm. Prima approssimazione";
	break;
	case 20:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta della salinità nei suoli di pianura tra 50-100 cm. Prima approssimazione";
	break;
	case 21:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico del Cromo [Cr] della pianura emiliano-romagnola";
	break;

	case 22:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico del Nichel [Ni] della pianura emiliano-romagnola";
	break;

	case 23:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico del Piombo [Pb] della pianura emiliano-romagnola";
	break;

	case 24:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico del Rame [Cu] della pianura emiliano-romagnola";
	break;

	case 25:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico dello Zinco [Zn] della pianura emiliano-romagnola";
	break;

	case 26:
		scala="1:250.000";
		pagPadre="carte_tematiche.jsp";
		cartella="capacitauso";
		tabella="";
		campoId="";
		title = "Carta del Fondo naturale-antropico dello Stagno [Sn] della pianura emiliano-romagnola";
	break;	
	
	
	
	default:
	break;
}

String h1 =  "Plugin di Google Earth - " + title;
title = h1 + " - I suoli dell'Emilia-Romagna";


%>
<%@ include file="head.jsp"
%>
<script type="text/javascript" src="http://www.google.com/jsapi?key=<%=GMkey%>"></script>

<script type="text/javascript" src="ge_map.js.jsp?liv=<%=liv%>"></script>

<!--<div id="kmldiv">Here's where KML should go</div>!-->
<div id="container" >
	<div id="intro">
  		<div id="pageHeader">
  			<h1><span>I suoli dell'Emilia-Romagna</span></h1>
  			<h2><span>a cura del Servizio Geologico Sismico e dei Suoli</span></h2>
  		</div>
  		<div id="logo_rer">
  			<img src="images/logo_rer.png" width="150" height="21" alt="Regione Emilia-romagna" />
  		</div>
  		<div id="titolo">
  			<img src="images/i_suoli_titolo.png" width="380" height="31" alt="I suoli dell'Emilia-Romagna" />
  		</div>
  		<div id="campo_search">
        <form method="get" action="/geologia/cerca.asp" id="ricerca">
          <div>
            <label id="label" for="q">cerca</label><br />
    				<input type="hidden" name="i" value="ERMES" id="i" />
    				<input type="hidden" name="url" value="geologia" id="url" />
    				<input type="text" name="q" size="16" value="" id="q" class="input_text" /><br />
    				<button type="submit" id="button" class="bottone_vai">Vai &#8250;&#8250;</button>
    			</div>
    		</form>
      </div>
	 </div>
  <div class="briciole">
	<a href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
<% if(!pagPadre.equals("")){
%>  
	&#8250;&#8250; <a href="<%=pagPadre%>" title="<%=pagPadreTitle%>"><%=pagPadreDesc%></a>&nbsp;
<%	
	}
%> 	
	
	
  </div>
  
  <div id="content_legenda">
    <noscript><p class="strong">Per visuailzzare la mappa contenuta in questa pagina è necessario avere abilitato Javascript.</p></noscript>
    <h3 class="titleMap"><%=h1%></h3>
		<div id="map3d_container">
			<div id="map3d"></div>
		</div>
		<em>Versione del PlugIn di Google Earth: <span id="installed-plugin-version"></span></em>
</div>
<%@ include file="ge_footer.htm"
%>