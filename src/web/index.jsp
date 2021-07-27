<%!
static String hostName = null;

static {
	try {
	    hostName = InetAddress.getLocalHost().getHostName();
	} catch (UnknownHostException uhe) {
	    hostName = "Unknown";
    }
}
%>
<%@page import="java.net.InetAddress" %>
<%@page import="java.net.UnknownHostException" %>
<html>
  <body>
    <%
    String localName = request.getServerName();
    String localPort = Integer.toString(request.getLocalPort());
    String contextPath = request.getServletContext().getContextPath();
    %>
    <p>Application version : 0</p>
    <p>Server host name : <%=hostName%></p>
    <p>Virtual host name : <%=localName%></p>
    <p>Virtual host port : <%=localPort%></p>
    <p>Context path : <%=contextPath %></p>
    <p>Current session: <%= session.getId() %></p>
    <p>Current user: <%= request.getUserPrincipal() %>
    <p><a href="protected/index.jsp">Protected page</a>.</p>
    <%
    String otherContextPath;
    if ("/foo".equals(contextPath)) {
        otherContextPath = "/bar";
    } else {
        otherContextPath = "/foo";
    }
    %>
    <p><a href="<%=otherContextPath%>/protected/index.jsp">Protected page in other context</a>.</p>
  </body>
</html>
