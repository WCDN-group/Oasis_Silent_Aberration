#loader contenttweaker
#priority 256

import mods.contenttweaker.Fluid;
import mods.contenttweaker.VanillaFactory;

val fluidAlchemy as Fluid = VanillaFactory.createFluid("liquid_alchemy", 0xe7cfe9);
fluidAlchemy.density = 1500;
fluidAlchemy.luminosity = 6;
fluidAlchemy.viscosity = 600;
fluidAlchemy.vaporize = false;
fluidAlchemy.material = <blockmaterial:water>;
fluidAlchemy.gaseous = true;
fluidAlchemy.register();