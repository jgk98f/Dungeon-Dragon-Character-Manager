<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <div class="left" style="padding-right: 150px;"/>
        <div class="right" style="padding-left: 150px;"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>D&D Manager</title>
    <h3 style="padding-top: 100px;">Welcome to the D&D Manager, where your adventures come to life!</h3>
    </head>
    <br/>
    <body class="center">
        
        <div class="center">
            <form class="form-group" action="http://hoare.cs.umsl.edu/servlet/j-klamert/Login" method="POST">
                <fieldset>
                    <legend>Account Information</legend>
                    <div class="form-group">
                        <label for="InputEmail">Email address:</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email"/>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">Password:</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-primary:hover btn-primary:focus">
                    Submit
                    </button>
                    <a href="http://hoare.cs.umsl.edu/servlet/j-klamert/success.jsp" class="btn btn-warning btn-warning:hover btn-warning:focus" type="button">Register Here</a>
                </fieldset>
            </form>
            
        </div>
        <a href="http://hoare.cs.umsl.edu/servlet/j-klamert/redirect.jsp"><u>Source Information</u></a>
        <div><b style="font-size: 11px;">This website is not affiliated, endorsed, or sponsored by Wizards of the Coast® or Hasbro®. Dungeons & Dragons®, and D&D® are registered trademarks of Wizards of the Coast®. Contact the Web Master at: jgk98f@umsl.edu</b></div>
    </body> 
</html>