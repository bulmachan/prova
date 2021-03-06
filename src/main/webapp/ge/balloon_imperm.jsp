<%
String scala = "Livello di dettaglio 1:25.000 - Carta delle Superfici impermeabilizzate di pianura";
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
	
	sqlString="SELECT "+
          " PED_VF_IMPERM_COMUNI_POL.GISID, PED_VF_IMPERM_COMUNI_POL.NOME_C, to_char(HA_AREA_COMUNE_TOT,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as HA_AREA_COMUNE_TOT,"+
		  " to_char(HA_AREA_COMUNE_PIA,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as HA_AREA_COMUNE_PIA, PERC_COM_PIA, "+
		  " to_char(PERC_ACQ_ANT,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_ACQ_ANT, "+
		  " to_char(PERC_25,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_25, "+
		  " to_char(PERC_50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_50, "+
		  " to_char(PERC_75,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_75, "+
		  " to_char(PERC_90,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_90, "+
		  " to_char(PERC_100,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_100, "+
		  " to_char(PERC_IMPER,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_IMPER "+
		  " FROM PED_USER.PED_VF_IMPERM_COMUNI_POL where PED_VF_IMPERM_COMUNI_POL.GISID="+id;
		  
	//out.println(dbConn.getMetaData().getURL() );
	//out.print(sqlString);
	
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=33">Torna alla Home Page</a></p>
		<%
	} else {



	%>

	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.jqplot.js"></script>
<script type="text/javascript" src="js/jqplot.pieRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="js/jquery.jqplot.css" />	
	
	

	  <p class="scala"><strong>Carta delle Superfici impermeabilizzate</strong><br />Livello di dettaglio 1:25.000</p>
	  
	  
		  <p><strong>Comune di: 
		  <% out.println(rs.getString("NOME_C"));
		  %></strong></p>
		  <table width="100%">
			<tr style="background-color: #b3814b;color:#000">
				<td align="center" valign="top">
					<strong>Attributo</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>Ettari&nbsp;</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>%</strong>
				</td>
			</tr>
			
			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Area del Comune</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("HA_AREA_COMUNE_TOT") != null) {
							out.println(rs.getString("HA_AREA_COMUNE_TOT"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					100.0					
				</td>
			</tr>		  

			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					<strong>Area del Comune in pianura</strong>
				</td>
				<td align="center">
					<%	if (rs.getString("HA_AREA_COMUNE_PIA") != null) {
							out.println(rs.getString("HA_AREA_COMUNE_PIA"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
				<td align="center">
					<%	if (rs.getString("PERC_COM_PIA") != null) {
							out.println(rs.getString("PERC_COM_PIA"));
						} else {
							out.println("-");
						} 
					%>					
				</td>
			</tr>			
		</table>
		<p></p>
		<table width="100%">
			<tr style="background-color: #b3814b;color:#000">
				<td align="center" valign="top">
					<strong>Attributo</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>%</strong>
				</td>
			</tr>			
			
			<tr style="background-color:rgb(115, 223, 255); color:#000;height: 24px;">
				<td align="center">
					aree permeabili antropizzate o corpi idrici
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_ACQ_ANT") != null) {
							out.println(rs.getString("PERC_ACQ_ANT"));
						} else {
							out.println("-");
						} 
					%>	</strong>				
				</td>
			</tr>	
			<tr style="background-color: #b3814b;color:#000;">
				<td align="center" valign="top">
					&nbsp;
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					&nbsp;
				</td>
			</tr>
			<tr style="background-color: rgb(255,217,247);color:#000;height: 24px;">
				<td align="center">
					aree impermeabili al 25%
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_25") != null) {
							out.println(rs.getString("PERC_25"));
						} else {
							out.println("-");
						} 
					%>		</strong>			
				</td>
			</tr>				
			<tr style="background-color: rgb(255,166,236);color:#000;height: 24px;">
				<td align="center">
					aree impermeabili al 50%
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_50") != null) {
							out.println(rs.getString("PERC_50"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr style="background-color: rgb(255,105,222);color:#000;height: 24px;">
				<td align="center">
					aree impermeabili al 75%
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_75") != null) {
							out.println(rs.getString("PERC_75"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr style="background-color: rgb(255,0,200);color:#fff;height: 24px;">
				<td align="center">
					aree impermeabili al 90%
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_90") != null) {
							out.println(rs.getString("PERC_90"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr style="background-color: rgb(168,0,132);color:#fff;height: 24px;">
				<td align="center">
					aree impermeabili al 100%
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_100") != null) {
							out.println(rs.getString("PERC_100"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr style="background-color: rgb(154,0,114);color:#fff;height: 24px;">
				<td align="center">
					Totale aree impermeabilizzate
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_IMPER") != null) {
							out.println(rs.getString("PERC_IMPER"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>				
		  </table>
		  <p></p>

	  <div>
		  Le % di impermeabilizzazione sono sempre riferite all'area di pianura. <br /> I dati di base sono aggiornati al 2008 o 2011, a seconda delle zone.
	  </div>

	  <div id="pie1" style="margin-top:20px; margin-left:20px; width:200px; height:200px;"></div>

	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2016
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/impermeabilizzazione.pdf" rel="external">apri note illustrative</a>
	  </div>

	<script class="code" type="text/javascript">
		$(document).ready(function(){
			var plot1 = $.jqplot('pie1', [[['a',25],['b',14],['c',7]]], {
				gridPadding: {top:0, bottom:38, left:0, right:0},
				seriesDefaults:{
					renderer:$.jqplot.PieRenderer, 
					trendline:{ show:false }, 
					rendererOptions: { padding: 8, showDataLabels: true }
				},
				legend:{
					show:true, 
					placement: 'outside', 
					rendererOptions: {
						numberRows: 1
					}, 
					location:'s',
					marginTop: '15px'
				}       
			});
		});
	</script>
	  

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
