<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.kona.wallet.model.KonaFile" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="org.kona.wallet.Constant" %>
<html>
<style>
    header {
        background-color: black;
        color: white;
        text-align: center;
        padding: 1px;
    }
    h3{
        padding: 0px;
        margin: 0px;
    }

    div {
        /*border:solid;*/
        /*border-color: black;*/
        color: black;
        margin: 10px;
        padding-left: 5px;
    }

    footer {
        background-color:black;
        color:white;
        text-align:center;
        bottom: 0px;
        width: 100%;
        left : 0px;

        padding: 1px;
    }
    a{
        color: blue;
    }
    a:hover {
        color: hotpink;
    }
</style>
<head>
    <title>Upload File Response</title>
</head>
<body>

<header>
    <h1>File Gallery</h1>
</header>

<h2>${requestScope.message}</h2>


<%
    ArrayList<KonaFile> files = new ArrayList<KonaFile>();
    files = (ArrayList<KonaFile>) request.getAttribute("list");


    String tempSession = "";
    String htmlText = "";
    int fixedItem = 6;
    if (files.size() > 0) {
        for(int i=0; i<(files.size()-fixedItem); i++) {
//        for (KonaFile file : files) {
            KonaFile file = files.get(i);
            if (!file.getTitle().equals(tempSession)) {
                if (!file.getTitle().equals(files.get(0).getTitle()) ) {
                    htmlText +="</div>";
                }

                htmlText += "<div>";
                htmlText += "<h3>[" + file.getDate()  + "]       " + file.getTitle() + "</h3>";
                htmlText += "<a href='/FileDownloadServlet?fileName=" + file.getFilePath() + "'>" + file.getName() + "</a>";
                tempSession = file.getTitle();
            } else {
                htmlText += "<br><a href='/FileDownloadServlet?fileName=" + file.getFilePath() + "'>" + file.getName() + "</a>";
            }

        }
        htmlText += "</div>";
    }

    String htmlText2="";
    for(int i=files.size()-fixedItem; i<files.size(); i++) {
        KonaFile file = files.get(i);
        if (!file.getTitle().equals(tempSession)) {
            if (!file.getTitle().equals(files.get(files.size()-fixedItem).getTitle()) ) {
                htmlText2 +="</div>";
            }

            htmlText2 += "<div>";
            htmlText2 += "<h3>[" + file.getDate()  + "]       " + file.getTitle() + "</h3>";
            htmlText2 += "<a href='/FileDownloadServlet?fileName=" + file.getFilePath() + "'>" + file.getName() + "</a>";
            tempSession = file.getTitle();
        } else {
            htmlText2 += "<br><a href='/FileDownloadServlet?fileName=" + file.getFilePath() + "'>" + file.getName() + "</a>";
        }
    }
    htmlText2 += "</div>";

%>



<table style="width:100%">
    <tr>
        <td valign="top">
            <%= htmlText %>
        </td>
        <td valign="top">
            <%= htmlText2 %>
        </td>
    </tr>
</table>
<footer>
    Copyright &copy; KonaSL.com
</footer>
</body>

</html>