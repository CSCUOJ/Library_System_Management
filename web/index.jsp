<%-- 
    Document   : index
    Created on : Jul 31, 2018, 11:39:51 PM
    Author     : THANUSSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <style type="text/css">
            html, body {
                height: 100%;
            }

            .vertical-center {
                width: 100%;
                text-align: center;  /* align the inline(-block) elements horizontally */
                font: 0/0 a;         /* remove the gap between inline(-block) elements */
            }

            @media (max-width: 768px) {
                .vertical-center:before {
                    /* height: auto; */
                    display: none;
                }                
            }
            .jumbotron{
                background-color:#343a40;
                justify-content: center;
                text-align:center;
                min-height: 250px;
            }
            h1{
                margin-top: 45px;
                color: #fff;
                
            }
            body{
                background-color: #f9f9f9;                
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="jumbotron vertical-center mb-5">
            <h1>Library Management System</h1>
        </div>
        <div class="container">            
            <div class="card-deck">
                <div class="col-2"></div>
                
                <div class="card text-center bg-light">
                    <div class="card-block">
                        <div class="card-img-top">
                            <img class="card-img" src="Content/ICONS/291400-books_2-512.png">
                        </div>
                        <div class="card-title">
                        <h4><a href="ViewBookController"> Books</a></h4>
                        </div> 
                    </div>
                </div>
                
                
                <div class="col-2"></div>
                
                <div class="card text-center bg-light">
                    <div class="card-block" >
                        <div class="card-img-top"><img class="card-img" src="Content/ICONS/Classification-512.png"></div>
                        <div class="card-title">
                        <h4><a href="ViewSubController"> Classifications</a></h4>
                        </div>   
                    </div>
                </div>
                
                <div class="col-2"></div> 
            </div>
        </div>
    </body>
</html>
