<?php
$name = "Michael";
$birthdate = "2005-01-01";
$birthday = date("d/m", strtotime($birthdate)) . "/" . date("Y");
$currentYear = date("Y");
$birthYear = date("Y", strtotime($birthdate));
$age = $currentYear - $birthYear;
$sex = "male";
$gpa = 3.77;
$isStudent = true;

echo "Name: $name <br>";
echo "Birthdate: $birthday <br>";
echo "Age: $age <br>";
echo "Sex: $sex <br>";
echo "GPA: $gpa <br>";
echo "Is Student: $isStudent <br>";

?>
