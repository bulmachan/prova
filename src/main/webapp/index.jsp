<%@ include file="params.jsp"
%>
<%		
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
	
	title = "I suoli della Regione Emilia-Romagna - Home Page";
	pageHeader = "Home Page";;
%>
<%@ include file="head.jsp"
%>
<%
	String carteSuoli1Novita="";
	if(oggi-dataCarteSuoli1<(giorniNovita*1000*3600*24))
		carteSuoli1Novita=immagineNovita;

	String carteSuoli2Novita="";
	if(oggi-dataCarteSuoli2<(giorniNovita*1000*3600*24))
		carteSuoli2Novita=immagineNovita;

	String carteSuoli3Novita="";
	if(oggi-dataCarteSuoli3<(giorniNovita*1000*3600*24))
		carteSuoli3Novita=immagineNovita;
	
	String carteSuoli4Novita="";
	if(oggi-dataCarteSuoli4<(giorniNovita*1000*3600*24))
		carteSuoli4Novita=immagineNovita;

		
	String carteTematiche1Novita="";
	if(oggi-dataCarteTematiche1<(giorniNovita*1000*3600*24))
		carteTematiche1Novita=immagineNovita;

	String carteTematiche2Novita="";
	if(oggi-dataCarteTematiche2<(giorniNovita*1000*3600*24))
		carteTematiche2Novita=immagineNovita;
		
		
%>
<ul class="skip">
	<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
    <li><a href="#cerca" title="Salta al form di ricerca - accesskey c">Cerca nel sito [c]</a> </li>
	<li><a href="#menu" title="Salta al menu principale - accesskey n" accesskey="n">Salta al menu principale [n]</a> </li>
	
	<!-- Nota: non si utilizza accesskey="1" perchè spesso utilizza dai Vocal reader per usi predefiniti 
    <li><a href="#terreg" title="Salta alla sezione Carta dei Suoli del Territorio regionale - accesskey 2" accesskey="2">Salta al territorio regionale [2]</a> </li>
    <li><a href="#terpia" title="Salta alla sezione Carta dei Suoli del Territorio di pianura  - accesskey 3" accesskey="3">Salta al territorio di pianura [3]</a> </li>
	 <li><a href="#cartem" title="Salta alla sezione Catalogo delle Carte Tematiche - accesskey 4" accesskey="4">Salta al Catalogo delle Carte Tematiche [4]</a></li>
    <li><a href="#aziagr" title="Salta alla sezione delle Aziende Agricole sperimentali - accesskey 5" accesskey="5">Salta alle Aziende Agricole sperimentali [5]</a> </li>
    <li><a href="#glossa" title="Salta alla sezione Glossario - accesskey 6" accesskey="6">Salta al glossario [6]</a> </li>
    <li><a href="#webgis" title="Salta all'elenco dei link a siti Web GIS  - accesskey 7" accesskey="7">Salta all'elenco dei link a siti Web Gis [7]</a> </li>
    <li><a href="#guida" title="Salta alla Guida - accesskey 8" accesskey="8">Salta alla guida [8]</a> </li> -->
 </ul>
 
<%@ include file="testata.jsp"
%>
	
  <div id="quickSummary">
  <a name="menu" tabindex="0"></a>
  		<ul>
        <li>Territorio regionale, carta dei suoli alla scala 1:1.000.000: <a href="google_earth/scala_1000000.kmz" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000">apri la cartografia interattiva in Google Earth</a> - <a href="legenda.jsp?liv=1" title="Visualizza le unità cartografiche scala 1:1.000.000">visualizza la legenda delle unità cartografiche</a></li>
  		<li>Territorio regionale, carta dei suoli alla scala 1:500.000: <a href="google_earth/scala_500000.kmz" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000">apri la cartografia interattiva in Google Earth</a> - <a href="legenda.jsp?liv=2" title="Visualizza le unità cartografiche scala 1:500.000">visualizza la legenda delle unità cartografiche</a></li>
  		<li>Territorio regionale, carta dei suoli alla scala 1:250.000: <a href="google_earth/scala_250000.kmz" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:250.000">apri la cartografia interattiva in Google Earth</a> - <a href="legenda.jsp?liv=3" title="Visualizza le unità cartografiche scala 1:250.000">visualizza la legenda delle unità cartografiche</a></li>
  		<li>Territorio di pianura, carta dei suoli alla scala 1:50.000: <a href="google_earth/scala_250000.kmz" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio di Pianura - al livello di dettaglio 1:50.000">file da scaricare per Google Earth</a></li>
  		<li>Aziende agricole, carta dei suoli alla scala 1:10.000: <a href="aziende/az_tadini.jsp" title="Apri la pagina dell'Azienda Tadini">Azienda Tadini</a>, <a href="aziende/az_stuard.jsp" title="Apri la pagina dell'Azienda Stuard">Azienda Stuard</a>, <a href="aziende/az_modenese.jsp" title="Apri la pagina dell'Azienda Modenese">Azienda Modenese</a>, <a href="aziende/az_brusca.jsp" title="Apri la pagina dell'Azienda Brusca">Azienda Brusca</a>, <a href="aziende/az_capanno.jsp" title="Apri la pagina dell'Azienda Capanno">Azienda Capanno</a>, <a href="aziende/az_rio.jsp" title="Apri la pagina dell'Azienda Rio">Azienda Rio</a>, <a href="aziende/az_maccolina.jsp" title="Apri la pagina dell'Azienda Podere Maccolina">Azienda Podere Maccolina</a>, <a href="aziende/az_marani.jsp" title="Apri la pagina dell'Azienda Marani">Azienda Marani</a>,
<a href="aziende/az_martorano.jsp" title="Azienda Martorano">Azienda Martorano</a></li>
        <li>Carte tematiche: <a href="carte_tematiche.jsp" title="Apri il Catalogo delle Carte Tematiche">Catalogo delle Carte Tematiche</a></li>
  			</ul>
  		</div>
  </div>
 
  <div class="contenitore_01">
  <a name="contenutopagina" tabindex="0"></a>
    <a name="terreg" tabindex="0"></a>
    <div class="spazio_titolo">
      

<%
	switch (liv){
		case 1:
		default:
%>			
	<h2 class="titolo">Territorio Regionale - Carta dei suoli alla scala 1:1.000.000</h2>
	<p class="titolo">territorio regionale</p>
    </div>
    <div class="spazio_contenuto">
    <div class="menu_orizz">
      <p class="menu_attivo">Carta dei suoli alla scala:<%=carteSuoli1Novita%></p>
      <p class="voci_menu_orizz"><span class="link_attivo_menu_orizz">1:1.000.000</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?liv=2" title="Apri la Carta dei Suoli alla scala 1:500.000">1:500.000</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?liv=3" title="Apri la Carta dei Suoli alla scala 1:250.000">1:250.000</a></p>
    </div>
    <p class="testo1_orizz"> 
        <a href="ge/kml.jsp?liv=1" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview1.jpg" alt="Miniatura della Carta dei suoli alla scala 1:1.000.000" title="Click per aprire la Carta dei suoli alla scala 1:1.000.000 in Google Earth [deve essere installato localmente]" width="200" height="110" /></a>
          Livello più generale della cartografia dei suoli emiliano-romagnoli. La carta dei suoli alla scala 1:1.000.000 è stata realizzata sintetizzando le informazioni provenienti dai rilevamenti effettuati per la Carta dei suoli dell'Emilia-Romagna in scala 1:250.000 (<strong>1994</strong>), con aggiornamenti successivi (2000). A questo livello di dettaglio vengono individuate e descritte 7 Unità cartografiche identificate da un numero (ad esempio Unità cartografica 3).</p>
      <p><br /></p>
    </div>
    <div class="spazio_allegati">
      <ul class="elenco_dx">
          <li class="violet">apri la <a href="ge/kml.jsp?liv=1" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000 [deve essere installato localmente]">cartografia 1:1.000.000 in Google Earth</a></li>
          <li class="violet">apri la <a href="ge_map.jsp?liv=1" title="Apri con Google Earth - Plugin la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000 [deve essere installato localmente]">cartografia 1:1.000.000 con il Plugin di Google Earth</a></li>
          <li class="green">visualizza la <a href="legenda.jsp?liv=1" title="Apri la Legenda delle unità cartografiche dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000">legenda delle unità cartografiche scala 1:1.000.000</a></li>
          <!-- <li class="orange">apri i <a href="<%=linkMetadati.get(1)%>" title="Apri i Metadati delle unità cartografiche dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000" rel="external">metadati delle unità cartografiche scala 1:1.000.000</a></li> -->
      </ul>
    </div>

<%		break;

		case 2:
%>
	<h2 class="titolo">Territorio Regionale - Carta dei suoli alla scala 1:500.00</h2>
	<p class="titolo">territorio regionale</p>
    </div>
    <div class="spazio_contenuto">
	  <div class="menu_orizz">
      <p class="menu_attivo">Carta dei suoli alla scala:<%=carteSuoli2Novita%></p>
      <p class="voci_menu_orizz"><a href="index.jsp?liv=1" title="Apri la Carta dei Suoli alla scala 1:1.000.000">1:1.000.000</a>&nbsp;&nbsp;&nbsp;&nbsp;<span class="link_attivo_menu_orizz">1:500.000</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?liv=3" title="Apri la Carta dei Suoli alla scala 1:250.000">1:250.000</a></p>
    </div>
    <p class="testo1_orizz"> 
         <a href="ge/kml.jsp?liv=2" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview2.jpg" alt="Miniatura della Carta dei suoli dell'Emilia-Romagna in scala 1:500.00" title="Click per aprire la Carta dei suoli alla scala 1:500.000 in Google Earth [deve essere installato localmente]" width="200" height="110" /></a>
         La carta dei suoli alla scala 1:500.000 è stata realizzata sintetizzando le informazioni provenienti dai rilevamenti effettuati per la Carta dei suoli dell'Emilia-Romagna in scala 1:250.000 (<strong>1994</strong>), con aggiornamenti successivi (<strong>2000</strong>). A questo livello di dettaglio sono individuate e descritte 27 Unità cartografiche identificate da un numero seguito da una lettera maiuscola (ad esempio Unità cartografica 3A).</p>
      <p><br /></p>
    </div>
    <div class="spazio_allegati">
      <ul class="elenco_dx">
          <li class="violet">apri la <a href="ge/kml.jsp?liv=2" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000 [deve essere installato localmente]">cartografia 1:500.000 in Google Earth</a></li>
          <li class="violet">apri la <a href="ge_map.jsp?liv=2" title="Apri con Google Earth - Plugin la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000 [deve essere installato localmente]">cartografia 1:500.000 con il Plugin di Google Earth</a></li>
          <li class="green">visualizza la <a href="legenda.jsp?liv=2" title="Apri la Legenda delle unità cartografiche dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000">legenda delle unità cartografiche scala 1:500.000</a></li>
          <!-- <li class="orange">apri i <a href="<%=linkMetadati.get(2)%>" title="Apri i Metadati delle unità cartografiche dei Suoli Territorio Regionale - al livello di dettaglio 1:500.000" rel="external">metadati delle unità cartografiche scala 1:500.000</a></li> -->
      </ul>
    </div>
		
<%		break;
		
		case 3:
%>
	<h2 class="titolo">Territorio Regionale - Carta dei suoli alla scala 1:250.000</h2>
	<p class="titolo">territorio regionale</p>
    </div>
    <div class="spazio_contenuto">
	  <div class="menu_orizz">
      <p class="menu_attivo">Carta dei suoli alla scala:<%=carteSuoli3Novita%></p>
      <p class="voci_menu_orizz"><a href="index.jsp?liv=1" title="Apri la Carta dei Suoli alla scala 1:1.000.000">1:1.000.000</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?liv=2" title="Apri la Carta dei Suoli alla scala 1:500.000">1:500.000</a>&nbsp;&nbsp;&nbsp;&nbsp;<span class="link_attivo_menu_orizz">1:250.000</span></p>
    </div>
    <p class="testo1_orizz"> 
        <a href="ge/kml.jsp?liv=3" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:250.000"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview3.jpg" alt="Miniatura della Carta dei suoli dell'Emilia-Romagna in scala 1:250.00" title="Click per aprire la Carta dei suoli alla scala 1:250.000 in Google Earth [deve essere installato localmente]" width="200" height="110" /></a>
         Carta dei suoli dell'Emilia-Romagna in scala 1:250.000 realizzata nel 1994, con aggiornamenti successivi (<strong>2000</strong>). A questo livello di dettaglio sono individuate e descritte 91 Unità cartografiche  identificate da un numero seguito da una lettera maiuscola e una lettera minuscola (ad esempio Unità cartografica 3Aa).</p>
      <p><br /></p>
    </div>
    <div class="spazio_allegati">
      <ul class="elenco_dx">
          <li class="violet">apri la <a href="ge/kml.jsp?liv=3" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:250.000 [deve essere installato localmente]">cartografia 1:250.000 in Google Earth</a></li>
          <li class="violet">apri la <a href="ge_map.jsp?liv=3" title="Apri con Google Earth - Plugin la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:250.000 [deve essere installato localmente]">cartografia 1:250.000 con il Plugin di Google Earth</a></li>
          <li class="green">visualizza la <a href="legenda.jsp?liv=3" title="Apri la Legenda delle unità cartografiche dei Suoli Territorio Regionale - al livello di dettaglio 1:250.000">legenda delle unità cartografiche scala 1:250.000</a></li>
          <li class="orange">apri i <a href="<%=linkMetadati.get(3)%>" title="Apri i Metadati della cartografia 1:250.000" rel="external">metadati della cartografia 1:250.000</a></li>
      </ul>
    </div>
	
<%		break;
	}	  
%>
	

  </div>
    
  <div class="contenitore_02">
    <a name="terpia" tabindex="0"></a>
    <div class="spazio_titolo">
	  <h2 class="titolo">Territorio di Pianura e di Collina- Carta dei suoli alla scala 1:50.000</h2>
      <p class="titolo">territorio di pianura e<br /> di collina</p>
    </div>
    <div class="spazio_contenuto">
    <div class="menu_orizz">
      <p class="menu_attivo">Carta dei suoli alla scala:<%=carteSuoli4Novita%></p>
      <p class="voci_menu_orizz"><span class="link_attivo_menu_orizz">1:50.000</span></p>
    </div>

      <p class="testo1_orizz">
        <a href="ge/kml.jsp?liv=4" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio di Pianura - al livello di dettaglio 1:50.000"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview4.jpg" alt="Miniatura della Carta dei suoli alla scala 1:50.000" title="Click per aprire la Carta dei suoli alla scala 1:50.000 in Google Earth [deve essere installato localmente]" width="200" height="110" /></a>
        Livello di "semi-dettaglio" dei suoli della pianura e di parte della collina emiliano romagnola. La carta dei suoli alla scala 1:50.000 è stata realizzata utilizzando le informazioni provenienti dai rilevamenti effettuati dalla metà degli anni settanta fino al 2015. (ed. <strong>2015</strong>). La descrizione dei suoli è qui effettuata attraverso 396 diversi tipi di suolo (UTS: Unità Tipologiche di Suolo), distribuiti in 7209 delineazioni identificate da un codice numerico.
		</p>
      <p><br /></p>
    </div>
    <div class="spazio_allegati">
      <ul class="elenco_dx">
          <li class="violet">apri la <a href="ge/kml.jsp?liv=4" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio di Pianura - al livello di dettaglio 1:50.000 [deve essere installato localmente]">cartografia 1:50.000 in Google Earth</a></li>
          <li class="violet">apri la <a href="ge_map.jsp?liv=4" title="Apri con Google Earth - Plugin la mappa interattiva dei Suoli Territorio di Pianura - al livello di dettaglio 1:50.000 [deve essere installato localmente]">cartografia 1:50.000 con il Plugin di Google Earth</a></li>
          
		  <li class="violet">apri il <a href="catalogo_tipi_suolo.jsp" title="Apri il Catalogo dei Suoli generale della carta dei suoli al livello di dettaglio 1:50.000">Catalogo dei Suoli generale</a></li>
          
		  <li class="orange">apri i <a href="<%=linkMetadati.get(4)%>" title="Apri i Metadati della cartografia al livello di dettaglio 1:50.000" rel="external">metadati della cartografia 1:50.000</a></li>
      </ul>
    </div>  
  </div>
  
  <div class="contenitore_03">
    <a name="cartem" tabindex="0"></a>
    <div class="spazio_titolo">
	  <h2 class="titolo">Carte Tematiche</h2>
      <p class="titolo">carte tematiche I</p>
    </div>
    <div class="spazio_contenuto_tematiche">
	<div class="menu_orizz">
       <p class="menu_attivo">1. Carte delle proprietà chimico-fisiche<%=carteTematiche1Novita%></p>
       <p class="voci_menu_orizz"><span class="link_attivo_menu_orizz_spento">Varie scale</span></p>
    </div>

       <p class="testo1_orizz">
        <a href="carte_tematiche.jsp?tem=1#tem1" title="Visualizza l'elenco delle carte delle proprietà chimico-fisiche"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview31.jpg" alt="Miniatura di un esempio di carta delle proprietà chimico-fisiche" title="Click per visualizzare l'elenco delle carte delle proprietà chimico-fisiche" width="200" height="110" /></a>
        Le carte dei suoli sono documenti complessi con un elevato contenuto informativo. Per l'applicazione a fini  ambientali, agricoli o di pianificazione territoriale, vengono selezionate ed elaborate carte descrittive di singoli parametri o proprietà del suolo di specifica rilevanza.</p>
       

    </div>
    <div class="spazio_allegati">
      <ul class="lista_cartapp">
          <li>visualizza le <a href="carte_tematiche.jsp?tem=1#tem1" title="Visualizza l'elenco delle carte delle proprietà chimico-fisiche">carte delle proprietà chimico-fisiche</a> [<span class="evidenzia">10</span>]</li> 
      </ul> 
    </div>  
    
  </div> 
  
  <div class="contenitore_04">
    <a name="aziagr" tabindex="0"></a>
    <div class="spazio_titolo">
	  <h2 class="titolo">Carte Tematiche</h2>
      <p class="titolo">carte tematiche II</p>
    </div>
    <div class="spazio_contenuto_tematiche">
	<div class="menu_orizz">
       <p class="menu_attivo">2. Carte applicative<%=carteTematiche2Novita%></p>
       <p class="voci_menu_orizz"><span class="link_attivo_menu_orizz_spento">Varie scale</span></p>
    </div>

       <p class="testo1_orizz">
        <a href="carte_tematiche.jsp?tem=2#tem2" title="Visualizza l'elenco delle carte applicative"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/overview18.jpg" alt="Miniatura di un esempio di carta applicativa" title="Click per visualizzare l'elenco delle carte applicative" width="200" height="110" /></a>
        Le carte applicative, pensate a supporto della pianificazione agricola, ambientale e territoriale rappresentano valutazioni delle qualità dei suoli, basate sulla selezione e l'integrazione di più informazioni e, se necessario, mediante l'utilizzazione di diversi tipi di modelli parametrici o matematici.</p>
       

    </div>
    <div class="spazio_allegati">
      <ul class="lista_cartapp">
          <li>visualizza le <a href="carte_tematiche.jsp?tem=2#tem2" title="Visualizza l'elenco delle carte applicative">carte applicative</a> [<span class="evidenzia">17</span>]</li> 
      </ul> 
    </div>    
  </div>
  
  <!-- <div class="contenitore_04">
    <a name="aziagr" tabindex="0"></a>
 -->  
 <div class="contenitore_05">
  
  <div class="banner_04_c05">
          <a name="aziende" tabindex="0"></a>
		  <h2 class="titolo">Carta dei suoli alla scala 1:10.000 - Aziende agricole sperimentali</h2>
		  <p class="ban_text">Carta dei suoli alla scala 1:10.000 - Aziende agricole sperimentali</p>
		  <div style="width:100%; overflow:auto;">
			  <ul class="lista" style="float:left;">
				  <li><a href="aziende/az_tadini.jsp" title="Apri la pagina dell'Azienda Tadini(Pc)">Azienda Tadini(Pc)</a></li>
				  <li><a href="aziende/az_stuard.jsp" title="Apri la pagina dell'Azienda Stuard (Pr)">Azienda Stuard (Pr)</a></li>
				  <li><a href="aziende/az_modenese.jsp" title="Apri la pagina dell'Azienda Modenese (Mo)">Azienda Modenese (Mo)</a></li>
			  </ul>
			  <ul class="lista" style="float:left;">
				  <li><a href="aziende/az_brusca.jsp" title="Apri la pagina dell'Azienda Brusca (Bo)">Azienda Brusca (Bo)</a></li>
				  <li><a href="aziende/az_capanno.jsp" title="Apri la pagina dell'Azienda Capanno(Bo)">Azienda Capanno(Bo)</a></li>
				  <li><a href="aziende/az_rio.jsp" title="Apri la pagina dell'Azienda Rio Valle (Bo)">Azienda Rio Valle (Bo)</a></li>
			  </ul>
			  <ul class="lista" style="float:left;">
				  <li><a href="aziende/az_maccolina.jsp" title="Apri la pagina dell'Azienda Podere Maccolina (Ra)">Azienda Podere Maccolina (Ra)</a></li>
				  <li><a href="aziende/az_marani.jsp" title="Apri la pagina dell'Azienda Marani (Ra)">Azienda Marani (Ra)</a></li>
				  <li><a href="aziende/az_martorano.jsp" title="Apri la pagina dell'Azienda Martorano (Fc)">Azienda Martorano (Fc)</a></li>
			  </ul>
			  <ul class="elenco_dx" style="padding-left:4px;margin-top:-4px;">
				<li class="orange"><a href="<%=linkMetadati.get(0)%>" title="Apri i Metadati della Carta dei suoli alla scala 1:10.000 - Aziende agricole sperimentali" rel="external">Metadati della Carta dei suoli alla scala 1:10.000 - Aziende agricole sperimentali</a></li>
			  </ul>
	    </div>  
    </div>  
  </div>
      
       
<div class="contenitore_05">
  
  <div class="banner_01_c05">
          <a name="glossa" tabindex="0"></a>
		  <h2 class="titolo">Glossario dei termini usati nelle descrizioni dei suoli</h2>
          <p class="ban_text">Glossario dei termini usati nelle descrizioni dei suoli</p>
          <ul class="lista">
            <li><a href="glossario.jsp" title="Apri il Glossario dei termini usati nelle descrizioni dei suoli">Glossario</a></li>
          </ul>
      </div>
      
	  <div class="banner_02_c05">
		 <h2 class="titolo">Elenco dei link ai software per la visualizzazione delle mappe interattive</h2>
         <p class="ban_text">Link - Google Earth (sito ufficiale)</p>
         <p class="ban_text_02_normal">Collegamenti per scaricare il software necessario alla visualizzare delle informazioni geografiche riguardanti i suoli dell'Emilia-Romagna, contenute nei file .kmz</p>
         <ul class="lista">
          <li><a href="http://earth.google.it/" title="Apri il sito Google Earth" rel="external">Google Earth - Esplora, cerca e scopri</a> </li>
          <li><a href="https://www.google.it/earth/explore/products/plugin.html" title="Apri il sito Google Earth - Plugin" rel="external">Google Earth - Plugin</a></li>
         </ul>
	<noscript><p class="ban_text_02_normal_bottom">Per la visualizzazione delle cartografie nel proprio browser con Google Earth - Plugin è necessario abilitare Javascript.</p></noscript>
      </div>
      <div class="banner_03_c05">
        <a name="webgis" tabindex="0"></a>
		<h2 class="titolo">Elenco dei link a siti Web Gis </h2>
        <p class="ban_text">Web GIS</p>
         <ul class="lista">
          <li><a href="http://ambiente.regione.emilia-romagna.it/geologia/cartografia/webgis-banchedati/webgis-suoli" title="Apri il sito della Cartografia dei suoli" rel="external">Cartografia dei suoli</a></li>
          <li><a href="http://ambiente.regione.emilia-romagna.it/geologia/cartografia/webgis-banchedati/webgis" title="Apri il sito della Cartografia geologica" rel="external">Cartografia geologica</a></li>
          <li><a href="http://geo.regione.emilia-romagna.it/geocatalogo/" title="Apri Il Catalogo dei Dati Geografici" rel="external">Il Catalogo dei Dati Geografici</a></li>
         </ul>
      </div>   
  </div>
  
<%@ include file="footer.htm"
%>
