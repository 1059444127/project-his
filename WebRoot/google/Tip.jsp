<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragram" content="no-cache">
<title>Tip.jsp</title>
</head>

<body>
<%
request.setCharacterEncoding("UTF-8");
String keyword = request.getParameter("KeyWord");

File file = new File("C:\\AjaxSourch.txt");
BufferedReader in = new BufferedReader(new FileReader(file));

String strLine = in.readLine();
StringBuffer sb = new StringBuffer(500);
while (strLine != null) {
    sb.append(strLine);
    sb.append("|");
    strLine = in.readLine();
}
String[] str=sb.toString().split("\\|");
sb.delete(0, sb.length());
if (keyword==null)
{
    //System.out.print("null");
}
else {
    int strLength = str.length;
    sb.append("|");
	for (int i=0;i < strLength; i++)
	{
		if (str[i].contains(keyword))
		{
		    sb.append(str[i]).append("|");
		}
	}
}
in.close();
//System.out.println("@" + sb.toString());
out.print(sb.toString());
%>
</body>
</html>