//
//  FontExtensions.swift
//  Cookerz
//
//  Created by apprenant98 on 07/03/2025.
//


import SwiftUI

// création de constantes pour changer facilement le size autant en Regular, Medium et Light
let title3Size : CGFloat = 20
let headlineSize : CGFloat = 17
let bodySize : CGFloat = 17
let calloutSize : CGFloat = 16
let subheadSize : CGFloat = 15
let footnoteSize : CGFloat = 13
let caption1Size : CGFloat = 12
let caption2Size : CGFloat = 11
let caption3Size : CGFloat = 10

// création de .font spéciaux selon nos fonts
extension Font {

    
    // Regular
    
    // func (comme ex .LargeTitle retournant la font et la taille)
    static func PoppinsTitle3() -> Font {
        return .custom("Poppins-Regular", size: title3Size)
    }
    
    
    static func PoppinsHeadline() -> Font {
        
        return .custom("Poppins-Regular", size: headlineSize)
    }
    
    
    static func PoppinsBody() -> Font {
        
        return .custom("Poppins-Regular", size: bodySize)
    }
    
    
    static func PoppinsCallout() -> Font {
        
        return .custom("Poppins-Regular", size: calloutSize)
    }
    
    
    static func PoppinsSubhead() -> Font {
        return .custom("Poppins-Regular", size: subheadSize)
    }
    
    
    static func PoppinsFootnote() -> Font {
        return .custom("Poppins-Regular", size: footnoteSize)
    }
    
    
    static func PoppinsCaption1() -> Font {
        return .custom("Poppins-Regular", size: caption1Size)
    }
    
    static func PoppinsCaption2() -> Font {
        return .custom("Poppins-Regular", size: caption2Size)
    }
    
    
    // Medium
    
    static func PoppinsTitle3Medium() -> Font {
        return .custom("Poppins-Medium", size: title3Size)
    }
    
    
    static func PoppinsHeadlineMedium() -> Font {
        
        return .custom("Poppins-Medium", size: headlineSize)
    }
    
    
    static func PoppinsBodyMedium() -> Font {
        
        return .custom("Poppins-Medium", size: bodySize)
    }
    
    
    static func PoppinsCalloutMedium() -> Font {
        
        return .custom("Poppins-Medium", size: calloutSize)
    }
    
    
    static func PoppinsSubheadMedium() -> Font {
        return .custom("Poppins-Medium", size: subheadSize)
    }
    
    
    static func PoppinsFootnoteMedium() -> Font {
        return .custom("Poppins-Medium", size: footnoteSize)
    }
    
    
    static func PoppinsCaption1Medium() -> Font {
        return .custom("Poppins-Medium", size: caption1Size)
    }
    
    
    static func PoppinsCaption2Medium() -> Font {
        return .custom("Poppins-Medium", size: caption2Size)
    }
    
    static func PoppinsCaption3Medium() -> Font {
        return .custom("Poppins-Medium", size: caption3Size)
    }
    
    
    // Light
    
    static func PoppinsTitle3Light() -> Font {
        return .custom("Poppins-Light", size: title3Size)
    }
    
    
    static func PoppinsHeadlineLight() -> Font {
        
        return .custom("Poppins-Light", size: headlineSize)
    }
    
    
    static func PoppinsBodyLight() -> Font {
        
        return .custom("Poppins-Light", size: bodySize)
    }
    
    
    static func PoppinsCalloutLight() -> Font {
        
        return .custom("Poppins-Light", size: calloutSize)
    }
    
    
    static func PoppinsSubheadLight() -> Font {
        return .custom("Poppins-Light", size: subheadSize)
    }
    
    
    static func PoppinsFootnoteLight() -> Font {
        return .custom("Poppins-Light", size: footnoteSize)
    }
    
    
    static func PoppinsCaption1Light() -> Font {
        return .custom("Poppins-Light", size: caption1Size)
    }
    
    
    static func PoppinsCaption2Light() -> Font {
        return .custom("Poppins-Light", size: caption2Size)
    }
}
