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
    <p>Current user: <%= request.getUserPrincipal() %></p>
    
<form method="POST" action='<%= response.encodeURL("j_security_check") %>' >
  <table>
    <tr>
      <th align="right">Username:</th>
      <td align="left"><input type="text" name="j_username"></td>
    </tr>
    <tr>
      <th align="right">Password:</th>
      <td align="left"><input type="password" name="j_password"></td>
    </tr>
    <tr>
      <td align="right"><input type="submit" value="Log In"></td>
      <td align="left"><input type="reset"></td>
    </tr>
  </table>
</form>
    
  </body>
</html>

