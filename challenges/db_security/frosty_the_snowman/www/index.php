<?php
//function to check if sqlitraining database is created or not.
ob_start();
session_start();
include("db_config.php");
ini_set('display_errors', 1);
?>
<!DOCTYPE html>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SQL Injection</title>

    <link href="./css/htmlstyles.css" rel="stylesheet">
        </head>

  <body>

    <div class="container-narrow">
        <div class="jumbotron">
                        <h1 style="color:#189AB4">Challenge Server</h1>
                        <h3 class="color:black">Ready for some fun CTFs?</h3>
        </div>
                <br />
    <div class="row marketing">
        <div style="padding: 10px">
          <b>Grinch has hidden the flag in one of the below applications. Can you find it?</b><br />
        </div>
        <div style="padding: 10px">
        <ul>
        <li>You can use the following users or register your own to login. bob:password, voldemort:horcrux</li>
        <li>The database needs to be setup before beginning.<a href="resetdb.php">Reset database</a>.</li>
        <li>The application is meant to be a deliberately insecure to enable SQL Injection attacks.</b></li>
        </ul>
        </div>
    </div>
      <div class="row marketing">
        <div class="col-lg-6">

    <div style="padding: 10px">
        <p><a href="register.php" style="color:#B31D14">Application 1</a> : This page can be used to create users that will be used throughout the application.</p>

        <p><a href="login1.php" style="color:#B31D14">Application 2</a> : This page contains the most simplistic form of SQL injection flaw. Verbose errors, can be used to enumerate columns and bypass user authentication altogether</p>

        <p><a href="login2.php" style="color:#B31D14">Application 3</a> : This page contains the most simplistic form of SQL injection flaw. Verbose errors, can be used to enumerate columns and bypass user authentication altogether. Backend query uses brackets to enclose variables. Very common on the Internet.</p>
                  
        <p><a href="searchproducts.php" style="color:#B31D14">Application 4</a> : Page contains code that fetches multiple entries from the DB</p>

        <p><a href="secondorder_register.php" style="color:#B31D14">Application 5</a> : Page allows user registration even with quotes. Quotes are nullified by appending a second quote to make them literals. Data is stored to backend tables without being verified if data was clean or not.</p>
                                  
        <p><a href="secondorder_changepass.php" style="color:#B31D14">Application 6</a> : Retrieves the username from the database as is and uses it to construct a new query</p>
                  
        <p><a href="blindsqli.php?user=<?php echo $_SESSION['username'];?>"  style="color:#B31D14">Application 7</a> : Page is vulnerable to blind sql injection using both changes in content as well as response times. Data can be extracted using true and false statements.</p>
                  
        </div>
      </div>

</div>

    </div> <!-- /container -->

  

</body></html>
