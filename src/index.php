<?php
	session_start();
	$_SESSION['shopping_cart']=array();
    $_SESSION['finaly_price']=0.0;
	$_SESSION['shopping_finished']=false;

	if(isset($_COOKIE['shopping_finished'])){
		if(!$_COOKIE['shopping_finished'])
		{
			$_SESSION['shopping_cart']=$_COOKIE['shopping_cart'];
    		$_SESSION['finaly_price']=$_COOKIE['finaly_price'];
			$_SESSION['shopping_finished']=$_COOKIE['shopping_finished'];
		}
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
			<div class="row h1 bg-black text-white pb-3 pt-3 px-3">
				sklepzewszystkim.pl
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
							<form class="card col-3" method="post" action="add_to_cart.php">
								<div class="card-body">
									<img class="card-img-top" alt="Zdjęcie produktu" src="$img" height="200px">
									<h5 class="card-title" name="name" value="$name">$name</h5>
									<h6 class="card-subtitle" name="price" value="$price">$price zł</h6
									<p class="card-text">$description</p>
									<input type="hidden" name="product_id" value="$id">
									<input type="submit" class="btn btn-outline-success" value="Kup">
								</div>
							</form>
							CARD;
						}
					}
				
				?>
			</div>
		</div>
	</body>
</html>

<?php
	if(!$_SESSION['shopping_finished']){
		setcookie('shopping_cart',$_SESSION['shopping_cart'],time()+10000,'/');
		setcookie('finaly_price',$_SESSION['finaly_price'],time()+10000,'/');
		setcookie('shopping_finished',$_SESSION['shopping_finished'],time()+10000,'/');
	}else{
		unset($_COOKIE['shopping_cart']);
		unset($_COOKIE['finaly_price']);
		unset($_COOKIE['shopping_finished']);
	}

	session_destroy();
?>

