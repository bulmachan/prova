<%@ include file="params.jsp"%>
<%
	title = "I suoli della Regione Emilia-Romagna - Risultati ricerca";
	String queryBriciole="";
	if (request.getParameter("query") != null){
		queryBriciole=request.getParameter("query");
	} else {
		if (request.getParameter("QUERY") != null){
			queryBriciole=request.getParameter("QUERY");
		} else {
			throw new Exception("Parametro QUERY non corretto");
		}
	}
%>
<%@ include file="head.jsp"
%>
<%@ include file="testata.jsp"%>
<ul class="skip">
	<li><a href="#homepage" title="Torna alla Pagina Principale - accesskey h">Torna alla Pagina Principale [h]</a> </li>
	<li><a href="#contenutopagina" title="Descrizione della #### - accesskey k" accesskey="k">Salta ai contenuti [k]</a> </li>
    <li><a href="#cerca" title="Salta al form di ricerca  - accesskey c">Cerca nel sito [c]</a> </li>

 </ul>
 </div>
  <div class="briciole">
  <a name="homepage" tabindex="0"></a>
  <a accesskey="h" href="index.jsp" title="Torna alla pagina principale">Home Page</a>&nbsp;&#8250;&#8250; Risultato della ricerca per: "<%=queryBriciole%>" 
  </div>
	
  <div class="risultato_ricerca">
  <a name="contenutopagina" tabindex="0"></a>
   
<%@ include file="cerca.jsp"%>

  </div>

<%@ include file="footer.htm"
%>