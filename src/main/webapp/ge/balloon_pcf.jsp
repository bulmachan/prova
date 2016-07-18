<%
String scala = "Livello di dettaglio 1:50.000 - Carta del contenuto % di carbonio organico nei suoli di pianura tra 0-30 cm";
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


try {
	
	if(liv==6){
		sqlString="select ped_vf_c_organico_p_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_c_organico_p_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_c_organico_p_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_c_organico_p_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
	
		scala="<strong>Contenuto % di carbonio organico tra 0-30 cm nei suoli di pianura. 2a edizione</strong><br />Livello di dettaglio 1:50.000";
	}
	if(liv==34){
		sqlString="select ped_vf_c_organico100_p_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_c_organico100_p_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_c_organico100_p_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_c_organico100_p_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
	
		scala="<strong>Contenuto % di carbonio organico tra 0-100 cm nei suoli di pianura.</strong><br />Livello di dettaglio 1:50.000";
	}
        if(liv==7){
		sqlString="select ped_vf_c_organico_m_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_c_organico_m_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_c_organico_m_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_c_organico_m_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
		
		scala="<strong>Contenuto % di carbonio organico tra 0-30 cm nei suoli dell'Appennino</strong><br />Livello di dettaglio 1:250.000";
	}
	/*if(liv==8){
		sqlString="select ped_vf_argilla_p_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_argilla_p_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_argilla_p_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_argilla_p_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
		
		scala="Carta del contenuto % di argilla nei suoli di pianura tra 0-30 cm<br />Livello di dettaglio 1:50.000";
	}*/
	if(liv==9){
		sqlString="select ped_vf_stock30_p_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_stock30_p_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_stock30_p_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_stock30_p_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv+" and ped_legende_ge_proprieta_cf.id <> 9999";
		
		scala="<strong>Carbonio organico immagazzinato nei suoli di pianura tra 0-30 cm. 2a edizione</strong><br />Livello di dettaglio 1:50.000";
	}
	if(liv==10){
		sqlString="select ped_vf_stock30_m_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_stock30_m_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_stock30_m_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_stock30_m_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
		
		scala="<strong>Carbonio organico immagazzinato nei suoli di pianura tra 0-100 cm</strong><br />Livello di dettaglio 1:50.000";
	}
	if(liv==11){
		sqlString="select ped_vf_stock100_p_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_stock100_p_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_stock100_p_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_stock100_p_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
		
		scala="<strong>Carbonio organico immagazzinato nei suoli dell'Appennino tra 0-30 cm</strong><br />Livello di dettaglio 1:250.000";
	}
	if(liv==12){
		sqlString="select ped_vf_stock100_m_ge_pol.*, ped_legende_ge_proprieta_cf.descrizione from ped_user.ped_vf_stock100_m_ge_pol, ped_user.ped_legende_ge_proprieta_cf where ped_vf_stock100_m_ge_pol.classe = ped_legende_ge_proprieta_cf.id and ped_vf_stock100_m_ge_pol.gisid = " + id + " and ped_legende_ge_proprieta_cf.liv = "+liv;
		
		scala="<strong>Carbonio organico immagazzinato nei suoli dell'Appennino tra 0-100 cm</strong><br />Livello di dettaglio 1:250.000";
	}
	if(liv==18){
		sqlString="select GISID, CLASSE from ped_user.PED_VF_LIVELLO_SO_POL where PED_VF_LIVELLO_SO_POL.gisid = " + id ;
		
		scala="<strong>Dotazione in sostanza organica dei suoli di pianura tra 0-30 cm. 2a edizione</strong><br />Livello di dettaglio 1:50.000";
	}
	if(liv==19){
		sqlString="select GISID, CLASSE, ECE, ATTENDIBILITA from ped_user.PED_VF_SALINITA_0_50_POL where PED_VF_SALINITA_0_50_POL.gisid = " + id ;
		
		scala="<strong>Salinità nei suoli di pianura tra 0-50 cm. Seconda approssimazione</strong><br />Livello di dettaglio 1:250.000";
	}
	if(liv==20){
		sqlString="select GISID, CLASSE, ECE, ATTENDIBILITA from ped_user.PED_VF_SALINITA_50_100_POL where PED_VF_SALINITA_50_100_POL.gisid = " + id ;
		
		scala="<strong>Salinità nei suoli di pianura tra 50-100 cm. Prima approssimazione</strong><br />Livello di dettaglio 1:250.000";
	}
	
	//out.println("CONNESSIONE AL DB: "+dbConn.getMetaData().getURL() );
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

		if(liv<=12 || liv==34){
			sqlString="select id, descrizione, colore from ped_user.ped_legende_ge_proprieta_cf where liv = "+liv+" and id >0 and id < 9999 order by id";
		} else if(liv==18){ 
			sqlString="select ID_LIVELLO_SO as id, descrizione, colore, t_sabbiosi, t_medioimpasto, t_argillosilimosi from ped_user.ped_t_livello_so where ordine > 0 order by ordine";
		} else if(liv==19){ 
		
			sqlString="SELECT classe, " +
			"  colore, " +
			"  descrizione " +
			"FROM " +
			"  (SELECT " +
			"    CASE " +
			"      WHEN PED_SALINITA_0_50.ECE > 0 " +
			"      AND PED_SALINITA_0_50.ECE  < 2 " +
			"      THEN 'Non salino' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 2 " +
			"      AND PED_SALINITA_0_50.ECE   < 4 " +
			"      THEN 'Molto debolmente salino' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 4 " +
			"      AND PED_SALINITA_0_50.ECE   < 8 " +
			"      THEN 'Debolmente salino' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 8 " +
			"      AND PED_SALINITA_0_50.ECE   < 16 " +
			"      THEN 'Moderatamente salino' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 16 " +
			"      THEN 'Fortemente salino' " +
			"      ELSE NULL " +
			"    END AS classe, " +
			"    CASE " +
			"      WHEN PED_SALINITA_0_50.ECE > 0 " +
			"      AND PED_SALINITA_0_50.ECE  < 2 " +
			"      THEN '209,255,115' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 2 " +
			"      AND PED_SALINITA_0_50.ECE   < 4 " +
			"      THEN '145,222,89' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 4 " +
			"      AND PED_SALINITA_0_50.ECE   < 8 " +
			"      THEN '223,115,255' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 8 " +
			"      AND PED_SALINITA_0_50.ECE   < 16 " +
			"      THEN '169,0,230' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 16 " +
			"      THEN '97,61,191' " +
			"      ELSE NULL " +
			"    END AS colore, " +
			"    CASE " +
			"      WHEN PED_SALINITA_0_50.ECE > 0 " +
			"      AND PED_SALINITA_0_50.ECE  < 2 " +
			"      THEN '&#8804;2' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 2 " +
			"      AND PED_SALINITA_0_50.ECE   < 4 " +
			"      THEN '2-4' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 4 " +
			"      AND PED_SALINITA_0_50.ECE   < 8 " +
			"      THEN '4-8' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 8 " +
			"      AND PED_SALINITA_0_50.ECE   < 16 " +
			"      THEN '8-16' " +
			"      WHEN PED_SALINITA_0_50.ECE >= 16 " +
			"      THEN '>16' " +
			"      ELSE NULL " +
			"    END              AS descrizione, " +
			"    PED_SALINITA_0_50.ECE AS ece " +
			"  FROM PED_USER.PED_SALINITA_0_50, " +
			"    PED_USER.PED_F_GRIGLIA500M_POL " +
			"  WHERE PED_F_GRIGLIA500M_POL.GISID = PED_SALINITA_0_50.GISID AND PED_SALINITA_0_50.ECE > 0 AND PED_SALINITA_0_50.DA=0 AND PED_SALINITA_0_50.A=50  " +
			"  ) " +
			"GROUP BY classe, " +
			"  colore, " +
			"  descrizione " +
			"ORDER BY MIN(ece)";
		
		} else if(liv==20){ 
		
			sqlString="SELECT classe, " +
			"  colore, " +
			"  descrizione " +
			"FROM " +
			"  (SELECT " +
			"    CASE " +
			"      WHEN PED_SALINITA_51_100.ECE > 0 " +
			"      AND PED_SALINITA_51_100.ECE  < 2 " +
			"      THEN 'Non salino' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 2 " +
			"      AND PED_SALINITA_51_100.ECE   < 4 " +
			"      THEN 'Molto debolmente salino' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 4 " +
			"      AND PED_SALINITA_51_100.ECE   < 8 " +
			"      THEN 'Debolmente salino' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 8 " +
			"      AND PED_SALINITA_51_100.ECE   < 16 " +
			"      THEN 'Moderatamente salino' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 16 " +
			"      THEN 'Fortemente salino' " +
			"      ELSE NULL " +
			"    END AS classe, " +
			"    CASE " +
			"      WHEN PED_SALINITA_51_100.ECE > 0 " +
			"      AND PED_SALINITA_51_100.ECE  < 2 " +
			"      THEN '209,255,115' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 2 " +
			"      AND PED_SALINITA_51_100.ECE   < 4 " +
			"      THEN '145,222,89' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 4 " +
			"      AND PED_SALINITA_51_100.ECE   < 8 " +
			"      THEN '223,115,255' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 8 " +
			"      AND PED_SALINITA_51_100.ECE   < 16 " +
			"      THEN '169,0,230' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 16 " +
			"      THEN '97,61,191' " +
			"      ELSE NULL " +
			"    END AS colore, " +
			"    CASE " +
			"      WHEN PED_SALINITA_51_100.ECE > 0 " +
			"      AND PED_SALINITA_51_100.ECE  < 2 " +
			"      THEN '&#8804;2' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 2 " +
			"      AND PED_SALINITA_51_100.ECE   < 4 " +
			"      THEN '2-4' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 4 " +
			"      AND PED_SALINITA_51_100.ECE   < 8 " +
			"      THEN '4-8' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 8 " +
			"      AND PED_SALINITA_51_100.ECE   < 16 " +
			"      THEN '8-16' " +
			"      WHEN PED_SALINITA_51_100.ECE >= 16 " +
			"      THEN '>16' " +
			"      ELSE NULL " +
			"    END              AS descrizione, " +
			"    PED_SALINITA_51_100.ECE AS ece " +
			"  FROM PED_USER.PED_SALINITA_51_100, " +
			"    PED_USER.PED_F_GRIGLIA1KM_POL " +
			"  WHERE PED_F_GRIGLIA1KM_POL.GISID = PED_SALINITA_51_100.GISID AND PED_SALINITA_51_100.ECE > 0 AND PED_SALINITA_51_100.DA=51 AND PED_SALINITA_51_100.A=100  " +
			"  ) " +
			"GROUP BY classe, " +
			"  colore, " +
			"  descrizione " +
			"ORDER BY MIN(ece)";
			
		}


		//out.println(sqlString);
		Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		rs2 = stm2.executeQuery(sqlString);

	%>
	  <p class="scala"><%=scala%></p>
	
	<% if(liv<=12 || liv==34){
	%>
	  <div class="uc">
<% if(liv==9 || liv==10 || liv==11 || liv==12){
%>		 
		Valore stimato Mg * ha<sup>-1</sup>
<% } else {
%>
		Valore stimato %
<% }
%>
	  </div>
	  <div class="titolo_uc_bal">
		  <strong>
	<%	if (rs.getString("ETICHETTA") != null) {

			BigDecimal bd = new BigDecimal(rs.getDouble("ETICHETTA"));
			bd = bd.setScale(2, RoundingMode.HALF_UP);	
		
			out.println(bd);
		} else {
			out.println("-");
		} 
	%>
		 </strong>
	  </div>

<% if(liv==6 || liv==34){
%>
	  <div class="uc">
		 Attendibilità della stima
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("ATTEND") != null) {
			out.println(rs.getString("ATTEND"));
		} else {
			out.println("-");
		} 
	%>
	  </strong></div>

<% }
%>
	  
<% if(liv==9){
%>	  
	  <div class="uc">
		  Dati accessori
	  </div>
	<div class="content_legenda">
		<table class="table_lege" summary="Legenda">
			<caption>Dati accessori</caption>
			<thead>
				<tr>
					<th id="c01" rowspan="2" valign="top">Attributo</th>
					<th colspan="3" style="text-align: center;">Valore</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="r01" headers="c01" style="background-color: #EBE0D6;">
						Densità apparente (g/cm<sup>3</sup>) [*] 
					</td>
					<td class="table_lege" headers="c02 r02" style="background-color: #EBE0D6;" >
						<%=rs.getString("dens_app")%>
					</td>
				</tr>
				<tr>
					<td id="r11" headers="c11" style="background-color: #EBE0D6;">
						Carbonio organico (%) 
					</td>
					<td class="table_lege" headers="c12 r12" style="background-color: #EBE0D6;" >
						<%=rs.getString("co")%>
					</td>
				</tr>				
				<tr>
					<td id="r21" headers="c21" style="background-color: #EBE0D6;">
						Scheletro (%) 
					</td>
					<td class="table_lege" headers="c22 r22" style="background-color: #EBE0D6;" >
						<%=rs.getString("sk")%>
					</td>
				</tr>
				<tr>
					<td id="r31" headers="c31" style="background-color: #EBE0D6;">
						Aree prive di suolo (%) [**]
					</td>
					<td class="table_lege" headers="c32 r32" style="background-color: #EBE0D6;" >
						<%=rs.getString("no_suo_per")%>
					</td>
				</tr>				
			</tbody>
		</table>
		
		<p>[*] esclusa la densità dello scheletro.</p> 
		<p>[**] da Carta dell'uso del suolo 2008 ed.2011 elaborata secondo gli indici di suolo/non suolo di Corticelli et.al 2008.</p>
	</div>
<% }
%>	 	  
	  
	  
	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
		<strong>Classi <%if(liv==6 || liv==7){%>&nbsp;(CO%)<%}%><%if(liv==9){%>&nbsp;CO Mg * ha<sup>-1</sup><%}%></strong>
		<div class="voce_leg voce_leg_pcf">
	<%	while(rs2.next()){
	%>
		<div class="row_legenda">
			<p class="col_01" style="background-color: rgb(<%=rs2.getString("colore")%>);width:22px;height:12px">&nbsp;</p>
			<p class="col_02"><strong><%=rs2.getString("descrizione")%></strong></p>
		</div>

	<% }
		rs2.close();
		stm2.close();
	%>

	  </div>
	  </div>
	  
	  <p>&nbsp;</p>

	<%}
	%>
	
	<% 
		// LIVELLO SO
		if(liv==18){
	%>
	  <div class="uc">
		 Classe di dotazione [*]
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("CLASSE") != null) {
			out.println(rs.getString("CLASSE"));
		} else {
			out.println("-");
		} 
	%>
	  </strong></div>


	  
 
	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
		<table class="table_lege" summary="Legenda">
			<caption>Legenda</caption>
			<thead>
				<tr>
					<th id="c01" rowspan="2" valign="top" style="text-align: center;">Classe di dotazione&nbsp;[*]</th>
					<th colspan="3" style="text-align: center;">Sostanza Organica (%)</th>
				</tr>
			 <tr>
			  <th id="c02" valign="top" style="text-align: center;font-weight:normal">
				  Terreni sabbiosi (S-SF-FS)
			  </th>
			  <th id="c03" valign="top" style="text-align: center;font-weight:normal">
				  Terreni medio impasto (F-FL-FA-FSA)
			  </th>
			  <th id="c04" valign="top" style="text-align: center;font-weight:normal">
				Terreni argillosi e limosi (A-AL-FLA-AS-L)
			  </th>
			 </tr>
			</thead>
			<tbody>
	 
		<%	int gg=0;
			while(rs2.next()){
				gg++;
		%>
				<tr>
					 <%if(gg!=2){%>
					<td id="r0<%=rs2.getString("id")%>" headers="c01" <%if(gg==1){%>rowspan="2"<%}%> style="background-color: rgb(<%=rs2.getString("colore")%>);">
						<%=rs2.getString("descrizione")%>
					</td>
					<%}%>
					<td class="table_lege" headers="c02 r0<%=rs2.getString("id")%> c02" style="background-color: #EBE0D6;" >
						<%=rs2.getString("t_sabbiosi")%>
					</td>
					<td class="table_lege" headers="c03 r0<%=rs2.getString("id")%> c03" style="background-color: #EBE0D6;">
						<%=rs2.getString("t_medioimpasto")%>
					</td>
					<td class="table_lege" headers="c04 r0<%=rs2.getString("id")%> c04" style="background-color: #EBE0D6;">
						<%=rs2.getString("t_argillosilimosi")%>
					</td>
				</tr>
		<% }
			rs2.close();
			stm2.close();
		%>

			</tbody>
		</table>
	  </div>
	  <div>
		 [*] Secondo schema di valutazione D.P.I. RER 2015
	  </div>
	  
	  
	<%}
	%>	  


	<% if(liv==19 || liv==20){
	%>
	  <div class="uc">
		 Classe
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("CLASSE") != null) {
			out.println(rs.getString("CLASSE"));
		} else {
			out.println("-");
		} 
	%>
	  </strong></div>

	  <div class="uc">
		 Valore stimato di ECe [*] (dSm<sup>-1</sup>)
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("ECE") != null) {
			out.println(rs.getDouble("ECE"));
		} else {
			out.println("-");
		} 
	%>
	  </strong></div>

	  <div class="uc">
		 Attendibilità della stima
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("ATTENDIBILITA") != null) {
			out.println(rs.getString("ATTENDIBILITA"));
		} else {
			out.println("-");
		} 
	%>
	  </strong></div>
	  
	  <div class="uc">
		  Legenda
	  </div>
	  <div class="content_legenda">
		<table class="table_lege" summary="Legenda">
			<caption>Legenda</caption>
			<thead>
				<tr>
					<th id="c01" rowspan="2" valign="top" align="center" style="text-align: center;"><strong>Classe</strong></th>
					<th colspan="3" style="text-align: center;"><strong>ECe [*]</strong><br />(dSm<sup>-1</sup>)</th>
				</tr>
			</thead>
			<tbody>
	 
		<%	while(rs2.next()){
		%>
				<tr>
					<td id="r0<%=rs2.getString("classe")%>" headers="c01" style="background-color: rgb(<%=rs2.getString("colore")%>);">
						<%=rs2.getString("classe")%>
					</td>
					<td class="table_lege" headers="c02 r0<%=rs2.getString("classe")%> c02" style="background-color: #EBE0D6;" >
						<%=rs2.getString("descrizione")%>
					</td>
				</tr>
		<% }
			rs2.close();
			stm2.close();
		%>

			</tbody>
		</table>
	  </div>
	<%}
	%>	 


<% if(liv==6 || liv==7 || liv==34){
%>		  
	<p class="note"><strong>Note</strong>: il valore di sostanza organica può essere ricavato attraverso il fattore di Van Bemmelen (S.O. = 1,724 C.O.) (Jackson, 1965).<!--<br />Valore stimato.Il valore % non tiene conto delle superfici prive di suolo.--></p>

<% } else if(liv==9){  %>
	<!-- <p class="note"><strong>Note</strong>: valore stimato.</p> -->
	
<% } else if(liv==19 || liv==20){  %>
	<p class="note">[*] Conducibilità elettrica dell'estratto in pasta satura</p>
<% } else {  %>
	<!--<p class="note">&nbsp;</p>-->
<% } %>
	
	<!-- </div> -->

	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
<% if(liv==19 || liv==20 || liv==6 || liv==9){
%>		  
		2015

<% } else if(liv==18){
%>
		2015

<% } else if(liv==34){
%>
		2016
		
<% } else {
%>
		2008
<% }
%>
	  </div>
	  <div class="link_dettaglio">
<% if(liv==6){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_CO_pianura.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==34){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_CO_pianura_0_100.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==7){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_CO_montagna.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==8){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_CLAY_pianura.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==9){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_stockCO30_pianura.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==10){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_stockCO100_pianura.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==11){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_stockCO30_montagna.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==12){
%>		  
		<a href="/gstatico/documenti/dati_pedol/NOTE_ILLUSTRATIVE_stockCO100_montagna.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==18){
%>		  
		<a href="/gstatico/documenti/dati_pedol/dotazioneSO.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==19){
%>		  
		<a href="/gstatico/documenti/dati_pedol/salinita0_50.pdf" rel="external">Apri note illustrative </a>
<% } %>
<% if(liv==20){
%>		  
		<a href="/gstatico/documenti/dati_pedol/salinita50_100.pdf" rel="external">Apri note illustrative </a>
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
