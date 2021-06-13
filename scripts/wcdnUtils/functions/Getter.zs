#priority 2047
#loader preinit contenttweaker crafttweaker
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;

static metalGetter as function()string[] = function () as string[] {
    var metalList as string[] = [];
    for i in oreDict.entries {
        var metalIngot as string = i.name;
        if(metalIngot has "ingot" && !(metalIngot has "Brick") && !(metalIngot has "brick")) {
            var metal as string = metalIngot.substring("ingot".length);
            metalList += metal;
        }
    } return metalList;
};

static odNameToIItemStack as function(string)IItemStack[] = function (odName as string) as IItemStack[] {
    var IItemStackList as IItemStack[] = [];
    var odGet as IOreDictEntry = oreDict.get(odName);
    for i in odGet.items {
        IItemStackList += i;
    } return IItemStackList;
};

static odNamesToIItemStack as function(string[])IItemStack[] = function (odName as string[]) as IItemStack[] {
    var IItemStackList as IItemStack[] = [];
    if(!isNull(odName)) {
        for odNames in odName{
            var odGet as IOreDictEntry = oreDict.get(odNames);
            for i in odGet.items {
                IItemStackList += i;
            }
        }
    } return IItemStackList;
};