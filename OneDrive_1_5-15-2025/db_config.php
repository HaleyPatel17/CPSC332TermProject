<?php

  function db_connect() {
    $username = "root"; 
    $dbname = "university";
    $password = "ZZbAvgx8WVk^!-@@7832"; 
    $servername = "localhost";
    $conn = new mysqli($servername, $username, $password, $dbname);
    return $conn; 
  }  

?>