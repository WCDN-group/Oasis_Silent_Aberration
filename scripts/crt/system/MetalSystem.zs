#priority 1

import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IItemStack;

import mods.pyrotech.IroncladAnvil as IA;
import mods.pyrotech.GraniteAnvil as GA;
import mods.pyrotech.Bloomery;

import mods.immersiveengineering.BottlingMachine;
import mods.immersiveengineering.BlastFurnace;
import mods.immersiveengineering.MetalPress;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.Mixer;

import mods.embers.DawnstoneAnvil;
import mods.embers.Stamper;
import mods.embers.Melter;

import mods.abyssalcraft.Transmutator;

val metal as string[] = [
    "Iron",
    "Gold",
    "Abyssalnite",
    "LiquifiedCoralium",
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

val liquid as ILiquidStack[] = [
    <liquid:alchemy_fluid_iron>,
    <liquid:alchemy_fluid_gold>,
    <liquid:alchemy_fluid_abyssalnite>,
    <liquid:alchemy_fluid_liquified_coralium>,
    <liquid:alchemy_fluid_arkenium>,
    <liquid:alchemy_fluid_copper>,
    <liquid:alchemy_fluid_tin>,
    <liquid:alchemy_fluid_aluminium>,
    <liquid:alchemy_fluid_lead>,
    <liquid:alchemy_fluid_silver>,
    <liquid:alchemy_fluid_nickel>,
    <liquid:alchemy_fluid_nickel>,
    <liquid:alchemy_fluid_uranium>,
    <liquid:alchemy_fluid_syrmorite>,
    <liquid:alchemy_fluid_octine>,
    <liquid:alchemy_fluid_niobium>
];

val liquid2 as ILiquidStack[] = [
    <liquid:iron>,
    <liquid:gold>,
    <liquid:abyssalnite>,
    <liquid:liquified_coralium>,
    <liquid:arkenium>,
    <liquid:copper>,
    <liquid:tin>,
    <liquid:aluminium>,
    <liquid:lead>,
    <liquid:silver>,
    <liquid:nickel>,
    <liquid:nickel>,
    <liquid:uranium>,
    <liquid:syrmorite>,
    <liquid:octine>,
    <liquid:niobium>
];

for i, metals in metal {
    val ILiquidMetal as ILiquidStack = liquid2[i];
    val ILiquid as ILiquidStack = liquid[i];
    MelterSystemNormal(ILiquidMetal, metals, ILiquid);
}

function MelterSystemNormal(liquid as ILiquidStack, metal as string, liquid2 as ILiquidStack) {
    val pureMetalFragments as IItemStack = oreDict.get("pureMetalFragments" ~ metal).firstItem;
    val clusterBroken as IItemStack = oreDict.get("clusterBroken" ~ metal).firstItem;
    val unformedIngot as IItemStack = oreDict.get("unformedIngot" ~ metal).firstItem;
    val crudeIngot as IItemStack = oreDict.get("crudeIngot" ~ metal).firstItem;
    val crudeDust as IItemStack = oreDict.get("crudeDust" ~ metal).firstItem;
    val cluster as IItemStack = oreDict.get("cluster" ~ metal).firstItem;
    val nugget as IItemStack = oreDict.get("nugget" ~ metal).firstItem;
    val potion as IItemStack = oreDict.get("potion" ~ metal).firstItem;
    val ingot as IItemStack = oreDict.get("ingot" ~ metal).firstItem;

    val PAname as string = clusterBroken.definition.id ~ "_" ~ clusterBroken.metadata;
    val Bname as string = nugget.definition.id ~ "_" ~ nugget.metadata;
    
    Bloomery.createBloomeryBuilder(Bname.toLowerCase().replace("contenttweaker:", "_").replace(":", "_")~ "_blm", nugget, clusterBroken)
        .setAnvilTiers(["granite", "ironclad"])
        .setBurnTimeTicks(19200)
        .setFailureChance(0.1)
        .addFailureItem(<pyrotech:slag>, 1)
        .setBloomYield(9, 15)
        .register();

    GA.addRecipe(PAname.toLowerCase().replace("contenttweaker:", "_").replace(":", "_") ~ "_ga", clusterBroken, cluster, 7, "hammer", false);
    IA.addRecipe(PAname.toLowerCase().replace("contenttweaker:", "_").replace(":", "_") ~ "_ia", clusterBroken, cluster, 5, "hammer");

    BlastFurnace.addRecipe(crudeIngot, clusterBroken, 3000, <item:immersiveengineering:material:7> * 2);
    BlastFurnace.addRecipe(pureMetalFragments, potion, 3000, <item:pyrotech:material:32> * 3);
    MetalPress.addRecipe(ingot, unformedIngot, <item:contenttweaker:mold_ingot>, 2048, 16);
    BottlingMachine.addRecipe(potion, <item:minecraft:glass_bottle>, liquid2);
    Crusher.addRecipe(clusterBroken, cluster, 2048, clusterBroken, 0.65);
    Crusher.addRecipe(crudeDust, crudeIngot, 2048, crudeDust, 0.65);
    Mixer.addRecipe(liquid2 * 144, <liquid:liquid_alchemy> * 144, [crudeDust], 2048);

    DawnstoneAnvil.add([ingot * 2], unformedIngot * 2, unformedIngot);
    Stamper.add(unformedIngot, liquid * 144, <item:embers:stamp_bar>);
    Melter.add(liquid * 144, nugget);

    Transmutator.addTransmutation(unformedIngot, pureMetalFragments, 0.5);
}
