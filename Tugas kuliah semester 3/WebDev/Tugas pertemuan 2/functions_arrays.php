<?php
include "variables.php";

function greet($students) {
    if (is_array($students)) {
        foreach($students as $student) {
            echo "Hello " . $student['name'] . "<br>";
        }
    }
}

greet($students);
?>
