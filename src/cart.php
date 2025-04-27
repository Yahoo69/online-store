<?php
session_start();
$_SESSION['finaly_price'] = 0.0;
?>
<!DOCTYPE html>
<html>

<head>
    <title>sklepzewszystkim.pl</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</head>

<body>
    <div class="container-fluid">
        <div class="row bg-black pb-3 pt-3 px-3">
            <a href="index.php" class="h1 text-white col-11">sklepzewszystkim.pl</a>
            <form method="post" action="cart.php" class="col-1 float-right">
                <button class="btn btn-sm"><img src="shopping_cart_icon.png" width="50px" alt="shopping_cart"></button>
            </form>
        </div>
        <div class="row py-5">
            <?php
            $servername = "localhost";
            $user = "KlientSklepu";
            $password = "";
            $base = "sklep_ze_wszystkim";

            $conn = new mysqli($servername, $user, $password, $base);

            if ($conn->connect_error) {
                die("Błąd połączenia z bazą!");
            }

            $resault = $conn->query("select * from produkty where id in (" . implode(",", array_keys($_SESSION["shopping_cart"])) . ");");

            echo <<<TABLE
                        <div class="col-11 mx-auto table-responsive">
                            <table class="table">
                                <h2 class="h2">Koszyk:</h2>
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col">Obraz</th>
                                        <th scope="col">Nazwa produktu</th>
                                        <th scope="col">ilosc</th>
                                        <th scope="col">cena</th>
                                    </tr>
                                </thead>
                                <tbody>
                    TABLE;
            if ($resault->num_rows > 0) {
                while ($row = $resault->fetch_assoc()) {
                    $img = $row["zdjecie_link"];
                    $id = $row["id"];
                    $name = ucfirst($row["nazwa"]);
                    $quantity = $_SESSION["shopping_cart"][$id];
                    $price = ucfirst($row["cena"]);
                    $description = $row["opis"];

                    $_SESSION['finaly_price'] += $price * $quantity;

                    echo <<<TABLE
                                    <tr>
                                        <td class="col-3"><img alt="Zdjęcie produktu" src="$img" height="200px"></td>
                                        <td class="col-3"><h5>$name</h5></td>
                                        <td class="col-3"><h6><button class="btn btn-light">-</button>$quantity<button class="btn btn-light">+</button></h6></td>
                                        <td class="col-3"><h6>$price zł</h6></td>
                                    </tr>
                            TABLE;
                }
            }
            $finaly_price=$_SESSION['finaly_price'];

            echo "</tbody></table></div><div class=\"col-8\"></div>
            <h2 class=\"h2 text-left col-3 mb-5\">Łączna cena:$finaly_price</h2";
            ?>
        </div>
        <form method="post" action="get_client_data.php" class="row">
            <div class="col-8"></div>
            <input type="submit" class="btn btn-outline-success col-3 mx-4 mb-5" value="Zamów">
        </form>
    </div>
</body>

</html>