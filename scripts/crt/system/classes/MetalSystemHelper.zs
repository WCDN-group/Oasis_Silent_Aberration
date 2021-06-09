#priority 2047

#norun
// "Iron" : ,
// "Gold" :,
// "Abyssalnite" :,
// "LiquifiedCoralium" :,
// "Arkenium" :,
// "Copper" :,
// "Tin" :,
// "Aluminium" :,
// "Lead" :,
// "Silver" :,
// "Nickel" :,
// "Uranium" :,
// "Syrmorite" :,
// "Octine" :,
// "Tungsten" :,
// "Niobium" :,
import crafttweaker.item.IItemStack;

import mods.pyrotech.GraniteAnvil as GA;
import mods.pyrotech.IroncladAnvil as IA;

zenClass MetalSystemHelper {

    function PAnvilSet(name as string, output as IItemStack, input as IItemStack, type as string, times as int, save as int){
        if (type == "pickaxe" || type == "hammer"){
            if (times >= 3){
                GA.addRecipe(name.toLowerCase() ~ "_ga", output, input, times, type, false);
                if (save > times) {
                    print("[MetalSystemHelper]error tool type found");
                    } else {
                        IA.addRecipe(name.toLowerCase() ~ "_ia", output, input, times - save, type);
                    }
                }
            } else {
                print("[MetalSystemHelper]error tool type found");
        }
    }
}

function getMetalSystemHelper() as MetalSystemHelper {
    return MetalSystemHelper;
}

