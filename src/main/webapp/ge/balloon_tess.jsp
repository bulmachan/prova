<%
String scala = "Livello di dettaglio 1:50.000 - Carta della tessitura dei suoli di pianura tra 0-30 cm";
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
	
	sqlString="  SELECT "+
          " PED_TESSITURA.GISID, to_char(PED_TESSITURA.SABBIA,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as SABBIA, "+
          " ASAB.LEGENDA AS ATT_SABBIE, to_char(PED_TESSITURA.LIMO,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as LIMO, "+
          " ALIM.LEGENDA AS ATT_LIMO, to_char(PED_TESSITURA.ARGILLA,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as ARGILLA, "+
          " AARG.LEGENDA AS ATT_ARGILLA, to_char(PED_TESSITURA.SK,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as SK, "+
          " ASK.LEGENDA AS ATT_SK, "+
          " CASE WHEN PED_T_TESS.SIGLA IS NOT NULL "+
          "       THEN    PED_T_TESS.SIGLA || ' - ' || PED_T_TESS.DESCRIZIONE "+
		  " 	ELSE NULL "+
          " END AS CLASSE "+
		  " FROM PED_USER.PED_TESSITURA LEFT JOIN PED_USER.PED_T_CLASSE_ATTEND ASAB ON PED_TESSITURA.ATT_SABBIA = ASAB.CLASSE_ARG "+
          " LEFT JOIN PED_USER.PED_T_CLASSE_ATTEND ALIM ON PED_TESSITURA.ATT_LIMO = ALIM.CLASSE_ARG "+
          " LEFT JOIN PED_USER.PED_T_CLASSE_ATTEND AARG ON PED_TESSITURA.ATT_ARGILLA = AARG.CLASSE_ARG "+
          " LEFT JOIN PED_USER.PED_T_CLASSE_ATTEND ASK ON PED_TESSITURA.ATT_SK = ASK.CLASSE_ARG "+
          " LEFT JOIN PED_USER.PED_T_TESS ON PED_TESSITURA.ID_CLASSE_TEX = PED_T_TESS.ID_CLASSE_TEX where PED_TESSITURA.GISID="+id;
		  
	//out.println(dbConn.getMetaData().getURL() );
	//out.print(sqlString);
	
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=31">Torna alla Home Page</a></p>
		<%
	} else {



	%>


	  <p class="scala"><strong>Tessitura dei suoli di pianura tra 0-30 cm</strong><br />Livello di dettaglio 1:50.000</p>
	  
	  
		  <table width="100%">
			<tr style="background-color: #b3814b;color:#000">
				<td align="center" valign="top">
					<strong>Attributo</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>Valore&nbsp;stimato&nbsp;%</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>Attendibilità</strong>
				</td>
			</tr>
			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Sabbia</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("SABBIA") != null) {
							out.println(rs.getString("SABBIA"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ATT_SABBIE") != null) {
							out.println(rs.getString("ATT_SABBIE"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
			</tr>		  

			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Limo</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("LIMO") != null) {
							out.println(rs.getString("LIMO"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ATT_LIMO") != null) {
							out.println(rs.getString("ATT_LIMO"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
			</tr>	

			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Argilla</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("ARGILLA") != null) {
							out.println(rs.getString("ARGILLA"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ATT_ARGILLA") != null) {
							out.println(rs.getString("ATT_ARGILLA"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
			</tr>
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Scheletro</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("SK") != null) {
							out.println(rs.getString("SK"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ATT_SK") != null) {
							out.println(rs.getString("ATT_SK"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
			</tr>			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Classe tessiturale</strong>
				</td>
				<td align="center" colspan="2">
					<%	if (rs.getString("CLASSE") != null) {
							out.println(rs.getString("CLASSE"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
	
			</tr>  
		  </table>
		  <p></p>

	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
		<p>Le classi tessiturali sono espresse secondo il seguente diagramma:</p>
		<p style="padding: 0;margin-left: -10px;"><img src="images/schema_tess.png" border="0" width="270px" alt="Schema classi tessiturali" title="Schema classi tessiturali"/></p>
		<p>Le classi tessiturali argilloso sabbiosa (AS) e limosa (L) non sono presenti nella pianura emiliano-romagnola.</p>
		<p>Le frazioni granulometriche seguono lo standard USDA:</p>
		<table width="100%">
		<tr style="background-color: #E3CBB1;color:#000"><td><strong>&nbsp;Argilla</strong></td><td align="center">< 2 micron</td></tr>
		<tr style="background-color: #E3CBB1;color:#000"><td><strong>&nbsp;Limo</strong></td><td align="center">50-2 micron</td></tr>
		<tr style="background-color: #E3CBB1;color:#000"><td><strong>&nbsp;Sabbia</strong></td><td align="center">2000-50 micron</td></tr>
		<tr style="background-color: #E3CBB1;color:#000"><td><strong>&nbsp;Scheletro</strong></td><td align="center">> 2000 micron</td></tr>
		</table>
	  </div>



	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2015
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/tessitura_pianura.pdf" rel="external">apri note illustrative</a>
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
