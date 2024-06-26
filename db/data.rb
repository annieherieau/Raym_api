COLORS = [
  {name: 'Beige', collection: 'Edition Pro Rider YR', description: ''},
  {name: 'Jaune', collection: 'Edition Corsica', description: ''},
  {name: 'Rose', collection: 'Edition Render', description: ''},
  {name: 'Gris', collection: 'Edition Lotus', description: ''},
  {name: 'standard', collection: 'Edition Classique', description: ''}
]
CATEGORIES = [
  {name: 'Off Road', configurator: true, bike: true, description: ''},
  {name: 'On Road', configurator: true, bike: true, description: ''},
  {name: 'Hybrid',  configurator: true, bike: true, description: ''},
  {name: 'Homme', configurator: true, clothing: true,   description: ''},
  {name: 'Femme', configurator: true, clothing: true, description: ''},
  {name: 'Accessoires', description: ''}
]
PHOTO_PATH='app/assets/images/'
PRODUCTS = [
  {name: 'La Rafale', price: 2499, category:'On Road', color:'Beige', photo: 'OnRoad-Raym.png'},
  {name: 'La Rafale', price: 2499, category:'On Road', color:'Rose', photo: 'OnRoad-Annie.png'},
  {name: 'La Rafale', price: 2499, category:'On Road', color:'Jaune', photo: 'OnRoad-Malo.png'},
  {name: 'La Rafale', price: 2499, category:'On Road', color:'Gris', photo: 'OnRoad-Robena.png'},
  
  {name: 'Vélo6Raptor', price: 5999, category:'Off Road', color:'Beige', photo: 'VELO6RAPTOR-RAYM.png'},
  {name: 'Vélo6Raptor', price: 5999, category:'Off Road', color:'Rose', photo: 'VELO6RAPTOR-Annie.png'},
  {name: 'Vélo6Raptor', price: 5999, category:'Off Road', color:'Jaune', photo: 'VELO6RAPTOR-Malo.png'},
  {name: 'Vélo6Raptor', price: 5999, category:'Off Road', color:'Gris', photo: 'VELO6RAPTOR-Robena.png'},

  {name: 'Overcharge', price: 3799, category:'Hybrid', color:'Beige', photo: 'Hybrid-Raym.png'},
  {name: 'Overcharge', price: 3799, category:'Hybrid', color:'Rose', photo: 'Hybrid-Annie.png'},
  {name: 'Overcharge', price: 3799, category:'Hybrid', color:'Jaune', photo: 'Hybrid-Malo.png'},
  {name: 'Overcharge', price: 3799, category:'Hybrid', color:'Gris', photo: 'Hybrid-Robena.png'},

  { name: 'Tenue Femme', price: 397, category: 'Femme', color: 'Beige', photo: 'tf_Raym.png' },
  { name: 'Tenue Femme', price: 367, category: 'Femme', color: 'Rose', photo: 'tf_Annie.png' },
  { name: 'Tenue Femme', price: 397, category: 'Femme', color: 'Gris', photo: 'tf_Robena.png' },
  { name: 'Tenue Homme', price: 367, category: 'Homme', color: 'Jaune', photo: 'th_Malo.png' },
  { name: 'Tenue Homme', price: 367, category: 'Homme', color: 'Gris', photo: 'th_Robena.png' },
  { name: 'Tenue Homme', price: 367, category: 'Homme', color: 'Rose', photo: 'th_Annie.png' },
  {name:'Tenue homme', price: 367, category: 'Homme', color: 'Beige', photo: 'th_Raym.png'},
  { name: 'Tenue Femme', price: 367, category: 'Femme', color: 'Jaune', photo: 'tf_Malo.png' },

  { name: 'Casquette Raym Noire édition collector', price: 29, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-cycliste-nautica.png' },
  { name: 'Casquette Raym edition Corsica', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-baseball-poc-pour-hommes-poc-youth-trucker.png' },
  { name: 'Casquette Raym edition Street-Art', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-cyclisme-mooquer-camo-classy-taille-unique-blanc-8-panneaux.png' },
  { name: 'Casquette Raym edition Lotus', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-velo-roadr-500-bleu-petrole.png' },
  { name: 'Casquette Raym edition Bordeaux', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-velo-roadr-500-bordeaux.png' },
  { name: 'Casquette Raym couleur chair ', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-velo-roadr-500-femme-nude.png' },
  { name: 'Casquette Raym edition Vert', price: 25, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-de-velo-roadr-500-vert.png' },
  { name: 'Casquette Raym LTD Edition Paris 2024', price: 30, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-velo-ltd-edition-paris-2024.png' },
  { name: 'Casquette Raym edition Roadr 520', price: 27, category: 'Accessoires', color: 'standard', photo: '/Caps/casquette-velo-roadr-520.png' },

  { name: 'Gant Raym Enfant Bleu', price: 15, category: 'Accessoires', color: 'standard', photo: '/Gloves/gant-mitaine-velo-enfant-bleu.png' },
  { name: 'Gant Raym Enfant Doctogirl', price: 15, category: 'Accessoires', color: 'standard', photo: '/Gloves/gant-mitaine-velo-enfant-doctogirl.png' },
  { name: 'Gant Raym Enfant Jaune', price: 15, category: 'Accessoires', color: 'standard', photo: '/Gloves/gant-mitaine-velo-enfant-jaune.png' },
  { name: 'Gant Raym Mi-saison Jaune Fluo', price: 20, category: 'Accessoires', color: 'standard', photo: '/Gloves/gants-velo-500-mi-saison-jaune-fluo.png' },
  { name: 'Gant Raym Enfant Noir et Jaune', price: 18, category: 'Accessoires', color: 'standard', photo: '/Gloves/gants-velo-enfant-500-noir-jaune-8-12-ans.png' },

  { name: 'Casque Raym Airdrop MIPS Blanc Polaire', price: 85, category: 'Accessoires', color: 'standard', photo: '/Helmet/airdrop-mips-blanc-polaire.png' },
  { name: 'Casque Raym 540 Bol Vélo Ville Kaki', price: 60, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-540-bol-velo-ville-kaki.png' },
  { name: 'Casque Raym Parachute MCR MIPS', price: 150, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-de-velo-parachute-mcr-mips.png' },
  { name: 'Casque Raym Route RCR MIPS Blanc', price: 90, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-de-velo-route-rcr-mips-blanc.png' },
  { name: 'Casque Raym MTB Gravity 40 Blanc', price: 75, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-mtb-gravity-40-blanc.png' },
  { name: 'Casque Raym Route Roadr 500 Jaune Fluo', price: 70, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-velo-route-roadr-500-jaune-fluo.png' },
  { name: 'Casque Raym Ville 900 avec Visière et Éclairage Arrière Noir', price: 80, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-velo-ville-900-visiere-et-eclairage-arriere-noir.png' },
  { name: 'Casque Raym Xult DH Acacia Black', price: 120, category: 'Accessoires', color: 'standard', photo: '/Helmet/casque-xult-dh-acacia-black.png' },
  { name: 'Casque Raym MTB Full Face Blade Unisex Noir Carbone', price: 130, category: 'Accessoires', color: 'standard', photo: '/Helmet/mtb-full-face-blade-unisex-noircarbone.png' },
  { name: 'Casque Raym Xult DH Blanc Noir', price: 110, category: 'Accessoires', color: 'standard', photo: '/Helmet/xult-dh-helmet-blancnoir.png' },

  { name: 'Sac à Eau Tactique Pack d\'Hydratation Rider LP 3L Backpack Noir', price: 45, category: 'Accessoires', color: 'standard', photo: '/Hydratation Bag/sac-a-eau-tactique-pack-dhydratation-rider-lp-3l-backpack-noir.png' },
  { name: 'Sac d\'Hydratation Tactique Sac à Dos avec Système d\'Hydratation de 3 Litres', price: 50, category: 'Accessoires', color: 'standard', photo: '/Hydratation Bag/sac-dhydratation-tactique-sac-a-dos-avec-systeme-dhydratation-de-3-litres.png' },
  { name: 'Sac d\'Hydratation Thule Rail 8L Beige', price: 60, category: 'Accessoires', color: 'standard', photo: '/Hydratation Bag/sac-dhydratation-thule-rail-8l-beige.png' },
  { name: 'Sac d\'Hydratation Thule Vital', price: 55, category: 'Accessoires', color: 'standard', photo: '/Hydratation Bag/sac-dhydratation-thule-vital.png' },

  { name: 'Lunettes de Vélo Adulte Perf 500 Light Catégorie 3 Blanche', price: 35, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-velo-adulte-perf-500-light-categorie-3-blanche.png' },
  { name: 'Lunettes de Vélo Adulte Perf 500 Light Catégorie 3 Noir Bleu', price: 35, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-velo-adulte-perf-500-light-categorie-3-noir-bleu.png' },
  { name: 'Lunettes de Vélo Adulte Perf 500 Light HD Cat3', price: 40, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-velo-adulte-perf-500-light-hd-cat3.png' },
  { name: 'Lunettes de Vélo Roadr 900 Perf Catégorie 3 Vertes Translucide', price: 45, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-velo-roadr-900-perf-categorie-3-vertes-translucide.png' },
  { name: 'Lunettes de Vélo Roadr 900 Perf Light Pack Noir', price: 50, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-velo-roadr-900-perf-light-pack-noir.png' },
  { name: 'Lunettes de VTT Adulte ST 100 Grises Catégorie 3', price: 30, category: 'Accessoires', color: 'standard', photo: '/Sunglasses/lunettes-de-vtt-adulte-st-100-grises-categorie-3.png' },

  { name: 'Pack 2x Shiva Bidon et 2x Porte-bidon', price: 25, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/2x-shiva-bidon-2x-porte-bidon-bouteilles-et-porte-bidons.png' },
  { name: 'Bidon 0.62L CamelBak Stage Chill Bleu Orange', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/bidon-062l-camelbak-stage-chill-bleu-orange.png' },
  { name: 'Bidon Vélo Acier Inox Isotherme Deboyo Race 550ml', price: 30, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/bidon-velo-acier-inox-isotherme-deboyo-race-550ml.png' },
  { name: 'Bouteille Podium Chill Race Edition Blanc 620ml', price: 22, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/bouteille-podium-chill-race-edition-blanc-620-ml.png' },
  { name: 'Bouteille de Vélo Unisexe Fidlock Twist Bottle 590ml', price: 28, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/fidlock-bouteille-de-velo-unisexe-twist-bottle-590-uni-base.png' },
  { name: 'Ensemble de Bouteilles de Vélo Unisexe Fidlock', price: 32, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/fidlock-ensemble-de-bouteilles-de-velo-unisexe.png' },
  { name: 'Gourde Bouchon à Visser Polisport S600', price: 18, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/gourde-bouchon-a-visser-polisport-s600.png' },
  { name: 'Gourde Podium 710ml 1', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/gourde-podium-710-ml-1.png' },
  { name: 'Gourde Podium 710ml 2', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/gourde-podium-710-ml-2.png' },
  { name: 'Gourde Podium 710ml', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle/gourde-podium-710-ml.png' },

  { name: 'Porte-bidon Elite Vico Carbon Noir', price: 18, category: 'Accessoires', color: 'standard', photo: '/Water_bottle_holder/elite-porte-bidon-vico-carbon-noir.png' },
  { name: 'Porte-bouteilles Elite Vico Glam Doré', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle_holder/elite-porte-bouteilles-vico-glam-dore.png' },
  { name: 'Porte-bouteilles Elite Vico Glam Gris', price: 20, category: 'Accessoires', color: 'standard', photo: '/Water_bottle_holder/elite-porte-bouteilles-vico-glam-gris.png' },
  { name: 'Porte-bidon Elite Vico', price: 15, category: 'Accessoires', color: 'standard', photo: '/Water_bottle_holder/porte-bidon-elite-vico.png' }

]