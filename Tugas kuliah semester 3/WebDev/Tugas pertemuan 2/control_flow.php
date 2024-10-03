<?php
$birthdate = "2005-01-01";
$currentYear = date("Y");
$birthYear = date("Y", strtotime($birthdate));
$age = $currentYear - $birthYear;

if ($age >= 18) {
    echo "You are an adult.";
} else {
    echo "You are a minor";
}
?>