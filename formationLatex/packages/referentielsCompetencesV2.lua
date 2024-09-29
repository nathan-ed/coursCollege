local competences = {
    c3NC1 = "Utiliser les nombres (différentes écritures, comparer,…)",
    c3NC2 = "Calculer avec des nombres entiers et décimaux",
    c3EG1 = "Repérage et déplacements dans l'espace",
    c3EG2 = "Manipuler des solides et des figures géométriques",
    c3EG3 = "Reconnaître et utiliser quelques relations géométriques",
    c3GM1 = "Manipuler des grandeurs géométriques",
    c3CO1 = "Restituer des connaissances",
    c3CO2 = "Communiquer",
    c3CO3 = "Modéliser un problème",
    c3CO4 = "Mettre en place des stratégies de recherche",
    c3CO5 = "Résoudre un problème",
    c4NC1 = "Utiliser les nombres (différentes écritures, comparer,…)",
    c4NC2 = "Calculer avec des nombres",
    c4NC3 = "Calculer avec des expressions littérales",
    c4GF1 = "Traduire un problème par une expression numérique et/ou littérale",
    c4GF2 = "Représenter et interpréter des données",
    c4GF3 = "Utiliser la proportionnalité",
    c4EG1 = "Se repérer sur une droite, dans le plan ou dans l'espace",
    c4EG2 = "Manipuler les instruments de géométrie",
    c4EG3 = "Suivre un programme de construction",
    c4AP1 = "Utiliser un logiciel (tableur, logiciel de géométrie dynamique…)",
    c4AP2 = "Manipuler l'algorithmique",
    c4GM1 = "Manipuler des grandeurs mesurables",
    c4GM2 = "Se déplacer dans le plan",
    c4CO1 = "Restituer des connaissances",
    c4CO2 = "Communiquer",
    c4CO3 = "Modéliser un problème",
    c4CO4 = "Mettre en place des stratégies de recherche",
    c4CO5 = "Résoudre un problème",
    c4CO6 = "Appliquer une formule, une propriété, un théorème"
}

-- fonctions pour retourner la compétence en fonction de son code
local function print_competence(code) tex.sprint(competences[code]) end

return {print = print_competence}
