<?php

function greet() {
    $name = array("Micin", "Tayo", "Asep", "Bambang", "Budi");
    if (is_array($name) || is_object($name)) {
        foreach($name as $student) {
            echo "Hello $student <br>";
        }
    }
}

greet();

?>