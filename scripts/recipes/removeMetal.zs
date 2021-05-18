import crafttweaker.oredict.IOreDictEntry;
import scripts.functions.remover.removeMetalByOutput;

var removePartList as string[] = [
    "ingot",
    "plate",
    "gear",
    "block",
    "stick",
    "blockSheetmetal",
    "slabSheetmetal"
];


for ingot in oreDict.entries {
    var IIngot as string = ingot.name;
    if(IIngot has "ingot") {
        var metal as string = IIngot.substring("ingot".length);
        for part in removePartList {
            var removes as IOreDictEntry = oreDict.get(part~metal);
            for Iremover in removes.items {
                removeMetalByOutput(Iremover.definition.makeStack(Iremover.metadata));
            }
        }
    }
}