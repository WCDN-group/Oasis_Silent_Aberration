#priority 1

import crafttweaker.item.IItemStack;
import mods.pyrotech.GraniteAnvil as GA;
import mods.pyrotech.IroncladAnvil as IA;
import mods.pyrotech.Bloomery;

val metal as string[] = [
    "Iron",
    "Gold",
    "Abyssalnite",
    "LiquifiedCoralium",
    "Dreadium",
    "Ethaxium",
    "Arkenium",
    "Copper",
    "Tin",
    "Aluminium",
    "Lead",
    "Silver",
    "Nickel",
    "Uranium",
    "Syrmorite",
    "Octine",
    "Niobium",
];


for metals in metal {

}

Bloomery.createBloomeryBuilder(name, output, input)
    .setAnvilTiers(["granite", "ironclad"])
    .setBurnTimeTicks(19200)
    .setFailureChance(0.25)
    .setBloomYield(9, 15)
    .register();


function PAnvilSet(name as string, output as IItemStack, input as IItemStack, type as string, times as int, save as int){
    if (type == "pickaxe" || type == "hammer"){
        if (times >= 3){
            GA.addRecipe(name.toLowerCase() ~ "_ga", output, input, times, type, false);
            if (save > times) {
                print("[MetalSystem]error times save found");
                } else {
                    IA.addRecipe(name.toLowerCase() ~ "_ia", output, input, times - save, type);
                }
            }
        } else {
            print("[MetalSystem]error tool type found");
    }
}
// import mods.pyrotech.Bloomery;

//  recipe for an iron bloom from an iron ore
// Bloomery.createBloomeryBuilder(
//         "bloom_from_iron_ore",   // recipe name
//         <minecraft:iron_nugget>, // output
//         <minecraft:iron_ore>     // input
//     )
//     .setAnvilTiers(["granite", "ironclad"])
//     .setBurnTimeTicks(28800)
//     .setFailureChance(0.25)
//     .setBloomYield(12, 15)
//     .setSlagItem(<pyrotech:generated_slag_iron>, 4)
//     .addFailureItem(<pyrotech:slag>, 1)
//     .addFailureItem(<pyrotech:generated_slag_iron>, 2)
//     .register();

// static void addRecipe(
//   string name,                // unique recipe name
//   IItemStack output,          // recipe output
//   IIngredient input,          // recipe input
//   int hits,                   // base number of hammer hits required
//   string type,                // hammer | pickaxe
//   @Optional boolean inherited // true if the recipe should be inherited
// );