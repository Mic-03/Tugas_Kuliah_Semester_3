<?php
include "variables.php";

$selectedStudent = null;
foreach ($students as $student) {
    if ($student['name'] === 'Miicn') {
        $selectedStudent = $student;
        break;
    }
}

if ($selectedStudent !== null) {
    $age = calculateAge($selectedStudent['birthdate']);

    if ($age >= 18) {
        echo "You are an adult. <br>";
        echo "Age: $age";
    } else {
        echo "You are a minor. <br>";
        echo "Age: $age";
    }
} else {
    echo "Student not found.";
}
?>
