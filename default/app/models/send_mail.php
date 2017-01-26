<?php

class SendMail {

    function enviar($destino) {
      $from = "micorreo@kumbiaphp.com";
      
      $header = "From:" . $from . "\nReply-To:" . $from . "\n";
      $header = $header . "X-Mailer:PHP/" . phpversion() . "\n";
      $header = $header . "Mime-Version: 1.0\n";
      $header = $header . "Content-Type: text/html";

      $asunto = "Gracias por registrarse en nuestro sitio web";
      $html = "Te damos la bienvenida a nuestro sitio web, donde podrás saber toda la informacion
      sobre este grandioso framework";

      mail($destino, $asunto, $html, $header) or die("Su mensaje no pudo enviarse.");
    }

}
