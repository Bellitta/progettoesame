  <!DOCTYPE html>
  <html>
  <head>
    <title>Il mio negozio</title>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>


    <link href='css/bootstrap.min.css' rel='stylesheet' media='screen'>

    <script src="js/jquery-1.10.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <style> 
	    body {
			padding: 2%;
		}
		.jumbotron {
		    background-color: rgb(240,173,78);
		}
		.testocarousel {
			font: italic bold 30px Georgia, Serif;
		}
		
		#messaggioErrore {
			font italic bold 30px Georgia, Serif;
		}
	</style>
   
     </head>
  <body>
  <nav class ="navbar navbar-default navbar-fixed-top">
  
    <div claas="container">
	    <div class="navbar-header">
		    <button class="navbar-toggle" data-toggle="collapse" data-target="#menunegozio">
			    <span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
				<span class="icon-bar"> </span>
			</button>
		</div>
		
		
		<div id="menunegozio" class="collapse navbar-collapse">
		    <ul class="nav navbar-nav">
			    <li class="active"> <a href= "#"> Home </a> </li>
				<li> <a href= "registra.php"> Resistrati </a> </li>
				 <li class="dropdown"> <a href= "#" claas="dropdown-toggle" data-toggle="dropdown">  Fai da te <span class="caret"></span> </a>
				     <ul class="dropdown-menu">
					     <li> <a href="ordini.php"> I miei ordini </a> </li>
						 <li> <a href="carrello.php"> Carrello </a> </li>
						 <li class="divider"> </li>
						 <li> <a href="logout.php"> Disconnetti </a> </li>
				     </ul>
				 </li>
			</ul>
				
		</div>
	</div>

</nav>

<div class="jumbotron">
    <div class="container">
	  <div class="row">
	    <div class="col-sm-4 hidden-xs">
		   <img src="foto/glem.png" class="img img-responsive img-thumbnail"/>
		</div>
		
		<div class="col-sm-8">
		    <h1> Compro tutto </h1>
			<h2> Tutto quello che cerchi, a prezzi imbattibili </h2>
		
		</div>
	  </div>
	</div>
    <div class="carousel slide col-sm-offset-1" data-ride="carousel">
	  <div class="carousel-inner testocarousel">
	    <div class="item active"> Frigoriferi </div>
		<div class="item"> Piani cottura </div>
		<div class="item"> Cappe da arredamento </div>
		<div class="item"> Lavelli </div>
		
	  </div>
	</div>
</div>

<div class="container">
 <br> <br>
<h1> Effettua il login </h1>
<div class="row">
    <form action="do_login.php" method="post" class="form-horizontal"> 
	    <div class="form-group">
		    <label for ="email" class="col-sm-4 control-label"> E-mail </label>
			<div class="col-sm-8">
			<input name="email" type ="email" id="email" required class="form-control" placeholder="Inserisci il tuo indirizzo e-mail">
			</div>
		</div>
		 
		 
		<div class="form-group">
		    <label for ="pwd" class="col-sm-4 control-label"> Password </label>
			<div class="col-sm-8">
			<input name="password" type ="password" id="pwd" required class="form-control" placeholder="Inserisci password">
			</div>
		</div>
		<div class="form-group">
		   <div class="col-sm-offset-4 col-sm-3">
		   <button type="submit" class="btn btn-warning"> Login </button>
		   </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-4" id="messaggioErrore">
			</div>
		</div>
		<?php
		    $codiceErrore = $_REQUEST["errore"];
			if ($codiceErrore==1)
				$messaggio = "Utente non registrato";
			else 
				if ($codiceErrore==2)
			        $messaggio ="Password errata";
				else
					$messaggio = "";
			echo "<script type='text/javascript'>";
			echo "$('#messaggioErrore').append ('$messaggio');";
			
			echo "</script>"; 
			
				
		?>
	
    </form>	
</div>
</div>


  </body>
</html>
