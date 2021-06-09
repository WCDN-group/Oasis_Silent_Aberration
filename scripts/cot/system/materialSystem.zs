#loader contenttweaker
#priority 257

import scripts.grassUtils.CotUtils;
import scripts.wcdnUtils.functions.Getter as getter;

print(getter.metalGetter()[0]);

val partBuild as string[] = ["cluster_broken", "crude_dust", "crude_ingot", "pure_metal_fragments", "unformed_ingot",];

val  metalBuild as int[string] = {
    "Iron" : 0xd8d8d8 ,
    "Gold" : 0xffff8b,
    "Abyssalnite" : 0x5722a0,
    "LiquifiedCoralium" : 0x129e6b,
    "Arkenium" : 0xc4c4c4,
    "Copper" : 0xd28a66,
    "Tin" : 0xEAEDEC,
    "Aluminium" : 0xc6ced1,
    "Lead" : 0x6d748d,
    "Silver" : 0xeaf7ff,
    "Nickel" : 0xe1e7d4,
    "Uranium" : 0x7f9374,
    "Syrmorite" : 0x5660a5,
    "Octine" : 0xf5a615,
    "Niobium" : 0xd1d3df,
};

val alloyBuild as int[string] = {
    "Bronze" : 0xe9b23a,
    "Dawnstone" : 0xffb648,
    "Endorium" : 0x0e3f37,
    "Constantan" : 0xff9e7f,
    "Electrum" : 0xffd051,
    "Steel" : 0xa2a2a2,
    "Antimony" : 0xe3e4c6,
    "Dreadium" : 0xb13939 ,
    "Ethaxium" : 0x969e8a,
    "Tungsten" : 0x646464,
};

for metals, color in metalBuild {
    val metal = CotUtils.getMaterialSystemHelper(0);
        metal.registerMaterial(metals, color);
}

for alloys, color in alloyBuild {
    val alloy = CotUtils.getMaterialSystemHelper(1);
        alloy.registerMaterial(alloys, color);
}

for part in partBuild {
        val parts = CotUtils.getMaterialSystemHelper(2);
            parts.registerNormalPart(part, "item", true);
}

for meatal in metalBuild {
    val meatals = CotUtils.getMaterialSystemHelper(3);
        meatals.addMaterial(meatal);
        for part in partBuild {
            meatals.registerMaterialPart(meatal, part);
        }
        meatals.registerMaterialPart(meatal, "metal_alchemy_fluid");
}

for alloy in alloyBuild {
    val alloys = CotUtils.getMaterialSystemHelper(4);
        alloys.addMaterial(alloy);
        alloys.registerMaterialPart(alloy, "pure_metal_fragments");
        alloys.registerMaterialPart(alloy, "unformed_ingot");
        alloys.registerMaterialPart(alloy, "metal_alchemy_fluid");
}

