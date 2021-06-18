#loader contenttweaker
#priority 256

import scripts.grassUtils.CotUtils;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

CotUtils.addNormalItem("mold_ingot");
addDamageItem("staff_fluorescent", 25);

function addDamageItem(name as string, damege as int) {
    val IItem as Item = VanillaFactory.createItem(name);
    IItem.maxDamage = damege;
    IItem.maxStackSize = 1;
    IItem.register();
}