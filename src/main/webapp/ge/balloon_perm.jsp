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
	
	sqlString="select gisid,etichetta,attendibilita from ped_user.ped_vf_permeabilita_ge_pol where gisid="+id;
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

		sqlString="SELECT LEG.ID, LEG.COLORE, LEG.DESCRIZIONE, VAL.ETICHETTA FROM (SELECT ID, COLORE, DESCRIZIONE FROM PED_USER.PED_LEGENDE_GE_PROPRIETA_CF WHERE LIV=32) LEG LEFT JOIN (SELECT CLASSE, ETICHETTA FROM PED_USER.PED_CARTE_TEM_DEL WHERE PED_CARTE_TEM_DEL.ATTRIBUTO = 'KSAT_CL' GROUP BY CLASSE, ETICHETTA) VAL ON LEG.ID=VAL.CLASSE ORDER BY LEG.ID";

		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);

	%>


	  <p class="scala"><strong>Conducibilità idraulica satura (Ksat) dei suoli della pianura emiliano-romagnola</strong><br />Livello di dettaglio 1:50.000</p>
	  <div class="uc">
		 Classe 
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
		Attendibilità
	  </div>
	  <div class="titolo_gruppi_bal">
	<%	if(rs.getString("attendibilita") != null) {
			out.println("<b><p>&nbsp;&nbsp;"+rs.getString("attendibilita")+"</p></b>");
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
		<p class="col_01"><b>Classe Ksat [*]</b></p>
		<p>&nbsp;</p>
	<%	while(rs2.next()){
	%>
		
			<div style="width:22px;height:12px; background: none repeat scroll 0 0 rgb(<%=rs2.getString("colore")%>); border: 0; float: left; padding: 2px;">&nbsp;</div>		
			
			<p class="col_01">&nbsp;<strong><%=rs2.getString("descrizione")%></strong></p>
			<p class="col_02" style="padding: 0 0 10px;">&nbsp;&nbsp;(<%=rs2.getString("ETICHETTA")%> cm/h)</p>

	<% }
		rs2.close();
		stm2.close();
	%>
			<p class="col_01" style="padding: 0 0 5px;">[*] <em>Soil Survey Manual</em> USDA, 1993.</p>
		</div>
	  </div>





	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2015
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/XXXXXXXXXXXX.pdf" rel="external">apri note illustrative</a>
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
