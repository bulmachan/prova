<%@ include file="params.jsp"
%><%@ include file="c_java.jsp"
%><%@ include file="apriDbConn.jsp"
%><%

int  id_fao_uni_parte = 0;

if (request.getParameter("id")!=null){ 
	if (!request.getParameter("id").equals("")) {
		try {
			 id_fao_uni_parte = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException nfe) {
			// catch exception if id isn't integer
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
				 id_fao_uni_parte = 0;
			}	
		} catch (NumberFormatException nfe) {
			// catch exception if id isn't integer
			 id_fao_uni_parte = 0;
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
				 id_fao_uni_parte = 0;
			}	
		} catch (NumberFormatException nfe) {
			// catch exception if liv isn't integer
			// invalid request
			 id_fao_uni_parte = 0;
		}
	}
}

String scala="1:1.000.000";
String pagPadre="scheda_provincia";

switch (liv){
	case 1:
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
	
	case 4:
		scala="1:50.000";
		pagPadre="";
	break;

	default:
	break;
}

String str_sql = "SELECT * FROM ped_user.ped_fao_uni_parti WHERE id_fao_uni_parte = " + id_fao_uni_parte;
ResultSet rs = null;


try
{
	Statement stm = dbConn.createStatement();
	rs = stm.executeQuery(str_sql);
	rs.next();
		
	if (rs.getRow() == 0) {
	
		title = "Comportamento agroforestale e ambientale";
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
				<a href="<%=pagPadre%>.jsp?id=<%=id_uc%>" title="Torna alla Unit&agrave; Cartografica <%=uc%>">U.C. <%=uc%></a>
			<%
			}
		}
		%>
			</div>
			<div class="uc_01">
				<a name="contenutopagina" tabindex="0"></a>
				<p id="msg_error">La scheda comportamento agroforestale e ambientale richiesta non &egrave; valida.<br/><br/>
				<%
				/* breadcrumbs valido */
				if (((liv >= 1) && (liv <= 3)) && (id_uc > 0)) {
				%>
				<a href="<%=pagPadre%>.jsp?id=<%=id_uc%>" title="Torna alla Unit&agrave; Cartografica <%=uc%>">Torna alla Unit&agrave; Cartografica <%=uc%></a>
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
		pageHeader = "";
		if (rs.getString("nome").substring(0,1).equalsIgnoreCase("H") || rs.getString("nome").substring(0,1).equalsIgnoreCase("A")){
			title = "Comportamento agroforestale e ambientale degli " + rs.getString("nome");
					
		} else {
			title = "Comportamento agroforestale e ambientale dei " + rs.getString("nome");
		}
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
			<a accesskey="h" href="index.jsp?liv=<%=liv%>" title="Torna alla pagina principale">Home Page</a>
			&#8250;&#8250; <a href="legenda.jsp?liv=<%=liv%>" title="Torna alla legenda Carta dei suoli alla scala <%=scala%>">Legenda carta dei suoli alla scala <%=scala%></a> &#8250;&#8250;
			<a href="<%=pagPadre+".jsp?id="+id_uc%>" title="Torna alla Unit&agrave; Cartografica <%=uc%>">U.C. <%=uc%></a>
			&#8250;&#8250; Comportamento agroforestale e ambientale
		</div>
		<div class="comportamento_01">
			<div id="box_titolo_comportamento">
				<div class="titolo_comp">
					<h1><%=title%></h1>
				</div>
			</div>
		</div>
		<div class="comportamento_02">
		<a name="contenutopagina" tabindex="0"></a>
	<%
		if (rs.getString("gest_af_amb")!=null)
		if (!rs.getString("gest_af_amb").trim().equals(""))
		{
	%>	
			<p>
				<%=rs.getString("gest_af_amb")%>
			</p>
	<%
		}
		if (rs.getString("indice_scelta_colt")!=null)
		if (!rs.getString("indice_scelta_colt").trim().equals(""))
		{
	%>
			<h2>Indicazioni per la scelta delle colture agrarie</h2>
			<p>
				<%=rs.getString("indice_scelta_colt")%>
			</p>
	<%
		}
		if (rs.getString("indice_scelta_foresta")!=null)
		if (!rs.getString("indice_scelta_foresta").trim().equals(""))
		{
	%>
			<h2>Indicazioni per la scelta delle specie forestali</h2>
			<p>
				<%=rs.getString("indice_scelta_foresta")%>
			</p>
	<%
		}
		if (rs.getString("sistemazioni")!=null)
		if (!rs.getString("sistemazioni").trim().equals(""))
		{
	%>
			<h2>Sistemazione</h2>
			<p>
				<%=rs.getString("sistemazioni")%>
			</p>
	<%
		}
		if (rs.getString("tecniche_colt_lav")!=null)
		if (!rs.getString("tecniche_colt_lav").trim().equals(""))
		{
	%>
			<h2>Coltivazione e Lavorazione</h2>
			<p>
				<%=rs.getString("tecniche_colt_lav")%>
			</p>
	<%
		}
		if (rs.getString("tecniche_fertilizz")!=null)
		if (!rs.getString("tecniche_fertilizz").trim().equals(""))
		{
	%>
			<h2>Fertilizzazione</h2>
			<p>
				<%=rs.getString("tecniche_fertilizz")%>
			</p>
	<%
		}
		if (rs.getString("tecniche_irriga")!=null)
		if (!rs.getString("tecniche_irriga").trim().equals(""))
		{
	%>
			<h2>Irrigazione</h2>
			<p>
				<%=rs.getString("tecniche_irriga")%>
			</p>
	<%
		}
	%>
		</div>

	<%

	}
	
	rs.close();
	stm.close();
	
} catch(Exception ee) {
	out.println(ee.getMessage());
	ee.printStackTrace();
}
%><%@ include file="chiudiDbConn.jsp"
%><%@ include file="footer.htm"
%>