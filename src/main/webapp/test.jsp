<html>
<head></head>
<body>
<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
    Select File to Upload:<input type="file" name="fileName" multiple="multiple"><br><br>
    Session Name: <input type="text" name="sessionName"><br><br>
    DateTime: <input type="date" name="date"><br><br>
    <input type="submit" value="Upload">
</form>
</body>
</html>