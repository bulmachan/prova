<%
String scala = "";
String titoloLegenda = "";
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
int liv=0;
if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv=Integer.parseInt(request.getParameter("liv"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}

String sqlString="";
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
String vtab_met="";
String sigla_met="";

try {
	
	if(liv==13){
		sqlString="select PED_VTAB_MET_CROMO_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_CROMO_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_CROMO_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_CROMO_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale del Cromo [Cr]<br />della pianura emiliano-romagnola. 2a edizione<br />Scala 1:250.000";
		titoloLegenda="Cromo";
		vtab_met="PED_VTAB_MET_CROMO_POL";
		sigla_met="CR";
	}
	if(liv==14){
		sqlString="select PED_VTAB_MET_NICHEL_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_NICHEL_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_NICHEL_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_NICHEL_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale del Nichel [Ni]<br />della pianura emiliano-romagnola. 2a edizione<br />Scala 1:250.000";
		titoloLegenda="Nichel";
		vtab_met="PED_VTAB_MET_NICHEL_POL";
		sigla_met="NI";
	}
	if(liv==15){
		sqlString="select PED_VTAB_MET_PIOMBO_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_PIOMBO_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_PIOMBO_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_PIOMBO_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale del Piombo [Pb]<br />della pianura emiliano-romagnola. 2a edizione<br />Scala 1:250.000";
		titoloLegenda="Piombo";
		vtab_met="PED_VTAB_MET_PIOMBO_POL";
		sigla_met="PB";
	}
	if(liv==16){
		sqlString="select PED_VTAB_MET_RAME_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_RAME_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_RAME_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_RAME_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale del Rame [Cu]<br />della pianura emiliano-romagnola. 2a edizione<br />Scala 1:250.000";
		titoloLegenda="Rame";
		vtab_met="PED_VTAB_MET_RAME_POL";
		sigla_met="CU";
	}
	if(liv==17){
		sqlString="select PED_VTAB_MET_ZINCO_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_ZINCO_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_ZINCO_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_ZINCO_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale dello Zinco [Zn]<br />della pianura emiliano-romagnola. 2a edizione<br />Scala 1:250.000";
		titoloLegenda="Zinco";
		vtab_met="PED_VTAB_MET_ZINCO_POL";
		sigla_met="ZN";
	}
	if(liv==35){
		sqlString="select PED_VTAB_MET_VANADIO_POL.*, ped_legende_ge_pedochimiche.descrizione from ped_user.PED_VTAB_MET_VANADIO_POL, ped_user.ped_legende_ge_pedochimiche where PED_VTAB_MET_VANADIO_POL.classe_ge = ped_legende_ge_pedochimiche.id and PED_VTAB_MET_VANADIO_POL.id_delineazione = " + id + " and ped_legende_ge_pedochimiche.liv = "+liv;
	
		scala="Carta del Fondo naturale del Vanadio [V]<br />della pianura emiliano-romagnola<br />Scala 1:250.000";
		titoloLegenda="Vanadio";
		vtab_met="PED_VTAB_MET_VANADIO_POL";
		sigla_met="V";
	}        

//out.println(sqlString);
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=<%=liv%>">Torna alla Home Page</a></p>
		<%
	} else {

		//sqlString="select classe_ge, classe, colore from ped_user."+vtab_met+", ped_user.ped_legende_ge_pedochimiche where "+vtab_met+".classe_ge =ped_legende_ge_pedochimiche.id and ped_legende_ge_pedochimiche.liv = " + liv + " group by classe_ge, classe, colore order by classe_ge";
		
		//sqlString="SELECT id as classe_ge, classe_decod as classe, colore FROM ped_user.ped_legende_ge_pedochimiche, PED_USER.ped_t_pedochimiche WHERE ped_legende_ge_pedochimiche.id=ped_t_pedochimiche.classe_ge and ped_legende_ge_pedochimiche.liv = " + liv + " and PED_T_PEDOCHIMICHE.metallo='"+sigla_met+"' GROUP BY id, classe_decod,   colore ORDER BY id";
		
		sqlString="SELECT id as classe_ge, descrizione as classe, colore FROM ped_user.ped_legende_ge_pedochimiche WHERE  ped_legende_ge_pedochimiche.liv = " + liv + " order by id";
		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);
//out.println(sqlString);
	%>

	  <p class="scala"><%=scala%></p>
	  <div class="uc">
		 Classe di concentrazione
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("CLASSE") != null) {
			out.println(rs.getString("CLASSE"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>

	  <div class="uc">
		 Unità
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("UNITA") != null) {
			out.println(rs.getString("UNITA"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>
	  
	  <div class="uc">
		 Suoli
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("SUOLI") != null) {
			out.println(rs.getString("SUOLI"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>



	  <div class="uc">
		 Provenienza dei sedimenti
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("PROVENIENZA_SEDIMENTI") != null) {
			out.println(rs.getString("PROVENIENZA_SEDIMENTI"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>




	  <div class="uc">
		 Complesso ambientale/<i>Ambiente deposizionale</i>
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("COMPL_AMB_DEP") != null) {
			out.println(rs.getString("COMPL_AMB_DEP").replace(" / ", " / <i>")+"</i>");
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>




	  <div class="uc">
		 50° percentile (mg/kg)
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("PER50") != null) {
			out.println(rs.getString("PER50"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>


	  <div class="uc">
		 90° percentile (mg/kg)
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("PER90") != null) {
			out.println(rs.getString("PER90"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>


	  <div class="uc">
		 95° percentile (mg/kg)
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("PER95") != null) {
			out.println(rs.getString("PER95"));
		} else {
			out.println("-");
		} 
	%>
	  </strong>
	  </div>




	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
	  <strong>Classi</strong>

	<table  class="table_gloss" summary="Legenda Cromo">
		<caption>Classi</caption>
		<thead>
			<tr>
				<th id="c01"><%=titoloLegenda%></th>
				<th id="c02"></th>
			</tr>   
		</thead>
		<tbody>
	<%	while(rs2.next()){
	%>
			<tr>
				<th id="r0<%=rs2.getString("classe")%>" headers="c01"><%=rs2.getString("classe")%></th>
				<td headers="c01 r0<%=rs2.getString("classe")%> c02" style="background-color: rgb(<%=rs2.getString("colore")%>);">&nbsp;</td>
			</tr>
	<% }
		rs2.close();
		stm2.close();
	%>

		</tbody>
	</table>
	  
	  <div class="titolo_uc_bal">
		La concentrazione è espressa in mg/kg		
	  </div>

<% if(liv==13){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u>, con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>35%</strong> circa.</p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->

<% } else if(liv==14){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u>, con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>23%</strong> circa.</p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->

<% } else if(liv==15){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u>. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>7%</strong> circa.</p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->

<% } else if(liv==16){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u> con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>17%</strong> circa. </p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->

<% } else if(liv==17){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u> con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>14%</strong> circa. </p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->

<% } else if(liv==35){
%>		  
	<p class="note"><strong>Note</strong>: i valori di concentrazione sono ottenuti con il metodo analitico <strong>XRF</strong> (Spettrometria per Fluorescenza a raggi X). Per questo metallo l'attacco con acqua regia e lettura ICP-MS (metodo UNI EN 13346- 2002/EPA 6020) determina valori <u>inferiori rispetto a quelli ottenuti con l'XRF</u> con una percentuale variabile in relazione alle caratteristiche fisico-chimiche della matrice. Una media sul set di dati utilizzati per la carta segnala uno scarto del <strong>37%</strong> circa. </p>
	<!-- <p class="note">Classificazione dei suoli: WRB, 2007.</p> -->
        
<% } else {  %>
	<p class="note">&nbsp;</p>
<% } %>
	
	</div>

	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2016		
	  </div>
	  <div class="link_dettaglio">
<% if(liv==13 || liv==14 || liv==15 || liv==16 || liv==17 || liv==35){
%>		  
		<a href="/gstatico/documenti/dati_pedol/CARTA_PEDOGEOCHIMICA.pdf" rel="external">Apri note illustrative</a>
<% } %>
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
