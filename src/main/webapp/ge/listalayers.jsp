<%@ page
	import="
		com.esri.sde.sdk.client.*
		, com.esri.*, java.util.*"
%><%

	String nomeServer = "vm113srv";
	String connUser = "cat_reader";
	String connPw = "geo01-catr";
	String instance = "5151";

	SeConnection conn=new SeConnection(nomeServer, instance, null, connUser, connPw);


			Collection seLayers = conn.getLayers();
			for (Iterator i = seLayers.iterator(); i.hasNext();)
	    		out.println(((SeLayer) i.next()).getQualifiedName()+"<br />");



%>
