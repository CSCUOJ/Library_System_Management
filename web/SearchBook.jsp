<%-- 
    Document   : SearchBook
    Created on : Aug 1, 2018, 9:38:28 PM
    Author     : THANUSSHAN
--%>

<%@page import="java.util.List"%>
<%@page import="com.sgc.model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script type="text/javascript" language="javascript" src="Content/bootstrap-4.1.3-dist/js/jquery.tablesorter.min.js"></script>
        <style>
            td , th{
                width: 10%;
            }

            .new{
                padding-top: 0;
                padding-left: 1;
                padding-right: 0;
                padding-bottom: 0;
            }

            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu a::after {
                transform: rotate(-90deg);
                position: absolute;
                right: 6px;
                top: .8em;
            }

            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-left: .1rem;
                margin-right: .1rem;
            }
            .navbar-nav>li{
                padding-left: 10px;
                padding-right: 10px;                
            }
            .navbar-brand{
                padding-left: 15px;
            }
        </style>

    </head>
    <body>
        
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5">
                <a class="navbar-brand" href="index.jsp"><img src="Content/ICONS/image.png" width="35" height="35"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">

                        <li class="nav-item active">
                            <a class="btn btn-outline-light" href="BookIdAutoGenController">Add Book <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <ul class="navbar-nav m1-auto">
                        <form class="form-inline my-2 my-lg-0" action="ViewBookController" method="get">
                            <input class="form-control mr-sm-2" name="txtSearchKey" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                        </form>
                        <li class="nav-item active">
                            <a class="btn btn-outline-light" href="ViewBookController">View All Book</a>
                        </li>
                    </ul>
                </div>
            </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col col-md-8 offset-2">
                    <% if (request.getAttribute("msg") == "Book deleted successfully") {%>
                     <div class="alert alert-success alert-dismissible fade show" role="alert">
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                         </button>
                         <strong>Success!</strong> <%= request.getAttribute("msg")%>
                     </div>
                     <%}%>
                </div>
            </div>
            <div class="container">
                <table id="bookTable" class="table table-responsive-lg " cellspacing="0" cellpadding="0" >
                    <thead class="table-dark">
                        <tr>
                            <th style="width: 8%" >Book ID</th>
                            <th >Title</th>
                            <th >Author</th>
                            <th>Main Classification</th>
                            <th>Sub Classification</th>
                            <th>Published Year</th>
                            <th>Printed Year</th>
                            <th>ISBN No</th>
                            <th style="width: 7%">No Of Pages</th>
                            <th style="width: 7%"> </th>
                        </tr>
                    </thead>
                    <tbody class="table table-hover">
                        <%  if (request.getAttribute("result") != null) {
                                List<Book> result = (List) request.getAttribute("result");
                                Book b = null;
                                for (int i = 0; i < result.size(); i++) {
                                    b = result.get(i);
                        %>
                        <tr>
                            <td style=" width: 5%;"><%=b.getId()%></td>
                            <td><%=b.getTitle()%></td>
                            <td><%=b.getAuthor()%></td>
                            <td><%=b.getMain()%></td>
                            <td><%=b.getSub()%></td>
                            <td><%=b.getPublishedYear()%></td>
                            <td><%=b.getPrintedYear()%></td>
                            <td><%=b.getIsbn()%></td>
                            <td style="width: 7%"><%=b.getPages()%></td>
                            <td style="width: 7%"> 
                                <div class="row">
                                <form action="PopulateUpdateBook" method="get">    
                                    <button name="txtSearchKey" id="updateBtn" class="btn btn-link new"  value="<%=b.getId()%>">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                </form>    
                                    <form action="DeleteBookController" method="get">
                                        <button name="deleteBook" type="submit" class="btn btn-link new"  value="<%=b.getId()%>" onclick="return confirm('Are you sure you want to delete?')">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%}}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script>
        $(function () {
            $('#bookTable').tablesorter();
        });
        $('.dropdown-menu a.dropdown-toggle').on('click', function (e) {
            if (!$(this).next().hasClass('show')) {
                $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            var $subMenu = $(this).next(".dropdown-menu");
            $subMenu.toggleClass('show');

            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
                $('.dropdown-submenu .show').removeClass("show");
            });
            return false;
        });
    </script>
</html>
