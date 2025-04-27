<?php
    session_start();
    $product_id=$_POST["product_id"];

    if (!array_key_exists($product_id, $_SESSION['shopping_cart'])) {
        $_SESSION['shopping_cart'][$product_id] = 0;
    }

    $_SESSION['shopping_cart'][$product_id]+=1;
?>
<?php
	if(!$_SESSION['shopping_finished']){
		setcookie('shopping_cart_keys',implode(";",array_keys($_SESSION['shopping_cart'])),time()+10000,'/');
		setcookie('shopping_cart_values',implode(";",$_SESSION['shopping_cart']),time()+10000,'/');
		setcookie('shopping_finished',$_SESSION['shopping_finished'],time()+10000,'/');
	}else{
		unset($_COOKIE['shopping_cart_keys']);
		unset($_COOKIE['shopping_cart_values']);
		unset($_COOKIE['shopping_finished']);
	}
?>
<?php
    echo '<script> history.back(); </script>';
?>
