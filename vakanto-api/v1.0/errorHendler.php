<?php


function MakeError($msg, $code) {
    http_response_code($code);
    echo json_encode(
        array(
            "type-error" => $msg,
            "status" => $code
        )
    );
}