<?php
$students = [
    [
        'name' => 'Micin',
        'birthdate' => '2005-01-01',
        'sex' => 'male',
        'gpa' => 3.77,
        'isStudent' => true
    ],
    [
        'name' => 'Asep',
        'birthdate' => '2003-05-12',
        'sex' => 'female',
        'gpa' => 3.85,
        'isStudent' => true
    ],
    [
        'name' => 'Tayo',
        'birthdate' => '2004-07-23',
        'sex' => 'male',
        'gpa' => 3.6,
        'isStudent' => true
    ],
    [
        'name' => 'Budi',
        'birthdate' => '2006-11-30',
        'sex' => 'female',
        'gpa' => 3.9,
        'isStudent' => true
    ],
    [
        'name' => 'Bambang',
        'birthdate' => '2005-02-18',
        'sex' => 'male',
        'gpa' => 3.72,
        'isStudent' => true
    ]
];

function calculateAge($birthdate) {
    $currentYear = date("Y");
    $birthYear = date("Y", strtotime($birthdate));
    return $currentYear - $birthYear;
}

if (basename(__FILE__) == basename($_SERVER['PHP_SELF'])) {
    foreach ($students as $student) {
        $name = $student['name'];
        $birthdate = $student['birthdate'];
        $birthday = date("d/m", strtotime($birthdate)) . "/" . date("Y");
        $age = calculateAge($birthdate);
        $sex = $student['sex'];
        $gpa = $student['gpa'];
        $isStudent = $student['isStudent'];

        echo "Name: $name <br>";
        echo "Birthdate: $birthday <br>";
        echo "Age: $age <br>";
        echo "Sex: $sex <br>";
        echo "GPA: $gpa <br>";
        echo "Is Student: " . ($isStudent ? 'Yes' : 'No') . "<br><br>";
    }
}

?>
