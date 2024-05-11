
eExpression =
{
    FaceWidth = 0,
    BrowHeight = 1,
    BrowWidth = 2,
    BrowDepth = 3,
    EarSize = 4,
    EarRotation = 5,
    EarLength = 6,
    EarLobe = 7,
    CheeksHeight = 8,
    CheeksWidth = 9,
    CheeksDepth = 10,
    JawHeight = 11,
    JawWidth = 12,
    JawDepth = 13,
    ChinTilt = 14,
    ChinWidth = 15,
    ChinDepth = 16,
    EyeHeight = 17,
    EyeWidth = 18,
    EyeDepth = 19,
    EyeAngle = 20,
    EyeHPos = 21,
    EyeVPos = 22,
    NoseWidth = 23,
    NoseLength = 24,
    NoseHeight = 25,
    NoseTilt = 26,
    NoseBreak = 27,
    NostrilWidth = 28,
    MouthWidth = 29,
    MouthDepth = 30,
    MouthHPos = 31,
    MouthVPos = 32,
    UpperLipThickness = 33,
    UpperLipWidth = 34,
    UpperLipDepth = 35,
    LowerLipThickness = 36,
    LowerLipWidth = 37,
    LowerLipDepth = 38,
}

eExpressionStr = {}

for str, i in pairs(eExpression) do
    eExpressionStr[i] = str
end

expressionSettings = {
    BrowShape =    
    {
        eExpression.BrowWidth,        
        eExpression.BrowHeight
    },
    BrowDepth =
    {
        eExpression.BrowDepth
    },
    EyeSize =
    {
        eExpression.EyeHeight,
        eExpression.EyeWidth
    },
    EyeShape =
    {   
        eExpression.EyeDepth,
        eExpression.EyeAngle
    },
    EyePos =
    {
        eExpression.EyeHPos,
        eExpression.EyeVPos
    },

    EarShape =
    {
        eExpression.EarLength,
        eExpression.EarRotation
    },

    EarSize =
    {
        eExpression.EarSize,
        eExpression.EarLobe
    },

    CheeksShape =
    {
        eExpression.CheeksHeight,
        eExpression.CheeksWidth
    },

    CheeksDepth =
    {
        eExpression.CheeksDepth
    },

    JawShape =
    {
        eExpression.JawHeight,
        eExpression.JawWidth
    },

    JawDepth =
    {
        eExpression.JawDepth
    },

    ChinShape =
    {
        eExpression.ChinTilt,
        eExpression.ChinWidth
    },

    ChinDepth =
    {
        eExpression.ChinDepth
    },

    Mouth =
    {
        eExpression.MouthWidth,
        eExpression.MouthDepth
    },

    MouthPosition =
    {
        eExpression.MouthVPos
    },

    UpperLipShape =
    {
        eExpression.UpperLipWidth,
        eExpression.UpperLipThickness
    },

    LowerLipShape =
    {
        eExpression.LowerLipWidth,
        eExpression.LowerLipThickness
    },

    LipsDepth =
    {
        eExpression.LowerLipDepth,
        eExpression.UpperLipDepth
    },

    NoseSize =
    {
        eExpression.NoseHeight,
        eExpression.NoseWidth
    },

    NoseShape =
    {
        eExpression.NoseLength,
        eExpression.NoseBreak
    },

    NoseTip =
    {
        eExpression.NoseTilt,        
        eExpression.NostrilWidth
    }
}