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
    %>
    <p>Application version : 0</p>
    <p>Server host name : <%=hostName%></p>
    <p>Virtual host name : <%=localName%></p>
    <p>Virtual host port : <%=localPort%></p>
    <p>Current session: <%= session.getId() %></p>
    <p>Current user: <%= request.getUserPrincipal() %>
    <p>
    Invalid username and/or password, please try
    <a href='<%= response.encodeURL("index.jsp") %>'>again</a>.
    </p>
  </body>
</html>
