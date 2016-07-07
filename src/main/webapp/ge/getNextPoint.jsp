<%@ include file="c_java.jsp"
%><%@ include file="micSpatialEngine.jsp"
%><%@ include file="params.jsp"
%><%

micSpatialEngine mSE = new micSpatialEngine(connUser,connPw,nomeServer,portaSDE);
SeConnection connSDE=null;
connSDE=new SeConnection(nomeServer, portaSDE, null, connUser, connPw);

ArrayList risultato=new ArrayList();
layer="ESC_VF_POI_GE_PUN";
risultato=mSE.trovaElementoPerParametri("ESC_USER"+"."+layer, "OBJECTID = 1", connSDE);

for(int j=0; j<risultato.size(); j++){
	String[] ris = (String[]) risultato.get(j);
	out.println(ris[0]);
}
mSE.chiudiConnSDE();
connSDE.close();

%>
