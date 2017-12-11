<html>
<head>

    <title>Upload Kona File</title>
    <style>


        header {
            background-color:black;
            color:white;
            text-align:center;
            padding:1px;
        }

        footer {
            background-color:black;
            color:white;
            text-align:center;
            position: fixed;
            bottom: 0px;
            width: 100%;
            left : 0px;
        }

        .upload-page {
            width: 500px;
            padding: 3% 0 0;
            margin: auto;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 500px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }


        #button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            cursor: pointer;
        }

        .form button:hover,.form button:active,.form button:focus {
            background: #43A047;
        }


        body {
            background: #76b852; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #76b852, #8DC26F);
            background: -moz-linear-gradient(right, #76b852, #8DC26F);
            background: -o-linear-gradient(right, #76b852, #8DC26F);
            background: linear-gradient(to left, #76b852, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    <script type="text/javascript" language="javascript">

        $(function () {
            $("body").on("click", ".remove", function () {
                $(this).closest("div").remove();
            });
        });
        function add() {

            var file = document.createElement("input");
            var name = document.createElement("input");

            var rmv = document.createElement("input");

            name.setAttribute("type", "text");
            name.setAttribute("value", "");
            name.setAttribute("name", "textFieldName");
            name.setAttribute("required","required");
            name.setAttribute("placeholder","File Name");


            file.setAttribute("type", "file");
            file.setAttribute("name", "fileName");

            rmv.setAttribute("value","Remove");
            rmv.setAttribute("type","button");
            rmv.setAttribute("class","remove");
            rmv.setAttribute("id","button");


            var foo = document.createElement("div");
            var tempDiv = document.getElementById("fooBar");


            foo.appendChild(name);
            foo.appendChild(file);
            foo.appendChild(rmv);
            foo.appendChild(document.createElement("br"));

            tempDiv.appendChild(foo);


        }
    </script>
</head>
<body>



<%--/* <a href="/FileUploadServlet"><button>File List</button></a>--%>
<%--<form action="FileUploadServlet" method="post" enctype="multipart/form-data">--%>
    <%--<br/>--%>
    <%--Session Name: <input type="text" name="sessionName" required="required"><br><br>--%>
    <%--Date: <input type="date" name="date" required="required"><br><br>--%>
    <%--File Name: <input type="text" name="textFieldName" required="required">--%>
    <%--<input type="file" name="fileName" required="required">--%>

    <%--<br>--%>
    <%--<div id="fooBar"></div>--%>
    <%--<input type="button" value="Add" onclick="add()"/>--%>
    <%--<input type="submit" name="button" id="button" value="Submit"/>--%>
<%--</form> */--%>



<header>
    <h1>Upload File</h1>
</header>

<div class="upload-page">
    <div class="form">
        <form action="upload" method="post" enctype="multipart/form-data">
            <input type="text" name="sessionName" placeholder="Session Name" required="required">
            <input type="date" name="date" placeholder="Date" required="required">
            <input type="text" name="textFieldName" placeholder="File Name" required="required">
            <input type="file" name="fileName" required="required">
            <div id="fooBar"></div>
            <%--/* 		<button onclick="add()">Add</button><br><br>--%>
            <%--<button id="button">Submit</button> */--%>
            <input type="button" value="Add More" id="button" onclick="add()"/>
            <input type="submit" name="button" id="button" value="Submit"/>
        </form>

    </div>
</div>

<footer>
    Copyright &copy; KonaSL.com
</footer>


</body>
</html>