//
//  RewardsDataBase.swift
//  Cookerz
//
//  Created by apprenant98 on 09/03/2025.
//

var rewards : [Reward] = [
    Reward(name: "Big Mamma : Cuisine Italienne en 30 minutes (douche comprise !)", type: .cookBook, icon: "Big Mamma _ Cuisine Itallienne en 30 minutes", description: "Votre beau-père débarque à l’improviste ? Vous recevez votre ex pour une 8e chance ? Challenge accepted. La team Big Mamma vous livre ses plus grands secrets de chef pour réaliser des plats rapides et ultragourmands. Chaque membre de la squadra a glissé ses tips et anecdotes tout droit sortis de la Botte pour faire de vous une star du forno. Ouvrez ce livre de recettes, respirez, cuisinez, et juste kiffez. C’est le moment d’épater les invités et de régaler toute la famille.", points: 2500 ),
    
    Reward(name: "La cuisine facile pour les hommes sans talent", type: .cookBook, icon: "La cuisine facile pour les hommes sans talent", description: "Tu prends régulièrement la bonne résolution de ne plus te nourrir exclusivement de pizza surgelée et de kebab ? Mais le soir, tu n’as finalement ni le temps ni l’envie de cuisiner pendant des heures ? En plus, tu n’es pas vraiment doué en cuisine ? Arrête les mauvaises excuses ! Tout un chacun est en mesure de se préparer une cuisine saine, gourmande et variée, de manière simple et sans être un cordon bleu. Bruno Gaureau en est un bon exemple. Cet homme-là a dû affronter les mêmes difficultés. Mais contrairement à toi, il a réussi à devenir en peu de temps un cuisinier respectable. La bonne nouvelle : Ce n’est pas si difficile !", points: 800 ),
    
    Reward(name: "Manuel du Cuisinier Amateur Tome 2", type: .cookBook, icon: "Le Manuel du Cuisinier Amateur Tome 2", description: "Le Manuel du Cuisinier Amateur rassemble plus de 150 recettes et techniques permettant à tout  un chacun de revisiter les plus grands classiques comme la blanquette de veau ou le hachis parmentier, de découvrir une multitude d'autres plats emblématiques du monde entier comme le ramen, le dalh ou le BLT mais aussi d'apprendre à manier des techniques et des ustensiles ultra-utiles pour briller en cuisine. Que vous ayez déjà adopté le tome 1, ou pas, ce second manuel a pour vocation de vous (re)donner l’envie de cuisiner seul(e), en famille ou entre amis, de vous servir de livre de chevet ou de dessous de plat, mais aussi, et surtout, de vous régaler lors de vos prochains dîners. ", points: 3500 ),
    
    Reward(name: "COMFORT", type: .cookBook, icon: "Ottolenghi Comfort", description: "Avec plus de 100 recettes, parmi lesquelles de nouvelles versions de classiques à base de pâtes ou de pommes de terre, en cocotte ou au four, COMFORT propose une belle palette de plats à la fois nostalgiques et inattendus, familiers et inventifs. Avec COMFORT, Yotam Ottolenghi et ses coauteurs nous offrent une ode à la nourriture et au fait maison, à ces liens que nous tissons en cuisinant et que nous transmettons autour de nous, d'un endroit à l'autre, d'une génération à l'autre. ", points: 4000 ),
    
    Reward(name: "Vegan pour la vie : Le livre incontournable pour végétaliser son quotidien", type: .cookBook, icon: "Vegan pour la vie", description: "La petite Okara partage dans cet ouvrage des plats vegan variés, riches en saveurs et inventifs. Avec des classiques revisités ou des recettes créatives plus originales, vous trouverez votre bonheur pour tous les moments de la journée et toutes vos envies. En plus des recettes, découvrez des pages de réflexions sur le mode de vie vegan et engagé, mais aussi des sujets plus légers comme des playlists à écouter en cuisinant, des tutos make-up ou encore quelques questions croustillantes de la communauté de La petite Okara. Le but de ce livre ? Vous accompagner en douceur, aussi bien en cuisine que dans la vie de tous les jours pour vous aider à déconstruire les clichés sur le véganisme. Car oui, on peut être vegan parce qu’on aime profiter de la vie", points: 3500 ),
    
    Reward(name: "La Grande bouffe : les recettes pour apprendre à cuisiner en se marrant", type: .cookBook, icon: "la_grande_bouffe", description: "Apprendre à cuisiner en se marrant ! Qu'est-ce qu'on mange ce soir ? Comment on fait des gnocchis ? Je fais quoi de cette aubergine qui traîne depuis 2 semaines ? Toutes ces questions qui se sont souvent soldées par un plat de pâtes au beurre ont enfin une réponse !", points: 2000),
    
    Reward(name: "Recettes et récits", type: .cookBook, icon: "recettes_et_recits", description: "Ma carbonara rodée dans les meilleures trattorias romaines ; mon fameux cake au citron emprunté à Martine, une amie de ma mère ; le poulet à l’estragon transmis par la cheffe 3 étoiles Anne-Sophie Pic, qui la tient de sa maman Suzanne ; ma soupe au lait de coco rapportée de Bangkok ; la pissaladière picorée chez Dominique Le Stanc, le chef de la Merenda à Nice ; l’irrésistible crème caramel de mon enfance…", points: 3500),
    
    Reward(name: "Tomate, feta, huile d'olive & citron", type: .cookBook, icon: "tomate_feta_etc", description: "Tomate, coriandre, burrata, aubergine,  huile d’olive, miel, grenade, basilic, agneau… La cuisine de Lou s’imprègne des saveurs du soleil pour livrer plus de 80 recettes de tous les jours, gourmandes, parfumées, healthy et tout en simplicité : de la tatin de légumes d’été, en passant par la salade colorée de quinoa feta-grenade-basilic, le tajine d’agneau aux pruneaux ou encore la brioche perdue à l’huile d’olive…", points: 2000),
    
    Reward(name: "Avant, j'aimais pas les légumes", type: .cookBook, icon: "avant-j-aimais-pas-les-legumes", description: "Ce livre va vous faire changer d'avis sur les légumes ! À travers 65 recettes créatives et faciles, découvrez une cuisine colorée et pleine de saveurs tout en prenant plaisir à cuisiner. Sublimez les légumes et réalisez des plats qui convaincront même les plus sceptiques ! ", points: 2000),
    
    
    Reward(name: "Le grand livre de la cuisine asiatique", type: .cookBook, icon: "Le-grand-livre-de-la-cuisine-asiatique", description: "Le livre de référence de la cuisine asiatique ! Chine, Japon, Corée, Laos, Vietnam, Thaïlande, Cambodge, Indonésie, Malaisie, Singapour …. Tous les plats incontournables, plus de 150 recettes d'entrées, soupes, salades, viandes, poissons, riz, légumes, œufs, nouilles et desserts. Sans oublier toutes les bases, les gestes incontournable en pas à pas, des infos sur les ustensiles et les ingrédients indispensables et de nombreuses astuces...", points: 3000),
    
    Reward(name: "-30% chez Carrefour ", type: .voucher, icon: "logo carrefour", description: "30% de réduction lors de votre prochain achat chez Carrefour (valable en ligne et en magasin).", points: 2500 ),
    
    Reward(name: "-10% chez Du Bruit dans la Cuisine ", type: .voucher, icon: "logo du bruit dans la cuisine", description: "10% de réduction sur votre prochaine commande sur le site de Du Bruit dans la Cuisine.", points: 500 ),
    
    Reward(name: "Bon de 10€ chez Alice Délice", type: .voucher, icon: "logo alice délice", description: "Un bon d'achat de 10€ sur votre prochaine commande chez Alice Délice.", points: 1500 ),
    
    Reward(name: "Bon de 5€ chez Culinarion", type: .voucher, icon: "logo culinarion", description: "Un bon d'achat de 5€ sur votre prochaine commande chez Culinarion.", points: 1000 ),
    
    Reward(name: "Bon de 5€ chez Hema", type: .voucher, icon: "logo hema", description: "Un bon d'achat de 5€ sur votre prochaine commande chez Hema.", points: 1000 ),
    
    Reward(name: "Bon de 15€ chez Too Good To Go", type: .voucher, icon: "logo too good to go", description: "Un bon d'achat de 15€ sur votre prochaine commande chez Too Good To Go.", points: 2500 ),
    
    Reward(name: "Bon de 20€ chez Bio c' Bon", type: .voucher, icon: "logo_bio_c_bon", description: "Un bon d'achat de 20€ valable sur tous les produits en magasin Bio c' Bon.", points: 3000),
    
    Reward(name: "-15% chez La Maison du Chocolat", type: .voucher, icon: "Logo_LMC", description: "15% de réduction sur votre commande à La Maison du Chocolat.", points: 2500),
    
    Reward(name: "Bon de 25€ chez Nature & Découvertes", type: .voucher, icon: "logo_nature_decouvertes", description: "Profitez de 25€ de réduction sur tous les articles en magasin et en ligne.", points: 3500),
    
    Reward(name: "-20% chez Kusmi Tea", type: .voucher, icon: "logo_kusmi_tea", description: "20% de réduction sur votre prochaine commande de thés et infusions chez Kusmi Tea.", points: 2000),
            
    Reward(name: "Bon de 10€ chez Darty", type: .voucher, icon: "logo_darty", description: "Un bon d'achat de 10€ valable sur livres, loisirs créatifs et papeterie.", points: 1800),
        
    Reward(name: "Bon de 5€ chez Boulanger", type: .voucher, icon: "logo_boulanger", description: "5€ offerts pour tout achat supérieur à 25€ chez Monoprix.", points: 1000)
    
]
