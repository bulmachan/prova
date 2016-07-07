<%
String scala = "Livello di dettaglio 1:1.000.000 - I suoli";
%>
<%@ include file="head_balloon.jsp"
%><%@ include file="testata_balloon.htm"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%@ include file="../params.jsp"
%><%
String sqlString="";
ResultSet rs = null;
ResultSet rs2 = null;

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

try {
	
	sqlString="SELECT PED_F_PROVINCE_POL.GISID, PED_F_PROVINCE_POL.CODICE, PED_F_PROVINCE_POL.ID_PROVINCIA, PED_PROVINCE.SIGLA, PED_PROVINCE.PAESAGGIO,PED_PROVINCE.DESCRIZIONE, 1000 as SCALA, PED_PROVINCE.DES_SUOLI_BAL, ANNO_AGG FROM ped_user.PED_F_PROVINCE_POL, ped_user.PED_PROVINCE WHERE PED_PROVINCE.ID_PROVINCIA = PED_F_PROVINCE_POL.ID_PROVINCIA AND PED_F_PROVINCE_POL.GISID="+id;
	
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=1">Torna alla Home Page</a></p>
		<%
	} else {

		sqlString="select PED_F_PROVINCE_POL.GISID, decode(PED_PED_IMMAGINI.DES_IMMAGINE,null,PED_IMMAGINI.DES_IMMAGINE,PED_PED_IMMAGINI.DES_IMMAGINE) as DIDASCALIA, COD_IMMAGINE as IMMAGINE, PED_T_IMMAGINI.DES_TIPOIMMAGINE from ped_user.PED_F_PROVINCE_POL, ped_user.PED_PED_IMMAGINI, ped_user.PED_T_IMMAGINI, ped_user.PED_IMMAGINI where PED_F_PROVINCE_POL.GISID=PED_PED_IMMAGINI.GISID AND PED_PED_IMMAGINI.ID_IMMAGINE=PED_IMMAGINI.ID_IMMAGINE AND PED_T_IMMAGINI.ID_TIPOIMMAGINE = PED_IMMAGINI.ID_TIPOIMMAGINE AND PED_F_PROVINCE_POL.GISID=" + id + " ORDER BY PED_PED_IMMAGINI.ORDINE ASC";

		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);
	%>


	  <p class="scala">Livello di dettaglio 1:1.000.000</p>
	  <div class="uc">
		 Unità Cartografica 
	  </div>
	  <div class="titolo_uc_bal">
	<%	out.println(rs.getString("SIGLA")+". "+rs.getString("PAESAGGIO"));
	%>
	  </div>
	  <div class="uc">
		Descrizione
	  </div>
	  <div class="titolo_uc_bal">
	<%	if (rs.getString("DESCRIZIONE")!=null) {
			out.println(rs.getString("DESCRIZIONE"));
		} else {
			out.println("-");
		}
	%>
	  </div>
	  <div class="uc">
		  Caratteri dei suoli
	  </div>
	  <div class="testo_uc_bal">
	<%
		String thisPage="";
		rs2.last();
		int numberOfRows = rs2.getRow();
		int currentIm=0;
		short kk;
		if (numberOfRows>0) {
			rs2.first();
			currentIm=1;
			if (request.getParameter("im")!=null){ 
				if (!request.getParameter("im").equals("")) {
					currentIm=Integer.parseInt(request.getParameter("im"));
				}
			}
			for (kk = 0; kk< currentIm-1; kk++){
				rs2.next();
			}
	%>

	  <div class="img_uc_bal_1000">
			<a href="<%=pathImg%>/paesaggi/<%=rs2.getString("IMMAGINE")%>.jpg" rel="external"><img src="<%=pathImg%>/paesaggi/<%=rs2.getString("IMMAGINE")%>_150.jpg" width="150" height="79" alt="paesaggio dell'unita' <%=rs.getString("SIGLA")%>" /></a>
			<div class="didascalia"><%=rs2.getString("DIDASCALIA")%></div>
	  </div>
	<%		if (currentIm<numberOfRows) { 
				thisPage = request.getRequestURL().toString() + "?id=" + request.getParameter("id") + "&im=" + (currentIm+1);
	%>     
	  <div class="fr_succ">
		<a href="<%=thisPage%>" title="immagine successiva">&#8250;&#8250;</a>
	  </div>
	<%		}
	%>
	<%		if (currentIm>1) { 
				thisPage = request.getRequestURL().toString() + "?id=" + request.getParameter("id") + "&im=" + (currentIm-1);
	%>      
	  <div class="fr_prec">
		<a href="<%=thisPage%>" title="immagine precedente">&#8249;&#8249;</a>
	  </div>
	<%		}
	%>

	<%	}
	%>
		<p><%
		if (rs.getString("DES_SUOLI_BAL")!=null) {
			out.println(rs.getString("DES_SUOLI_BAL"));
		} else {
			out.println("-");
		}
		%></p>
	  </div>


	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
	<%	if (rs.getString("ANNO_AGG")!=null) {
			out.println(rs.getString("ANNO_AGG")); 
		} else {
			out.println("-");
		}
	%>
	  </div>
	  
	<% 
		int idProvincia = Integer.parseInt(rs.getString("ID_PROVINCIA"));
		if (idProvincia>=1 && idProvincia<=7) {
	%>
		<div class="link_dettaglio">
			<a href="../scheda_provincia.jsp?id=<%=rs.getString("ID_PROVINCIA")%>" rel="external">apri scheda dettagli</a>
		</div>
	 
	<% 
	}
		rs.close();
		stm.close();
		rs2.close();
		stm2.close();
	}
} catch(Exception ee) {
	out.println(ee.getMessage());
	ee.printStackTrace();
}
%><%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer_balloon.htm"
%>
