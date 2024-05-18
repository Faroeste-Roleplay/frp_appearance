DEBUG_MODE = true

PriceDefaultToPay = 2

ePCStepType =
{
    None = 0,
    Body = 1,
    Head = 2,
    Expressions = 3,
    Hair = 4,
    Overlays = 5,
    Overlays_two = 6,
    Makeup = 7,
    Clothing = 8,
    StoreCloth = 9,
    StoreAccessories = 10,
}

eFaceFeature = {

    CHEEKS_SHAPE = 'CheeksShape',
    CHEEKS_DEPTH = 'CheeksDepth',

    JAW_SHAPE = 'JawShape',
    JAW_DEPTH = 'JawDepth',

    CHIN_SHAPE = 'ChinShape',
    CHIN_DEPTH = 'ChinDepth',

    EAR_SHAPE = 'EarShape',
    EAR_SIZE = 'EarSize',

    BROW_SHAPE = 'BrowShape',
    BROW_DEPTH = 'BrowDepth',

    EYE_SHAPE = 'EyeShape',
    EYE_SIZE = 'EyeSize',
    EYE_POS = 'EyePos',

    NOSE = 'NoseShape',
    NOSE_SIZE = 'NoseSize',
    NOSE_TIP = 'NoseTip',

    MOUTH = 'Mouth',
    MOUTH_POSITION = 'MouthPosition',
    UPPER_LIP_SHAPE = 'UpperLipShape',
    LOWER_LIP_SHAPE = 'LowerLipShape',
    LIPS_DEPTH = 'LipsDepth',

    FACE_WIDTH = 'FaceWidth',

    -- others ff
    EYES_COLOR = "EYES_COLOR",
    TEETH_COLOR = "TEETH_COLOR"
}

ePCStepImplBodyButtonType =
{
    PLACEHOLDER = 'PLACEHOLDER',

    SKIN_COLOR      = 'SKIN_COLOR',
    BODY_TYPE       = 'BODY_TYPE',
    PORTE           = 'PORTE',
    WAIST           = 'WAIST',
    HEIGHT          = 'HEIGHT',

    HEADS           = 'HEADS',
    FACE_WIDTH      = 'FACE_WIDTH',
    
    WHISTLE_STYLE   = 'WHISTLE_STYLE',
    WHISTLE_PITCH   = 'WHISTLE_PITCH',
    WHISTLE_CLARITY = 'WHISTLE_CLARITY',
}

eAppearanceFace =
{
    LIPSTICK_STYLE   = 'LipstickStyle',
    LIPSTICK_COLOR   = 'LipstickColor',
    LIPSTICK_OPACITY = 'LipstickOpacity',

    EYESHADOW_STYLE   = 'EyeshadowStyle',
    EYESHADOW_COLOR   = 'EyeshadowColor',
    EYESHADOW_OPACITY = 'EyeshadowOpacity',
    
    EYEBROWS_STYLE   = 'EyebrowsStyle',
    EYEBROWS_COLOR   = 'EyebrowsColor',
    EYEBROWS_OPACITY = 'EyebrowsOpacity',
    
    EYELINER_STYLE   = 'EyeLinerStyle',
    EYELINER_COLOR   = 'EyeLinerColor',
    EYELINER_OPACITY = 'EyeLinerOpacity',

    FACIALHAIR_STYLE   = 'FacialHairStyle',
    FACIALHAIR_COLOR   = 'FacialHairColor',
    FACIALHAIR_OPACITY = 'FacialHairOpacity',

    HEADHAIR_STYLE   = 'HeadHairStyle',
    HEADHAIR_COLOR   = 'HeadHairColor',
    HEADHAIR_OPACITY = 'HeadHairOpacity',

    FACEPAINT_STYLE   = 'FacePaintStyle',
    FACEPAINT_COLOR   = 'FacePaintColor',
    FACEPAINT_OPACITY = 'FacePaintOpacity',

    AGEING_STYLE   = 'AgeingStyle',
    AGEING_COLOR   = 'AgeingColor',
    AGEING_OPACITY = 'AgeingOpacity',

    BLUSHER_STYLE   = 'BlusherStyle',
    BLUSHER_COLOR   = 'BlusherColor',
    BLUSHER_OPACITY = 'BlusherOpacity',

    FOUNDATION_STYLE   = 'FoundationStyle',
    FOUNDATION_COLOR   = 'FoundationColor',
    FOUNDATION_OPACITY = 'FoundationOpacity',

    ACNE_STYLE   = 'AcneStyle',
    ACNE_COLOR   = 'AcneColor',
    ACNE_OPACITY = 'AcneOpacity',

    SCAR_STYLE   = 'ScarStyle',
    SCAR_COLOR   = 'ScarColor',
    SCAR_OPACITY = 'ScarOpacity',

    COMPLEXION_STYLE   = 'ComplexionStyle',
    COMPLEXION_COLOR   = 'ComplexionColor',
    COMPLEXION_OPACITY = 'ComplexionOpacity',

    SKIN_MOTTLING_STYLE   = 'SkinMottlingStyle',
    SKIN_MOTTLING_COLOR   = 'SkinMottlingColor',
    SKIN_MOTTLING_OPACITY = 'SkinMottlingOpacity',

    FRECKLES_STYLE   = 'FrecklesStyle',
    FRECKLES_COLOR   = 'FrecklesColor',
    FRECKLES_OPACITY = 'FrecklesOpacity',
    
    GRIME_STYLE   = 'GrimeStyle',
    GRIME_COLOR   = 'GrimeColor',
    GRIME_OPACITY = 'GrimeOpacity',
    
    MOLES_STYLE   = 'MolesStyle',
    MOLES_COLOR   = 'MolesColor',
    MOLES_OPACITY = 'MolesOpacity',

    SPOTS_STYLE   = 'SpotsStyle',
    SPOTS_COLOR   = 'SpotsColor',
    SPOTS_OPACITY = 'SpotsOpacity'
}

ePCStepImplHairButtonType =
{
    PLACEHOLDER = 'PLACEHOLDER',

    HAIR      = 'HAIR',
    HAIR_COLOR       = 'HAIR_COLOR',

    BEARDS_COMPLETE       = 'BEARDS_COMPLETE',
    BEARDS_COMPLETE_COLOR = 'BEARDS_COMPLETE_COLOR'
}

ePCStepStoreClothButtonType =
{
    PLACEHOLDER = 'PLACEHOLDER',

    HATS                = 'HATS',
    HATS_COLOR          = 'HATS_COLOR',

    SHIRTS_FULL         = 'SHIRTS_FULL',
    SHIRTS_FULL_COLOR   = 'SHIRTS_FULL_COLOR',

    VESTS               = 'VESTS',
    VESTS_COLOR         = 'VESTS_COLOR',

    COATS               = 'COATS',
    COATS_COLOR         = 'COATS_COLOR',
    
    COATS_CLOSED        = 'COATS_CLOSED',
    COATS_CLOSED_COLOR  = 'COATS_CLOSED_COLOR',
    
    CHAPS               = 'CHAPS',
    CHAPS_COLOR         = 'CHAPS_COLOR',

    PONCHOS             = 'PONCHOS',
    PONCHOS_COLOR       = 'PONCHOS_COLOR',

    NECKTIES            = 'NECKTIES',
    NECKTIES_COLOR      = 'NECKTIES_COLOR',

    LOADOUTS            = 'LOADOUTS',
    LOADOUTS_COLOR      = 'LOADOUTS_COLOR',

    SUSPENDERS          = 'SUSPENDERS',
    SUSPENDERS_COLOR    = 'SUSPENDERS_COLOR',

    GLOVES              = 'GLOVES',
    GLOVES_COLOR        = 'GLOVES_COLOR',
    
    BELTS               = 'BELTS',
    BELTS_COLOR         = 'BELTS_COLOR',

    BELT_BUCKLES        = 'BELT_BUCKLES',
    BELT_BUCKLES_COLOR  = 'BELT_BUCKLES_COLOR',

    GUNBELTS        = 'GUNBELTS',
    GUNBELTS_COLOR  = 'GUNBELTS_COLOR',

    HOLSTERS_LEFT        = 'HOLSTERS_LEFT',
    HOLSTERS_LEFT_COLOR  = 'HOLSTERS_LEFT_COLOR',
        
    SKIRTS               = 'SKIRTS',
    SKIRTS_COLOR         = 'SKIRTS_COLOR',

    PANTS               = 'PANTS',
    PANTS_COLOR         = 'PANTS_COLOR',

    BOOTS               = 'BOOTS',
    BOOTS_COLOR         = 'BOOTS_COLOR'
}

ePCStepImplClothingButtonType =
{
    PLACEHOLDER = 'PLACEHOLDER',

    HATS                = 'HATS',
    HATS_COLOR          = 'HATS_COLOR',

    SHIRTS_FULL         = 'SHIRTS_FULL',
    SHIRTS_FULL_COLOR   = 'SHIRTS_FULL_COLOR',

    VESTS               = 'VESTS',
    VESTS_COLOR         = 'VESTS_COLOR',

    COATS               = 'COATS',
    COATS_COLOR         = 'COATS_COLOR',
    
    COATS_CLOSED        = 'COATS_CLOSED',
    COATS_CLOSED_COLOR  = 'COATS_CLOSED_COLOR',

    NECKTIES            = 'NECKTIES',
    NECKTIES_COLOR      = 'NECKTIES_COLOR',

    GUNBELTS            = 'GUNBELTS',
    GUNBELTS_COLOR      = 'GUNBELTS_COLOR',

    PANTS               = 'PANTS',
    PANTS_COLOR         = 'PANTS_COLOR',

    BOOTS               = 'BOOTS',
    BOOTS_COLOR         = 'BOOTS_COLOR'
}

ePCStepStoreAccessoriesButtonType =
{
    PLACEHOLDER = 'PLACEHOLDER',

    BOOT_ACCESSORIES            = 'BOOT_ACCESSORIES',
    BOOT_ACCESSORIES_COLOR      = 'BOOT_ACCESSORIES_COLOR',

    MASKS                       = 'MASKS',
    MASKS_COLOR                 = 'MASKS_COLOR',
    
    SPATS                       = 'SPATS',
    SPATS_COLOR                 = 'SPATS_COLOR',

    EYEWEAR                     = 'EYEWEAR',
    EYEWEAR_COLOR               = 'EYEWEAR_COLOR',

    NECKWEAR                    = 'NECKWEAR',
    NECKWEAR_COLOR              = 'NECKWEAR_COLOR',

    ACCESSORIES                 = 'ACCESSORIES',
    ACCESSORIES_COLOR           = 'ACCESSORIES_COLOR',
    
    JEWELRY_RINGS_RIGHT         = 'JEWELRY_RINGS_RIGHT',
    JEWELRY_RINGS_RIGHT_COLOR   = 'JEWELRY_RINGS_RIGHT_COLOR',
    
    JEWELRY_RINGS_LEFT          = 'JEWELRY_RINGS_LEFT',
    JEWELRY_RINGS_LEFT_COLOR    = 'JEWELRY_RINGS_LEFT_COLOR',
    
    JEWELRY_BRACELETS           = 'JEWELRY_BRACELETS',
    JEWELRY_BRACELETS_COLOR     = 'JEWELRY_BRACELETS_COLOR',
    
    GAUNTLETS                   = 'GAUNTLETS',
    GAUNTLETS_COLOR             = 'GAUNTLETS_COLOR',
    
    SATCHELS                    = 'SATCHELS',
    SATCHELS_COLOR              = 'SATCHELS_COLOR',
}