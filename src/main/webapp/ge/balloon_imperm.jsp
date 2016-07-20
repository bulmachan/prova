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
            " PED_VF_IMPERM_COMUNI_POL.GISID, PED_VF_IMPERM_COMUNI_POL.NOME_C, PED_VF_IMPERM_PROVINCE_POL.SIGLA_PRO as PROVINCIA, " +
            "to_char(PED_VF_IMPERM_COMUNI_POL.HA_AREA_COMUNE_TOT,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as HA_AREA_COMUNE_TOT,"+
            " to_char(PED_VF_IMPERM_COMUNI_POL.HA_AREA_COMUNE_PIA,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as HA_AREA_COMUNE_PIA, "+
            " PED_VF_IMPERM_COMUNI_POL.PERC_COM_PIA, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_ACQ_ANT,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_ACQ_ANT, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_25,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_25, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_50, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_75,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_75, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_90,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_90, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_100,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_100, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_25 + PED_VF_IMPERM_COMUNI_POL.PERC_50 + PED_VF_IMPERM_COMUNI_POL.PERC_75 + PED_VF_IMPERM_COMUNI_POL.PERC_90 + PED_VF_IMPERM_COMUNI_POL.PERC_100,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_PERC, "+
            " to_char(100-(PED_VF_IMPERM_COMUNI_POL.PERC_ACQ_ANT + PED_VF_IMPERM_COMUNI_POL.PERC_25 + PED_VF_IMPERM_COMUNI_POL.PERC_50 + PED_VF_IMPERM_COMUNI_POL.PERC_75 + PED_VF_IMPERM_COMUNI_POL.PERC_90 + PED_VF_IMPERM_COMUNI_POL.PERC_100),'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as SUOLO_LIBERO, "+
            " to_char(PED_VF_IMPERM_COMUNI_POL.PERC_IMPER,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_IMPER, " +
                
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_IMPER,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_IMPER_PRO, " +
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_SUO_LIB,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_SUO_LIB_PRO, " +
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_ACQ_ANT,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_ACQ_ANT_PRO, "+
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_25,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_25_PRO, "+
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_50,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_50_PRO, "+
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_75,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_75_PRO, "+
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_90,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_90_PRO, "+
            " to_char(PED_VF_IMPERM_PROVINCE_POL.PERC_100,'99G990D0', 'NLS_NUMERIC_CHARACTERS = ''.,''') as PERC_100_PRO "+
                
            " FROM PED_USER.PED_VF_IMPERM_COMUNI_POL " +
            " LEFT JOIN PED_USER.PED_VF_IMPERM_PROVINCE_POL ON PED_VF_IMPERM_COMUNI_POL.ID_PROVINCIA = PED_VF_IMPERM_PROVINCE_POL.ID_PROVINCIA " +
            " where PED_VF_IMPERM_COMUNI_POL.GISID="+id;
		  
	//out.println(dbConn.getMetaData().getURL() );
	//out.print(sqlString);
	
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(sqlString);
	rs.next();
	
	String paramsChart1="";
	String paramsChart2="";
	String s1="";
	String s2="";
	String s3="";
	String provincia="";
        
	if (rs.getRow() == 0) {
		%>
		<p>La scheda richiesta non &egrave; valida. </p>
		<p><a title="Torna alla pagina principale" href="../index.jsp?liv=33">Torna alla Home Page</a></p>
		<%
	} else {
		
		
		paramsChart1="['a',"+rs.getString("SUOLO_LIBERO")+"],['b',"+rs.getString("PERC_ACQ_ANT")+"],['c',"+rs.getString("PERC_PERC")+"]";
		
		paramsChart2="['a',"+rs.getString("SUOLO_LIBERO")+"],['b',"+rs.getString("PERC_ACQ_ANT")+"],['c',"+rs.getString("PERC_25")+"],['d',"+rs.getString("PERC_50")+"],['e',"+rs.getString("PERC_75")+"],['f',"+rs.getString("PERC_90")+"],['g',"+rs.getString("PERC_100")+"]";
                    
                
                //s1 = "["+rs.getString("SUOLO_LIBERO")+","+rs.getString("PERC_ACQ_ANT")+","+rs.getString("PERC_25")+","+rs.getString("PERC_50")+","+rs.getString("PERC_75")+","+rs.getString("PERC_90")+","+rs.getString("PERC_100")+"]";
                s1 = "["+rs.getString("PERC_100")+","+rs.getString("PERC_90")+","+rs.getString("PERC_75")+","+rs.getString("PERC_50")+","+rs.getString("PERC_25")+","+rs.getString("PERC_ACQ_ANT")+","+rs.getString("SUOLO_LIBERO")+"]";

                //s2 = "["+rs.getString("PERC_SUO_LIB_PRO")+","+rs.getString("PERC_ACQ_ANT_PRO")+","+rs.getString("PERC_25_PRO")+","+rs.getString("PERC_50_PRO")+","+rs.getString("PERC_75_PRO")+","+rs.getString("PERC_90_PRO")+","+rs.getString("PERC_100_PRO")+"]";
                s2 = "["+rs.getString("PERC_100_PRO")+","+rs.getString("PERC_90_PRO")+","+rs.getString("PERC_75_PRO")+","+rs.getString("PERC_50_PRO")+","+rs.getString("PERC_25_PRO")+","+rs.getString("PERC_ACQ_ANT_PRO")+","+rs.getString("PERC_SUO_LIB_PRO")+"]";
                
                provincia=rs.getString("PROVINCIA");
	%>

	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.jqplot.js"></script>
<!--<script type="text/javascript" src="js/jqplot.pieRenderer.js"></script>
 <script type="text/javascript" src="js/jqplot.highlighter.js"></script> -->
<script type="text/javascript" src="js/jqplot.barRenderer.js"></script>

<script type="text/javascript" src="js/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="js/jqplot.pointLabels.js"></script>
  
<link rel="stylesheet" type="text/css" href="js/jquery.jqplot.css" />	
<style>

	.jqplot-data-label{
            color: #000;
            font-size: 1.1em;
            font-weight: bold;
	}
        .jqplot-point-label {
            color: #000;
            font-size: 1.1em;
            font-weight: bold;
           
            z-index: 2;
        } 
        .jqplot-yaxis {
            font-size: 1.1em;
            font-weight: bold;
            margin-right: 10px;
            color: #000;
            padding: 5px;
        }
        .jqplot-xaxis {
            margin-top: 10px;
            font-size: 1.1em;
            font-weight: bold;
            color: #000;
        }        
</style>	

	  <p class="scala"><strong>Carta delle Superfici impermeabilizzate</strong><br />Livello di dettaglio 1:25.000</p>
	  
	  
		  <h2>Comune di <% out.println(rs.getString("NOME_C")+" ("+rs.getString("PROVINCIA")+")");%></h2>
		  
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
					Area del Comune
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("HA_AREA_COMUNE_TOT") != null) {
							out.println(rs.getString("HA_AREA_COMUNE_TOT"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
				<td align="center">
					<strong>100.0</strong>				
				</td>
			</tr>		  

			<tr style="background-color: #E3CBB1;color:#000">
				<td align="center">
					Area del Comune in pianura
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("HA_AREA_COMUNE_PIA") != null) {
							out.println(rs.getString("HA_AREA_COMUNE_PIA"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
				<td align="center"><strong>
					<%	if (rs.getString("PERC_COM_PIA") != null) {
							out.println(rs.getString("PERC_COM_PIA"));
						} else {
							out.println("-");
						} 
					%></strong>			
				</td>
			</tr>			
		</table>
		<p></p>
		<table width="100%">
			<tr style="background-color: #b3814b;color:#000">
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>#</strong>
				</td>
                                <td align="center" valign="top"style="width: 180px;">
					<strong>Attributo</strong>
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					<strong>%</strong>
				</td>
			</tr>			
			
                        <tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>a</strong>
				</td>
				<td align="center" style="background-color: #E3CBB1;color:#000;width: 180px;">
					Suoli agricoli e aree naturali
				</td>
				<td align="center" style="background-color: #E3CBB1; color:#000;height: 24px;"><strong>
					<%	if (rs.getString("SUOLO_LIBERO") != null) {
							out.println(rs.getString("SUOLO_LIBERO"));
						} else {
							out.println("-");
						} 
					%>	</strong>				
				</td>
			</tr>
                        
			<tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>b</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Corpi idrici, alberi e aree permeabili antropizzate
				</td>
				<td align="center" style="background-color:rgb(115, 223, 255); color:#000;height: 24px;"><strong>
					<%	if (rs.getString("PERC_ACQ_ANT") != null) {
							out.println(rs.getString("PERC_ACQ_ANT"));
						} else {
							out.println("-");
						} 
					%>	</strong>				
				</td>
			</tr>	

			<!--<tr style="background-color: #b3814b;color:#000;">
				<td align="center" valign="top">
					&nbsp;
				</td>
				<td align="center" valign="top" style="padding-left:5px;padding-right:5px">
					&nbsp;
				</td>
			</tr>-->
			<tr>
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>c</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Aree impermeabili al 25%
				</td>
				<td align="center" style="background-color: rgb(255,217,247);color:#000;height: 24px;"><strong>
					<%	if (rs.getString("PERC_25") != null) {
							out.println(rs.getString("PERC_25"));
						} else {
							out.println("-");
						} 
					%>		</strong>			
				</td>
			</tr>				
			<tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>d</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Aree impermeabili al 50%
				</td>
				<td align="center" style="background-color: rgb(255,166,236);color:#000;height: 24px;"><strong>
					<%	if (rs.getString("PERC_50") != null) {
							out.println(rs.getString("PERC_50"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>e</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Aree impermeabili al 75%
				</td>
				<td align="center" style="background-color: rgb(255,105,222);color:#000;height: 24px;"><strong>
					<%	if (rs.getString("PERC_75") != null) {
							out.println(rs.getString("PERC_75"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>f</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Aree impermeabili al 90%
				</td>
				<td align="center" style="background-color: rgb(255,0,200);color:#fff;height: 24px;"><strong>
					<%	if (rs.getString("PERC_90") != null) {
							out.println(rs.getString("PERC_90"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr >
				<td align="center" style="background-color: #E3CBB1;color:#000">
                                    <strong>g</strong>
				</td>
                                <td align="center" style="background-color: #E3CBB1;color:#000">
					Aree impermeabili al 100%
				</td>
				<td align="center" style="background-color: rgb(168,0,132);color:#fff;height: 24px;"><strong>
					<%	if (rs.getString("PERC_100") != null) {
							out.println(rs.getString("PERC_100"));
						} else {
							out.println("-");
						} 
					%></strong>					
				</td>
			</tr>
			<tr >
				<td colspan="2" align="center" style="background-color: #E3CBB1;color:#000">
					Totale aree impermeabilizzate
				</td>
				<td align="center" style="background-color: #E3CBB1;color:#000;height: 24px;"><strong>
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
	  <div class="uc">
		  Valori % nel comune rispetto alla provincia 
	  </div>

	  <!--<div id="pie1" style="margin-top:0; margin-left:0; width:250px; height:250px;"></div>
	  <div id="pie2" style="margin: 0; padding: 0; width:270px; height:270px; background:#f3eadf;"></div>-->
          <div><span id="infoBar">&nbsp;</span></div>
          <div id="bar" style="margin: 0; padding: 0; width:270px; height:450px; background:#f3eadf;"></div>
          <div><span id="infoBar2">&nbsp;</span></div>
          
	  <div>
		  Le percentuali di impermeabilizzazione sono sempre riferite all'area di pianura. <br />I dati di base sono aggiornati al 2008 o 2011 (a seconda delle zone).
	  </div>


	  <div class="uc">
		  Anno di aggiornamento
	  </div>
	  <div class="titolo_uc_bal">
		2016
	  </div>
	  <div class="link_dettaglio">
		<a href="/gstatico/documenti/dati_pedol/AREE_IMPERMEABILIZZATE_PIANURA.pdf" rel="external">apri note illustrative</a>
	  </div>

	<script class="code" type="text/javascript">

		$(document).ready(function(){
			/*var plot1 = $.jqplot('pie1', [[<% out.print(paramsChart1);%>]], {
				grid: {
					drawBorder: true, 
					drawGridlines: false,
					background: '#402923',
					shadow:false
				},
				seriesDefaults:{
					renderer:$.jqplot.PieRenderer, 
					trendline:{ show:false }, 
					rendererOptions: { 
						sliceMargin: 1, 
						showDataLabels: true,
						dataLabelFormatString: "%#.1f"
					}
				},
				seriesColors: [ 'yellow', 'rgb(115,223,255)', 'rgb(154,0,1114)' ]
				
			});*/
			/*var plot2 = $.jqplot('pie2', [[<% out.print(paramsChart2);%>]], {
				grid: {
					drawBorder: false, 
					drawGridlines: false,
					background: '#f3eadf',
					shadow:false
				},
				seriesDefaults:{
					renderer:$.jqplot.PieRenderer, 
					trendline:{ show:false }, 
					rendererOptions: {
						sliceMargin: 1,
						showDataLabels: true,
						dataLabelThreshold: 0.1,
						dataLabelPositionFactor: 1.25,
						dataLabelFormatString: '%.1f %',
                                                startAngle: -90
					}
				},
				seriesColors: ['rgb(227,203,177)', 'rgb(115,223,255)','rgb(255,217,247)', 'rgb(255,166,236)', 'rgb(255,105,222)', 'rgb(255,0,200)', 'rgb(168,0,132)' ]
				
			});*/
    
                    $.jqplot.config.enablePlugins = true;
                    
                    var s1 = <% out.print(s1);%>;
                    var s2 = <% out.print(s2);%>;
                    var s3 = [71.96,6.82,12.00,0.26,0.49,2.33,6.15];
                    var ticks = ['g','f','e','d','c','b','a'];
                    var nomi = ['Aree impermeabili al 100%','Aree impermeabili al 90%','Aree impermeabili al 75%','Aree impermeabili al 50%','Aree impermeabili al 25%','Corpi idrici e aree permeabili','Suoli agricoli e aree naturali'];

                    plot2 = $.jqplot('bar', [s2, s1], {
                        
                        seriesDefaults: {
                            renderer:$.jqplot.BarRenderer,
                            pointLabels: { 
                                show: true,
                                formatString: '%.1f %'
                            },
                            rendererOptions: {
                                barDirection: 'horizontal',
                                dataLabelFormatString: '%.1f %',
                                varyBarColor: true
                            }
                        },
                        series: [
                            {seriesColors: ['#f48024', '#f48024', '#f48024', '#f48024', '#f48024', '#f48024', '#f48024']},
                            {seriesColors: ['rgb(168,0,132)', 'rgb(255,0,200)', 'rgb(255,105,222)','rgb(255,166,236)','rgb(255,217,247)','rgb(115,223,255)','rgb(227,203,177)']}
                        ],
            
                        axes: {
                            yaxis: {
                                renderer: $.jqplot.CategoryAxisRenderer,
                                ticks: ticks,
                                tickOptions:{
                                    max: 1,
                                    min: 200,
                                    formatString:'%i'
                                }
                            }/*,
                            xaxis: {
                                min:0,
                                max:85
                            }*/
                        }
                    });

                    $('#bar').bind('jqplotDataHighlight', 
                        function (ev, seriesIndex, pointIndex, data) {
                            if(seriesIndex==1){
                                var ind=parseInt(data[1]);
                                var valore=data[0];
                                //$('#infoBar').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': <strong>'+valore+'%</strong>');
                                //$('#infoBar2').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': <strong>'+valore+'%</strong>');
                                $('#infoBar').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': dato comunale');
                                $('#infoBar2').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': dato comunale');
                            } else {
                                var ind=parseInt(data[1]);
                                var valore=data[0];
                                //$('#infoBar').html('<strong>'+ticks[ind-1]+')</strong> Valore nella provincia di <% out.print(provincia);%>: <strong>'+valore+'%</strong>');
                                //$('#infoBar2').html('<strong>'+ticks[ind-1]+')</strong> Valore nella provincia di <% out.print(provincia);%>: <strong>'+valore+'%</strong>');
                                $('#infoBar').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': dato provinciale (<% out.print(provincia);%>)');
                                $('#infoBar2').html('<strong>'+ticks[ind-1]+')</strong> '+nomi[ind-1]+': dato provinciale (<% out.print(provincia);%>)');
                            }
                        }
                    );   

                    $('#bar').bind('jqplotDataUnhighlight', 
                        function (ev) {
                            //$('#infoBar').html('&nbsp;');
                            $('#infoBar').html('&nbsp;');
                            $('#infoBar2').html('&nbsp;');
                        }
                    );
 
    
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
