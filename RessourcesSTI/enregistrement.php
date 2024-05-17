<?php
$cnx=mysqli_connect("127.0.0.1","root","","bd_seisme");
$station=$_POST['station'];
$region=$_POST['region'];
$dates=$_POST['dates'];
$heures=$_POST['heures'];
$magnitude=$_POST['magnitude'];
$latitude=$_POST['latitude'];
$longitude=$_POST['longtitude'];
$d=$dates." ".$heures;
$req1 = "SELECT codesta, s.NumReg, DateSeisme 
         FROM region r, seisme s 
         WHERE s.NumReg = r.NumReg 
         AND CodeSta = '$station' 
         AND NomReg = '$region' 
         AND DateSeisme = '$d';";
$res1 = mysqli_query($cnx, $req1);
if (!$res1) {
    die("Échec de la requête : " . mysqli_error($cnx));
}

$n = mysqli_num_rows($res1);
if ($n > 0) {
    echo 'Activité déjà enregistrée';
} else {
    
    $req2 = "SELECT NumReg FROM region WHERE NomReg = '$region'";
    $res2 = mysqli_query($cnx, $req2);
    if (!$res2) {
        die("Échec de la requête : " . mysqli_error($cnx));
    }

    $n = mysqli_num_rows($res2);
    if ($n > 0) {
        $t = mysqli_fetch_row($res2);
        $num = $t[0];

        
        $req3 = "INSERT INTO seisme (CodeSta, NumReg, Latitude, Longitude, Magnitude, DateSeisme) 
                 VALUES ('$station', '$num', '$latitude', '$longitude', '$magnitude', '$d')";
        $res3 = mysqli_query($cnx, $req3);
        if (!$res3) {
            die("Échec de la requête : " . mysqli_error($cnx));
        }

        if (mysqli_affected_rows($cnx) > 0) {
            echo 'Activité enregistrée avec succès';
        } else {
            echo 'Échec de l\'enregistrement de l\'activité';
        }
    } else {
        echo 'Région non trouvée';
    }
}

mysqli_close($cnx);
?>

























?>