<%
	Connection dbConn = null;
	try{ // INIZIO connessione
	
	//PARAMETRI PER LA CONNESSIONE ORACLE
		javax.naming.Context initContext = new javax.naming.InitialContext();
		/* OLD */
		/*javax.naming.Context envContext  = (javax.naming.Context)initContext.lookup("java:/comp/env");
		javax.sql.DataSource ds = (javax.sql.DataSource)envContext.lookup("jdbc/sgss");*/
		
		javax.sql.DataSource ds = (DataSource) initContext.lookup("java:/sgss");
		
		dbConn = ds.getConnection(); // oggetto connessione
		//out.println(dbConn.getMetaData().getURL() );
	// FINE		
	
	} catch(Exception ee) {
		out.println("Errore durante la connessione al DB: "+ee);

	}// FINE connessione

%>