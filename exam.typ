#import "@preview/ttt-exam:0.1.2": *

#set text(size: 12pt, font: ("Rubik"), weight: 300, lang: "fr")

#show: exam.with(
  ..toml("meta.toml").info, 
  logo: image("sjtu.png"),
  cover: true, // true or false
  eval-table: false,  // true or false
  appendix: none, // content or none
)

= Partie 1: Création artistique (40 PTs)

#assignment[
  Dessiner et expliquer.
  
  #question(points: 20)[
  Utilisez un crayon pour dessiner deux tableaux d'encadrement de votre environnement actuel, montrant les caractéristiques du rococo dans le premier et les caractéristiques du cubisme dans le second.
  ]

   #figure(answer(field: box(radius: 3pt, stroke: 0.5pt, width: 36em, height: 24em)[])[])


   #figure(answer(field: box(radius: 3pt, stroke: 0.5pt, width: 36em, height: 24em)[])[])

  #question(points: 20)[
    Rédigez une analyse de chacun d'eux en 80 mots environ.
  ]

  #answer(field: lines(10))[Les peintures doivent refléter les caractéristiques suivantes. Caractéristiques du rococo : légèreté, grâce et élégance, primauté de la décoration. Caractéristiques du cubisme : Fragmentation et géométrisation des formes, utilisation de la couleur, abstraction et recherche de la "vérité" de l'objet.]
]



= Partie 2: Questionnaire à choix multiple (30 PTs)

#let _multiple-choice(distractors: (), answer: (), dir: ttb) = {
  let answers = if (type(answer) == array ) { answer } else { (answer,) }
  let choices = (..distractors, ..answers)

  choices = shuffle(choices).map(choice => {
    box(inset:(x:0.5em))[
      #context {
        let is-solution =  _solution.get() and choice in answers
        checkbox(fill: if is-solution { red }, tick: is-solution )
      }
    ]; choice;
  })

  stack(dir:dir, spacing: 1em, ..choices)
}

#let multiple-choice(..args, dir: ttb) = {
  // assertions
  let data = args.named()
  assert(type(data) == dictionary, message: "expected data to be a dictionary, found " + type(data))
  let keys = data.keys()
  assert("prompt" in keys, message: "could not find prompt in keys");
  assert("distractors" in keys, message: "could not find distractors in keys");
  assert("answer" in keys, message: "could not find answer in keys");

  // create output
  block(breakable: false,
    question(points: { 3 })[
      #data.prompt
      #_multiple-choice(
        distractors: data.distractors, 
        answer: data.answer,
        dir: dir //if data.at("dir", default: none) != none { data.at("dir") } else { ttb }
      )
      // show hint if available.
      #if ("hint" in data.keys()) {
        strong(delta: -100)[Hint: #data.at("hint", default: none)]
      }
    ]
  )
}

== Introduction aux arts français

#multiple-choice(
  prompt: [
  Choisissez des artistes français parmi les artistes suivants.],
  distractors: (
    "Van Gogh", "Salvador Dalí", "Leonardo da Vinci"
  ),
  answer: (
    "Oscar-Claude Monet"
  ),
  dir: ltr,
)
 
#multiple-choice(
  prompt: [
Quelle ville française est célèbre pour le site culturel qui porte son nom ?
  ],
  distractors: (
"Lourdes", "Toulouse", "Saint-Gaudens"
  ),
  answer: (
    "Aurignac",
  ),
  dir: ltr,
)

#figure(image("img/001.png", height: 200pt))

#multiple-choice(
  prompt: [
Quel type d’outil le motif du tableau est-il le plus susceptible de représenter ?
  ],
  distractors: (
"un totem",
"un ornement",
"une sorte de panneau routier",
  ),
  answer: (
"une arme"
  ),
  dir: ltr,
)

#figure(image("img/002.png", height: 200pt))

#multiple-choice(
  prompt:  [Quelle(s) caractéristique(s) de "Le Cri" de Edvard Munch correspond(ent) à l'expressionnisme ?],
  distractors: (
    "Le thème de la nature paisible et sereine",
    "Le réalisme dans la représentation des personnages",
    "L'absence de détails et la simplification des formes",
  ),
  answer: (
    "L'utilisation de couleurs vives et non-naturalistes",
    "La perspective déformée et la figure déséquilibrée",
  ),
  dir: ttb,
)

#figure(image("img/003.png", height: 200pt))
#multiple-choice(
  prompt:  [Lors de l’analyse de la composition de la Joconde, les méthodes de segmentation applicables sont ?],
  distractors: (
    "Division en réticule",
    "division diagonale",
    "Diviser en tiers",
    "Divisé en cinq parties égales",
  ),
  answer: (
  ),
  dir: ttb,
)

#multiple-choice(
  prompt:  [Quelles caractéristiques de "L'École d'Athènes" de Raphaël reflètent l'esprit de la Renaissance ?],
  distractors: (
    "La représentation réaliste et détaillée des personnages",
    "L'utilisation de couleurs vives et contrastées",
    "La représentation d'une scène de discussion philosophique",
  ),
  answer: (
    "La composition symétrique et équilibrée",
    "La présence d'une perspective illusionniste et d'une profondeur spatiale",
  ),
  dir: ttb,
)

#figure(image("img/007.png", height: 200pt))
#multiple-choice(
  prompt:  [Quels sont les personnages principaux représentés dans cette œuvre et leurs significations symboliques ?],
  distractors: (
    "Mercure, le dieu du commerce, et Mars, le dieu de la guerre, représentant les activités terrestres",
    "Hercule, le héros légendaire, et Bacchus, le dieu du vin, symbolisant la force et la débauche",
    "Le Christ et la Vierge Marie, incarnant la pureté spirituelle",
  ),
  answer: (
    "Adam et Ève, représentant le péché originel et la chute de l'homme",
    "Vénus, la déesse de l'amour, et Cupidon, son fils, symbolisant la passion amoureuse",
  ),
  dir: ttb,
)
#multiple-choice(
  prompt:  [Quelles sont les principales influences qui ont façonné le style néoclassique dans l'art français du XVIIIe siècle ?],
  distractors: (
    "Le rejet total du style rococo et de ses excès décoratifs",
    "La volonté de se détacher des courants romantiques et réalistes",
    "Le rôle central joué par l'Académie royale de peinture et de sculpture",
  ),
  answer: (
    "L'influence des modèles esthétiques de la Grèce et de la Rome antiques",
    "L'évolution des connaissances archéologiques sur l'Antiquité",
  ),
  dir: ttb,
)

#figure(image("img/011.png", height: 200pt))

#multiple-choice(
  prompt:  [Dans son tableau "Les Corbeaux au-dessus d'un champ de blé", peint juste avant sa mort, quels éléments suggèrent l'état d'esprit tourmenté de Van Gogh ?],
  distractors: (
"L'absence totale de figures humaines",
"L'utilisation de couleurs vives et contrastées",
"La perspective plongeante sur le champ de blé"
),
answer: (
"Le ciel orageux et menaçant",
"Le mouvement tourbillonnant des corbeaux"
),
  dir: ttb,
)
#figure(image("img/012.png", height: 200pt))
#multiple-choice(
  prompt:  [Comment le tableau "Le Rêve" de Picasso, peint en 1932, s'inscrit-il dans le mouvement cubiste ?],
  distractors: (
  "Par l'emploi de couleurs vives et contrastées",
  "Par l'absence totale de référence à la figure humaine",
  "Par l'incorporation d'éléments de la réalité dans la composition"
),
answer: (
  "Par l'utilisation de formes géométriques simples",
  "Par la représentation simultanée de plusieurs points de vue"
),
  dir: ttb,
)

= Partie 3: Questions à réponse courte (30 PTs)

== Introduction aux arts français

#question(points: 3)[
Expliquer comment le nombre d'or $Phi$ est calculé mathématiquement.
]

#answer(field: lines(2))[$(sqrt(5) + 1) / 2$]

#question(points: 3)[
Qu'est-ce que le Cubisme et quelles sont ses principales caractéristiques ?
]

#answer(field: lines(2))[Fragmentation des formes, Perspective multiple, Palette de couleurs restreinte, Collage et assemblage]

#figure(image("img/004.png", height: 200pt))

#question(points: 3)[
Analyser la composition du Supplice de Jane Gray à l'aide de méthodes de segmentation.
]

#answer(field: lines(2))[Trois divisions égales sont utilisées pour distinguer les différents personnages, et des divisions en losange sont utilisées pour distinguer les personnages et les arrière-plans.]

#figure(image("img/005.png", height: 200pt))

#question(points: 3)[Quelles sont les principales innovations techniques et symboliques apportées par Jan van Eyck dans son tableau "Les Époux Arnolfini" ?]

#answer(field: lines(2))[Utilisation de la peinture à l'huile, permettant des détails extrêmement minutieux et réalistes. \
Maîtrise de la perspective linéaire pour créer une illusion de profondeur
Rendu détaillé des textures, des matériaux et des reflets. \
Symbolisme des objets (chandelier, chien, gants) qui transmettent des significations sur le mariage et la vie conjugale.]

#figure(image("img/006.png", height: 200pt))

#question(points: 3)[Quelle est la signification symbolique du crâne anamorphique représenté dans "Les Ambassadeurs" de Hans Holbein le Jeune ?]
#answer(field: lines(2))[C'est un memento mori, un rappel de la vanité et de la fragilité de la vie humaine. Le crâne symbolise la mort qui guette derrière l'opulence et le prestige des deux hommes représentés.]

#figure(image("img/008.png", height: 150pt))
#figure(image("img/009.png", height: 150pt))

#question(points: 3)[Quelles sont les principales différences de composition entre la "Cène" de Léonard de Vinci et celle réalisée par le Tintoret ?]
#answer(field: lines(2))[Vinci : utilisation d'une perspective linéaire complexe, avec des lignes de fuite convergentes vers le Christ, éclairage doux et uniforme, mettant l'accent sur la scène centrale.
Tintoret : perspective plus libre, avec un traitement plus dynamique de l'espace, utilisation de contrastes d'ombre et de lumière, créant une atmosphère plus dramatique.
]
#question(points: 3)[Quels sont les principaux facteurs qui ont conduit à l'émergence du style rococo en France au XVIIIe siècle ?]
#answer(field: lines(2))[Volonté de se détacher du classicisme et du formalisme de l'époque précédente. Goût pour le luxe, l'élégance et les plaisirs de la vie de cour.]
#question(points: 3)[Quels sont les arts majeurs qui ont émergé dans l’art français au fil du temps, du style post-Renaissance aux temps modernes ? Les triez: Rococo, Néoclassicisme, Renaissance, Surréalisme, Romantisme, Cubisme, Réalisme et Impressionnisme, Baroque et classicisme, Fauvisme]
#answer(field: lines(2))[Renaissance, Baroque et classicisme, Rococo, Néoclassicisme, Romantisme, Réalisme, Impressionnisme, Fauvisme, Cubisme, Surréalisme]
#figure(image("img/010.png", height: 200pt))
#question(points: 3)[Quelles sont les principales innovations picturales mises en œuvre par Monet dans son tableau "Impression, soleil levant" (1872) ?]
#answer(field: lines(2))[Technique de la touche libre, Primauté de l'effet lumineux,  Travail en extérieur ("en plein air")]

#figure(image("img/013.png", height: 200pt))

#question(points: 3)[En quoi les œuvres de Vincent van Gogh ont-elles pu inspirer et influencer le mouvement fauviste, qui émerge au début du XXe siècle ?
]
#answer(field: lines(2))[Utilisation de la couleur pure et expressive. Gestualité et touche picturale. Importance de l'expressivité et de la subjectivité.]

