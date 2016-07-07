<%
	try{ // INIZIO chiusura connessione
		
		if(dbConn != null){
			dbConn.close();
		}
		dbConn=null;

	} catch(Exception e) {
		out.println("Errore durante la chiusura della connessione: "+e);

	}// FINE chiusura connessione
%>
