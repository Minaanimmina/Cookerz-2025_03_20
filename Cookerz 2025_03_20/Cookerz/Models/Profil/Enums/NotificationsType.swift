//
//  NotificationsType.swift
//  Cookerz
//
//  Created by Carole TREM on 12/03/2025.
//

enum NotificationsType {
    case likePost
    case abonnement
    case favRecipe
    case challengeStart
    case challengeEnd
    case atelierStart
    
    func image (userImage : String?, challengeImage : String?) -> String? {
        switch self {
        case .likePost :
            return userImage
        case .abonnement:
            return userImage
        case .favRecipe:
            return userImage
        case .challengeStart:
            return challengeImage
        case .challengeEnd:
            return challengeImage
        case .atelierStart:
            return userImage
        }
    }
    func description(nameUser: String?, nameChallenge: String?, nameAtelier: String?) -> String {
        switch self {
        case .likePost :
            return "\(nameUser ?? "") a aimé votre recette !"
        case .abonnement:
            return "\(nameUser ?? "") s'est abonné.e !"
        case .favRecipe:
            return "\(nameUser ?? "") a ajouté votre recette aux favoris !"
        case .challengeStart:
            return "Le challenge \"\(nameChallenge ?? "")\" a commencé !"
        case .challengeEnd:
            return "Le challenge \"\(nameChallenge ?? "")\" est terminé !"
        case .atelierStart:
            return "L'atelier \"\(nameAtelier ?? "")\" a commencé !"
        }
    }
}
