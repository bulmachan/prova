<%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%@ include file="params.jsp"
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

String scala="1:1.000.000";
String h1="LEGENDA della Carta dei Suoli al livello di dettaglio "+scala;
String pagLink="";
String pagPadre="";
String pagPadreTitle="";
String pagPadreDesc="";
String tabella="ped_user.ped_v_province";
String cartella="province";
String campoId="id_provincia";
String esempio="un numero (ad esempio Unità cartografica 3)";
String imgCarta="1000mila_tr.gif";
String titoloCarta="Carta dei Suoli al livello di dettaglio 1:1.000.000";
String stmt_Sql = "";

switch (liv){
	case 1:
	default:
		scala="1:1.000.000";
		h1="LEGENDA della Carta dei Suoli al livello di dettaglio "+scala;
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala;
		pagPadre="";
		pagLink="scheda_provincia";
		cartella="province";
		tabella="ped_user.ped_v_province";
		campoId="id_provincia";
		esempio="Livello più generale della cartografia dei suoli emiliano-romagnoli. Sono qui descritti sette gruppi di suoli (Unità Cartografiche), corrispondenti a grandi ambienti della regione (piana deltizia, aree rilevate della pianura alluvionale, alto Appennino, ecc.). Le 7 Unità Cartografiche sono identificate da un numero (ad esempio Unità Cartografica 3).";
		stmt_Sql = "SELECT " + campoId +" as id, etichetta, descrizione FROM " + tabella +" where sigla <> 'ACQ' and sigla <> 'CA' and sigla <> 'ALV' order by etichetta";
		imgCarta = "overview1.jpg";//"1000mila_tr.gif";
		titoloCarta="Carta dei Suoli al livello di dettaglio 1:1.000.000";
	break;
	
	case 2:
		scala="1:500.000";
		h1="LEGENDA della Carta dei Suoli al livello di dettaglio "+scala;
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala;
		pagPadre="";
		pagLink="scheda_sistema";
		cartella="sistemi";
		tabella="ped_user.ped_v_sistemi";
		campoId="id_sistema";
		esempio="I sette gruppi di suoli corrispondenti a grandi ambienti della regione, descritti nella carta alla scala 1:1.000.000, sono qui suddivisi in 27 sottogruppi (Unità Cartografiche), che entrano in maggiore dettaglio rispetto al rapporto suolo ambiente. Le 27 Unità cartografiche sono identificate da un numero seguito da una lettera maiuscola (ad esempio Unità cartografica 3A).";
		stmt_Sql = "SELECT " + campoId +" as id, etichetta, descrizione FROM " + tabella +" where sigla <> 'ACQ' and sigla <> 'CA' and sigla <> 'ALV' order by etichetta";
		imgCarta = "overview2.jpg";//"500mila_250mila_tr.gif";
		titoloCarta="Carta dei Suoli al livello di dettaglio 1:500.000";
	break;
	
	case 3:
		scala="1:250.000";
		h1="LEGENDA della Carta dei Suoli al livello di dettaglio "+scala;
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala;
		pagPadre="";
		pagLink="scheda_sottosistema";
		cartella="sottosistemi";
		tabella="ped_user.ped_v_sottosistemi";
		campoId="id_sottosistema";
		esempio="In questa rappresentazione cartografica sono sintetizzate le informazioni sui suoli della Regione con un dettaglio informativo tale che ha permesso di distinguere 91 Unità Cartografiche, identificate da un numero seguito da una lettera maiuscola e una lettera minuscola (ad esempio Unità cartografica 3Aa).";
		stmt_Sql = "SELECT " + campoId +" as id, etichetta, descrizione FROM " + tabella +" where sigla <> 'ACQ' and sigla <> 'CA' and sigla <> 'ALV' order by etichetta";
		imgCarta = "overview3.jpg";//"500mila_250mila_tr.gif";
		titoloCarta="Carta dei Suoli al livello di dettaglio 1:250.000";
	break;
	
	case 5:
		scala="1:50.000";
		h1="LEGENDA della Carta della Capacità d'uso dei Suoli di pianura al livello di dettaglio "+scala;
		pageHeader = "Carta della Capacità d'uso dei Suoli di pianura al livello di dettaglio "+scala;
		pagPadre="carte_tematiche.jsp?tem=2#carta"+liv;
		pagPadreTitle="Torna alla lista delle carte tematiche - carte applicative";
		pagPadreDesc="Carte tematiche ›› Carte applicative";
		pagLink="";
		cartella="capacitauso";
		tabella="ped_user.ped_capacitauso_classi";
		campoId="id_classe";
		esempio="Il sistema di classificazioni prevede 8 Classi di capacità d’uso definite secondo il tipo e l’intensità della limitazione del suolo che condiziona sia la scelta delle colture che la produttività delle stesse. Nella carta sono in realtà presenti anche molte classi intermedie (es. I/II) dovute alla complessità della distribuzione dei suoli.";
		stmt_Sql = "SELECT " + campoId +" as id, sigla as etichetta, descrizione FROM " + tabella +" where sigla <> 'ND' order by id_classe";
		imgCarta="overview5.jpg";//"50mila_cu.gif";
		titoloCarta="Carta della Capacità d'uso dei Suoli di pianura al livello di dettaglio "+scala;
	break;

}

ResultSet rs = null;

try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(stmt_Sql);
%>
<% 
   title = h1.replaceAll(":", " a ");
%>
<%@ include file="head.jsp"
%>
<ul class="skip">
	<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
	<li><a href="#contenutopagina" title="Descrizione della <%=h1%>  - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
    <li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
	<li><a href="#menu" title="Salta all'elenco delle Unità cartografiche <%=scala%> - accesskey n" accesskey="n">Salta all'elenco delle Unità cartografiche [n]</a> </li>
 </ul>
 
<%@ include file="testata.jsp"
%>  
  	</div>
  <div class="briciole">
  <a name="homepage" tabindex="0"></a>
  <a accesskey="h" href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
<% if(!pagPadre.equals("")){
%>  
	&#8250;&#8250; <a href="<%=pagPadre%>" title="<%=pagPadreTitle%>"><%=pagPadreDesc%></a>
<%	
	}
	out.println("&nbsp;&#8250;&#8250; Legenda "+titoloCarta);
%>  
  
  </div>

  
  <div id="content_legenda">
	<a name="contenutopagina" tabindex="0"></a>
    <h2><%=h1%></h2>
	
    <div ><a href="ge/kml.jsp?liv=<%=liv%>" type="application/vnd.google-earth.kml+xml" title="Apri con Google Earth la mappa interattiva dei Suoli Territorio Regionale - al livello di dettaglio 1:1.000.000"><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/<%=imgCarta%>" width="200" height="110" alt="<%=h1%>" title="Click per aprire la <%=titoloCarta%> in Google Earth [deve essere installato localmente]" /></a></div>
    <div class="par_leg"><%=esempio%></div>
    <a name="menu" tabindex="0"></a>
    <table class="table_legenda" summary="<%=h1%>">
	<caption><%=h1%></caption>
      <thead>
        <tr>
          <th id="c01" scope="col">Unità cartografica</th>
          <th id="c02" scope="col">Descrizione</th>
        </tr>    
      </thead>
      <tbody> 
 <%	
 Integer i = 0;
 while(rs.next()){
%>     <tr>
         <td headers="c01" id="r0<%=i%>">
          
<img src="<%=pathImg%>/<%=cartella%>/legenda/<%=rs.getString("etichetta").toLowerCase()%>.gif" width="22" height="12" alt="Tassello dell'Unità cartografica <%=rs.getString("etichetta")%>" />
<% if(!pagLink.equals("")){
%>
      <a href="<%=pagLink%>.jsp?id=<%=rs.getString("id")%>" title="Visualizza scheda unit&agrave; cartografica <%=rs.getString("id")%> - Carta dei Suoli scala <%=scala%>"><%=rs.getString("etichetta")%></a>
<%
  } else {
	out.println("<strong>"+rs.getString("etichetta")+"</strong>");
  }
%>
          </td>
          <td headers="c01 r0<%=i%> c02"><%=rs.getString("descrizione")%></td>
        </tr>
<% 
	i++;
}
	rs.close();
	stm.close();
%>
        </tbody>
    </table><p><br /></p>
      

</div>

<%	
		if (liv == 5) {
%>
			<div class="link_note_illustrative">
			<a href="/gstatico/documenti/dati_pedol/CAPACITA_USO.pdf" rel="external">Note illustrative</a> [PDF]
			</div>
<%
		}

	} catch(Exception ee2) {
		out.println(ee2.getMessage());
		ee2.printStackTrace();
	}
%>


<%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>
