# hello_ispa

Application Flutter Hello ISPA (séance 1).



![Capture](docs/capture.png)



## Exploration du projet
- lib/main.dart : point d'entrée, code de l'interface
- pubspec.yaml : configuration et dépendances
- android/ : projet Android natif
- test/ : tests automatiques
- .gitignore : fichiers ignorés par Git

## Questions de compréhension
1. Après un hot reload, le State reste en mémoire, donc le compteur garde sa valeur. Un hot restart relance l'application et recrée le State : le compteur repart à 0.
2. HelloIspaApp ne change jamais (thème et page de départ), donc Stateless. AccueilPage contient une donnée qui change (_presents), donc Stateful.
3. Sans setState(), la variable augmente mais Flutter n'est pas prévenu de redessiner l'écran : l'affichage ne change pas.