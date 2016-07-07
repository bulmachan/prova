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
String h1="Legenda della Carta dei Suoli al livello di dettaglio "+scala;
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
	case 30:
	default:
		scala="1:50.000";
		h1="Legenda della Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola";
		pageHeader = "Carta al livello di dettaglio "+scala;
		pagPadre="";
		pagLink="scheda_provincia";
		cartella="province";
		tabella="ped_user.ped_v_province";
		campoId="id_provincia";
		esempio="I Gruppi Idrologici indicano il comportamento potenziale dei suoli nel generare scorrimento superficiale dell'acqua, secondo la <strong>metodologia USDA-NRCS</strong> (<i>National Engineering Hand Book</i>, parte 630, <strong>2009</strong>). Quest'ultima si basa sul presupposto che suoli all'interno di una medesima regione climatica simili per profondità, per capacità di infiltrazione, per tessitura, struttura e per profondità della falda, danno la stessa risposta come deflusso superficiale. In accordo alla metodologia sono presenti quattro gruppi principali <strong>A</strong>, <strong>B</strong>, <strong>C</strong> e <strong>D</strong> a deflusso superficiale potenziale crescente e tre <strong>classi duali</strong> <strong>A/D</strong>, <strong>B/D</strong>, <strong>C/D</strong> dove la seconda lettera indica la presenza temporanea di una falda entro 60 cm. ";
		stmt_Sql = "select * from ped_user.ped_t_param_suolo where id is not null order by id asc nulls last, sigla";
		imgCarta = "overview30.jpg";//"1000mila_tr.gif";
		titoloCarta="Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola";
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
          <th id="c01" scope="col">Gruppo<br />Idrologico</th>
          <th id="c02" scope="col">Deflusso superficiale potenziale</th>
          <th id="c03" scope="col">Caratteri tipici dei suoli della pianura emiliano-romagnola nei Gruppi Idrologici</th>
        </tr>    
      </thead>
      <tbody> 
 <%	
 Integer i = 0;
 while(rs.next()){
%>     <tr>
         <td headers="c01" id="r0<%=i%>">
          <div style="width:22px;height:12px; background: none repeat scroll 0 0 rgb(<%=rs.getString("colore")%>); border: 1px solid white; float: left; padding: 2px;">&nbsp;</div>
<%
	out.println("<strong>&nbsp;&nbsp;"+rs.getString("sigla")+"</strong>");
  
%>
            </td>
            <td headers="c01 r0<%=i%> c02">
<% if(rs.getString("nome")!= null){
		out.print(rs.getString("nome"));
	} else {
		out.print("&nbsp;&nbsp;*");
	}
%>
 
			</td>
            <td headers="c01 r0<%=i%> c03">
<% if(rs.getString("descrizione")!= null){
		out.print(rs.getString("descrizione"));
	} else {
		out.print("&nbsp;");
	}
%>
 
 </td>

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
		if (liv == 30) {
%>
			<div class="link_note_illustrative">
			<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_GRUPPI_IDROLOGICI.pdf" rel="external">Note illustrative</a> [PDF]
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
