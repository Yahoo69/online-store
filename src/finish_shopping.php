<?php
session_start();

$servername = "localhost";
$user = "KlientSklepu";
$password = "";
$base = "sklep_ze_wszystkim";

$conn = new mysqli($servername, $user, $password, $base);

if ($conn->connect_error) {
    die("Błąd połączenia z bazą!");
}

$id_zamowienia=0;
try {
    $conn->begin_transaction();

    $query1 = "INSERT INTO klienci (imie, nazwisko, email, telefon, ulica, nr_domu, kod_pocztowy, miejscowosc) VALUES (
            '" . addslashes($_POST["imie"]) . "',
            '" . addslashes($_POST["nazwisko"]) . "',
            '" . addslashes($_POST["email"]) . "',
            '" . addslashes($_POST["telefon"]) . "',
            '" . addslashes($_POST["ulica"]) . "',
            '" . addslashes($_POST["nr_domu"]) . "',
            '" . addslashes($_POST["kod_pocztowy"]) . "',
            '" . addslashes($_POST["miejscowosc"]) . "'
        );";

    if (!$conn->query($query1)) {
        throw new Exception("Błąd zapytania:" . $conn->error);
    }

    $id_klienta = $conn->insert_id;
    $finaly_price = (float) $_SESSION["finaly_price"];

    $query2 = "INSERT INTO zamowienia (id_klienta, data_zamowienia, laczna_kwota, status) VALUES (
            $id_klienta,
            '" . date("Y-m-d H:i:s") . "',
            $finaly_price,
            'nie opłacone'
        );";

    if (!$conn->query($query2)) {
        throw new Exception("Błąd zapytania:" . $conn->error);
    }

    $id_zamowienia = (int) $conn->insert_id;

    $query3 = "INSERT INTO szczegoly_zamowienia (id_zamowienia,id_produktu,ilosc) VALUES";
    $id_produktow = array_keys($_SESSION["shopping_cart"]);
    $id_produktu = current($id_produktow);
    foreach ($_SESSION["shopping_cart"] as $ilosc) {
        $ilosc=(int) $ilosc;
        $query3 .= "($id_zamowienia,$id_produktu,$ilosc),";
        $id_produktu = next($id_produktow);
    }
    $query3 = rtrim($query3, ",") . ";";

    if (!$conn->query($query3)) {
        throw new Exception("Błąd zapytania:" . $conn->error);
    }

    $conn->commit();

    session_destroy();
    unset($_COOKIE['shopping_cart_keys']);
    unset($_COOKIE['shopping_cart_values']);
    unset($_COOKIE['shopping_finished']);

    echo <<<TEXT
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
                        <h2 class="h2">Zamóweienie zostało złożone. Nr twojego zamowienia to $id_zamowienia. Po opłaceniu przez ciebie zamówienia rozpoczniemy wysyłkę.</h2>
                        <h4 class="h4">Kliknij przycisk aby opłacić zamówienie</h4>
                        <butoon class="btn btn-outline-success">Zapłać</button>
			        </div>
		            </div>
	            </body>
             </html>
TEXT;
} catch (Exception $e) {
    $conn->rollback();
    echo "Wystąpił błąd:" . $e->getMessage();
}

$conn->close();
?>