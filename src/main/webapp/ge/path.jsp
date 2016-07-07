
<%@ include file="c_java.jsp"
%><%


out.println("application.getRealPath(request.getServletPath()): "+application.getRealPath(request.getServletPath())+"<br />");

out.println("request.getLocalAddr().toString(): "+request.getLocalAddr().toString()+"<br />");

out.println("request.getRemoteAddr(): "+request.getRemoteAddr().toString()+"<br />");

out.println("request.getRemoteHost(): "+ request.getRemoteHost().toString()+"<br />");

out.println("request.getServerName(): "+ request.getServerName() +"<br />");

out.println("request.getLocalName(): "+ request.getLocalName() +"<br />");

out.println("request.getScheme(): "+ request.getScheme()+"<br />");

out.println("request.getRequestURI(): "+ request.getRequestURI()+"<br />");

%>