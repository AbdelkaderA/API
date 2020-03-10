<?php
  $url = 'http://127.0.0.1/API/create.php';
  $data = array('Adresses_idAdresses' => 22, 'Produits_idProduits' => 5, 'Quantité' => 5);
  // utilisez 'http' même si vous envoyez la requête sur https:// ...
  $options = array(
    'http' => array(
      'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
      'method'  => 'POST',
      'content' => http_build_query($data)
    )
  );
  $context  = stream_context_create($options);
  $result = file_get_contents($url, false, $context);
  if ($result === FALSE) { /* Handle error */ }
  var_dump($result);
?>