
<!--Test Oracle file for UBC CPSC304 2018 Winter Term 1
  Created by Jiemin Zhang
  Modified by Simona Radu
  Modified by Jessica Wong (2018-06-22)
  This file shows the very basics of how to execute PHP commands
  on Oracle.
  Specifically, it will drop a table, create a table, insert values
  update values, and then query for values
  IF YOU HAVE A TABLE CALLED "demoTable" IT WILL BE DESTROYED
  The script assumes you already have a server set up
  All OCI commands are commands to the Oracle libraries
  To get the file to work, you must place it somewhere where your
  Apache server can run it, and you must rename it to have a ".php"
  extension.  You must also change the username and password on the
  OCILogon below to be your ORACLE username and password -->

  <html>
    <head>
        <title>CPSC 304 PHP/Oracle Demonstration</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <style>
        /* NAVBAR */
body {
    /* padding: 0px; */
    margin:0px;
    
}

.title h1{
    font-family: Arial, Helvetica, sans-serif;
    padding-left: 40px;
    padding-top: 20px;
    padding-bottom: 20px;
    margin-top: 0px;
    margin-bottom: 0px;
    background-color: rgb(242, 242, 114);
    
}
.title h1 a{
    color: black;
    text-decoration: none;
}

 /* Navbar container */
 .navbar {
    overflow: hidden;
    background-color: #5b3cf8;
    font-family: Arial;
    
  }



  /* Links inside the navbar */
  .navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-decoration: none;

    display: block;
    text-align: center;
    
    text-decoration: none;
    font-family: Arial, Helvetica, sans-serif;

    padding-top: 20px;
    padding-bottom: 19px;
    width: 180px;

  }
  
  /* The dropdown container */
  .dropdown {
    float: left;
    overflow: hidden;
  }
  
  /* Dropdown button */
  .dropdown .dropbtn {
    font-size: 16px;
    border: none;
    outline: none;
    color: white;
    background-color: inherit;
    font-family: inherit; /* Important for vertical align on mobile phones */
    margin: 0; /* Important for vertical align on mobile phones */


    display: block;
    text-align: center;
    padding-top: 20px;
    padding-bottom: 20px;
    text-decoration: none;
    font-family: Arial, Helvetica, sans-serif;
    width: 180px;



  }
  
  .navbar a:hover, .dropdown:hover .dropbtn {
    background-color: #432fa8;
  }


  
  /* Dropdown content (hidden by default) */
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: rgb(126, 102, 244);
    
  }
  
  /* Links inside the dropdown */
  .dropdown-content a {
    width: 180px;
    float: none;
    color: black;
    text-align: center;
    text-decoration: none;
    
  }
  
  /* Add a grey background color to dropdown links on hover */
  .dropdown-content a:hover {
    background-color: #ff9090;
  }
  
  /* Show the dropdown menu on hover */
  .dropdown:hover .dropdown-content {
    display: block;
  } 


.searchBar{
    margin-top: 17px;
    margin-left: 16px;
    border: none;
    width: 40%;
    font-size: 20px; 
} 



.submenu {
  display:none;
  list-style: none;
  padding-left: 0px;
  position: absolute;
  left: 180px;
  top: -16px;
  background: #fac0c0;

}



  /* Show the dropdown submenu on hover */
.has-submenu:hover .submenu{
  display: block;
} 


/*-----------------------------------------------------------------------*/

.navbar h2 {
    float: left;
    /* display: block; */
    text-align: center;
    width: 180px;
    margin-top: 0;
    margin-bottom: 0;
  }

  .navbar h2:hover, .dropdown:hover .dropbtn {
    background-color: #432fa8;
  }


  .navbar h2 form input{
    font-size: 16px;
    color: white;
    font-family: Arial, Helvetica, sans-serif;
    text-align:justify;

    border: transparent;
    background-color: transparent;
    padding-left: 52px;
    padding-right: 52px;

    padding-bottom: 20px;
    padding-top: 20px;
    
    margin-bottom: -25px;
  }


  .dropdown button{
    padding-bottom: 0px;
  }



  .has-submenu h3 {
    font-size: 16px;
    color: white;
    font-family: Arial, Helvetica, sans-serif;
    text-align:justify;
    padding-left: 52px;
    padding-right: 59px;

    padding-bottom: 19px;
    padding-top: 20px;

    margin-bottom: 0;
    margin-top: 0;


  }

  .has-submenu h3:hover{
    background-color: #5b3cf8;
  }
    </style>
       
    <body>
    <div class="bavbarMain">
        <div class="title">
            <h1> <a href="">CPSC 304 SPORTS DATABASE</a> </h1>
        </div>

        <div class="navbar">
            <h2 href="#PLAYERS">
                <form method="GET" action="oracle-test.php">
                    <input type="hidden" id="getAllPlayersRequest" name="getAllPlayersRequest">
                    <input type="submit" name="getAllPlayers" value="PLAYERS" >
                </form>
            </h2>


            <h2 href="#TEAMS">
                <form method="GET" action="oracle-test.php">
                    <input type="hidden" id="getTeamsRequest" name="getTeamsRequest">
                    <input type="submit" name="getTeams" value="TEAMS" >
                </form>
            </h2>


            <div class="dropdown">
              <button class="dropbtn" >LEAGUES 🞃
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">


                <div class="has-submenu">
                <h3 href="#">NBA</h3>
                  <ul class='submenu'>  
                    
                    <h2 href="#Season 1.1">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="getTeamInfoRequest" name="getTeamInfoRequest">
                        <input type="submit" name="getTeamInfo" value="2023" >
                    </form>
                    </h2>

                    <h2 href="#Season 1.2">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="2022" >
                    </form>
                    </h2>


                    <h2 href="#Season 1.3">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="2021" >
                    </form>
                    </h2>


                  </ul>
                </div>
                
                <div class="has-submenu">
                  <h3 href="#">WNBA</h3>
                  <ul class='submenu'>
                  <h2 href="#Season 2.1">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="2023" >
                    </form>
                    </h2>

                    <h2 href="#Season 2.2">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="2022" >
                    </form>
                    </h2>


                    <h2 href="#Season 2.3">
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="2021" >
                    </form>
                    </h2>  

                  </ul>
                </div>

                <div class="has-submenu">
                <h3 href="#">League 3</h3>
                  <ul class='submenu'>

                    <h2 >
                        <form method="GET" action="oracle-test.php">
                            <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                            <input type="submit" name="countTuples" value="Season 3.1" >
                        </form>
                    </h2>

                    <h2 >
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="Season 3.2" >
                    </form>
                    </h2>


                    <h2 >
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="Season 3.3" >
                    </form>
                    </h2>  
                    
                  </ul>
                </div>

              </div>

            </div>

            <div class="dropdown">
              <button class="dropbtn">NEWS 🞃
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                
                    <h2>
                        <form method="GET" action="oracle-test.php">
                            <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                            <input type="submit" name="countTuples" value="Publisher 1" >
                        </form>
                    </h2>

                    <h2 >
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="Publisher 2" >
                    </form>
                    </h2>


                    <h2>
                    <form method="GET" action="oracle-test.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="Publisher 3" >
                    </form>
                    </h2>  
              </div>
            </div>
            <input class="searchBar" type="text" placeholder="Search..">
          </div> 
    </div>
    <!-- <div class="content">  </div> -->

        <?php
		//this tells the system that it's no longer just parsing html; it's now parsing PHP

        $success = True; //keep track of errors so it redirects the page only if there are no errors
        $db_conn = NULL; // edit the login credentials in connectToDB()
        $show_debug_alert_messages = False; // set to True if you want alerts to show you which methods are being triggered (see how it is used in debugAlertMessage())

        function debugAlertMessage($message) {
            global $show_debug_alert_messages;

            if ($show_debug_alert_messages) {
                echo "<script type='text/javascript'>alert('" . $message . "');</script>";
            }
        }

        function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
            //echo "<br>running ".$cmdstr."<br>";
            global $db_conn, $success;

            $statement = OCIParse($db_conn, $cmdstr);
            //There are a set of comments at the end of the file that describe some of the OCI specific functions and how they work

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
                echo htmlentities($e['message']);
                $success = False;
            }

            $r = OCIExecute($statement, OCI_DEFAULT);
            if (!$r) {
                echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
                echo htmlentities($e['message']);
                $success = False;
            }

			return $statement;
		}

        function executeBoundSQL($cmdstr, $list) {
            /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
		In this case you don't need to create the statement several times. Bound variables cause a statement to only be
		parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection.
		See the sample code below for how this function is used */

			global $db_conn, $success;
			$statement = OCIParse($db_conn, $cmdstr);

            if (!$statement) {
                echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
                $e = OCI_Error($db_conn);
                echo htmlentities($e['message']);
                $success = False;
            }

            foreach ($list as $tuple) {
                foreach ($tuple as $bind => $val) {
                    //echo $val;
                    //echo "<br>".$bind."<br>";
                    OCIBindByName($statement, $bind, $val);
                    unset ($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
				}

                $r = OCIExecute($statement, OCI_DEFAULT);
                if (!$r) {
                    echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
                    $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
                    echo htmlentities($e['message']);
                    echo "<br>";
                    $success = False;
                }
            }
        }

        function printResult($result) { //prints results from a select statement
            echo "<br>Retrieved data from table demoTable:<br>";
            echo "<table>";
            echo "<tr><th>ID</th><th>Name</th></tr>";

            while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
                echo "<tr><td>" . $row["ID"] . "</td><td>" . $row["NAME"] . "</td></tr>"; //or just use "echo $row[0]"
            }

            echo "</table>";
        }

        function connectToDB() {
            global $db_conn;

            // Your username is ora_(CWL_ID) and the password is a(student number). For example,
			// ora_platypus is the username and a12345678 is the password.
             $db_conn = OCILogon("ora_nimamot", "a66492497",  "dbhost.students.cs.ubc.ca:1522/stu");

            // $db_conn = OCILogon("ora_farouks", "a53860227",  "dbhost.students.cs.ubc.ca:1522/stu");

            if ($db_conn) {
                
                debugAlertMessage("Database is Connected");
                
                return true;
            } else {
                debugAlertMessage("Cannot connect to Database");
                $e = OCI_Error(); // For OCILogon errors pass no handle
                echo htmlentities($e['message']);
                return false;
            }
        }

        function disconnectFromDB() {
            global $db_conn;

            debugAlertMessage("Disconnect from Database");
            OCILogoff($db_conn);
        }




        function handleCountRequest() {
            global $db_conn;

            $result = executePlainSQL("SELECT Count(*) FROM Leagues");
            // echo $result;
            if (($row = oci_fetch_row($result)) != false) {
                echo "<br> The number of tuples in Leagues: " . $row[0] . "<br>";
            }
        }



        // HANDLE ALL GET ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
        function handleGETRequest() {
            if (connectToDB()) {
                
                if (array_key_exists('countTuples', $_GET)) {
                    handleCountRequest();

                } else if (array_key_exists('printTable', $_GET)){
                    handlePrintTableRequest();

                }else if (array_key_exists('getTeams', $_GET)){
                    handleGetTeamsRequest();

                }else if (array_key_exists('getTeamPlayers', $_GET)){

                    handleGetTeamPlayersRequest($_GET['getTeamPlayers']);

                }else if (array_key_exists('getTeamInfo', $_GET)){
                    handleGetTeamInfoRequest($_GET['getTeamInfo']);

                }else if (array_key_exists('getTeamStats', $_GET)){
                    handleGetTeamStatsRequest($_GET['getTeamStats']);

                }else if (array_key_exists('getPlayerStats', $_GET)){
                    handleGetPlayerStatsRequest($_GET['getPlayerStats']);

                }else if (array_key_exists('getAllPlayers', $_GET)){
                    handleGetAllPlayersRequest();

                }
                
                disconnectFromDB();
            }
        }



        

		if (isset($_POST['reset']) || isset($_POST['updateSubmit']) || isset($_POST['insertSubmit'])) {
            handlePOSTRequest();
        } else if ( isset($_GET['countTupleRequest'])       || 
                    isset($_GET['printTableRequest'])       ||
                    isset($_GET['getTeamsRequest'])         ||
                    isset($_GET['getTeamPlayersRequest'])   ||
                    isset($_GET['getTeamInfoRequest'])      ||
                    isset($_GET['getTeamStatsRequest'])     ||
                    isset($_GET['getPlayerStatsRequest'])   ||
                    isset($_GET['getAllPlayersRequest']) ){
                        
            handleGETRequest();

        } 

        //--------------------------------------------------------------------------------------------

        function handlePrintTableRequest() {
            global $db_conn;


            $result = executePlainSQL("SELECT * FROM demoTable");
            echo($result);

            if (($row = oci_fetch_row($result)) != false) {
                
                echo "<br> The demoTable: " . $row[0] . "<br>";
                echo "<br> The demoTable: " . $row[1] . "<br>";
                echo "<br> The demoTable: " . $row[2] . "<br>";
            }
        }

        function handleGetTeamsRequest(){
            global $db_conn;

            $team_object_a_style = 'text-decoration : none; color: black; margin-top: 40px; margin-left: 10px; font-size: 20px;';
            $team_object_style = 'display:flex; border-style: solid; margin-right:70px; padding-top:10px; padding-bottom:10px; padding-left:10px;';
            $team_object_list_style = 'display: grid; row-gap: 50px; column-gap: 5px; grid-template-columns: auto auto auto auto; margin-left: 50px; margin-top:20px;';

            $result = executePlainSQL("SELECT * FROM teams");
            echo "<div class='team_object_list' style='" . $team_object_list_style . "'>";
            while(true){
                if (($row = oci_fetch_array($result)) != false) {
                   
                    $team_name_underscore = $row[0];
                    $team_name_underscore = preg_replace('/\s+/', '_', $team_name_underscore);

                    echo "<div class='team_object' style='" . $team_object_style . "' >  <img src='". $row[3] ."' width='90'> 
                     <a href=oracle-test.php?getTeamInfoRequest=&getTeamInfo=" . $team_name_underscore."
                     style='" . $team_object_a_style  ."' >" . $row[0] . '</a></div>';
                    
                }  else break;  
            }
            echo '</div>';
                
        }


        function handleGetTeamPlayersRequest($teamName){
            global $db_conn;
            
            $temp = str_replace('_', ' ', $teamName);
            $result = executePlainSQL("SELECT * FROM players WHERE TeamName='$temp'"); // 

            // $player_style
            $player_list_style = 'list-style-type: none; border-style: solid; padding-right:15px; padding-bottom: 15px; max-width:180px;';

            echo "<div style='display: grid; grid-template-columns: auto auto auto auto auto; margin-left: 50px; column-gap: 5px;' >";
            while(true){
                if (($row = oci_fetch_array($result)) != false){
                    $picture = executePlainSQL("SELECT picture FROM sportPeople WHERE name_='$row[1]'");

                    echo "<div class='player' style='display:flex;'> <ul style='" . $player_list_style ."'>";

                    if (($pictureURL = oci_fetch_array($picture)) != false) 
                        echo  "<img src='". $pictureURL[0] ."'width='120'>";

                    echo "<li> Name: " . $row[1] ."</li>";
                    echo "<li> Nationality: " . $row[0] ."</li>";
                    echo "<li> Birthday: " . $row[2] ."</li>";
                    echo "<li> Position: " . $row[4] ."</li>";
                    echo "<p style='font-size: 25px; margin: 0px; ' > No. " . $row[5] . "</p>";

                    $temp_playername = preg_replace('/\s+/', '_', $row[1]);
                    $key  = $temp_playername . "-" . $teamName;

                    echo "<a href=oracle-test.php?getPlayerStatsRequest=&getPlayerStats=". $key ." style='font-size: 15px; margin: 0px; ' > MORE INFO </a>";
                    echo "</ul>";
                    echo "</div>";
                }else break;
            }
            echo "</div>";

            
        }


        function handleGetTeamInfoRequest($teamName){
            global $db_conn;
            $temp = str_replace('_', ' ', $teamName);

            $result = executePlainSQL("SELECT * FROM Teams WHERE TeamName='$temp'"); 

            if (($row = oci_fetch_array($result)) != false){
                echo "<h1 style='margin-left:50px; margin-top:50px; font-family: arial;'> " . $row[0] . " </h1>";
                echo "<div style='display:flex;'>";

                echo "<img src=" . $row[3] . " width=200px  style='margin: 50px;'>";
                echo "<h2 style='margin-left:50px; margin-top:50px; font-family: arial;'> Location: " . $row[1] . " </h2>";

                echo "<a href=oracle-test.php?getLeagueRequest=&getLeague=". $row[2] . " 
                style='font-size:25px; text-decoration:none; margin: 50px;'>  League: " .  $row[2] ." </a>";
                
                echo "<a href=oracle-test.php?getTeamPlayersRequest=&getTeamPlayers=". $teamName . " 
                style='font-size:25px; text-decoration:none; margin: 50px;'>  PLAYERS </a>";

                echo "<h2 style='margin-left:50px; margin-top:50px; font-family: arial;'> Official Sponsor: IDK</h2>";


                echo "</div>";
            }
                

            // echo "<a href=oracle-test.php?getTeamStatsRequest=&getTeamStats=" . $teamName ." >  STATISTICS </a>";
            handleGetTeamStatsRequest($teamName);


       
        }


        function handleGetTeamStatsRequest($teamName){
            global $db_conn;
            $temp = str_replace('_', ' ', $teamName);
            $result = executePlainSQL("SELECT * FROM teamStats WHERE TeamName='$temp'"); 
            
            echo "<table style='margin: 0px 0px 0px 50px; border:1px solid black; font-size:20px;'>";
            echo "<tr style='padding-right=20px;'> 
                    <th style='border:1px solid black; padding:5px;'> Year </th>
                    <th style='border:1px solid black; padding:5px;'> Games Tied </th>
                    <th style='border:1px solid black; padding:5px;'> Games Won </th>
                    <th style='border:1px solid black; padding:5px;'> Games Lost </th>
                    <th style='border:1px solid black; padding:5px;'> Average Scored </th>
                    <th style='border:1px solid black; padding:5px;'> Average Conceded </th>
                    <th style='border:1px solid black; padding:5px;'> Table Standing </th>
                    
                    </tr>";

            for($i = 0; $i < 3; $i++){
                if (($row = oci_fetch_array($result)) != false){
                    echo "<tr style='padding-right=20px; '>" ;
                    echo "<td style='text-align: center; border:1px solid black; padding:5px;'> " . $row[6] ." </td>";
                    for($t = 0; $t < 6; $t++)
                        echo "<td style='text-align: center; border:1px solid black; padding:5px;'> " . $row[$t] ." </td>";
                    echo  "</tr>";

                    
                }
            }
            echo "</table>";

               
        }

        function handleGetPlayerStatsRequest($player){
            global $db_conn;


            // echo $player;
            $names = explode("-", $player); 
            // echo $names[1];
            
            $playerName = str_replace('_', ' ', $names[0]);
            $teamName = str_replace('_', ' ', $names[1]);


            //----------------------------------

            $result = executePlainSQL("SELECT * FROM players WHERE name_='$playerName'");

                if (($row = oci_fetch_array($result)) != false){
                    $picture = executePlainSQL("SELECT picture FROM sportPeople WHERE name_='$playerName'");

                    echo "<div class='player' style='display:flex;'> <ul>";

                    if (($pictureURL = oci_fetch_array($picture)) != false) 
                        echo  "<img src='". $pictureURL[0] ."'>";

                    echo "<li> Name: " . $row[1] ."</li>";
                    echo "<li> Nationality: " . $row[0] ."</li>";
                    echo "<li> Birthday: " . $row[2] ."</li>";
                    echo "<li> Position: " . $row[4] ."</li>";
                    echo "<li> Team: " . $row[3] ."</li>";
                    echo "<p style='font-size: 25px; margin: 0px; ' > No. " . $row[5] . "</p>";

                    echo "</ul>";
                    echo "</div>";
                }


            //-----------------------------------


   
            
            
            $result = executePlainSQL("SELECT * FROM playersStats WHERE TeamName='$teamName' AND name_='$playerName'");


            echo "<table style='margin: 0px 0px 0px 50px; border:1px solid black; font-size:20px;'>";
            echo "<tr style='padding-right=20px;'> 
                    <th style='border:1px solid black; padding:5px;'> Year </th>
                    <th style='border:1px solid black; padding:5px;'> Wins </th>
                    <th style='border:1px solid black; padding:5px;'> Losses </th>
                    <th style='border:1px solid black; padding:5px;'> Average Rating </th>
                    <th style='border:1px solid black; padding:5px;'> Appearances </th>
                    
                    </tr>";


            for($i = 0; $i < 3; $i++){
                if (($row = oci_fetch_array($result)) != false){
                    echo "<tr style='padding-right=20px; '>" ;
                    echo "<td style='text-align: center; border:1px solid black; padding:5px;'> " . $row[2] ." </td>";
                    for($t = 0; $t < 5; $t++)
                        if($t != 2)
                        echo "<td style='text-align: center; border:1px solid black; padding:5px;'> " . $row[$t] ." </td>";
                    echo  "</tr>";

                    
                }
            }

            echo "</table>";
            
        }


        function handleGetAllPlayersRequest(){
            global $db_conn;
            $result = executePlainSQL("SELECT * FROM players ORDER BY players.name_");

            echo "<div style='margin-left:50px;'>";
            while(true){
                if (($row = oci_fetch_array($result)) != false){    
                    $playername = preg_replace('/\s+/', '_', $row[1]);
                    $teamName = preg_replace('/\s+/', '_', $row[3]);
                    $key  = $playername . "-" . $teamName;
                    // echo $key;

                    echo "<h3> <a href=oracle-test.php?getPlayerStatsRequest=&getPlayerStats=". $key .">" . $row[1]. "</a> </h3>";

                }else break;
            }
            echo "</div>";

        }

		?>
	</body>
</html>
