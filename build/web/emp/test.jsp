<%-- 
    Document   : test
    Created on : 20 Jun, 2018, 3:28:54 PM
    Author     : CC-005
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/10.0.1/classic/ckeditor.js"></script>
    </head>
    <body>
        
        <textarea name="content" id="editor">
    <p>Here goes the initial content of the editor.</p>
</textarea>
        <script type="text/javascript">
            ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .then( editor => {
        console.log( editor );
    } )
    .catch( error => {
        console.error( error );
    } );
        </script>
    </body>
</html>
