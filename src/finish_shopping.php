<?php
    $query="insert into klienci VALUES (id,".$_POST["imie"].",".$_POST["nawisko"].",".$_POST["email"].",".$_POST["telefon"].",".$_POST["ulica"].",".$_POST["nr_domu"].",".$_POST["kod_pocztowy"].",".$_POST["miejscowosc"].");";
    $query=$query."insert into zamowienia VALUES (id,(select id from klienci order by id DESC limit 1),".date("Y-m-d H:i:s").",".$_SESSION['finaly_price'].",\"nie opłacone\");";
    $query=$query."select id from zamowienia order by id DESC limit 1;";

    $servername = "localhost";
    $user = "KlientSklepu";
    $password = "";
    $base = "sklep_ze_wszystkim";

    $conn = new mysqli($servername, $user, $password, $base);

    if ($conn->connect_error) {
        die("Błąd połączenia z bazą!");
    }

    $resault=$conn->query($query);

    echo $resault->fetch_assoc()["id"];
?>