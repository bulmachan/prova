<%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%@ include file="params.jsp"
%>
  
<%
int liv=13;
if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv=Integer.parseInt(request.getParameter("liv"));
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
		}
	}
}

String scala="";
String h1="";
String pagPadre="carte_tematiche.jsp?tem=1#carta"+liv;
String pagPadreTitle="Torna all'elenco delle carte tematiche - Carte delle proprietà chimico-fisiche";
String pagPadreDesc="Carte tematiche&nbsp;&#8250;&#8250; Carte delle proprietà chimico-fisiche";
String esempio="";
String imgCarta="";

String sqlString = "";
String titoloLegenda = "";
String pref="";
switch (liv){
	case 13:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale del Cromo [Cr] al livello di dettaglio "+scala+". 2a edizione";
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala+". 2a edizione";
		esempio="Le classi di concentrazione per il Cromo vanno da 1 a 4 in ordine di concentrazione crescente.<br /><strong>Classe 1</strong>: suoli dei bacini di pertinenza dei Torrenti Chiavenna, Crostolo, Parma, Stirone, Tidone e del F. Secchia;<br /><strong>Classe 2</strong>: suoli dei dei bacini di pertinenza dei Torrenti, Baganza, Enza e Tresinaro;<br /><strong>Classe 3</strong>: suoli dei dei bacini di pertinenza dei Torrenti Arda, Taro e del Fiume Po;<br /><strong>Classe 4</strong>: suoli dei dei bacini di pertinenza i suoli dei Torrenti Trebbia e Nure.<br /><br />Nei suoli il contenuto naturale di Cromo è strettamente legato alla provenienza del sedimento, tranne che in quelli ad elevato grado di alterazione di pertinenza delle superfici più antiche del margine appenninico dove il contenuto di metalli è piuttosto omogeneo e indipendente dal bacino: questi tipi di suoli appartengono tutti alla classe 2.<br /><br />Il valore limite stabilito dal DLgs 152/06 è di 150 mg/kg (titolo 5, allegato 5, colonna A della tabella).";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview13.jpg";
		titoloLegenda="Cromo";
		pref="CR";
	break;
	
	case 14:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale del Nichel [Ni] al livello di dettaglio "+scala+". 2a edizione";
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala+". 2a edizione";
		esempio="Le classi di concentrazione per il Nichel vanno da 1 a 4 in ordine di concentrazione crescente.<br /><strong>Classe 1</strong>: suoli dei bacini di pertinenza dei Torrenti Chiavenna, Crostolo, Parma, Stirone, Tidone e del F.Secchia;<br /><strong>Classe 2</strong>: suoli dei dei bacini di pertinenza dei Torrenti, Baganza, Enza e Tresinaro;<br /><strong>Classe 3</strong>: suoli dei dei bacini di pertinenza dei Torrenti Arda, Taro e del Fiume Po;<br /><strong>Classe 4</strong>: suoli dei dei bacini di pertinenza i suoli dei Torrenti Trebbia e Nure.<br /><br />Nei suoli il contenuto naturale di Nichel è strettamente legato alla provenienza del sedimento, tranne che in quelli ad elevato grado di alterazione di pertinenza delle superfici più antiche del margine appenninico dove il contenuto di metalli è piuttosto omogeneo e indipendente dal bacino: essi appartengono tutti alla classe 1. Il valore limite stabilito dal DLgs 152/06 è di 120 mg/kg (titolo 5, allegato 5, colonna A della tabella).<br /><br />Il valore limite stabilito dal DLgs 99/92 è di 75 mg/kg (allegato I A)";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview14.jpg";
		titoloLegenda="Nichel";
		pref="NI";
	break;
	
	case 15:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale del Piombo [Pb] al livello di dettaglio "+scala+". 2a edizione";
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala+". 2a edizione";
		esempio="Le due classi di concentrazione che risultano dall’analisi dei dati pedo-geochimici hanno valori talmente ravvicinati tra loro che non è stato ritenuto opportuno mantenerle.<br />La carta del piombo è perciò attualmente costituita da un’unica classe su tutta la pianura emiliana.<br /><br />Il valore limite stabilito dal DLgs 152/06 è di 100 mg/kg (titolo 5, allegato 5, colonna A della tabella).<br />Il valore limite stabilito dal DLgs 99/92 è di 100 mg/kg (allegato I A)";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview15.jpg";
		titoloLegenda="Piombo";
		pref="PB";
	break;
	
	case 16:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale del Rame [Cu] al livello di dettaglio "+scala+". 2a edizione";
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala+". 2a edizione";
		esempio="Le classi di concentrazione sono solo due in ordine di concentrazione crescente:<br /><br /><strong>Classe 1</strong>: suoli ad elevato grado di differenziazione del profilo; <br /><strong>Classe 2</strong>: suoli con grado di differenziazione del profilo da debole a moderato e da moderato ad elevato.<br /><br />Il valore limite stabilito dal DLgs 152/06 è di 120 mg/kg (titolo 5, allegato 5, colonna A della tabella).<br />Il valore limite stabilito dal DLgs 99/92 è di 100 mg/kg (allegato I A)";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview16.jpg";
		titoloLegenda="Rame";
		pref="CU";
	break;

	case 17:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale dello Zinco [Zn] al livello di dettaglio "+scala+". 2a edizione";
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala+". 2a edizione";
		esempio="Le classi di concentrazione sono solo due in ordine di concentrazione crescente:<br /><br /><strong>Classe 1</strong>: suoli a tessitura media o moderatamente grossolana, in ambiente di canale, argine e rotta fluviale;  <br /><strong>Classe 2</strong>: suoli a tessitura fine o moderatamente fine in ambiente di piana inondabile e di conoide.<br /><br />Nei suoli il contenuto naturale di Zinco è prevalentemente legato alla granulometria, tranne che in quelli ad elevato grado di alterazione di pertinenza delle superfici più antiche del margine appenninico dove il contenuto di metalli è piuttosto omogeneo e indipendente dalla granulometria: essi appartengono tutti alla classe 1.<br /><br />Il valore limite stabilito dal DLgs 152/06 è di 150 mg/kg (titolo 5, allegato 5, colonna A della tabella).<br />Il valore limite stabilito dal DLgs 99/92 è di 300 mg/kg (allegato I A)";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview17.jpg";
		titoloLegenda="Zinco";
		pref="ZN";
	break;
	case 35:
		scala="1:250.000";
		h1="Legenda della Carta del Fondo naturale del Vanadio [V] al livello di dettaglio "+scala;
		pageHeader = "Carta dei Suoli al livello di dettaglio "+scala;
		esempio="Le classi di concentrazione sono solo due in ordine di concentrazione crescente:<br /><br /><strong>Classe 1</strong>: suoli a tessitura media o moderatamente grossolana, in ambiente di canale, argine e rotta fluviale;  <br /><strong>Classe 2</strong>: suoli a tessitura fine o moderatamente fine in ambiente di piana inondabile e di conoide.<br /><br />Nei suoli il contenuto naturale di Zinco è prevalentemente legato alla granulometria, tranne che in quelli ad elevato grado di alterazione di pertinenza delle superfici più antiche del margine appenninico dove il contenuto di metalli è piuttosto omogeneo e indipendente dalla granulometria: essi appartengono tutti alla classe 1.<br /><br />Il valore limite stabilito dal DLgs 152/06 è di 150 mg/kg (titolo 5, allegato 5, colonna A della tabella).<br />Il valore limite stabilito dal DLgs 99/92 è di 300 mg/kg (allegato I A)";
		imgCarta = "/gstatico/documenti/cartpedo/immagini/overview35.jpg";
		titoloLegenda="Vanadio";
		pref="V";
	break;        
	
}
ResultSet rs2 = null;

try {
	
	//sqlString="select id, descrizione, perc50, perc90, perc95, colore from ped_user.ped_legende_ge_pedochimiche where liv = "+liv+" order by id";


  sqlString="SELECT distinct "
		+"ped_t_pedochimiche.classe_decod         AS CLASSE, "
		+"ped_t_pedochimiche.classe_ge            AS CLASSE_GE, "
		+"ped_t_pedochimiche.gruppo               AS UNITA, "
		+"ped_t_met_gruppif.suoli                 AS SUOLI, "
		+"ped_t_met_gruppif.provenienza           AS PROVENIENZA_SEDIMENTI, "
		+"ped_t_ambienti.descrizione || '<br />' || '<i>' || ped_t_depositi.descrizione || '</i>' AS Compl_amb_dep, "
		+"ped_t_pedochimiche.val_50     AS perc50, "
		+"ped_t_pedochimiche.val_90     AS perc90, "
		+"ped_t_pedochimiche.val_95     AS perc95, "
		+"colore "

	+"FROM (((((((ped_user.ped_carte_tem_del "
	+"INNER JOIN ped_user.ped_t_pedochimiche "
	+"ON (ped_carte_tem_del.attributo = ped_t_pedochimiche.metallo) "
	+"AND (ped_carte_tem_del.classe   = ped_t_pedochimiche.id_classe)) "
	+"INNER JOIN ped_user.ped_t_met_gruppif "
	+"ON ped_t_pedochimiche.gruppo = ped_t_met_gruppif.id_gruppo) "
	+"INNER JOIN ped_user.ped_delin_ambienti "
	+"ON ped_carte_tem_del.xid_delineazione = ped_delin_ambienti.xid_delineazione) "
	+"INNER JOIN ped_user.ped_delin_depositi "
	+"ON ped_carte_tem_del.xid_delineazione = ped_delin_depositi.xid_delineazione) "
	+"INNER JOIN ped_user.ped_t_ambienti "
	+"ON ped_delin_ambienti.id_ambiente = ped_t_ambienti.id_ambiente) "
	+"INNER JOIN ped_user.ped_t_depositi "
	+"ON ped_delin_depositi.id_deposito = ped_t_depositi.id_deposito) "
	+"INNER JOIN ped_user.ped_legende_ge_pedochimiche "
	+"ON ped_legende_ge_pedochimiche.id = ped_t_pedochimiche.classe_ge) "

	+"WHERE ped_carte_tem_del.attributo='"+pref+"' and ped_legende_ge_pedochimiche.liv="+liv
	+" order by classe_ge, perc95";

	//out.println(dbConn.getMetaData().getURL() );

	Statement stm2 = dbConn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	//out.println(sqlString);
	rs2 = stm2.executeQuery(sqlString);
%>
<% 
   title = h1.replaceAll(":", " a ");
%>
<%@ include file="head.jsp"
%>
<ul class="skip">
	<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
	<li><a href="#contenutopagina" title="Descrizione della <%=h1%>  - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
    <li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
	<li><a href="#menu" title="Salta all'elenco delle Unità cartografiche <%=scala%> - accesskey n" accesskey="n">Salta all'elenco delle Unità cartografiche [n]</a> </li>
 </ul>
 
<%@ include file="testata.jsp"
%>  
  	</div>
  <div class="briciole">
  <a name="homepage" tabindex="0"></a>
  <a accesskey="h" href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
<% if(!pagPadre.equals("")){
%>  
	&#8250;&#8250; <a href="<%=pagPadre%>" title="<%=pagPadreTitle%>"><%=pagPadreDesc%></a>&nbsp;&#8250;&#8250; Legenda <%=titoloLegenda%>
<%	
	}
%>  
  
  </div>

  
  <div id="content_legenda">
	<a name="contenutopagina" tabindex="0"></a>
    <h1><%=h1%></h1>
	
    <!-- <div class="img_leg"><img src="<%=imgCarta%>" width="204" height="114" alt="<%=h1%>" /></div> -->
    <!-- <div class="par_leg"><%=esempio%></div> -->
    <a name="menu" tabindex="0"></a>
	
	<table  class="table_lege" summary="Legenda <%=titoloLegenda%>">
		<!-- <caption>LEGENDA</caption> -->
		<thead>
			<tr>
				<th id="c01">Classe <sup>1)</sup> (mg/kg)</th>
				<th id="c02">Unità</th>
				<th id="c03">Suoli <sup>2)</sup></th>
				<th id="c04">Provenienza dei sedimenti</th>
				<th id="c05">Complesso ambientale<br /><i>Ambiente deposizionale</i></th>
				<th id="c06">50°</th>
				<th id="c07">90°</th>
				<th id="c08">95°</th>
			</tr>   
		</thead>
		<tbody>
	<%	
		String classe_table_lege="table_lege";
		int i=1;
		while(rs2.next()){
	%>
			<tr>
				<th id="r0<%=i%>" headers="c01"><%=rs2.getString("classe")%></th>
				
	<%		if(Integer.parseInt(rs2.getString("classe_ge"))>2)
				classe_table_lege="table_lege_bianco";
	%>	
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c02" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("unita")%></td>
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c03" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("suoli")%></td>
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c04" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("provenienza_sedimenti")%></td>
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c05" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("compl_amb_dep")%></td>

				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c06" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("perc50")%></td>
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c07" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("perc90")%></td>
				<td class="<%=classe_table_lege%>" headers="c01 r0<%=rs2.getString("classe_ge")%> c08" style="background-color: rgb(<%=rs2.getString("colore")%>);"><%=rs2.getString("perc95")%></td>
			</tr>
	<% 
			i++;
		}
		rs2.close();
		stm2.close();
	%>
		</tbody>
	</table>
	<div class="note_legenda">
            1) Valori definiti in base al 95° percentile
            <br />
            2) Classificazione dei suoli: WRB, 2007
        </div>
	
	<p><br /></p>
      

</div>


			<div class="link_note_illustrative">
			<a href="/gstatico/documenti/dati_pedol/CARTA_PEDOGEOCHIMICA.pdf" rel="external">Note illustrative</a> [PDF]
			</div>
<%
	
	} catch(Exception ee2) {
		out.println(ee2.getMessage());
		ee2.printStackTrace();
	}
%>


<%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>
