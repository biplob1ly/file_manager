<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Upload Kona File</title></head>
<script type="text/javascript">

    function doAddMore() {
        var div = document.getElementById('fileuploads');
        var field = div.getElementsByTagName('input')[0];
        var field2 = div.getElementsByTagName('input')[1];

        div.appendChild(document.createElement("br"));
        div.appendChild(field.cloneNode(false));
        div.appendChild(field2.cloneNode(false));
    }

</script>

<p></p>
    <body>
    <td align="center">Multiple Kona File Issue Submit</td>
    <form action="FileUploadServlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
        <table border="2" align="left">
            <tr>
            </tr>
            <tr>
                Session Name: <input type="text" name="sessionName"><br><br>
                Date: <input type="date" name="date"><br><br>

                <div id="fileuploads" align="left">
                    File Name: <input type="text" name="name"> <t></t>
                    Select File to Upload:
                    <input type="file" name="fileName" multiple="multiple"><br><br>
                </div>
            </tr>
            <td align="left">
                <input type="button" name="addmore" id="addmore" value="Add More" onClick="doAddMore();"/>
            </td>
        </table>
<p></p>
<input type="submit" name="button" id="button" value="Submit"/>

</form>
</body>
</html>
