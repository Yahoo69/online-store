<?php
	session_start();

	if(isset($_COOKIE['shopping_finished']) && !isset($_SESSION['shopping_finished'])){
		if(!$_COOKIE['shopping_finished'])
		{
			$_SESSION['shopping_cart']=array_combine(explode(";",$_COOKIE["shopping_cart_keys"]),explode(";",$_COOKIE["shopping_cart_values"])); // TODO przerobić pod nowe tablice
			$_SESSION['shopping_finished']=$_COOKIE['shopping_finished'];
		}
	}

	if(!isset($_SESSION['shopping_finished'])){
		$_SESSION['shopping_cart']=array();
		$_SESSION['shopping_finished']=false;
	}
?>

<!DOCTYPE html>
<html>	
	<head>
		<title>sklepzewszystkim.pl</title>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row bg-black pb-3 pt-3 px-3">
				<a href="index.php" class="h1 text-white col-11">sklepzewszystkim.pl</a>
				<form method="post" action="cart.php"  class="col-1 float-right">
					<button class="btn btn-sm"><img src="shopping_cart_icon.png" width="50px" alt="shopping_cart"></button>
				</form>
			</div>
			<div class="row py-5">
				<?php
					$servername="localhost";
					$user="KlientSklepu";
					$password="";
					$base="sklep_ze_wszystkim";

					$conn=new mysqli($servername,$user,$password,$base);

					if($conn->connect_error){
						die("Błąd połączenia z bazą!");
					}

					$resault=$conn->query("select * from produkty;");
					if($resault->num_rows > 0){
						while($row=$resault->fetch_assoc()){
							$img=$row["zdjecie_link"];
							$id=$row["id"];
							$name=ucfirst($row["nazwa"]);
							$price=ucfirst($row["cena"]);
							$description=$row["opis"];
							echo <<<CARD
							<form class="card border-warning col-3" method="post" action="add_to_cart.php">
								<div class="card-body">
									<img class="card-img-top" alt="Zdjęcie produktu" src="$img" height="200px">
									<h5 class="card-title" value="$name">$name</h5>
									<h6 class="card-subtitle" value="$price">$price zł</h6
									<p class="card-text">$description</p>
									<input type="hidden" name="product_id" value="$id">
									<input type="hidden" name="price" value="$price">
									<input type="submit" class="btn btn-outline-success" value="Kup">
								</div>
							</form>
							CARD;
						}
					}
					
					$conn->close();
				?>
			</div>
		</div>
	</body>
</html>
