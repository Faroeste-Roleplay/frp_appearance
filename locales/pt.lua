i18n.importData("pt", {
    info = {
        cancel_appearance = "Fechar e cancelar?",
        have_sure = "Tem certeza que deseja cancelar?",
        save_new_outfit = "Deseja salvar como um novo outfit?",
        new_outfit_name = "Qual o nome do novo outfit?",
        outfit = "Outfit",
    },
    error = {
        does_not_have_money = "Não tem $%s",
    },
    BUTTONS = {
        next = "Próximo",
        confirm = "Confirmar",
        back = "Voltar",
    },
    STEPS_TITLE_AND_SUBTITLE = {
        [ePCStepType.None]          = { '', ''      },
        [ePCStepType.Body]          = { 'Personagem', 'Estrutura do personagem'      },
        [ePCStepType.Head]          = { 'Aparência', 'Modifique o formato da cabeça' },
        [ePCStepType.Expressions]   = { 'Rosto'     , 'Aparência do seu personagem'  },
        [ePCStepType.Hair]          = { 'Cabelo'    , 'Opções'                       },
        [ePCStepType.Overlays]      = { 'Pele'    , 'Modifique os aspêctos da pele'  },
        [ePCStepType.Overlays_two]  = { 'Pele'    , 'Modifique os aspêctos da pele'  },
        [ePCStepType.Makeup]        = { 'Maquiagem'    , 'Modifique os aspêctos da pele'  },
        [ePCStepType.Clothing]      = { 'Roupas'    , 'Escolha suas roupas iniciais' },
    
        [ePCStepType.StoreCloth]            = { 'Loja de Roupa'    , 'Escolha novas peças de roupas' },
        [ePCStepType.StoreAccessories]      = { 'Loja de Roupa'    , 'Escolha novas peças de roupas' },
    },

    STEPS_BUTTONS_TITLE_AND_DESCRIPTION =
    {
        [ePCStepType.None] =
        {
            ['NONE'] = {'PLACEHOLDER', 'PLACEHOLDER'},
        },

        [ePCStepType.Body] =
        {
            [ePCStepImplBodyButtonType.SKIN_COLOR] = { 'Cor da Pele', 'Selecione seu tom de pele.' },
            [ePCStepImplBodyButtonType.BODY_TYPE] = { 'Pele [tipo]', 'Selecione seu tipo de pele.' },
            [ePCStepImplBodyButtonType.WAIST] = { 'Gordura corporal', 'Selecione a gordura corporal.' },
            [ePCStepImplBodyButtonType.PORTE] = { 'Porte Físico', 'Selecione a estrutura do seu porte físico.' },
            [ePCStepImplBodyButtonType.HEIGHT] = { 'Altura', 'Selecione a altura de seu personagem.' },

            [ePCStepImplBodyButtonType.HEADS] = { 'Cabeça', 'Selecione a base de sua aparência.' },
            [ePCStepImplBodyButtonType.FACE_WIDTH] = { 'Largura da Cabeça', 'Modifique a largura da cabeça.' },

            [ePCStepImplBodyButtonType.WHISTLE_STYLE] = { 'Assovio', 'Selecione o tipo do assovio.' },
            [ePCStepImplBodyButtonType.WHISTLE_PITCH] = { 'Ass. Tom', 'Selecione o tom do assovio.' },
            [ePCStepImplBodyButtonType.WHISTLE_CLARITY] = { 'Ass. Clareza', 'Selecione a clareza do assovio.' },
        },   

        [ePCStepType.Head] =
        {
            [eFaceFeature.CHEEKS_SHAPE] = { 'Bochecha', 'Modifique a forma das bochechas' },
            [eFaceFeature.CHEEKS_DEPTH] = { 'Profundidade das bochechas', 'Modifique a profundidade das bochechas' },

            [eFaceFeature.JAW_SHAPE] = { 'Mandíbula', 'Modifique a forma da mandíbula' },
            [eFaceFeature.JAW_DEPTH] = { 'Profundidade da Mandíbula', 'Modifique a profundidade da mandíbula' },

            [eFaceFeature.CHIN_SHAPE] = { 'Queixo', 'Modifique a forma do queixo' },
            [eFaceFeature.CHIN_DEPTH] = { 'Profundidade do Queixo', 'Modifique a profundidade do queixo' },
            
            [eFaceFeature.EAR_SHAPE] = { 'Orelha', 'Modifique a forma das orelhas' },
            [eFaceFeature.EAR_SIZE] = { 'Tamanho das Orelhas', 'Modifique o tamanho das orelhas"' },
            
            [eFaceFeature.BROW_SHAPE] = { 'Supercílio', 'Modifique a forma do Supercílio' },
            [eFaceFeature.BROW_DEPTH] = { 'Profundidade do Supercílio', 'Modifique a profundidade da Supercílio' },
        },
        
        [ePCStepType.Expressions] =
        {
            [eFaceFeature.EYES_COLOR] = {'Olhos', 'Selecione o tipo de olho'},
            [eFaceFeature.EYE_SHAPE] = {'Forma do olho', 'Modifique a forma dos olhos'},
            [eFaceFeature.EYE_SIZE] = {'Tamanho dos Olhos', 'Modifique o tamanho dos olhos'},
            [eFaceFeature.EYE_POS] = {'Posição dos Olhos', 'Modifique a posição dos olhos'},

            [eFaceFeature.NOSE] = {'Nariz', ''},
            [eFaceFeature.NOSE_SIZE] = {'Tamanho do Nariz', 'Modifique o tamanho do nariz'},
            [eFaceFeature.NOSE_TIP] = {'Ponta do Nariz', 'Modifique a ponta do nariz'},

            [eFaceFeature.TEETH_COLOR] = {'Dentes', 'Selecione a arcada dentária'},
            [eFaceFeature.MOUTH] = {'Boca', 'Modifique o tamanho da boca'},
            [eFaceFeature.MOUTH_POSITION] = {'Posição da Boca', 'Modifique a posição da boca'},
            [eFaceFeature.UPPER_LIP_SHAPE] = {'Lábio Superior', 'Modifique a forma do lábio superior'},
            [eFaceFeature.LOWER_LIP_SHAPE] = {'Lábio Inferior', 'Modifique a forma do lábio inferior'},
            [eFaceFeature.LIPS_DEPTH] = {'Prof. dos Lábios', 'Modifique a profundidade dos lábios'},
        },

        [ePCStepType.Hair] =
        {
            [ePCStepImplHairButtonType.HAIR] = {'Cabelo', 'Selecione o tipo de cabelo.'},
            [ePCStepImplHairButtonType.HAIR_COLOR] = {'Cor do cabelo', 'Modifique a cor do cabelo.'},
            
            [ePCStepImplHairButtonType.BEARDS_COMPLETE] = {'Barba', 'Selecione o tipo de barba.'},
            [ePCStepImplHairButtonType.BEARDS_COMPLETE_COLOR] = {'Cor da barba', 'Modifique a cor do barba.'},

            [eAppearanceFace.FACIALHAIR_COLOR] = {'Barba a Fazer', 'Ative ou desative a barba'},
            [eAppearanceFace.FACIALHAIR_OPACITY] = {'Opacidade', 'Selecione a opacidade da barba'},
            
            [eAppearanceFace.HEADHAIR_STYLE] = {'Cabelo a Fazer', 'Ative ou desative o cabelo.'},
            [eAppearanceFace.HEADHAIR_COLOR] = {'Cor', 'Selecione a cor do cabelo.'},
            [eAppearanceFace.HEADHAIR_OPACITY] = {'Opacidade', 'Selecione a opacidade do cabelo.'},
        },

        [ePCStepType.Overlays] =
        {
            [eAppearanceFace.EYEBROWS_COLOR] = {'Cor', 'Selecione a opacidade da sujeira'},
            [eAppearanceFace.EYEBROWS_STYLE] = {'Sobrancelhas', 'Selecione a opacidade das sardas'},
            [eAppearanceFace.EYEBROWS_OPACITY] = {'Opacidade', 'Selecione a opacidade das sardas'},

            [eAppearanceFace.COMPLEXION_STYLE] = {'Marcas de Sol', 'Selecione uma marca de sol.'},
            [eAppearanceFace.COMPLEXION_OPACITY] = {'Opacity', 'Selecione a opacidade das marcas de sol.'},

            [eAppearanceFace.SCAR_STYLE] = {'Cicatriz', 'Personalizar manchas e marcas nos rosto.'},
            [eAppearanceFace.SCAR_COLOR] = {'Cor', 'Personalizar manchas e marcas nos rosto.'},
            [eAppearanceFace.SCAR_OPACITY] = {'Opacidade', 'Selecione a opacidade das manchas e marcas nos rosto.'},
            
            [eAppearanceFace.SPOTS_STYLE] = {'Espinhas', 'Selecione a quantidade de espinhas no rosto.'},
            [eAppearanceFace.SPOTS_OPACITY] = {'Opacidade', 'Selecione a opacidade de espinhas no rosto.'},

        },

        [ePCStepType.Overlays_two] =
        {
            [eAppearanceFace.FRECKLES_STYLE] = {'Sardas', 'Selecione o tipo de sarda'},
            [eAppearanceFace.FRECKLES_OPACITY] = {'Opacidade', 'Selecione a opacidade das sardas'},
            
            [eAppearanceFace.GRIME_STYLE] = {'Sujeira', 'Selecione o tipo de sujeira'},
            [eAppearanceFace.GRIME_OPACITY] = {'Opacidade', 'Selecione a opacidade da sujeira'},
            
            [eAppearanceFace.MOLES_STYLE] = {'Verrugas', 'Selecione o tipo de Verruga'},
            [eAppearanceFace.MOLES_OPACITY] = {'Opacidade', 'Selecione a opacidade das Verrugas'},

            [eAppearanceFace.SKIN_MOTTLING_STYLE] = {'Descoloração', 'Selecione o tipo de Descoloração'},
            [eAppearanceFace.SKIN_MOTTLING_OPACITY] = {'Opacidade', 'Selecione o tipo de Descoloração'},
            
            [eAppearanceFace.AGEING_STYLE] = { 'Marcas de Velhice', 'Deformações e marcas de velhice no rosto.' },
            [eAppearanceFace.AGEING_OPACITY] = { 'Opacidade', 'Deformações e marcas de velhice no rosto.' },
        },

        [ePCStepType.Makeup] =
        {
            /*
            [eAppearanceFace.FACEPAINT_COLOR] = {'Mascara', 'Selecione a cor da mascara'},
            [eAppearanceFace.FACEPAINT_OPACITY] = {'Opacidade', 'Selecione a opacidade da mascara'},
            */

            [eAppearanceFace.FOUNDATION_COLOR] = {'Base', 'Selecione a cor da base'},
            [eAppearanceFace.FOUNDATION_OPACITY] = {'Opacidade', 'Selecione a opacidade da base'},

            [eAppearanceFace.BLUSHER_STYLE] = {'Blush', 'Selecione a estilo do Blush'},
            [eAppearanceFace.BLUSHER_COLOR] = {'Cor', 'Selecione a cor do Blush'},
            [eAppearanceFace.BLUSHER_OPACITY] = {'Opacidade', 'Selecione a opacidade do Blush'},

            [eAppearanceFace.EYELINER_COLOR] = {'Deleniador', 'Selecione a cor do deleniador'},
            [eAppearanceFace.EYELINER_OPACITY] = {'Opacidade', 'Selecione a opacidade das deleniador'},

            [eAppearanceFace.LIPSTICK_COLOR] = {'Batom', 'Selecione a opacidade das sardas'},
            [eAppearanceFace.LIPSTICK_OPACITY] = {'Batom Opacidade', 'Selecione a opacidade das sardas'},
            
            [eAppearanceFace.EYESHADOW_COLOR] = {'Sombra', 'Selecione a opacidade da sujeira'},
            [eAppearanceFace.EYESHADOW_OPACITY] = {'Sombra Opacidade', 'Selecione a opacidade das sardas'},
        },

        [ePCStepType.Clothing] =
        {
            [ePCStepImplClothingButtonType.HATS] = {'Chapéu', 'Selecione seu chapeú'},
            [ePCStepImplClothingButtonType.HATS_COLOR] = {'Cor do Chapéu', 'Selecione cor do seu chapeú'},

            [ePCStepImplClothingButtonType.SHIRTS_FULL] = {'Camisa', 'Selecione sua camisa'},
            [ePCStepImplClothingButtonType.SHIRTS_FULL_COLOR] = {'Cor da Camisa', 'Selecione dor da sua camisa'},

            [ePCStepImplClothingButtonType.PANTS] = {'Calça', 'Selecione sua calça'},
            [ePCStepImplClothingButtonType.PANTS_COLOR] = {'Cor da Calça', 'Selecione cor da sua calça'},

            [ePCStepStoreClothButtonType.VESTS] = {'Colete', 'Selecione seu colete'},
            [ePCStepStoreClothButtonType.VESTS_COLOR] = {'Cor', 'Selecione cor do seu colete'},

            [ePCStepStoreClothButtonType.BOOTS] = {'Calçado', 'Selecione seu calçado'},
            [ePCStepStoreClothButtonType.BOOTS_COLOR] = {'Cor', 'Selecione cor do seu calçado'},

            [ePCStepStoreClothButtonType.COATS] = {'Casaco', 'Selecione seu Casaco'},
            [ePCStepStoreClothButtonType.COATS_COLOR] = {'Cor', 'Selecione cor do seu Casaco'},

            [ePCStepStoreClothButtonType.COATS_CLOSED] = {'Casaco fechado', 'Selecione seu Casaco fechado'},
            [ePCStepStoreClothButtonType.COATS_CLOSED_COLOR] = {'Cor', 'Selecione cor do seu Casaco fechado'},

            [ePCStepStoreClothButtonType.NECKTIES] = {'Gravata', 'Selecione a Gravata'},
            [ePCStepStoreClothButtonType.NECKTIES_COLOR] = {'Cor', 'Selecione cor de sua Gravata'},

            [ePCStepStoreClothButtonType.GUNBELTS] = {'Coldre', 'Selecione o Coldre'},
            [ePCStepStoreClothButtonType.GUNBELTS_COLOR] = {'Cor', 'Selecione cor de seu Coldre'},
        },

        [ePCStepType.StoreCloth] =
        {
            [ePCStepStoreClothButtonType.HATS] = {'Chapéu', 'Selecione seu chapeú'},
            [ePCStepStoreClothButtonType.HATS_COLOR] = {'Cor', 'Selecione cor do seu chapeú'},

            [ePCStepStoreClothButtonType.SHIRTS_FULL] = {'Camisa', 'Selecione sua camisa'},
            [ePCStepStoreClothButtonType.SHIRTS_FULL_COLOR] = {'Cor', 'Selecione dor da sua camisa'},

            [ePCStepStoreClothButtonType.VESTS] = {'Colete', 'Selecione seu colete'},
            [ePCStepStoreClothButtonType.VESTS_COLOR] = {'Cor', 'Selecione cor do seu colete'},

            [ePCStepStoreClothButtonType.PANTS] = {'Calça', 'Selecione sua calça'},
            [ePCStepStoreClothButtonType.PANTS_COLOR] = {'Cor', 'Selecione cor da sua calça'},

            [ePCStepStoreClothButtonType.BOOTS] = {'Calçado', 'Selecione seu calçado'},
            [ePCStepStoreClothButtonType.BOOTS_COLOR] = {'Cor', 'Selecione cor do seu calçado'},

            [ePCStepStoreClothButtonType.COATS] = {'Casaco', 'Selecione seu Casaco'},
            [ePCStepStoreClothButtonType.COATS_COLOR] = {'Cor', 'Selecione cor do seu Casaco'},

            [ePCStepStoreClothButtonType.COATS_CLOSED] = {'Casaco fechado', 'Selecione seu Casaco fechado'},
            [ePCStepStoreClothButtonType.COATS_CLOSED_COLOR] = {'Cor', 'Selecione cor do seu Casaco fechado'},

            [ePCStepStoreClothButtonType.CHAPS] = {'Chaps', 'Selecione seu Chaps'},
            [ePCStepStoreClothButtonType.CHAPS_COLOR] = {'Cor', 'Selecione cor do seu Chaps'},

            [ePCStepStoreClothButtonType.PONCHOS] = {'Poncho', 'Selecione seu Poncho'},
            [ePCStepStoreClothButtonType.PONCHOS_COLOR] = {'Cor', 'Selecione cor do seu Poncho'},

            [ePCStepStoreClothButtonType.NECKTIES] = {'Gravata', 'Selecione a Gravata'},
            [ePCStepStoreClothButtonType.NECKTIES_COLOR] = {'Cor', 'Selecione cor de sua Gravata'},

            [ePCStepStoreClothButtonType.LOADOUTS] = {'Bandoleiras', 'Selecione a Bandoleira'},
            [ePCStepStoreClothButtonType.LOADOUTS_COLOR] = {'Cor', 'Selecione cor de sua Bandoleira'},

            [ePCStepStoreClothButtonType.SUSPENDERS] = {'Suspensório', 'Selecione o Suspensório'},
            [ePCStepStoreClothButtonType.SUSPENDERS_COLOR] = {'Cor', 'Selecione cor de seu Suspensório'},

            [ePCStepStoreClothButtonType.GLOVES] = {'Luva', 'Selecione a Luva'},
            [ePCStepStoreClothButtonType.GLOVES_COLOR] = {'Cor', 'Selecione cor de sua Luva'},

            [ePCStepStoreClothButtonType.BELTS] = {'Cinto', 'Selecione o Cinto'},
            [ePCStepStoreClothButtonType.BELTS_COLOR] = {'Cor', 'Selecione cor de seu Cinto'},

            [ePCStepStoreClothButtonType.BELT_BUCKLES] = {'Fivela de Cinto', 'Selecione a Fivela do Cinto'},
            [ePCStepStoreClothButtonType.BELT_BUCKLES_COLOR] = {'Cor', 'Selecione cor da Fivela do Cinto'},

            [ePCStepStoreClothButtonType.GUNBELTS] = {'Coldre', 'Selecione o Coldre'},
            [ePCStepStoreClothButtonType.GUNBELTS_COLOR] = {'Cor', 'Selecione cor de seu Coldre'},

            [ePCStepStoreClothButtonType.HOLSTERS_LEFT] = {'Coldre secundário', 'Selecione o Coldre'},
            [ePCStepStoreClothButtonType.HOLSTERS_LEFT_COLOR] = {'Cor', 'Selecione cor de seu Coldre'},

            [ePCStepStoreClothButtonType.SKIRTS] = {'Saia', 'Selecione a Saia'},
            [ePCStepStoreClothButtonType.SKIRTS_COLOR] = {'Cor', 'Selecione cor de seu Saia'},
        },

        [ePCStepType.StoreAccessories] =
        {
            [ePCStepStoreAccessoriesButtonType.BOOT_ACCESSORIES] = {'Acessório para Bota', 'Selecione seu Acessório para Bota'},
            [ePCStepStoreAccessoriesButtonType.BOOT_ACCESSORIES_COLOR] = {'Cor', 'Selecione cor do seu Acessório para Bota'},

            /*
            [ePCStepStoreAccessoriesButtonType.MASKS] = {'Mascara', 'Selecione sua Mascara'},
            [ePCStepStoreAccessoriesButtonType.MASKS_COLOR] = {'Cor', 'Selecione a cor de sua Mascara'},
            */

            [ePCStepStoreAccessoriesButtonType.SPATS] = {'Caneleira', 'Selecione a caneleira'},
            [ePCStepStoreAccessoriesButtonType.SPATS_COLOR] = {'Cor', 'Selecione cor da sua Caneleira'},

            [ePCStepStoreAccessoriesButtonType.EYEWEAR] = {'Óculos/Tapa-olho', 'Selecione seu Óculos/Tapa-olho'},
            [ePCStepStoreAccessoriesButtonType.EYEWEAR_COLOR] = {'Cor', 'Selecione cor do seu Óculos/Tapa-olho'},

            [ePCStepStoreAccessoriesButtonType.NECKWEAR] = {'Acessório para Pescoço', 'Selecione seu Acessório para Pescoço'},
            [ePCStepStoreAccessoriesButtonType.NECKWEAR_COLOR] = {'Cor', 'Selecione cor do seu Acessório para Pescoço'},

            [ePCStepStoreAccessoriesButtonType.ACCESSORIES] = {'Acessório', 'Selecione seu Acessório para Pescoço'},
            [ePCStepStoreAccessoriesButtonType.ACCESSORIES_COLOR] = {'Cor', 'Selecione cor do seu Acessório para Pescoço'},
            
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_RIGHT] = {'Joia Mão Direita', 'Selecione sua Joia Mão Direita'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_RIGHT_COLOR] = {'Cor', 'Selecione cor do sua Joia Mão Direita'},

            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_LEFT] = {'Joia Mão Esquerda', 'Selecione sua Joia Mão Esquerda'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_RINGS_LEFT_COLOR] = {'Cor', 'Selecione cor do sua Joia Mão Esquerda'},
            
            [ePCStepStoreAccessoriesButtonType.JEWELRY_BRACELETS] = {'Pulseiras', 'Selecione sua pulseiras'},
            [ePCStepStoreAccessoriesButtonType.JEWELRY_BRACELETS_COLOR] = {'Cor', 'Selecione cor do sua pulseiras'},

            [ePCStepStoreAccessoriesButtonType.GAUNTLETS] = {'Braceletes', 'Selecione seu Braceletes'},
            [ePCStepStoreAccessoriesButtonType.GAUNTLETS_COLOR] = {'Cor', 'Selecione cor do Braceletes'},

            [ePCStepStoreAccessoriesButtonType.SATCHELS] = {'Bolsa', 'Selecione sua Bolsa'},
            [ePCStepStoreAccessoriesButtonType.SATCHELS_COLOR] = {'Cor', 'Selecione cor da Bolsa'},
        },
    }
})