i18n.importData("en", {
    info = {
        cancel_appearance = "Close and cancel appearance change",
        have_sure = "Do you have a sure?"
    },
    BUTTONS = {
        next = "Next",
        confirm = "Confirm",
        back = "Back",
    },
    STEPS_TITLE_AND_SUBTITLE = {
        [ePCStepType.None]          = { '', ''      },
        [ePCStepType.Body]          = { 'Character', 'Character structure'      },
        [ePCStepType.Head]          = { 'Appearance', 'Modify head shape' },
        [ePCStepType.Expressions]   = { 'Face'     , 'Character face appearance'  },
        [ePCStepType.Hair]          = { 'Hair'    , 'Options'                       },
        [ePCStepType.Overlays]      = { 'Skin'    , 'Modify skin aspects'  },
        [ePCStepType.Overlays_two]  = { 'Skin'    , 'Modify skin aspects'  },
        [ePCStepType.Makeup]        = { 'Makeup'    , 'Modify skin aspects'  },
        [ePCStepType.Clothing]      = { 'Clothes'    , 'Choose your initial clothes' },
    
        [ePCStepType.StoreCloth]            = { 'Clothing Store'    , 'Choose new clothing items' },
        [ePCStepType.StoreAccessories]      = { 'Clothing Store'    , 'Choose new clothing items' },    
    },

    STEPS_BUTTONS_TITLE_AND_DESCRIPTION =
    {
        [ePCStepType.None] =
        {
            ['NONE'] = {'PLACEHOLDER', 'PLACEHOLDER'},
        },

        [ePCStepType.Body] =
        {
            [ePCStepImplBodyButtonType.SKIN_COLOR] = { 'Skin Color', 'Select your skin tone.' },
            [ePCStepImplBodyButtonType.BODY_TYPE] = { 'Body Type', 'Select your body type.' },
            [ePCStepImplBodyButtonType.WAIST] = { 'Body Fat', 'Select body fat.' },
            [ePCStepImplBodyButtonType.PORTE] = { 'Physical Build', 'Select your physical build.' },
            [ePCStepImplBodyButtonType.HEIGHT] = { 'Height', 'Select your character\'s height.' },

            [ePCStepImplBodyButtonType.HEADS] = { 'Head', 'Select your appearance base.' },
            [ePCStepImplBodyButtonType.FACE_WIDTH] = { 'Head Width', 'Modify head width.' },

            [ePCStepImplBodyButtonType.WHISTLE_STYLE] = { 'Whistle', 'Select whistle type.' },
            [ePCStepImplBodyButtonType.WHISTLE_PITCH] = { 'Whistle Pitch', 'Select whistle pitch.' },
            [ePCStepImplBodyButtonType.WHISTLE_CLARITY] = { 'Whistle Clarity', 'Select whistle clarity.' },
        },   

        [ePCStepType.Head] =
        {
            [eFaceFeature.CHEEKS_SHAPE] = { 'Cheeks', 'Modify cheek shape' },
            [eFaceFeature.CHEEKS_DEPTH] = { 'Cheek Depth', 'Modify cheek depth' },

            [eFaceFeature.JAW_SHAPE] = { 'Jaw', 'Modify jaw shape' },
            [eFaceFeature.JAW_DEPTH] = { 'Jaw Depth', 'Modify jaw depth' },

            [eFaceFeature.CHIN_SHAPE] = { 'Chin', 'Modify chin shape' },
            [eFaceFeature.CHIN_DEPTH] = { 'Chin Depth', 'Modify chin depth' },

            [eFaceFeature.EAR_SHAPE] = { 'Ear', 'Modify ear shape' },
            [eFaceFeature.EAR_SIZE] = { 'Ear Size', 'Modify ear size' },

            [eFaceFeature.BROW_SHAPE] = { 'Eyebrow', 'Modify eyebrow shape' },
            [eFaceFeature.BROW_DEPTH] = { 'Eyebrow Depth', 'Modify eyebrow depth' },
        },

        [ePCStepType.Expressions] =
        {
            [eFaceFeature.EYES_COLOR] = {'Eyes', 'Select eye type'},
            [eFaceFeature.EYE_SHAPE] = {'Eye Shape', 'Modify eye shape'},
            [eFaceFeature.EYE_SIZE] = {'Eye Size', 'Modify eye size'},
            [eFaceFeature.EYE_POS] = {'Eye Position', 'Modify eye position'},

            [eFaceFeature.NOSE] = {'Nose', ''},
            [eFaceFeature.NOSE_SIZE] = {'Nose Size', 'Modify nose size'},
            [eFaceFeature.NOSE_TIP] = {'Nose Tip', 'Modify nose tip'},

            [eFaceFeature.TEETH_COLOR] = {'Teeth', 'Select tooth arch'},
            [eFaceFeature.MOUTH] = {'Mouth', 'Modify mouth size'},
            [eFaceFeature.MOUTH_POSITION] = {'Mouth Position', 'Modify mouth position'},
            [eFaceFeature.UPPER_LIP_SHAPE] = {'Upper Lip', 'Modify upper lip shape'},
            [eFaceFeature.LOWER_LIP_SHAPE] = {'Lower Lip', 'Modify lower lip shape'},
            [eFaceFeature.LIPS_DEPTH] = {'Lips Depth', 'Modify lips depth'},
        },

        [ePCStepType.Hair] =
        {
            [ePCStepImplHairButtonType.HAIR] = {'Hair', 'Select hair type.'},
            [ePCStepImplHairButtonType.HAIR_COLOR] = {'Hair Color', 'Modify hair color.'},
            
            [ePCStepImplHairButtonType.BEARDS_COMPLETE] = {'Beard', 'Select beard type.'},
            [ePCStepImplHairButtonType.BEARDS_COMPLETE_COLOR] = {'Beard Color', 'Modify beard color.'},

            [eAppearanceFace.FACIALHAIR_COLOR] = {'To Be Shaved', 'Enable or disable beard'},
            [eAppearanceFace.FACIALHAIR_OPACITY] = {'Opacity', 'Select beard opacity'},

            [eAppearanceFace.HEADHAIR_STYLE] = {'To Be Shaved', 'Enable or disable hair.'},
            [eAppearanceFace.HEADHAIR_COLOR] = {'Color', 'Select hair color.'},
            [eAppearanceFace.HEADHAIR_OPACITY] = {'Opacity', 'Select hair opacity.'},
        },

        [ePCStepType.Overlays] =
        {
            [eAppearanceFace.EYEBROWS_COLOR] = {'Color', 'Select dirt opacity'},
            [eAppearanceFace.EYEBROWS_STYLE] = {'Eyebrows', 'Select freckles opacity'},
            [eAppearanceFace.EYEBROWS_OPACITY] = {'Opacity', 'Select freckles opacity'},

            [eAppearanceFace.COMPLEXION_STYLE] = {'Sun Marks', 'Select sun mark.'},
            [eAppearanceFace.COMPLEXION_OPACITY] = {'Opacity', 'Select sun mark opacity.'},

            [eAppearanceFace.SCAR_STYLE] = {'Scar', 'Customize facial scars and marks.'},
            [eAppearanceFace.SCAR_COLOR] = {'Color', 'Customize facial scars and marks.'},
            [eAppearanceFace.SCAR_OPACITY] = {'Opacity', 'Select scar and mark opacity.'},

            [eAppearanceFace.SPOTS_STYLE] = {'Pimples', 'Select amount of pimples on face.'},
            [eAppearanceFace.SPOTS_OPACITY] = {'Opacity', 'Select pimple opacity.'},
        },

        [ePCStepType.Overlays_two] =
        {
            [eAppearanceFace.FRECKLES_STYLE] = {'Freckles', 'Select freckle type'},
            [eAppearanceFace.FRECKLES_OPACITY] = {'Opacity', 'Select freckle opacity'},
            
            [eAppearanceFace.GRIME_STYLE] = {'Dirt', 'Select dirt type'},
            [eAppearanceFace.GRIME_OPACITY] = {'Opacity', 'Select dirt opacity'},
            
            [eAppearanceFace.MOLES_STYLE] = {'Moles', 'Select mole type'},
            [eAppearanceFace.MOLES_OPACITY] = {'Opacity', 'Select mole opacity'},

            [eAppearanceFace.SKIN_MOTTLING_STYLE] = {'Discoloration', 'Select discoloration type'},
            [eAppearanceFace.SKIN_MOTTLING_OPACITY] = {'Opacity', 'Select discoloration opacity'},
            
            [eAppearanceFace.AGEING_STYLE] = { 'Aging Marks', 'Aging marks and deformations on face.' },
            [eAppearanceFace.AGEING_OPACITY] = { 'Opacity', 'Aging marks and deformations on face.' },
        },

        [ePCStepType.Makeup] =
        {
            [eAppearanceFace.FACEPAINT_COLOR] = {'Face Paint', 'Select face paint color'},
            [eAppearanceFace.FACEPAINT_OPACITY] = {'Opacity', 'Select face paint opacity'},

            [eAppearanceFace.FOUNDATION_COLOR] = {'Foundation', 'Select foundation color'},
            [eAppearanceFace.FOUNDATION_OPACITY] = {'Opacity', 'Select foundation opacity'},

            [eAppearanceFace.BLUSHER_STYLE] = {'Blush', 'Select blush style'},
            [eAppearanceFace.BLUSHER_COLOR] = {'Color', 'Select blush color'},
            [eAppearanceFace.BLUSHER_OPACITY] = {'Opacity', 'Select blush opacity'},

            [eAppearanceFace.EYELINER_COLOR] = {'Eyeliner', 'Select eyeliner color'},
            [eAppearanceFace.EYELINER_OPACITY] = {'Opacity', 'Select eyeliner opacity'},

            [eAppearanceFace.LIPSTICK_COLOR] = {'Lipstick', 'Select lipstick opacity'},
            [eAppearanceFace.LIPSTICK_OPACITY] = {'Lipstick Opacity', 'Select lipstick opacity'},
            
            [eAppearanceFace.EYESHADOW_COLOR] = {'Eyeshadow', 'Select eyeshadow opacity'},
            [eAppearanceFace.EYESHADOW_OPACITY] = {'Eyeshadow Opacity', 'Select eyeshadow opacity'},
        },

        [ePCStepType.Clothing] =
        {
            [ePCStepImplClothingButtonType.HATS] = {'Hat', 'Select your hat'},
            [ePCStepImplClothingButtonType.HATS_COLOR] = {'Hat Color', 'Select your hat color'},

            [ePCStepImplClothingButtonType.SHIRTS_FULL] = {'Shirt', 'Select your shirt'},
            [ePCStepImplClothingButtonType.SHIRTS_FULL_COLOR] = {'Shirt Color', 'Select your shirt color'},

            [ePCStepImplClothingButtonType.PANTS] = {'Pants', 'Select your pants'},
            [ePCStepImplClothingButtonType.PANTS_COLOR] = {'Pants Color', 'Select your pants color'},

            [ePCStepStoreClothButtonType.VESTS] = {'Vest', 'Select your vest'},
            [ePCStepStoreClothButtonType.VESTS_COLOR] = {'Color', 'Select your vest color'},

            [ePCStepStoreClothButtonType.BOOTS] = {'Footwear', 'Select your footwear'},
            [ePCStepStoreClothButtonType.BOOTS_COLOR] = {'Color', 'Select your footwear color'},

            [ePCStepStoreClothButtonType.COATS] = {'Coat', 'Select your coat'},
            [ePCStepStoreClothButtonType.COATS_COLOR] = {'Color', 'Select your coat color'},

            [ePCStepStoreClothButtonType.COATS_CLOSED] = {'Closed Coat', 'Select your closed coat'},
            [ePCStepStoreClothButtonType.COATS_CLOSED_COLOR] = {'Color', 'Select your closed coat color'},

            [ePCStepStoreClothButtonType.NECKTIES] = {'Tie', 'Select your tie'},
            [ePCStepStoreClothButtonType.NECKTIES_COLOR] = {'Color', 'Select your tie color'},

            [ePCStepStoreClothButtonType.GUNBELTS] = {'Holster', 'Select your holster'},
            [ePCStepStoreClothButtonType.GUNBELTS_COLOR] = {'Color', 'Select your holster color'},
        },

        [ePCStepType.StoreCloth] =
        {
            [ePCStepStoreClothButtonType.HATS] = {'Hat', 'Select your hat'},
            [ePCStepStoreClothButtonType.HATS_COLOR] = {'Color', 'Select your hat color'},

            [ePCStepStoreClothButtonType.SHIRTS_FULL] = {'Shirt', 'Select your shirt'},
            [ePCStepStoreClothButtonType.SHIRTS_FULL_COLOR] = {'Color', 'Select your shirt color'},

            [ePCStepStoreClothButtonType.VESTS] = {'Vest', 'Select your vest'},
            [ePCStepStoreClothButtonType.VESTS_COLOR] = {'Color', 'Select your vest color'},

            [ePCStepStoreClothButtonType.PANTS] = {'Pants', 'Select your pants'},
            [ePCStepStoreClothButtonType.PANTS_COLOR] = {'Color', 'Select your pants color'},

            [ePCStepStoreClothButtonType.BOOTS] = {'Footwear', 'Select your footwear'},
            [ePCStepStoreClothButtonType.BOOTS_COLOR] = {'Color', 'Select your footwear color'},

            [ePCStepStoreClothButtonType.COATS] = {'Coat', 'Select your coat'},
            [ePCStepStoreClothButtonType.COATS_COLOR] = {'Color', 'Select your coat color'},

            [ePCStepStoreClothButtonType.COATS_CLOSED] = {'Closed Coat', 'Select your closed coat'},
            [ePCStepStoreClothButtonType.COATS_CLOSED_COLOR] = {'Color', 'Select your closed coat color'},

            [ePCStepStoreClothButtonType.CHAPS] = {'Chaps', 'Select your chaps'},
            [ePCStepStoreClothButtonType.CHAPS_COLOR] = {'Color', 'Select your chaps color'},

            [ePCStepStoreClothButtonType.PONCHOS] = {'Poncho', 'Select your poncho'},
            [ePCStepStoreClothButtonType.PONCHOS_COLOR] = {'Color', 'Select your poncho color'},

            [ePCStepStoreClothButtonType.NECKTIES] = {'Tie', 'Select your tie'},
            [ePCStepStoreClothButtonType.NECKTIES_COLOR] = {'Color', 'Select your tie color'},

            [ePCStepStoreClothButtonType.LOADOUTS] = {'Bandolier', 'Select your bandolier'},
            [ePCStepStoreClothButtonType.LOADOUTS_COLOR] = {'Color', 'Select your bandolier color'},

            [ePCStepStoreClothButtonType.SUSPENDERS] = {'Suspenders', 'Select your suspenders'},
            [ePCStepStoreClothButtonType.SUSPENDERS_COLOR] = {'Color', 'Select your suspenders color'},

            [ePCStepStoreClothButtonType.GLOVES] = {'Gloves', 'Select your gloves'},
            [ePCStepStoreClothButtonType.GLOVES_COLOR] = {'Color', 'Select your gloves color'},

            [ePCStepStoreClothButtonType.BELTS] = {'Belt', 'Select your belt'},
            [ePCStepStoreClothButtonType.BELTS_COLOR] = {'Color', 'Select your belt color'},

            [ePCStepStoreClothButtonType.BELT_BUCKLES] = {'Belt Buckle', 'Select your belt buckle'},
            [ePCStepStoreClothButtonType.BELT_BUCKLES_COLOR] = {'Color', 'Select your belt buckle color'},

            [ePCStepStoreClothButtonType.GUNBELTS] = {'Holster', 'Select your holster'},
            [ePCStepStoreClothButtonType.GUNBELTS_COLOR] = {'Color', 'Select your holster color'},

            [ePCStepStoreClothButtonType.HOLSTERS_LEFT] = {'Secondary Holster', 'Select your holster'},
            [ePCStepStoreClothButtonType.HOLSTERS_LEFT_COLOR] = {'Color', 'Select your holster color'},

            [ePCStepStoreClothButtonType.SKIRTS] = {'Skirt', 'Select your skirt'},
            [ePCStepStoreClothButtonType.SKIRTS_COLOR] = {'Color', 'Select your skirt color'},
        },

        [ePCStepType.StoreAccessories] =
        {
            [ePCStepStoreAccessoriesButtonType.BOOT_ACCESSORIES] = {'Boot Accessories', 'Select your boot accessories'},
            [ePCStepStoreAccessoriesButtonType.BOOT_ACCESSORIES_COLOR] = {'Color', 'Select your boot accessories color'},

            [ePCStepStoreAccessoriesButtonType.MASKS] = {'Mask', 'Select your mask'},
            [ePCStepStoreAccessoriesButtonType.MASKS_COLOR] = {'Color', 'Select your mask color'},

            [ePCStepStoreAccessoriesButtonType.SPATS] = {'Spats', 'Select your spats'},
            [ePCStepStoreAccessoriesButtonType.SPATS_COLOR] = {'Color', 'Select your spats color'},

            [ePCStepStoreAccessoriesButtonType.EYEWEAR] = {'Eyewear', 'Select your eyewear'},
            [ePCStepStoreAccessoriesButtonType.EYEWEAR_COLOR] = {'Color', 'Select your eyewear color'},

            [ePCStepStoreAccessoriesButtonType.NECKWEAR] = {'Neckwear', 'Select your neckwear'},
            [ePCStepStoreAccessoriesButtonType.NECKWEAR_COLOR] = {'Color', 'Select your neckwear color'},

            [ePCStepStoreAccessoriesButtonType.ACCESSORIES] = {'Accessories', 'Select your accessories'},
            [ePCStepStoreAccessoriesButtonType.ACCESSORIES_COLOR] = {'Color', 'Select your accessories color'},
            
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_RIGHT] = {'Right Hand Jewelry', 'Select your right hand jewelry'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_RIGHT_COLOR] = {'Color', 'Select your right hand jewelry color'},

            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_LEFT] = {'Left Hand Jewelry', 'Select your left hand jewelry'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_LEFT_COLOR] = {'Color', 'Select your left hand jewelry color'},
            
            [ePCStepStoreAccessoriesButtonType.JEWELRY_BRACELETS] = {'Bracelets', 'Select your bracelets'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_BRACELETS_COLOR] = {'Color', 'Select your bracelets color'},

            [ePCStepStoreAccessoriesButtonType.GAUNTLETS] = {'Gauntlets', 'Select your gauntlets'},
            [ePCStepStoreAccessoriesButtonType.GAUNTLETS_COLOR] = {'Color', 'Select your gauntlets color'},

            [ePCStepStoreAccessoriesButtonType.SATCHELS] = {'Satchels', 'Select your satchels'},
            [ePCStepStoreAccessoriesButtonType.SATCHELS_COLOR] = {'Color', 'Select your satchels color'},
        },
    }
})