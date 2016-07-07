<div id="container">
	<div id="intro">
  		<div id="logo_rer">
			<a href="http://www.regione.emilia-romagna.it" title="Apri il Portale della Regione Emilia-Romagna" rel="external"><img src="images/logo_er.png" alt="Logo del Portale della Regione Emilia-Romagna"  height="30" /></a>&nbsp;<a href="http://www.regione.emilia-romagna.it" title="Apri il Portale della Regione Emilia-Romagna" rel="external"><img border="0" src="images/logo_rer.png" width="150" height="21" alt="Logo Regione Emilia-Romagna" /></a>
  		</div>


  		<div id="logo_rer_stampa">
			<img src="images/marchio_RER.jpg" width="200" height="34" alt="Regione Emilia-Romagna" />
  			<span>http://www.regione.emilia-romagna.it</span>
  		</div>
		<div id="pageHeader">			
			<h1>
<%			if (pageHeader != "") {
%>
				<span><%=pageHeader%></span>
<%
			}
%> 			<span>I suoli dell'Emilia-Romagna</span>
  			<span>a cura del Servizio Geologico Sismico e dei Suoli, Regione Emilia-Romagna</span></h1>
  		</div>
  		<div id="titolo">
  			<img src="images/i_suoli_titolo.png" width="380" height="31" alt="I suoli dell'Emilia-Romagna" />
  		</div>

		<div id="campo_search">
        <form method="get" action="risultato_ricerca.jsp" id="ricerca">
          <div>
            <label id="label" for="query">cerca</label><br />

					<!--queste righe:
    				<input type="hidden" value="Cartpedo" id="i" name="i" />
    				<input type="hidden" value="cartpedo" id="url" name="url" />
  					<input type="hidden" value="query" id="f" name="f" />
  					<input type="hidden" value="cartpedo" name="content" />
					 sono commentate fin qui-->

					<a name="cerca" tabindex="0"></a>
    				<input accesskey="c" type="text" name="query" size="16" value="" id="query" class="input_text" /><br />
    				<button type="submit" value=" " title="Avvia ricerca" id="button" class="bottone_vai">Vai &#8250;&#8250;</button>
    			</div>
    	</form>
        </div>

