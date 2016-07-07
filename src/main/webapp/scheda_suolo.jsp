<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%>
<%

String id_suolo="";

if (request.getParameter("id")!=null){ 
	if (!request.getParameter("id").equals("")) {
		id_suolo = request.getParameter("id");

	}
}
String stmt_Sql = "SELECT ped_suoli.xid_suolo, ped_suoli.nome_suolo, ped_suoli.descr_introduttiva, ped_suoli.decod_usda, ped_suoli.decod_wrb "+
		"FROM ped_user.ped_suoli "+
		"WHERE (((ped_suoli.xid_suolo)= '"+id_suolo+"') AND ((ped_suoli.flag_cat)=-1))";
		
ResultSet rs = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
ResultSet rs4 = null;
ResultSet rs5 = null;
%>
<%
try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(stmt_Sql);
	rs.next();
	if (rs.getRow() == 0) {
		title = "Unit&agrave; cartografica&nbsp; - Carta dei suoli alla scala 1:1.000.000";
		pageHeader = "Carta dei suoli alla scala 1:1.000.000";
		%>
	
		<%@ include file="head.jsp"
		%>
		<ul class="skip">
		<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
		<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
		<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
		</ul>
		<%@ include file="testata.jsp"
		%>
		</div>
		<div class="briciole">
			<a name="homepage" tabindex="0"></a>
			<a accesskey="h" href="index.jsp?liv=1" title="Torna alla pagina principale">Home Page</a>
			&#8250;&#8250; <a href="legenda.jsp?liv=1" title="Torna alla legenda Carta dei suoli alla scala 1:1.000.000">Legenda Carta dei suoli alla scala 1:1.000.000</a>&nbsp;
			&#8250;&#8250; Unit&agrave; cartografiche
		</div>
		<div class="uc_01">
			<a name="contenutopagina" tabindex="0"></a>
			<p id="msg_error">L'unit&agrave; cartografica richiesta non &egrave; valida.<br/><br/>
			<a href="legenda.jsp?liv=1" title="Torna alla legenda Carta dei suoli al livello di dettaglio 1:1.000.000">Torna alla LEGENDA Carta dei suoli al livello di dettaglio 1:1.000.000</a>
			</p>
		</div>
	<%
	} else  {		

		title = "Unit&agrave; cartografica&nbsp; - Carta dei suoli alla scala 1:1.000.000";
		pageHeader = "Carta dei suoli alla scala 1:1.000.000";
%>

<%@ include file="head.jsp"
%>



		<ul class="skip">
		<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
		<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
		<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
        <li><a href="#menu" title="Salta al menu principale - accesskey n" accesskey="n">Salta al menu principale [n]</a> </li>
		</ul>
		
		
		<%@ include file="testata.jsp"
		%> 		


  </div>
  
  
  
  
 <p class="briciole"><a name="homepage" tabindex="0"></a> 
 <a accesskey="h" href="index.jsp" title="Torna alla pagina principale">Home Page</a>
 &nbsp;&#8250;&#8250; <a accesskey="c" href="catalogo_tipi_suolo.jsp" title="Torna alla pagina del Catalogo dei tipi di suolo">Catalogo dei tipi di suolo</a>
 &#8250;&#8250; <%=rs.getString("nome_suolo")%></p>
  <div class="comportamento_01">
    <div id="box_titolo_comportamento">
      <div class="titolo_comp">
        <h1><%=rs.getString("nome_suolo")%></h1>
      </div>
    </div>
  </div>
  <div class="catalogo_collina"> <a name="contenutopagina" tabindex="0"></a>
    <h2 class="h2_coll">Descrizione introduttiva</h2>
    <p><%=rs.getString("descr_introduttiva")%></p>
    <p>&nbsp;</p>
    <h2 class="h2_coll">Classificazione Soil Taxonomy</h2>
    <p><%=rs.getString("decod_usda")%></p>
	<p>&nbsp;</p>
    
	<h2 class="h2_coll">Classificazione WRB</h2>
    <p><%=rs.getString("decod_wrb")%></p>
 	<p>&nbsp;</p>
<%
	stmt_Sql = "SELECT ped_suoli.xid_archivio, ped_suoli.xid_suolo, ped_suoli.prof_rappresentativo AS ID_OSS "+
		"FROM ped_user.ped_suoli  "+
		"WHERE "+
		"ped_suoli.xid_suolo ='"+id_suolo+"'";
try
{
	Statement stm2 = dbConn.createStatement();
	rs2 = stm2.executeQuery(stmt_Sql);
	rs2.next();
		


%>	
	<h2 class="h2_coll"><a href="https://applicazioni.regione.emilia-romagna.it/gstatico/documenti/REPORT/SITO/Rep_SITO_ID_OSS=<%=rs2.getString("ID_OSS")%>.html" title="Profilo rappresentativo" rel="external">Profilo rappresentativo</a></h2>
   	<p>&nbsp;</p>

<%
		rs2.close();
		stm2.close();
	}	catch(Exception ee2) {
		out.println(ee2.getMessage());
		ee2.printStackTrace();
	}

	
%>	





 
 	<!-- <p><strong>Qualità specifiche</strong></p> -->
    
    <table class="table_cat_suoli" summary="Orizzonti genetici del suolo (valori modali) <%=rs.getString("nome_suolo")%> (<%=rs.getString("xid_suolo")%>)">
      <!-- <caption>Orizzonti genetici del suolo (valori modali)<%=rs.getString("nome_suolo")%> (<%=rs.getString("xid_suolo")%>)</caption> -->
      <caption>Orizzonti genetici del suolo (valori modali)</caption>
      <thead>
        <tr>
          <th id="c01" scope="col">N°</th>
          <th id="c02" scope="col">OrizGen</th>
          <th id="c03" scope="col">ProfLimSup</th>
          <th id="c04" scope="col">Spes</th>
          <th id="c05" scope="col">Arg</th>
          <th id="c06" scope="col">Sab</th>
          <th id="c07" scope="col">%Schel</th>
          <th id="c08" scope="col">S.O.</th>
          <th id="c09" scope="col">CalcTot</th>
          <th id="c10" scope="col">pH</th>
          <th id="c11" scope="col">Ksat</th>
          <th id="c12" scope="col">BD</th>
          <th id="c13" scope="col">Concentrazioni</th>
          <th id="c14" scope="col">%Conc</th>
          <th id="c15" scope="col">Qualità</th>
        </tr>   
      </thead>
      <tbody>
<%
String format = String.format("%%0%dd", 2);
		
stmt_Sql = "SELECT "+
		"ped_suoli_orizzonti.xid_archivio, "+
		"ped_suoli_orizzonti.xid_suolo, "+
		"ped_suoli_orizzonti.xnum_orizzonte_suolo, "+
		"ped_suoli_orizzonti.oriz_gen_codice, "+
		"ped_suoli_orizzonti.prof_md, "+
		"ped_suoli_orizzonti.spes_md, "+
		"ped_suoli_orizzonti.arg_tot, "+
		"ped_suoli_orizzonti.sab_tot, "+
		"ped_suoli_orizzonti.schelabb, "+
		"to_char(ped_suoli_orizzonti.sost_org,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as sost_org, "+
		"ped_suoli_orizzonti.cal_tot, "+
		"to_char(ped_suoli_orizzonti.ph,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as ph, "+
		"ped_suoli_orizzonti.ksatcl, "+
		"ped_suoli_orizzonti.densapp, "+
		"ped_suoli_orizzonti.conctp, "+
		"ped_suoli_orizzonti.concabb, "+
		"ped_suoli_orizzonti.qualita "+
		" FROM ped_user.ped_suoli_orizzonti where xid_suolo = '"+id_suolo+"' order by xnum_orizzonte_suolo";

		

try
{
	Statement stm3 = dbConn.createStatement();
	rs3 = stm3.executeQuery(stmt_Sql);
	int i=0;
	String valore="";
	while(rs3.next()){
		i++;

		

%>	  
	  
        <tr class="tab_dispari"> 
          <td headers="c01" class="larghezza_td_tabella " id="r<%=String.format(format, i)%>"><%=rs3.getString("xnum_orizzonte_suolo")%></td>
<%
		if (rs3.getObject("oriz_gen_codice")!=null){
			valore = rs3.getString("oriz_gen_codice");
		} else {
			valore = "";
		}
%>
          <td headers="c01 r<%=String.format(format, i)%> c02"><%=valore%></td>

<%
		if (rs3.getObject("prof_md")!=null){
			valore = rs3.getString("prof_md");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c03"><%=valore%></td>
		  
<%
		if (rs3.getObject("spes_md")!=null){
			valore = rs3.getString("spes_md");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c04"><%=valore%></td>


<%
		if (rs3.getObject("arg_tot")!=null){
			valore = rs3.getString("arg_tot");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c05"><%=valore%></td>

<%
		if (rs3.getObject("sab_tot")!=null){
			valore = rs3.getString("sab_tot");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c06"><%=valore%></td>

<%
		if (rs3.getObject("schelabb")!=null){
			valore = rs3.getString("schelabb");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c07"><%=valore%></td>

<%
		if (rs3.getObject("sost_org")!=null){
			valore = rs3.getString("sost_org");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c08"><%=valore%></td>

<%
		if (rs3.getObject("cal_tot")!=null){
			valore = rs3.getString("cal_tot");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c09"><%=valore%></td>

<%
		if (rs3.getObject("ph")!=null){
			valore = rs3.getString("ph");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c10"><%=valore%></td>
		
<%
		if (rs3.getObject("ksatcl")!=null){
			valore = rs3.getString("ksatcl");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c11"><%=valore%></td>
<%
		if (rs3.getObject("densapp")!=null){
			valore = rs3.getString("densapp");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c12"><%=valore%></td>

<%
		if (rs3.getObject("conctp")!=null){
			valore = rs3.getString("conctp");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c13"><%=valore%></td>
<%
		if (rs3.getObject("concabb")!=null){
			valore = rs3.getString("concabb");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c14"><%=valore%></td>
<%
		if (rs3.getObject("qualita")!=null){
			valore = rs3.getString("qualita");
		} else {
			valore = "";
		}
%>
        <td headers="c01 r<%=String.format(format, i)%> c15"><%=valore%></td>
	

        </tr>

<%
	}
	rs3.close();
	stm3.close();
}	catch(Exception ee3) {
	out.println(ee3.getMessage());
	ee3.printStackTrace();
}

%>		
		
		
      </tbody>
    </table>
 
 
 
 
 
 
  <p>&nbsp;</p>
  <p>&nbsp;</p>
 
 
 
 




	
	<!-- <p><strong>Qualità specifiche</strong></p> -->
    
    <table class="table_cat_suoli" summary="Qualità specifiche <%=rs.getString("nome_suolo")%> (<%=rs.getString("xid_suolo")%>)">
      <!-- <caption><%=rs.getString("nome_suolo")%> (<%=rs.getString("xid_suolo")%>)</caption> -->
      <caption>Qualità specifiche</caption>
      <thead>
        <tr>
          <th id="c01" scope="col">Parametro</th>
          <th id="c02" scope="col">Valore</th>
        </tr>   
      </thead>
      <tbody>
<%


stmt_Sql = "SELECT A.xid_archivio, A.xid_suolo, A.parametro, A.NOTA "+
		"FROM (SELECT ped_suoli.xid_archivio, ped_suoli.xid_suolo, ped_par_analitici.descrizione AS parametro, "+
		"'da '|| round(ped_suoli_par.id_min,1) ||' a '|| round(ped_suoli_par.id_max,1) ||' '|| ped_par_analitici.uni ||' '|| ped_suoli_par.commento AS nota, ped_par_analitici.ordine "+
		"FROM PED_USER.ped_suoli, PED_USER.ped_par_analitici, PED_USER.ped_suoli_par "+
		"WHERE "+
		"ped_par_analitici.id = ped_suoli_par.id_parametro AND "+
		"ped_suoli.xid_suolo = ped_suoli_par.xid_suolo AND  "+
		"ped_suoli.xid_archivio = ped_suoli_par.xid_archivio AND "+
		"ped_par_analitici.tipo ='a' AND "+
		"ped_suoli.flag_cat = -1 AND  "+
		"ped_suoli_par.id_min<> ped_suoli_par.id_max "+
		"UNION "+
		"SELECT ped_suoli.xid_archivio, ped_suoli.xid_suolo, ped_par_analitici.descrizione AS parametro, round(ped_suoli_par.id_max,1) ||' '|| ped_par_analitici.uni ||' '|| ped_suoli_par.commento AS nota, ped_par_analitici.ordine "+
		"FROM PED_USER.ped_suoli, PED_USER.ped_par_analitici, PED_USER.ped_suoli_par "+
		"WHERE "+
		"ped_par_analitici.id = ped_suoli_par.id_parametro AND "+
		"ped_suoli.xid_suolo = ped_suoli_par.xid_suolo AND  "+
		"ped_suoli.xid_archivio = ped_suoli_par.xid_archivio AND "+
		"ped_par_analitici.tipo ='a' AND "+
		"ped_suoli.flag_cat = -1 AND  "+
		"ped_suoli_par.id_min = ped_suoli_par.id_max "+
		"UNION "+
		"SELECT ped_suoli.xid_archivio, ped_suoli.xid_suolo, ped_par_analitici.descrizione AS parametro,  "+
		"'da '|| ped_par_classi_val_1.descrizione ||' a '|| ped_par_classi_val.descrizione ||' '|| ped_suoli_par.commento AS nota, ped_par_analitici.ordine "+
		"FROM PED_USER.ped_suoli, PED_USER.ped_par_classi_val,(PED_USER.ped_par_classi_val)ped_par_classi_val_1, PED_USER.ped_suoli_par, PED_USER.ped_par_analitici, PED_USER.ped_par_classi_poss "+
		"WHERE "+
		"ped_suoli_par.id_min = ped_par_classi_val_1.id AND "+
		"ped_suoli_par.id_max = ped_par_classi_val.id AND "+
		"ped_par_analitici.id = ped_par_classi_poss.id_parametro AND "+
		"ped_par_analitici.id = ped_suoli_par.id_parametro AND  "+
		"ped_par_classi_val.id = ped_par_classi_poss.id_classe_val AND "+
		"ped_suoli.xid_suolo = ped_suoli_par.xid_suolo AND  "+
		"ped_suoli.xid_archivio = ped_suoli_par.xid_archivio AND "+
		"ped_suoli_par.id_min <> ped_suoli_par.id_max AND "+
		"ped_suoli.flag_cat = -1 "+
		"UNION "+
		"SELECT ped_suoli.xid_archivio, ped_suoli.xid_suolo, ped_par_analitici.descrizione AS parametro, ped_par_classi_val.descrizione ||' '|| ped_suoli_par.commento AS nota, ped_par_analitici.ordine "+
		"FROM PED_USER.ped_suoli, PED_USER.ped_par_classi_val,(PED_USER.ped_par_classi_val)ped_par_classi_val_1, PED_USER.ped_suoli_par, PED_USER.ped_par_analitici, PED_USER.ped_par_classi_poss "+
		"WHERE "+
		"ped_suoli_par.id_min = ped_par_classi_val_1.id AND "+
		"ped_suoli_par.id_max = ped_par_classi_val.id AND "+
		"ped_par_analitici.id = ped_par_classi_poss.id_parametro AND "+
		"ped_par_analitici.id = ped_suoli_par.id_parametro AND  "+
		"ped_par_classi_val.id = ped_par_classi_poss.id_classe_val AND "+
		"ped_suoli.xid_suolo = ped_suoli_par.xid_suolo AND  "+
		"ped_suoli.xid_archivio = ped_suoli_par.xid_archivio AND "+
		"ped_suoli_par.id_min = ped_suoli_par.id_max AND "+
		"ped_suoli.flag_cat = -1)A "+
		"WHERE  "+
		"A.xid_suolo = '"+id_suolo+"' AND  "+
		"A.ordine Is Not Null "+
		"ORDER BY A.xid_suolo, A.ordine ";

try
{
	Statement stm3 = dbConn.createStatement();
	rs3 = stm3.executeQuery(stmt_Sql);
	int i=0;
	while(rs3.next()){
		i++;


%>	  
	  
        <tr class="tab_dispari"> 
          <td headers="c01" class="larghezza_td_tabella " id="r<%=String.format(format, i)%>"><%=rs3.getString("parametro")%></td>
          <td headers="c01 r<%=String.format(format, i)%> c02"><%=rs3.getString("nota").replace("<","&lt;").replace(">","&gt;")%></td>
        </tr>

<%
	}
	rs3.close();
	stm3.close();
}	catch(Exception ee3) {
	out.println(ee3.getMessage());
	ee3.printStackTrace();
}

%>		
		
		
      </tbody>
    </table>
 

 
 
 
 

 
 
 
 
 
 
 
 
 
 
<%



	 
stmt_Sql = "SELECT ped_suoli.xid_suolo, ped_suoli.qualita_agro, ped_suoli.sistemazioni, ped_suoli.tecniche_colt_lav, "+
"ped_suoli.tecniche_fert, ped_suoli.tecniche_irriga "+ 
"FROM ped_user.ped_suoli "+
"WHERE ped_suoli.xid_suolo ='"+id_suolo+"' AND ped_suoli.flag_cat_collina=-1 OR ped_suoli.xid_suolo = '"+id_suolo+"' "+
"AND ped_suoli.flag_cat_pianura =-1";
	 
//out.print(stmt_Sql);
try
{
	Statement stm4 = dbConn.createStatement();
	rs4 = stm4.executeQuery(stmt_Sql);
	rs4.next();
	if (rs4.getRow() > 0){
%> 
 
<% 	
	if (rs4.getObject("qualita_agro")!=null){
%> 
	<p>&nbsp;</p>
    <h2 class="h2_coll">Considerazioni sulla gestione</h2>
    <h3 class="h3_coll">Qualità agronomiche</h3>
    <p><%=rs4.getString("qualita_agro")%></p>
<% }
%>

<% 	
	if (rs4.getObject("sistemazioni")!=null){
%>	
	
	<p>&nbsp;</p>
    <h3 class="h3_coll">Sistemazioni</h3>
    <p><%=rs4.getString("sistemazioni")%></p>
<% }
%>

<% 	
	if (rs4.getObject("tecniche_colt_lav")!=null){
%>	
   	<p>&nbsp;</p>
	<h3 class="h3_coll">Tecniche di lavorazione</h3>
    <p><%=rs4.getString("tecniche_colt_lav")%></p>
<% }
%>


<% 	
	if (rs4.getObject("tecniche_fert")!=null){
%>
	<p>&nbsp;</p>
    <h3 class="h3_coll">Fertilizzazione</h3>
    <p><%=rs4.getString("tecniche_fert")%></p>
<% }
%>

<% 	
	if (rs4.getObject("tecniche_irriga")!=null){
%>	
	<p>&nbsp;</p>
    <h3 class="h3_coll">Tecniche di irrigazione</h3>
    <p><%=rs4.getString("tecniche_irriga")%></p>
<% }
%>
	
<%
		}
		rs4.close();
		stm4.close();
	}	catch(Exception ee4) {
		out.println(ee4.getMessage());
		ee4.printStackTrace();
	}

%>		
	

<%
stmt_Sql = "SELECT ped_suoli.xid_suolo, ped_suoli.indice_scelta_colt, ped_suoli.indice_scelta_foresta "+
	"FROM ped_user.ped_suoli "+
	"WHERE ped_suoli.xid_suolo ='"+id_suolo+"' AND ped_suoli.flag_cat_collina=-1 OR "+
	" ped_suoli.xid_suolo = '"+id_suolo+"' AND ped_suoli.flag_cat_pianura =-1 AND (ped_suoli.indice_scelta_colt is not null or ped_suoli.indice_scelta_foresta is not null)";
//out.print(stmt_Sql);

try
{

	Statement stm5 = dbConn.createStatement();
	rs5 = stm5.executeQuery(stmt_Sql);
	rs5.next();
	if (rs5.getRow() > 0){

%>

	
	<p>&nbsp;</p>
	<p>&nbsp;</p>
    <h2 class="h2_coll">Indicazioni sulla scelta delle colture</h2>
<% 	
	if (rs5.getObject("indice_scelta_colt")!=null){
%>	
    <h3 class="h3_coll">Indicazioni per la scelta delle colture agrarie</h3>
    <p><%=rs5.getString("indice_scelta_colt")%></p>
<% }
%>


<% 	
	if (rs5.getObject("indice_scelta_foresta")!=null){
%>		
	<p>&nbsp;</p>
    <h3 class="h3_coll">Indicazioni per la scelta delle specie forestali</h3>
    <p><%=rs5.getString("indice_scelta_foresta")%></p>
<% }
%>
	 
	 
<%
		}
		rs5.close();
		stm5.close();
	}	catch(Exception ee5) {
		out.println(ee5.getMessage());
		ee5.printStackTrace();
	}

%>		 
    <p><br /></p>
  </div>
  
<%
		}
		rs.close();
		stm.close();
	}	catch(Exception ee) {
		out.println(ee.getMessage());
		ee.printStackTrace();
	}
	
%>  
<%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>
