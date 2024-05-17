//un module permettant de vérifier si une chaine passée en paramètre est composée seulement par des lettres et des espaces
function AlphaEspace(ch) {
  ch = ch.toUpperCase();
  i = 0;
  ok = true;
  while (ok && i < ch.length) {
    if ((ch.charAt(i) >= "A" && ch.charAt(i) <= "Z") || ch.charAt(i) == " ") {
      i = i + 1;
    } else {
      ok = false;
    }
  }
  return ok;
}

function verif1() {
  sta = document.getElementById("station").selectedIndex;
  reg = document.getElementById("reg").value;
  dates = document.getElementById("dates").value;
  heures = document.getElementById("heures").value;
  magnitude = document.getElementById("magnitude").value;
  latitude = document.getElementById("latitude").value;
  longtitude = document.getElementById("longtitude").value;
  if (sta < 1) {
    alert("veuillez choisir une station");
    return false;
  }
  if (reg.length == 0 || reg.length > 50 || AlphaEspace(reg) == false) {
    alert("veuillez entrer un nom de region ");
    return false;
  }
  dsys = new date();
  if (new date(dates) > dsys) {
    alert("veuillez entrer une date valide ");
    return false;
  }
  d = dates + " " + heures;
  if (dsys < new date(d)) {
    alert("date de seisme non confirme ");
    return false;
  }
  mag = magnitude.substr(magnitude.indexof(".") + 1, magnitude.length);
  if (
    magnitude == "" ||
    isNaN(magnitude) ||
    Number(magnitude) < 1 ||
    Number(magnitude) > 10 ||
    mag.length > 1
  ) {
    alert("valeur magnitude non confirme");
    return false;
  }
  lat = latitude.substr(latitude.indexof(".") + 1, latitude.length);
  if (
    magnitude == "" ||
    isNaN(latitude) ||
    Number(latitude) <= 0 ||
    lat.length > 2
  ) {
    alert("valeur latitude non confirme");
    return false;
  }
}

function verif2() {
  station = document.getElementById("station").selectedIndex;

  //Compléter le reste de la fonction

  resultat = true;
  if (station == 0) {
    alert("la sélection d'une station est obligatoire");
    resultat = false;
  }

  //Compléter le reste de la fonction

  return resultat;
}
