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
	
	if(liv==21){
		sqlString="select ped_vf_fna_cromo_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_cromo_pol, ped_user.ped_vf_fna_cromo_ge_pol where ped_vf_fna_cromo_pol.gisid=ped_vf_fna_cromo_ge_pol.gisid and ped_vf_fna_cromo_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico del<br />Cromo [Cr] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Cromo";
		vtab_met="PED_VTAB_MET_CROMO_POL";
		sigla_met="CR";
	}
	if(liv==22){
		sqlString="select ped_vf_fna_nichel_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_nichel_pol, ped_user.ped_vf_fna_nichel_ge_pol where ped_vf_fna_nichel_pol.gisid=ped_vf_fna_nichel_ge_pol.gisid and ped_vf_fna_nichel_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico del<br />Nichel [Ni] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Nichel";
		vtab_met="PED_VTAB_MET_NICHEL_POL";
		sigla_met="NI";
	}
	if(liv==23){
		sqlString="select ped_vf_fna_piombo_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_piombo_pol, ped_user.ped_vf_fna_piombo_ge_pol where ped_vf_fna_piombo_pol.gisid=ped_vf_fna_piombo_ge_pol.gisid and ped_vf_fna_piombo_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico del<br />Piombo [Pb] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Piombo";
		vtab_met="PED_VTAB_MET_PIOMBO_POL";
		sigla_met="PB";
	}
	if(liv==24){
		sqlString="select ped_vf_fna_rame_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_rame_pol, ped_user.ped_vf_fna_rame_ge_pol where ped_vf_fna_rame_pol.gisid=ped_vf_fna_rame_ge_pol.gisid and ped_vf_fna_rame_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico del<br />Rame [Cu] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Rame";
		vtab_met="PED_VTAB_MET_RAME_POL";
		sigla_met="CU";
	}
	if(liv==25){
		sqlString="select ped_vf_fna_zinco_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_zinco_pol, ped_user.ped_vf_fna_zinco_ge_pol where ped_vf_fna_zinco_pol.gisid=ped_vf_fna_zinco_ge_pol.gisid and ped_vf_fna_zinco_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico dello<br />Zinco [Zn] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Zinco";
		vtab_met="PED_VTAB_MET_ZINCO_POL";
		sigla_met="ZN";
	}
	if(liv==26){
		sqlString="select ped_vf_fna_stagno_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_stagno_pol, ped_user.ped_vf_fna_stagno_ge_pol where ped_vf_fna_stagno_pol.gisid=ped_vf_fna_stagno_ge_pol.gisid and ped_vf_fna_stagno_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico dello<br />Stagno [Sn] della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Stagno";
		vtab_met="PED_VTAB_MET_ZINCO_POL";
		sigla_met="SN";
	}
	if(liv==27){
		sqlString="select ped_vf_fna_arsenico_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_arsenico_pol, ped_user.ped_vf_fna_arsenico_ge_pol where ped_vf_fna_arsenico_pol.gisid=ped_vf_fna_arsenico_ge_pol.gisid and ped_vf_fna_arsenico_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico dell'Arsenico [As]<br /> della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Arsenico";
		vtab_met="PED_VTAB_MET_ARSENICO_POL";
		sigla_met="AS";
	}
	if(liv==28){
		sqlString="select ped_vf_fna_vanadio_pol.gisid, cls_legenda as classe,to_char(p50,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER50, to_char(p90,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER90, to_char(p95,'99G990D00', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PER95, attendibilita from ped_user.ped_vf_fna_vanadio_pol, ped_user.ped_vf_fna_vanadio_ge_pol where ped_vf_fna_vanadio_pol.gisid=ped_vf_fna_vanadio_ge_pol.gisid and ped_vf_fna_vanadio_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico del Vanadio [V]<br /> della pianura emiliano-romagnola</strong><br />Scala 1:250.000";
		titoloLegenda="Vanadio";
		vtab_met="PED_VTAB_MET_VANADIO_POL";
		sigla_met="AS";
	}
	if(liv==29){
		sqlString="select ped_vf_fna_allelement_pol.gisid, ";
		
		sqlString+="to_char(as_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as as_p50, ";
		sqlString+="to_char(as_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as as_p95, ";
		sqlString+="as_cls_legenda,";
		sqlString+="as_attend,";
    
		sqlString+="to_char(cr_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as cr_p50,";
		sqlString+="to_char(cr_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as cr_p95,";
		sqlString+="cr_cls_legenda, ";
		sqlString+="cr_attend, ";

		sqlString+="to_char(ni_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as ni_p50, ";
		sqlString+="to_char(ni_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as ni_p95, ";
		sqlString+="ni_cls_legenda, ";
		sqlString+="ni_attend, ";

		sqlString+="to_char(pb_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as pb_p50, ";
		sqlString+="to_char(pb_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as pb_p95, ";
		sqlString+="pb_cls_legenda, ";
		sqlString+="pb_attend, ";

		sqlString+="to_char(cu_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as cu_p50, ";
		sqlString+="to_char(cu_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as cu_p95, ";
		sqlString+="cu_cls_legenda, ";
		sqlString+="cu_attend, ";

		sqlString+="to_char(sn_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as sn_p50, ";
		sqlString+="to_char(sn_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as sn_p95, ";
		sqlString+="sn_cls_legenda, ";
		sqlString+="sn_attend, ";

		sqlString+="to_char(v_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as v_p50, ";
		sqlString+="to_char(v_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as v_p95, ";
		sqlString+="v_cls_legenda, ";
		sqlString+="v_attend, ";

		sqlString+="to_char(zn_p50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as zn_p50, ";
		sqlString+="to_char(zn_p95,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as zn_p95, ";
		sqlString+="zn_cls_legenda, ";
		sqlString+="zn_attend ";

		sqlString+="from ped_user.ped_vf_fna_allelement_pol, ped_user.ped_vf_fna_allelement_ge_pol ";
		
		sqlString+="where ped_vf_fna_allelement_pol.gisid=ped_vf_fna_allelement_ge_pol.gisid and ped_vf_fna_allelement_pol.gisid=" + id;
	
		scala="<strong>Fondo naturale-antropico di <br />As, Cr, Cu, Ni, Pb, Sn, V, Zn.<br />Scala 1:250.000";
		titoloLegenda="As, Cr, Cu, Ni, Pb, Sn, V, Zn";
		vtab_met="";
		sigla_met="As, Cr, Cu, Ni, Pb, Sn, V, Zn";
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
		
		if(liv==29){
%>
		  <p class="scala"><%=scala%></p>

		  <table width="100%">
			<tr style="background-color: #b3814b;color:#000">
				<td align="center">
					<strong>Elem.</strong>
				</td>
				<td align="center">
					<strong>Stima 50° <br />(mg/kg)</strong>
				</td>
				<td align="center">
					<strong>Stima 95° <br />(mg/kg)</strong>
				</td>
				<td align="center">
					<strong>Classe <br />concen.</strong>
				</td>
				<td align="center">
					<strong>Attend.</strong>
				</td>
			</tr>
			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>As</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("as_p50") != null) {
							out.println(rs.getString("as_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("as_p95") != null) {
							out.println(rs.getString("as_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("as_cls_legenda") != null) {
							out.println(rs.getString("as_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("as_attend") != null) {
							out.println(rs.getString("as_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>		  

			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Cr</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("cr_p50") != null) {
							out.println(rs.getString("cr_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("cr_p95") != null) {
							out.println(rs.getString("cr_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("cr_cls_legenda") != null) {
							out.println(rs.getString("cr_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("cr_attend") != null) {
							out.println(rs.getString("cr_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>	

			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Cu</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("cu_p50") != null) {
							out.println(rs.getString("cu_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("cu_p95") != null) {
							out.println(rs.getString("cu_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("cu_cls_legenda") != null) {
							out.println(rs.getString("cu_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("cu_attend") != null) {
							out.println(rs.getString("cu_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>				
			


			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Ni</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("ni_p50") != null) {
							out.println(rs.getString("ni_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ni_p95") != null) {
							out.println(rs.getString("ni_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("ni_cls_legenda") != null) {
							out.println(rs.getString("ni_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("ni_attend") != null) {
							out.println(rs.getString("ni_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>	

			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Pb</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("pb_p50") != null) {
							out.println(rs.getString("pb_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("pb_p95") != null) {
							out.println(rs.getString("pb_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("pb_cls_legenda") != null) {
							out.println(rs.getString("pb_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("pb_attend") != null) {
							out.println(rs.getString("pb_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>				


			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Sn</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("sn_p50") != null) {
							out.println(rs.getString("sn_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("sn_p95") != null) {
							out.println(rs.getString("sn_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("sn_cls_legenda") != null) {
							out.println(rs.getString("sn_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("sn_attend") != null) {
							out.println(rs.getString("sn_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>	
			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>V</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("v_p50") != null) {
							out.println(rs.getString("v_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("v_p95") != null) {
							out.println(rs.getString("v_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("v_cls_legenda") != null) {
							out.println(rs.getString("v_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("v_attend") != null) {
							out.println(rs.getString("v_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>	

			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Zn</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("zn_p50") != null) {
							out.println(rs.getString("zn_p50"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("zn_p95") != null) {
							out.println(rs.getString("zn_p95"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("zn_cls_legenda") != null) {
							out.println(rs.getString("zn_cls_legenda"));
						} else {
							out.println("-");
						} 
					%>
				</td>
				<td align="center">
					<%	if (rs.getString("zn_attend") != null) {
							out.println(rs.getString("zn_attend"));
						} else {
							out.println("-");
						} 
					%>
				</td>
			</tr>				
			
			
		  </table>
		  

		  
		  

	  <div class="titolo_uc_bal">
		La concentrazione è espressa in mg/kg		
	  </div>

	  <div class="uc" >
		 Note
	  </div>

		  
		  
		
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
		 Classe
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
		 Valore stimato 50° percentile (mg/kg)
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
		 Valore stimato 90° percentile (mg/kg)
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
		 Valore stimato 95° percentile (mg/kg)
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
		 Attendibilità della stima
	  </div>
	  <div class="titolo_uc_bal"><strong>
	<%	if (rs.getString("attendibilita") != null) {
			out.println(rs.getString("attendibilita"));
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

	  <div class="uc">
		 Note
	  </div>	
	
	
<% }
%>
	



<% if(liv==21 || liv==22 || liv==23 || liv==24 || liv==25 || liv==26 || liv==27 || liv==28 || liv==29){
%>		  

	<strong>1)</strong> i valori di concentrazione sono ottenuti con il metodo analitico UNI EN 13346:2002 (Metodo C. Procedimento di estrazione con forno a microonde chiuso, in accordo con la mineralizzazione in forno a microonde del metodo XI.I del DM 13/09/99) e lettura ICP-MS (Mass Spectrometry) secondo la metodica EPA 6020.<br />

	<strong>2)</strong> le carte sono state ottenute con krigaggio semplice tramite simulazione geostatistica previa normalizzazione della distribuzione osservata (Simulazioni Gaussiane Sequenziali), e hanno quindi la proprietà di onorare il valore osservato nei punti di campionamento.<br />
	Dove questo succede, essendo il valore simulato N volte sempre il medesimo,  i percentili della distribuzione sono tutti uguali e corrispondono al valore osservato.<br />
	

<% } else {  %>
	<p class="note">&nbsp;</p>
<% } %>
	
	<p></p><p></p>
	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
<% if(liv==21 || liv==22 || liv==23 || liv==24 || liv==25 || liv==26){
%>			2012
<% } %>
<% if(liv==27 || liv==28 || liv==29){
%>			2013
<% } %>

	</div>
		

	  <div class="link_dettaglio">
<% if(liv==21 || liv==22 || liv==23 || liv==24 || liv==25 || liv==26 || liv==27 || liv==28 || liv==29){
%>		  
		<a href="/gstatico/documenti/dati_pedol/Carta_fondo_naturale_antropico.pdf" rel="external">Apri le note illustrative</a>
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
