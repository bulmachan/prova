<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%>

<%
title = "Unit&agrave; cartografica&nbsp; - Carta dei suoli alla scala 1:1.000.000";
pageHeader = "Carta dei suoli alla scala 1:1.000.000";
%>

<%@ include file="head.jsp"
%>

<ul class="skip">
	<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
	<li><a href="#contenutopagina" title="Salta alla descrizione Catalogo dei tipi di suolo  - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
    <li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
	<li><a href="#menu" title="Salta all'elenco delle Unità cartografiche 1:1.000.000 - accesskey n" accesskey="n">Salta all'elenco delle Unità cartografiche [n]</a> </li>
 </ul>
		<%@ include file="testata.jsp"
		%> 


  
  	</div>
  <div class="briciole">
  <a name="homepage" tabindex="0"></a>
  <a accesskey="h" href="index.jsp" title="Torna alla pagina principale">Home Page</a>
&nbsp;&#8250;&#8250; Catalogo dei tipi di suolo
  </div>

  
  <div id="content_legenda">
	<a name="contenutopagina" tabindex="0"></a>
	<h1>Carta dei Suoli al livello di dettaglio 1:50.000</h1>
    <h2>Catalogo dei tipi di suolo</h2>
	
    <div><img class="img_leg" src="/gstatico/documenti/cartpedo/immagini/catalogo_tipi_suolo.jpg" width="200" height="134" alt="Catalogo dei tipi di suolo" title="Catalogo dei tipi di suolo" /></a></div>
    <div class="par_leg">Qui sono elencati in ordine alfabetico tutti i <strong>396</strong> tipi di suolo descritti nella carta dei suoli in scala 1:50.000, relativi agli ambienti della pianura e di parte del basso e medio Appennino (collina e media montagna). <br />Per ogni suolo è presente una <strong>scheda generale</strong> in cui è presente una breve descrizione del suolo, classificazione ST e WRB, profilo rappresentativo, sequenza tipica degli orizzonti genetici e qualità specifiche. Per <strong>174</strong> suoli di pianura <strong>24</strong> di collina e <strong>6</strong> di montagna sono disponibili anche schede più dettagliate riguardo a <strong>considerazioni sulla gestione</strong> (qualità agronomiche, sistemazioni, tecniche di lavorazione, fertilizzazione, irrigazione) e <strong>indicazioni sulla scelta delle colture</strong> (colture agrarie e forestali).</div>
    <a name="menu" tabindex="0"></a>
	<p>&nbsp;</p><p>&nbsp;</p>
	<div class="par_leg">&nbsp;&nbsp;| 
	
<%

String stmt_Sql = "SELECT substr(ped_suoli.xid_suolo,1,1) as lettera "+
			"FROM ped_user.ped_suoli "+
			"WHERE ped_suoli.flag_cat =-1 "+
			"group by substr(ped_suoli.xid_suolo,1,1) "+
			"ORDER BY substr(ped_suoli.xid_suolo,1,1) ";
			
ResultSet rs2 = null;
try
{
	Statement stm2 = dbConn.createStatement();
	rs2 = stm2.executeQuery(stmt_Sql);			
	while(rs2.next()){
		out.println("<a href=\"#Lettera_"+rs2.getString("lettera")+"\"><strong>"+rs2.getString("lettera")+"</strong></a> | ");
	}		
	rs2.close();
	stm2.close();
} catch(Exception ee2) {
	out.println(ee2.getMessage());
	ee2.printStackTrace();
}			

%>	
	</div>
	<p>&nbsp;</p>
    <table class="table_legenda" summary="Catalogo dei tipi di suolo">
	<caption>Tipi di suolo</caption>
      <thead>
        <tr>
          <th id="c01" scope="col">Sigla suolo</th>
          <th id="c02" scope="col">Nome suolo</th>
        </tr>    
      </thead>
      <tbody> 
<%	  
 stmt_Sql = "SELECT ped_suoli.xid_suolo, ped_suoli.nome_suolo "+
			"FROM ped_user.ped_suoli "+
			"WHERE ped_suoli.flag_cat =-1 "+
			"ORDER BY ped_suoli.xid_suolo";


	
String format = String.format("%%0%dd", 3);
ResultSet rs = null;

try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(stmt_Sql);
	int i=0;
	String lettera="";
	String testpLetteraAncor="";
	
	while(rs.next())
	{
		i++;
		if(!rs.getString("xid_suolo").substring(0,1).equals(lettera)){
			testpLetteraAncor="<a name=\"Lettera_"+rs.getString("xid_suolo").substring(0,1)+"\" tabindex=\"0\"></a>";
		} else {
			testpLetteraAncor="";
		}
		lettera=rs.getString("xid_suolo").substring(0,1);
			
		
%>	  

      <tr>
         <td headers="c01" id="r<%=String.format(format, i)%>">

			<a href="scheda_suolo.jsp?id=<%=rs.getString("xid_suolo")%>" title="Visualizza la scheda del suolo <%=rs.getString("nome_suolo").replace("\"","&quot;")%>"><strong><%=rs.getString("xid_suolo")%></strong></a>

          </td>
          <td headers="c01 r<%=String.format(format, i)%> c02"><%=testpLetteraAncor%><%=rs.getString("nome_suolo").replace("<","&lt;").replace(">","&gt;")%></td>
        </tr>
 
 <%
	}

		rs.close();
		stm.close();
	} catch(Exception ee) {
		out.println(ee.getMessage());
		ee.printStackTrace();
	}
 %>
        </tbody>
    </table>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>	
 	<p>&nbsp;</p>
	<p>&nbsp;</p>	
	<p>&nbsp;</p>	
	<p>&nbsp;</p>	
	<p>&nbsp;</p>	
	<p>&nbsp;</p>	
      

</div>




<%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>
