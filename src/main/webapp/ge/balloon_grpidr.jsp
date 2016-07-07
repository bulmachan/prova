<%
String scala = "Livello di dettaglio 1:50.000 - Carta dei Gruppi Idrologici dei suoli della pianura emiliano-romagnola";
%>
<%@ include file="head_balloon.jsp"
%><%@ include file="testata_balloon.htm"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%@ include file="../params.jsp"
%><%

int id=0;
if (request.getParameter("id")!=null){ 
	if (!request.getParameter("id").equals("")) {
		try {
			id=Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}

String sqlString="";
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;


try {
	
	sqlString="select xid_delin,etichetta,percent_gruppi from ped_user.ped_vtab_gruppi_idrol_perc where xid_delin="+id;
	//out.println(dbConn.getMetaData().getURL() );
	//out.print(sqlString);
	
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=5">Torna alla Home Page</a></p>
		<%
	} else {

		sqlString="select * from ped_user.ped_t_param_suolo order by id asc nulls last, sigla";

		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);

	%>


	  <p class="scala"><strong>Gruppi Idrologici dei suoli della pianura emiliano-romagnola</strong><br />Livello di dettaglio 1:50.000</p>
	  <div class="uc">
		 Gruppo Idrologico prevalente 
	  </div>
	  <div class="titolo_gruppi_bal">
	<%	if (rs.getString("etichetta") != null) {
			out.println("<b><p>&nbsp;&nbsp;"+rs.getString("etichetta")+"</p></b>");
		} else {
			out.println("-");
		} 
	%>
	  </div>
	  <div class="uc">
		Gruppi Idrologici presenti
	  </div>
	  <div class="titolo_gruppi_bal">
	<%	if(rs.getString("percent_gruppi") != null) {
			out.println("<b><p>&nbsp;&nbsp;"+rs.getString("percent_gruppi").replace(";","</p><p>&nbsp;").replace(":",":&nbsp;")+"</p></b>");
			//out.println("<b><p>"+rs.getString("percent_gruppi").replace(";","&nbsp;&nbsp;&nbsp;")+"</p></b>");
		} else {
			out.println("-");
		}
	%>
	  </div>
	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
		<div class="voce_leg">
		<p class="col_01"><b>Gruppo</b></p>
		<p class="col_02" style="padding: 0 0 8px;margin: 0 0 0 6em;"><b>Deflusso superficiale potenziale</b></p>
	<%	while(rs2.next()){
	%>
		
		<div style="width:22px;height:12px; background: none repeat scroll 0 0 rgb(<%=rs2.getString("colore")%>); border: 0 solid white; float: left; padding: 2px;">&nbsp;</div>		
		
		<p class="col_01">
			

	<%	 
		out.print("&nbsp;&nbsp;<strong>"+rs2.getString("sigla")+"</strong>");
	%>
		</p>
<% if(rs2.getString("sigla").equals("B/D") || rs2.getString("sigla").equals("C/D")){
%>
		<p class="col_02" style="padding: 0 0 3px;margin: 0 0 0 6em;">
<% } else {
%>
		<p class="col_02" style="padding: 0 0 10px;margin: 0 0 0 6em;">
<% }
%>

	<% if(rs2.getString("nome")!= null){
		out.print(rs2.getString("nome"));
	} else {
		out.print("&nbsp;*&nbsp;");
	}
	%>
		</p>

	<% }
		rs2.close();
		stm2.close();
	%>
	<p class="col_01" style="padding: 0 0 5px;">* Poligoni in cui non c’è un singolo gruppo idrologico prevalente.</p>
	</div>
	  </div>





	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2014
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_GRUPPI_IDROLOGICI.pdf" rel="external">apri note illustrative</a>
	  </div>
	  

	<% 
		rs.close();
		stm.close();
	}
} catch(Exception ee) {
	out.println(ee.getMessage());
	ee.printStackTrace();
}
%><%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer_balloon.htm"
%>
