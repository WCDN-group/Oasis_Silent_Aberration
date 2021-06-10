#loader contenttweaker
#priority 300

import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.MaterialPartLocalizedNameSupplier;

val osaFluidType = MaterialSystem.createPartType("alchemy_fluid", function(materialPart){
    val materialName as string = materialPart.getMaterial().getName();
    val color as int = materialPart.getMaterial().getColor();
    val IFluid as Fluid = VanillaFactory.createFluid("alchemy_fluid_" ~ materialName.toLowerCase(), color);
    IFluid.density = 4500;
    IFluid.luminosity = 3;
    IFluid.viscosity = 4500;
    IFluid.vaporize = false;
    IFluid.colorize = true;
    IFluid.stillLocation = "contenttweaker:fluids/water_still";
    IFluid.flowingLocation = "contenttweaker:fluids/water_flow";
    IFluid.material = <blockmaterial:lava>;
    IFluid.register();
});

val metalAlchemyFluid = mods.contenttweaker.MaterialSystem.getPartBuilder();
    metalAlchemyFluid.setName("metal_alchemy_fluid");
    metalAlchemyFluid.setPartType(osaFluidType);
    metalAlchemyFluid.build();