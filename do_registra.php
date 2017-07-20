<?php
/*
  $email = $_REQUEST["email"];
  $nome = $_REQUEST["nome"];
  $cognome = $_REQUEST["cognome"];
  $password = $_REQUEST["password"];
  
  
  $servername = "localhost";
  $username = "root";
  $pwdserver = "matec";
  $dbname = "mionegozio";
  
 
  $conn = mysqli_connect ($servername, $username, $pwdserver);
  if (!$conn)
	  die ("Errore nella connessione al $servername");
 $seldb = mysqli_select_db ($conn,$dbname);
  if (!$seldb)
	  die ("Errore nella connessione all'archivio $dbname");
  
  
  $query = "INSERT INTO utenti (email,nome,cognome,password) VALUES ('$email', '$nome', '$cognome', '$password')";
  
  $result = mysqli_query ($conn, $query);
  if (!$result)
	  die ("Errore nella registrazione dell'utente: $query");
  */
  
  header('Location: index.php');
  exit ();
?>