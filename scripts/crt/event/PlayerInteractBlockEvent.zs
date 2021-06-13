#priority -1
#loader crafttweaker reloadableevents

import crafttweaker.events.IEventManager;
import crafttweaker.event.PlayerInteractBlockEvent;
import scripts.grassUtils.GrassUtils;

events.onPlayerInteractBlock(function(event as PlayerInteractBlockEvent) {
    if(!event.world.remote) {
        if(
            event.block.definition.id == "minecraft:crafting_table" || 
            event.block.definition.id == "midnight:shadowroot_crafting_table" ||
            event.block.definition.id == "thebetweenlands:weedwood_workbench" ||
            event.block.definition.id == "aether:aether_crafting_table" ) {
                event.cancel();
                event.player.sendChat(GrassUtils.i18nValued("text.disable.info", [event.block.definition.unlocalizedName ~ "name"]));
        }
    }
});