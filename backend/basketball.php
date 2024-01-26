
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
         <style>
        /* NAVBAR */
body {
  /* padding: 0px; */
  margin: 0px;

}




.title h1 {
  font-family: Arial, Helvetica, sans-serif;
  padding-left: 40px;
  padding-top: 20px;
  padding-bottom: 20px;
  margin-top: 0px;
  margin-bottom: 0px;
  background-color: rgb(242, 242, 114);

}

.title h1 a {
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
  font-family: inherit;
  /* Important for vertical align on mobile phones */
  margin: 0;
  /* Important for vertical align on mobile phones */


  display: block;
  text-align: center;
  padding-top: 20px;
  padding-bottom: 20px;
  text-decoration: none;
  font-family: Arial, Helvetica, sans-serif;
  width: 180px;



}

.navbar a:hover,
.dropdown:hover .dropbtn {
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


.searchBar {
  margin-top: 17px;
  margin-left: 16px;
  border: none;
  width: 40%;
  font-size: 20px;
}



.submenu {
  display: none;
  list-style: none;
  padding-left: 0px;
  position: absolute;
  left: 180px;
  top: -16px;
  background: #fac0c0;

}



/* Show the dropdown submenu on hover */
.has-submenu:hover .submenu {
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

.navbar h2:hover,
.dropdown:hover .dropbtn {
  background-color: #432fa8;
}


.navbar h2 form input {
  font-size: 16px;
  color: white;
  font-family: Arial, Helvetica, sans-serif;
  text-align: justify;

  border: transparent;
  background-color: transparent;
  padding-left: 52px;
  padding-right: 52px;

  padding-bottom: 20px;
  padding-top: 20px;

  margin-bottom: -25px;
}


.dropdown button {
  padding-bottom: 0px;
}



.has-submenu h3 {
  font-size: 16px;
  color: white;
  font-family: Arial, Helvetica, sans-serif;
  text-align: justify;
  padding-left: 52px;
  padding-right: 59px;

  padding-bottom: 19px;
  padding-top: 20px;

  margin-bottom: 0;
  margin-top: 0;


}

.has-submenu h3:hover {
  background-color: #5b3cf8;
}

/*-----------------------------------------------------------*/
    </style>
    </head>

    <body>
    <div class="bavbarMain">
        <div class="title">
            <h1> <a href="hello.php">CPSC 304 SPORTS DATABASE : Basketball</a> </h1>
            
        </div>

        <div class="navbar">
            <h2 href="#PLAYERS">
                <form method="GET" action="basketball.php">
                    <input type="hidden" id="getAllPlayersRequest" name="getAllPlayersRequest">
                    <input type="submit" name="getAllPlayers" value="PLAYERS" >
                    <input type="hidden" name="groupBy" value="alphabetical" >
                    <input type="hidden" name="sportName" value="Basketball" >
                </form>
            </h2>


            <h2 href="#TEAMS">
                <form method="GET" action="basketball.php">
                    <input type="hidden" id="getTeamsRequest" name="getTeamsRequest">
                    <input type="submit" name="getTeams" value="TEAMS" >
                    <input type="hidden" name="sportName" value="Basketball" >
                    <input type="hidden" name="leagues" value="all" >
                </form>
            </h2>


            <div class="dropdown">
              <button class="dropbtn" >LEAGUES 🞃
                <i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">


                <div class="has-submenu" style='width: 180px;'>
                <h3 href="#">NBA</h3>
                  <ul class='submenu'>  
                    
                    <h2 href="#Season 1.1">
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2023" >
                        <input type="hidden" name="leagueName" value="NBA" >
                    </form>
                    </h2>

                    <h2 href="#Season 1.2">
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2022" >
                        <input type="hidden" name="leagueName" value="NBA" >
                    </form>
                    </h2>


                    <h2 href="#Season 1.3">
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2021" >
                        <input type="hidden" name="leagueName" value="NBA" >
                    </form>
                    </h2>


                  </ul>
                </div>
                
                <div class="has-submenu">
                  <h3 href="#">WNBA</h3>
                  <ul class='submenu'>
                  <h2 href="#Season 2.1">
                    <form method="GET" action="basketball.php">
                    <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2023" >
                        <input type="hidden" name="leagueName" value="WNBA" >
                    </form>
                    </h2>

                    <h2 href="#Season 2.2">
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2022" >
                        <input type="hidden" name="leagueName" value="WNBA" >
                    </form>
                    </h2>


                    <h2 href="#Season 2.3">
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="getLeagueRequest" name="getLeagueRequest">
                        <input type="submit" name="getLeague" value="2021" >
                        <input type="hidden" name="leagueName" value="WNBA" >
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
                        <form method="GET" action="basketball.php">
                            <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                            <input type="submit" name="countTuples" value="Publisher 1" >
                        </form>
                    </h2>

                    <h2 >
                    <form method="GET" action="basketball.php">
                        <input type="hidden" id="countTupleRequest" name="countTupleRequest">
                        <input type="submit" name="countTuples" value="Publisher 2" >
                    </form>
                    </h2>


                    <h2>
                    <form method="GET" action="basketball.php">
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

        $sport = "Basketball";

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
            //$db_conn = OCILogon("ora_farouks", "a53860227",  "dbhost.students.cs.ubc.ca:1522/stu");

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

        // HANDLE ALL POST ROUTES
	// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
	function handlePOSTRequest()
	{
		if (connectToDB()) {
			if (array_key_exists('resetTablesRequest', $_POST)) {
				handleResetRequest();
			} else if (array_key_exists('updateQueryRequest', $_POST)) {
				handleUpdateRequest();
			} else if (array_key_exists('insertQueryRequest', $_POST)) {
				handleInsertRequest();
			}else if (array_key_exists('postTeamStatsRequest', $_POST)) {
				handlePostTeamStatsRequest();
			}else if (array_key_exists('deleteButton', $_POST)){
                handleDelete();

            }

            
			disconnectFromDB();
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
                    handleGetTeamsRequest($_GET['leagues']);

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

                }else if (array_key_exists('getLeagueRequest', $_GET)){
                    handlGetLeagueRequest($_GET['getLeague'], $_GET['leagueName']);

                }else if (array_key_exists('getCoachRequest', $_GET)){
                    handleGetCoachRequest($_GET['getCoach']);

                }else if (array_key_exists('getLeagueInfoRequest', $_GET)){
                    handleGetLeagueInfoRequest($_GET['leagueName']);
                }

                
                disconnectFromDB();
            }
        }



        

		if (isset($_POST['reset']) || isset($_POST['updateSubmit']) || isset($_POST['insertSubmit']) ||
            isset($_POST['postTeamStats']) || isset($_POST['deleteButton'])) {
                
            handlePOSTRequest();

        } else if ( isset($_GET['countTupleRequest'])       || 
                    isset($_GET['printTableRequest'])       ||
                    isset($_GET['getTeamsRequest'])         ||
                    isset($_GET['getTeamPlayersRequest'])   ||
                    isset($_GET['getTeamInfoRequest'])      ||
                    isset($_GET['getTeamStatsRequest'])     ||
                    isset($_GET['getPlayerStatsRequest'])   ||
                    isset($_GET['getAllPlayersRequest'])    ||
                    isset($_GET['getLeagueRequest'])        ||
                    isset($_GET['getCoachRequest'])         ||
                    isset($_GET['getLeagueInfoRequest'])){

                        
                        
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

        function handleGetTeamsRequest($leagues){
            global $db_conn;
            

            $team_object_a_style = 'text-decoration : none; color: black; margin-top: 40px; margin-left: 10px; font-size: 20px;';
            $team_object_style = 'display:flex; border-style: solid; margin-right:70px; padding-top:10px; padding-bottom:10px; padding-left:10px;';
            $team_object_list_style = 'display: grid; row-gap: 50px; column-gap: 5px; grid-template-columns: auto auto auto auto; margin-left: 50px; margin-top:20px;';

            if($leagues == 'all')
                $result = executePlainSQL("SELECT * FROM Teams WHERE Teams.leaguename='NBA' OR Teams.leaguename='WNBA' ");
            else
                $result = executePlainSQL("SELECT * FROM Teams WHERE Teams.leaguename='$leagues' ");
            
                echo "<div class='team_object_list' style='" . $team_object_list_style . "'>";
            while(true){
                if (($row = oci_fetch_array($result)) != false) {
                   
                    $team_name_underscore = $row[0];
                    $team_name_underscore = preg_replace('/\s+/', '_', $team_name_underscore);

                    echo "<div class='team_object' style='" . $team_object_style . "' >  <img src='". $row[3] ."' width='90'> 
                     <a href=basketball.php?getTeamInfoRequest=&getTeamInfo=" . $team_name_underscore."
                     style='" . $team_object_a_style  ."' >" . $row[0] . '</a></div>';
                    
                }  else break;  
            }
            echo '</div>';
                
        }


        function handleGetTeamPlayersRequest($teamName){
            global $db_conn;
            
            $temp = str_replace('_', ' ', $teamName);
            $result = executePlainSQL("SELECT * FROM players WHERE TeamName='$temp' "); // 
            
            // $player_style
            $player_list_style = 'list-style-type: none; border-style: solid; padding-right:15px; padding-bottom: 15px; max-width:180px;';

            echo "<div style='display: grid; grid-template-columns: auto auto auto auto auto; margin-left: 50px; column-gap: 5px;' >";
            while(true){
                if (($row = oci_fetch_array($result)) != false){
                    $picture = executePlainSQL("SELECT picture FROM sportPeople WHERE name_='$row[1]'");

                    echo "<div class='player' style='display:flex;'> <ul style='" . $player_list_style ."'>";

                    if (($pictureURL = oci_fetch_array($picture)) != false) 
                        echo  "<img src='". $pictureURL[0] ."'>";

                    echo "<li> Name: " . $row[1] ."</li>";
                    echo "<li> Nationality: " . $row[0] ."</li>";
                    echo "<li> Birthday: " . $row[2] ."</li>";
                    echo "<li> Position: " . $row[4] ."</li>";
                    echo "<p style='font-size: 25px; margin: 0px; ' > No. " . $row[5] . "</p>";

                    $temp_playername = preg_replace('/\s+/', '_', $row[1]);
                    $key  = $temp_playername . "-" . $teamName;

                    echo "<a href=basketball.php?getPlayerStatsRequest=&getPlayerStats=". $key ." style='font-size: 15px; margin: 0px; ' > MORE INFO </a>";
                    echo "</ul>";
                    echo "</div>";
                }else break;
            }
            echo "</div>";

            
        }


        function handleGetTeamInfoRequest($teamName){
            global $db_conn;
            $temp = str_replace('_', ' ', $teamName);
            
            $result = executePlainSQL("SELECT * FROM Teams WHERE TeamName='$temp' "); 
            

            if (($row = oci_fetch_array($result)) != false){
                echo "<h1 style='margin-left:50px; margin-top:50px; font-family: arial;'> " . $row[0] . " </h1>";
                echo "<div style='display:flex;'>";

                echo "<img src=" . $row[3] . " width=200px  style='margin: 50px;'>";
                echo "<h2 style='margin-left:50px; margin-top:50px; font-family: arial;'> Location: " . $row[1] . " </h2>";

                echo "<a href=basketball.php?getLeagueInfoRequest=&leagueName=". $row[2] . " 
                style='font-size:25px; text-decoration:none; margin: 50px;'>  League: " .  $row[2] ." </a>";
                
                echo "<a href=basketball.php?getTeamPlayersRequest=&getTeamPlayers=". $teamName . " 
                style='font-size:25px; text-decoration:none; margin: 50px;'>  PLAYERS </a>";

                echo "<a href=basketball.php?getCoachRequest=&getCoach=". $teamName . " 
                style='font-size:25px; text-decoration:none; margin: 50px;'>  Coach </a>";

                echo "<h2 style='margin-left:50px; margin-top:50px; font-family: arial;'> Official Sponsor: IDK</h2>";


                echo "</div>";
            }
                

            // echo "<a href=basketball.php?getTeamStatsRequest=&getTeamStats=" . $teamName ." >  STATISTICS </a>";
            handleGetTeamStatsRequest($teamName);


       
        }


        function handleGetTeamStatsRequest($teamName){
            global $db_conn;
            $temp = str_replace('_', ' ', $teamName);
            $result = executePlainSQL("SELECT * FROM teamStats WHERE TeamName='$temp'"); 
            $count = executePlainSQL("SELECT count(*) FROM teamStats WHERE TeamName='$temp'"); 
    
            
            echo "<table style='margin: 0px 0px 0px 50px; border:1px solid black; font-size:20px;'>";
            echo "<tr style='padding-right=20px;'> 
                    <th style='border:1px solid black; padding:5px;'>  Year </th>
                    <th style='border:1px solid black; padding:5px;'> Games Tied </th>
                    <th style='border:1px solid black; padding:5px;'> Games Won </th>
                    <th style='border:1px solid black; padding:5px;'> Games Lost </th>
                    <th style='border:1px solid black; padding:5px;'> Average Scored </th>
                    <th style='border:1px solid black; padding:5px;'> Average Conceded </th>
                    <th style='border:1px solid black; padding:5px;'> Table Standing </th>
                    
                </tr>";

            if(($c = oci_fetch_array($count)) != false){
                for($i = 0; $i < $c[0]; $i++){
                    if (($row = oci_fetch_array($result)) != false ) {
                        echo "<tr style='padding-right=20px; '> " ;
                        echo " <td style='text-align: center; border:1px solid black; padding:5px;'> " 
                        . $row[6] ." 
                            <form method='post'> 
                            <input type='submit' name='deleteButton'
                                    class='testbtn' value='Remove' /> 
                                    <input type='hidden' name='year' value='".$row[6] ."' >
                                    <input type='hidden' name='teamname' value='".$teamName ."' >
                            </form> 
                        </td>";
                        for($t = 0; $t < 6; $t++)
                            echo " <td style='text-align: center; border:1px solid black; padding:5px;'>  " . $row[$t] ." </td>";
                        echo  "</tr>";

                        
                    }
                }
            }
            echo "</table>";


            echo "<form method='POST' action='basketball.php' style='margin-top:50px; margin-left:50px;'>
            <h3>Insert or Update Stats </h3>
            <input type='hidden' id='postTeamStats' name='postTeamStatsRequest'>
            
            Year: <input type='text' name='Year'> <br /><br />
		    Games Tied: <input type='text' name='Games_Tied'> <br /><br />
            Games Won: <input type='text' name='Games_Won'> <br /><br />
		    Games Lost: <input type='text' name='Games_Lost'> <br /><br />
            Average Scored: <input type='text' name='Average_Scored'> <br /><br />
            Average Conceded: <input type='text' name='Average_Conceded'> <br /><br />
            Table Standing: <input type='text' name='Table_Standing'> <br /><br />
            <input type='submit' name='postTeamStats' value='Enter' ><br />
            <input type='hidden' name='teamname' value='".$teamName."' >
            </form>";



               
        }

        function handleGetPlayerStatsRequest($player){
            global $db_conn;


            // echo $player;
            $names = explode("-", $player); 
            // echo $names[1];
            
            $playerName = str_replace('_', ' ', $names[0]);
            $teamName = str_replace('_', ' ', $names[1]);


            //----------------------------------

            $result = executePlainSQL("SELECT * FROM players WHERE name_='$playerName' ");

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
            //players
            
            echo "<form method='GET' action='basketball.php' style='margin-left:50px; margin-top:30px;'>
                    <h3> SORT BY </h3>
                    <input type='hidden' id='getAllPlayersRequest' name='getAllPlayersRequest'>
                    <input type='hidden' name='getAllPlayers' value='PLAYERS' >
                    <input type='submit' name='groupBy' value='names' >
                    <input type='submit' name='groupBy' value='teams' >
                    <input type='submit' name='groupBy' value='leagues' >
                    <input type='hidden' name='sportName' value='Basketball' >
                </form>";

            global $db_conn;
            if( $_GET['groupBy'] == "names")
                $result = executePlainSQL("SELECT * FROM players ORDER BY players.name_");

            else if($_GET['groupBy'] == "teams")
                $result = executePlainSQL("SELECT * FROM players ORDER BY players.teamname");
            
            else if($_GET['groupBy'] == "leagues")
                $result = executePlainSQL("SELECT * FROM players ORDER BY (SELECT leaguename FROM teams WHERE teams.teamname=players.teamname)");

            echo "<div style='margin-left:50px;'>";
            while(true){
                if (($row = oci_fetch_array($result)) != false){    
                    $playername = preg_replace('/\s+/', '_', $row[1]);
                    $teamName = preg_replace('/\s+/', '_', $row[3]);
                    $key  = $playername . "-" . $teamName;
                    // echo $key;
                    

                    echo "<h3> <a href=basketball.php?getPlayerStatsRequest=&getPlayerStats=". $key .">" . $row[1]. "</a> </h3>";

                }else break;
            }
            echo "</div>";

        }

//SELECT * FROM players, teams WHERE players.teamName=teams.teamName;

        function handlGetLeagueRequest($season, $leagueName){
            global $db_conn;

            $year='/00';
            $year[1] = $season[2];
            $year[2] = $season[3];

            echo '<div style="padding-left:50px; padding-right:400px;">';
            echo "<h2><a href=basketball.php?getTeamsRequest=&getTeams=TEAMS&leagues=$leagueName> Teams </a><hr /></h2>";
            echo "<h2> MATCHES </h2>";

            $matches = executePlainSQL("SELECT * FROM matches_2 WHERE matches_2.leagueName='$leagueName' AND matches_2.matchDate like '%$year%'");
            
            while(true){
                if (($row = oci_fetch_array($matches)) != false){    
                    $play = executePlainSQL("SELECT * FROM play WHERE play.matchDate='$row[1]' AND play.stadium='$row[0]'");
                    if(($playRow = oci_fetch_array($play)) != false){
                        echo "<h3> Date:".$row[1] . ", Stadium: ".$row[0] . "</h3>";
                        echo "<h3> Home Team: <a href=basketball.php?getTeamInfoRequest=&getTeamInfo=". preg_replace('/\s+/', '_', $playRow[3]) .">".$playRow[3] . 
                        "</a> <br> Away Team: <a href=basketball.php?getTeamInfoRequest=&getTeamInfo=". preg_replace('/\s+/', '_', $playRow[2]) .">".$playRow[2] . "</a></h3>";
                        
                        echo "<h3> Result: " . $row[4] ." For " . $row[3]  ."</h3><hr />";
                    
                    }

                    
                }else break;
            }
    

            echo '</div>';
//SELECT * FROM players, teams WHERE players.teamName=teams.teamName;
        }


        function handleGetCoachRequest($teamName){
            $teamName = str_replace('_', ' ', $teamName);
            echo "<div style='margin-left:50px; margin-top:50px;'>";
            
            

            $result = executePlainSQL("SELECT * FROM coaches WHERE teamname='$teamName' ");
            if(($row = oci_fetch_array($result)) != false){
                echo "<h1>". $row[2]. "  </h1>";
                echo "<h1>Coach </h1>";
             
                $spresult = executePlainSQL( "SELECT * FROM sportPeople WHERE name_='$row[1]' AND teamname='$row[2]' AND birthdate='$row[3]'");
                if(($srow = oci_fetch_array($spresult)) != false){

                    echo "<img src=".$srow[4].">";
                    echo "<h2> ". $srow[1] ."<h2>";
                    echo "<h2>Date of Birth: ". $srow[2] ."<h2>";
                    echo "<h2> Nationality: ". $srow[0] ."<h2>";
                    echo "<h2> Experience: ". $row[0] ." Seasons <h2>";
                    
                    
                }   
                
                
            }
            echo "</div>";
        }

        function handleGetLeagueInfoRequest($leagueName){
            $result = executePlainSQL("SELECT picture FROM leagues WHERE leagueName='$leagueName' ");
            
            if(($row = oci_fetch_array($result)) != false){
                echo "<div style='margin-left: 100px; margin-top:50px;'>";
                echo "<img src='" .$row[0]."'>";
                echo "<ul style='font-size:30px;' > Seasons
                <li > <a  href=basketball.php?getLeagueRequest=&getLeague=2023&leagueName=".$leagueName."> 2023 </a> </li>
                <li> <a href=basketball.php?getLeagueRequest=&getLeague=2022&leagueName=".$leagueName."> 2022 </a> </li>
                <li> <a href=basketball.php?getLeagueRequest=&getLeague=2021&leagueName=".$leagueName."> 2021 </a> </li>
                <ul>";
                echo "</div>";
            }   

            
        }


        function handlePostTeamStatsRequest(){
            global $db_conn;
            $temp = str_replace('_', ' ', $_POST['teamname']);
             

            //Getting the values from user and insert data into the table
            $tuple = array(
                6 => $_POST['Year'],
                0 => $_POST['Games_Tied'],
                1=> $_POST['Games_Won'],
                2 => $_POST['Games_Lost'],
                3 => $_POST['Average_Scored'],
                4 => $_POST['Average_Conceded'],
                5 => $_POST['Table_Standing']
            );

            $atrb = array(
                6 => 'Year',
                0 => 'MATCHESDREW',
                1=> 'MATCHESWON',
                2 => 'MATCHESLOST',
                3 => 'AVERAGESCORED',
                4 => 'AVERAGESCOREDAGAINST',
                5 => 'CURRENTTABLERANKING'
            );

            if(!ctype_space($_POST['Year']) && $_POST['Year'] != ''){
                $result=  executePlainSQL("SELECT * FROM teamstats WHERE teamname='" . $temp. "' AND year_=" .$tuple[6] ." ");
                if (($row = oci_fetch_array($result)) != false){
                    for( $i = 0 ; $i < 6; $i++){
                        if(!ctype_space($tuple[$i]) && $tuple[$i]!=''){
                            executePlainSQL("UPDATE teamstats SET ".$atrb[$i]."=".$tuple[$i]." WHERE teamname='". $temp. "' AND year_=" .$tuple[6] . " ");
                            oci_commit($db_conn);
                        }
                        
                    }
    
                } else {
                    $count = 0;
                    for($i = 0; $i < 6; $i++){
                        if(is_blank($tuple[$i])){
                            $count++;
                            echo $count;
                        }
                        
                    }
                    if($count == 5){
                        executePlainSQL("INSERT into teamstats values (". $tuple[0] .",". $tuple[1] .",".$tuple[2] .",".$tuple[3] .",".$tuple[4] .",".$tuple[5] .",".$tuple[6] .", '".$temp. "')");
                        oci_commit($db_conn);
                    }
                    
                    
    
                }
                
            }
            handleGetTeamInfoRequest($_POST['teamname']);
            
            
        }


        function handleDelete(){
    
            global $db_conn;
            $temp = str_replace('_', ' ', $_POST['teamname']);
            
            executePlainSQL("DELETE FROM teamstats WHERE teamname='" . $temp  ."' AND year_=". $_POST['year']  ." ");
            oci_commit($db_conn);
            handleGetTeamInfoRequest($_POST['teamname']);
        } 

        
        function is_blank($var){
            return (ctype_space($var) || $var == '');
        }
        // SELECT COUNT(*) FROM TEAMSTATS WHERE TEAMNAME='Dallas Wings';
        



		?>
	</body>
</html>