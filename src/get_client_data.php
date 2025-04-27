<?php
session_start();
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
            <h2 class="h2">Podaj dane do wysyłki:</h2>
            <form method="post" action="finish_shopping.php">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="imie" class="form-label">Imię:</label>
                        <input type="text" class="form-control" id="imie" name="imie" placeholder="Imię..." required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="nazwisko" class="form-label">Nazwisko:</label>
                        <input type="text" class="form-control" id="nazwisko" name="nazwisko" placeholder="Nazwisko..."
                            required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="email@example.com"
                            required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="telefon" class="form-label">Telefon:</label>
                        <input type="tel" class="form-control" id="telefon" name="telefon" pattern="\+48[0-9]{9}"
                            placeholder="+48666666666" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label for="ulica" class="form-label">Ulica:</label>
                        <input type="text" class="form-control" id="ulica" name="ulica" placeholder="Ulica..." required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="nr_domu" class="form-label">Numer domu:</label>
                        <input type="text" class="form-control" id="nr_domu" name="nr_domu" placeholder="Numer domu..."
                            required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label for="kod_pocztowy" class="form-label">Kod pocztowy:</label>
                        <input type="text" class="form-control" id="kod_pocztowy" name="kod_pocztowy"
                            pattern="[0-9]{2}-[0-9]{3}" placeholder="11-111" required>
                    </div>
                    <div class="col-md-8 mb-3">
                        <label for="miejscowosc" class="form-label">Miejscowość:</label>
                        <input type="text" class="form-control" id="miejscowosc" name="miejscowosc"
                            placeholder="Miejscowość..." required>
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-success col-3 mb-5 float-right">Złóż zamówienie i zapłać</button>
            </form>
        </div>
    </div>
</body>
</html>