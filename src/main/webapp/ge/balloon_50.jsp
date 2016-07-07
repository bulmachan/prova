<%
String scala = "Livello di dettaglio 1:500.000 - I suoli";
%>
<%@ include file="head_balloon.jsp"
%><%@ include file="testata_balloon.htm"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%@ include file="../params.jsp"
%><%

//String urlGias="http://gias.regione.emilia-romagna.it/suoli/getdelineazione.asp?delineazione"; // VECCHISSIMO SITO
//String urlGias="http://www2.altavianet.it/newsuoli/delineazione.asp?delineazione"; // VECCHIO SITO
String urlGias="http://www.suolo.it/delineazione.asp?delineazione";
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
	
	//sqlString="SELECT PED_F_DELINEAZIONI_POL.GISID, PED_F_DELINEAZIONI_POL.CODICE, PED_F_DELINEAZIONI_POL.ID_DELINEAZIONE, PED_DELINEAZIONI.SIGLA, PED_DELINEAZIONI.SIGLA_SUOLI_BAL, PED_DELINEAZIONI.DES_SIGLA_SUOLI_BAL, 50 as SCALA, PED_DELINEAZIONI.PAESAGGIO, PED_F_DELINEAZIONI_POL.CODICE_GIAS, ANNO_AGG FROM ped_user.PED_F_DELINEAZIONI_POL, ped_user.PED_DELINEAZIONI WHERE PED_DELINEAZIONI.ID_DELINEAZIONE = PED_F_DELINEAZIONI_POL.ID_DELINEAZIONE AND PED_F_DELINEAZIONI_POL.GISID="+request.getParameter("id");
	

	sqlString="SELECT PED_F_DELINEAZIONI_POL.GISID, PED_DELINEAZIONI.CODICE, PED_DELINEAZIONI.COD_UC as SIGLA, PED_DELINEAZIONI.SIGLA_UC as SIGLA_SUOLI_BAL, PED_DELINEAZIONI.DESCRIZIONE_UC as DES_SIGLA_SUOLI_BAL, 50 as SCALA, PED_DELINEAZIONI.PAESAGGIO, ANNO_UPD as ANNO_AGG FROM ped_user.PED_F_DELINEAZIONI_POL, ped_user.PED_DELINEAZIONI WHERE PED_DELINEAZIONI.XID_DELIN = PED_F_DELINEAZIONI_POL.gisid AND PED_F_DELINEAZIONI_POL.GISID="+request.getParameter("id");




	//out.print(sqlString);

	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=4">Torna alla Home Page</a></p>
		<%
	} else {

		sqlString="select PED_F_DELINEAZIONI_POL.GISID, decode(PED_PED_IMMAGINI.DES_IMMAGINE,null,PED_IMMAGINI.DES_IMMAGINE,PED_PED_IMMAGINI.DES_IMMAGINE) as DIDASCALIA, COD_IMMAGINE as IMMAGINE, PED_T_IMMAGINI.DES_TIPOIMMAGINE from ped_user.PED_F_DELINEAZIONI_POL, ped_user.PED_PED_IMMAGINI, ped_user.PED_T_IMMAGINI, ped_user.PED_IMMAGINI where PED_F_DELINEAZIONI_POL.GISID=PED_PED_IMMAGINI.GISID AND PED_PED_IMMAGINI.ID_IMMAGINE=PED_IMMAGINI.ID_IMMAGINE AND PED_T_IMMAGINI.ID_TIPOIMMAGINE = PED_IMMAGINI.ID_TIPOIMMAGINE AND PED_F_DELINEAZIONI_POL.GISID=" + request.getParameter("id") + " ORDER BY PED_PED_IMMAGINI.ORDINE ASC";

		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);
	%>


	  <p class="scala">Livello di dettaglio 1:50.000</p>
	  <div class="uc">
		 Unità Cartografica 
	  </div>
	  <div class="titolo_uc_bal">
	<%	if (rs.getString("SIGLA_SUOLI_BAL") != null) {
			if (rs.getString("GISID") != null) {
				out.println(rs.getString("SIGLA_SUOLI_BAL") + " (Num. delineazione: " + rs.getString("GISID") + ")");
			} else {
				out.println(rs.getString("SIGLA_SUOLI_BAL"));
			}
		} else {
			out.println("-");
		}
	%>
	  </div>
	  <div class="uc">
		Nome dell'unità cartografica
	  </div>
	  <div class="titolo_uc_bal">
	<%	if (rs.getString("DES_SIGLA_SUOLI_BAL") != null) {
			
			char[] stringArray = rs.getString("DES_SIGLA_SUOLI_BAL").toCharArray();
			stringArray[0] = Character.toUpperCase(stringArray[0]);
			String myString = new String(stringArray);
			
			out.println(myString);
		} else {
			out.println("-");
		}
	%>
	  </div>
	  <div class="uc">
		  Descrizione dell’ambiente
	  </div>
	  <div class="testo_uc_bal">
	<% 	if (rs.getString("PAESAGGIO") != null) {
			if (rs.getString("PAESAGGIO").length() > 800) {
				out.println(rs.getString("PAESAGGIO").substring(0, 800) + "...");
			} else {
				out.println(rs.getString("PAESAGGIO"));
			}
		} else {
			out.println("-");
		}
	%>
	  </div>

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

	  <div class="img_uc_bal">
			<a href="<%=pathImg%>/paesaggi/<%=rs2.getString("IMMAGINE")%>.jpg" rel="external"><img src="<%=pathImg%>/paesaggi/<%=rs2.getString("IMMAGINE")%>_150.jpg" width="150" height="79" alt="paesaggio di <%=rs.getString("PAESAGGIO")%>" /></a>
			<div class="didascalia"><%=rs2.getString("DIDASCALIA")%></div>
	  </div>
	<%		if (currentIm<numberOfRows) { 
				thisPage = request.getServletPath().replace("/","") + "?id=" + request.getParameter("id") + "&im=" + (currentIm+1);
	%>     
	  <div class="fr_succ">
		<a href="<%=thisPage%>" title="immagine successiva">&#8250;&#8250;</a>
	  </div>
	<%		}
	%>
	<%		if (currentIm>1) { 
				thisPage = request.getServletPath().replace("/","") + "?id=" + request.getParameter("id") + "&im=" + (currentIm-1);
	%>      
	  <div class="fr_prec">
		<a href="<%=thisPage%>" title="immagine precedente">&#8249;&#8249;</a>
	  </div>
	<%		}
	%>


	<%	}
	%>

	<%  
	  if (rs.getString("GISID")!=null) {
	%> 
	  
	  <!-- ATTIVATO IL 5 luglio!! PER IL MOMENTO LO TOGLIAMO FINCHE' LUIGI NUOVO ANCORA NON E' IN PRODUZIONE -->
	  <div class="uc"> 
		  Descrizione dei suoli
	  </div>
	  
	  <div class="link_dettaglio">
		<a href="https://applicazioni.regione.emilia-romagna.it/cartografia_sgss/user/jsp/IdentifyDelineazioni.jsp?XID_DELINEAZIONE=<%=rs.getString("GISID")%>" rel="external">Apri scheda</a>
	  </div>


	  <div class="uc">
		  Documenti collegati
	  </div>

	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/carta_suoli_50k.pdf" rel="external">Carta dei suoli 1:50.000</a>
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/SITI_BENCHMARK_RER.pdf" rel="external">Siti rappresentativi locali</a>
	  </div>
	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
	<%	
		if (rs.getString("ANNO_AGG")!=null) {
			out.println(rs.getString("ANNO_AGG"));
		} else {
			out.println("-");
		}
	%>
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
