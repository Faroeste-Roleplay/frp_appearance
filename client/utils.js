
const mergeArrData = (arr, data) => {
    return [ ...arr, ...data];
}
exports("mergeArrData", mergeArrData)

const mergeObjectData = (obj, data) => {
    return { ...obj, ...data }
}
exports("mergeObjectData", mergeObjectData)

const ConfigFileApparatusIdInputInlineList = (apparatusType) =>
{
    // enviar a informação com o minimo e maximo de cada component para a ui
    
    return MetaPedComponents[apparatusType][gPedGenderSelected].length
}
exports('ConfigFileApparatusIdInputInlineList', ConfigFileApparatusIdInputInlineList)

const ConfigFileApparatusStyleInputInlineList = (apparatusType) =>
{  
    let num = 0;

    if (apparatusType == 0 || apparatusType == 39) 
    {
        num = 1
    }
    // enviar a informação com o minimo e maximo de cada estilo dos components para a ui
    for (let id = num; id < MetaPedComponents[apparatusType][gPedGenderSelected].length; id++)
    {        
        return MetaPedComponents[apparatusType][gPedGenderSelected][id].length
    }
}
exports('ConfigFileApparatusStyleInputInlineList', ConfigFileApparatusStyleInputInlineList)