<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%

int id_suolo = 0;

if (request.getParameter("id")!=null){ 
	if (!request.getParameter("id").equals("")) {
		try {
			id_suolo = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException nfe) {
			// catch exception if id isn't integer
			id_suolo = 0;
		}
	}
}


int id_uc = 0;

if (request.getParameter("id_uc")!=null){ 
	if (!request.getParameter("id_uc").equals("")) {
		try {
			id_uc = Integer.parseInt(request.getParameter("id_uc"));
			if (id_uc <= 0) {
				// invalid request
				id_suolo = 0;
			}	
		} catch (NumberFormatException nfe) {
			// catch exception if id isn't integer
			id_suolo = 0;
		}
	}
}

String uc = "0";

if (request.getParameter("uc")!=null){ 
	if (!request.getParameter("uc").equals("")) {
			uc = request.getParameter("uc");
	}
}

int liv = 0;

if (request.getParameter("liv")!=null){ 
	if (!request.getParameter("liv").equals("")) {
		try {
			liv = Integer.parseInt(request.getParameter("liv"));
			if (liv <= 0) {
				// invalid request
				id_suolo = 0;
			}	
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
			// invalid request
			id_suolo = 0;
		}
	}
}

String stmt_Sql = "SELECT * FROM ped_user.ped_v_fasi_suolo WHERE id_suolo = " + id_suolo;
ResultSet rs = null;

String scala="1:1.000.000";
String pagPadre="scheda_provincia";

switch (liv){
	case 1:
	default:
		scala="1:1.000.000";	
		pagPadre="scheda_provincia";
		break;
				
	case 2:
		scala="1:500.000";
		pagPadre="scheda_sistema";
		break;
				
	case 3:
		scala="1:250.000";
		pagPadre="scheda_sottosistema";
		break;
				
	/* for future development */ 
	/*case 4:
		scala="1:50.000";
		pagPadre="";
	break;*/

}

try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(stmt_Sql);

	rs.next();
	if (rs.getRow() == 0) {
		title = "Unit&agrave; cartografica&nbsp; ";
		pageHeader = "";
		%>
						
		<%@ include file="head.jsp"
		%>
		<ul class="skip">
		<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
		<li><a href="#contenutopagina" title="Salta ai contenuti - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
		<li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>
		</ul><%@ include file="testata.jsp"
		%>
		</div>
		<div class="briciole">
		<%
		if ((liv >= 1) && (liv <= 3)) {
		%>
			<a name="homepage" tabindex="0"></a>
			<a accesskey="h" href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
			&#8250;&#8250; <a href="legenda.jsp?liv=<%=liv%>" title="Torna alla legenda Carta dei suoli alla scala <%=scala%>">Legenda Carta dei suoli alla scala <%=scala%></a>
		<%
		 
			/* breadcrumbs valido */
			if (id_uc > 0) {
			%>
			
				&#8250;&#8250;
				<a href="<%=pagPadre+".jsp?id="+id_uc%>" title="Torna alla Unit&agarve; Cartografica <%=uc%>">U.C. <%=uc%></a>
			<%
			}
		}
		%>
			</div>
			<div class="uc_01">
				<a name="contenutopagina" tabindex="0"></a>
				<p id="msg_error">La scheda dei suoli richiesta non &egrave; valida.<br/><br/>
				<%
				/* breadcrumbs valido */
				if (((liv >= 1) && (liv <= 3)) && (id_uc > 0)) {
				%>
				<a href="<%=pagPadre+".jsp?id="+id_uc%>" title="Torna alla Unit&agrave; Cartografica <%=uc%>">Torna alla Unit&agrave; Cartografica <%=uc%></a>
				<%
				} else {
					if ((liv >= 1) && (liv <= 3)) {
						%>
						<a href="legenda.jsp?liv=<%=liv%>" title="Torna alla legenda Carta dei suoli al livello di dettaglio <%=scala%>">Torna alla LEGENDA Carta dei suoli al livello di dettaglio <%=scala%></a>
						<%
					} else {
						%>
						<a href="index.jsp?liv=1" title="Torna alla pagina principale">Torna alla Home Page - I suoli della Regione Emilia Romagna</a>
						<%
					}
				}
				%>
				</p>
			</div>
		<%
	
	} else {
				
		String sigla_suolo = rs.getString("sigla");
		title = rs.getString("intestazione") + " - U.C. " + uc + " - Scala " + scala;
		pageHeader = "";
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
		<!--<div id="quickSummary">
			<p class="p1"><span></span></p>
			<p class="p2"><span></span></p>
			<p class="p3"><span></span></p>
			<p class="p3"><span></span></p>
		</div>-->
		</div>
		<div class="briciole">
			<a name="homepage" tabindex="0"></a>
			<a accesskey="h" href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
			&#8250;&#8250; <a href="legenda.jsp?liv=<%=liv%>" title="Torna alla legenda Carta dei suoli alla scala <%=scala%>">Legenda carta dei suoli alla scala <%=scala%></a> &#8250;&#8250;
			<a href="<%=pagPadre+".jsp?id="+id_uc%>" title="Torna alla Unit&agrave; Cartografica <%=uc%>">U.C. <%=uc%></a>
			&#8250;&#8250; Suoli <%=rs.getString("sigla")%>
		</div>
		<div class="comportamento_01">
			<div id="box_titolo_comportamento">
				<div class="titolo_comp">
					<h1><%=rs.getString("intestazione")%></h1>
				</div>
			</div>
		</div>
	<%
		String id_profilo = rs.getString("id_profilo");
		String Catalogo_Collina = rs.getString("flag_cat_collina");
		String Catalogo_Pianura = rs.getString("flag_cat_pianura");

		if (!id_profilo.equals(""))
		{
			String str_sql = "SELECT * FROM ped_user.ped_v_profili_rife WHERE id_profilo = " + id_profilo;
			ResultSet rs2 = null;
			try
			{
				Statement stm2 = dbConn.createStatement();
				rs2 = stm2.executeQuery(str_sql);

				while(rs2.next())
				{
	%>
		<div class="intro_profilo_rif">
			<div class="img_comportamento">
				<img src="<%=pathImg%>/profili/<%=rs2.getString("img")%>.jpg"
					width ="256" height="384"
					alt="Immagine del profilo"
				/>
			</div>
			<a name="contenutopagina" tabindex="0"></a>
			<p class="profilo_descrizione_suoli">
				<%=aCapo(rs.getString("descrizione_250"))%>
			</p>
			<div class="titolo_profilo_rif">Profilo di riferimento</div>
			<p class="profilo_rif">
					Sigla profilo: <%=rs2.getString("sigla")%> <br />
					Località: <%=rs2.getString("localita")%> <br />
					Uso del Suolo: <%=rs2.getString("uso_suolo")%> <br />
					Data di rilevamento: <%=rs2.getString("data_osservaz")%><br />
					Rilevatori: <%=rs2.getString("rilevatori")%> <br /><br /><br />
			</p>
			<p class="profilo_descrizione">
				<%=aCapo(rs2.getString("descrizione"))%>
			</p>
	<%
				}
				rs2.close();
				stm2.close();
				} catch(Exception ee2) {
					out.println(ee2.getMessage());
					ee2.printStackTrace();
				}
			}
			if (Catalogo_Pianura.equals("1"))
			{
	%>	
			<div class="link_profilo_rif">
				<p>Per approfondimenti sul comportamento agro-forestale e ambientale vedi:</p>
				<p class="link_cataloghi">
					&#8250;&#8250; <a href="<%=Link_CatalogoPianura + sigla_suolo%>" title="Apri GIAS - Ermes Agricoltura">Catalogo dei tipi di suolo della pianura emiliano-romagnola (<%=Link_sito%>)</a>
				</p>
			</div>
	<%	} else if(Catalogo_Collina.equals("1")){  
	%>  
			<div class="link_profilo_rif">
				<p>Per approfondimenti sul comportamento agro-forestale e ambientale vedi:</p>
				<p class="link_cataloghi">
					&#8250;&#8250; <a href="catalogo_collina/<%=sigla_suolo.toLowerCase()%>.jsp" title="Apri Catalogo regionale dei principali suoli agricoli di collina e montagna">Catalogo regionale dei principali suoli agricoli di collina e montagna</a>
				</p>
			</div>
	<%	}
	%>
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
%><%@ include file="footer.htm"
%>