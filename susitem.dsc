#
# Feel free to use it however you like :D
#
# version 0.2
# author: RoboChicken
#
# skill keys:
#    Click:
#     - triggers when player right Clicks any block including air
#     - ideal for activating aoe or utility skills
#    ATTACK:
#     - triggers when attacking an entity
#     - for combat skills
#    BOW:
#     - triggers when an entity shoots a bow
#     - can be used to change the type of projectile
#     - or add effects when shooting the bow
#    ARROW:
#     - triggers when an arrow/projectile hits an entity or a block
#     - useful for making custom arrows
#    SHIELD:
#     - triggers when a player toggles his shield either hand
#
#   There are predefined tags that you can use directly in your task scripts
#   but make sure you add the tags that you are using in the "definitions" key
#   of your task script to prevent vscode from detecting it as an error
#
#   A little heads up for the spigot boys, you will have to change the code for the arrow
#   skill because the <context.item> tag for the bow shooting event only works on paper.
#   hint: use a tag that gets the first arrow item of the player's inventory
#
item_skills_handler:
  type: world
  debug: false
  events:
    on player right clicks block using:hand:
    - if <context.item.script.data_key[skills.click]||null> != null:
      - define player <player>
      - define item <context.item>
      - define location <context.location||<player.location>>
      - define relative <context.relative||null>
      - inject <[item].script.data_key[skills.click]>
 
    on player damages entity:
    - if <context.damager.item_in_hand.script.data_key[skills.attack]||null> != null:
      - define player <context.damager>
      - define item <context.damager.item_in_hand>
      - define entity <context.entity>
      - define finalDamage <context.final_damage>
      - inject <[player].item_in_hand.script.data_key[skills.attack]>

    on player shoots bow:
    - if <context.item.script.data_key[skills]||null> != null:
      - define player <context.entity>
      - define projectile <context.projectile>
      - define bow <context.bow>
      - define force <context.force>
      - define item <context.item>
      - if <[item].script.data_key[skills.bow]||null> != null:
        - inject <[item].script.data_key[skills.bow]>
      - if <[item].script.data_key[skills.arrow]||null> != null:
        - flag <[projectile]> shooter:<[player]>
        - flag <[projectile]> bow:<[bow]>
        - flag <[projectile]> force:<[force]>
        - flag <[projectile]> arrow:<[item]>
        - flag <[projectile]> skills.arrow:<context.item.script.data_key[skills.arrow]>

    on projectile hits block:
    - if <context.projectile.has_flag[skills.arrow]>:
      - define player <context.projectile.flag[shooter]>
      - define bow <context.projectile.flag[bow]>
      - define force <context.projectile.flag[force]>
      - define arrow <context.projectile.flag[item]>
      - define location <context.location>
      - inject <context.projectile.flag[skills.arrow].as_script>
    on projectile collides with entity:
    - if <context.projectile.has_flag[skills.arrow]>:
      - define player <context.projectile.flag[shooter]>
      - define bow <context.projectile.flag[bow]>
      - define force <context.projectile.flag[force]>
      - define arrow <context.projectile.flag[item]>
      - define projectile <context.projectile>
      - define entity <context.entity>
      - inject <[projectile].flag[skills.arrow].as_script>

    # doesnt have much tags but would be nice if
    # theres a tag for the shield item and whatever hand is using it
    on player toggles shield:
    - if <player.item_in_hand.script.data_key[skills.shield]||null> != null:
      - define player <player>
      - define item <player.item_in_hand>
      - define state <context.state>
      - define hand hand
      - inject <[item].script.data_key[skills.shield]>
    - if <player.item_in_offhand.script.data_key[skills.shield]||null> != null:
      - define player <player>
      - define item <player.item_in_offhand>
      - define state <context.state>
      - define hand off_hand
      - inject <[item].script.data_key[skills.shield]>



masamune:
  type: item
  material: netherite_sword
  display name: <&[item]><&8>Masamune
  allow in material recipes: false
  flags:
    type: sword
    sword: masamune
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 1
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 8
          slot: ANY
  lore:
  - <&[lore]>memory...


airforcombat:
  type: item
  material: netherite_sword
  display name: <&[item]><&7>Air
  allow in material recipes: false
  flags:
    type: sword
    sword: air
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 2
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3.4
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 1
          slot: ANY
  lore:
  - <&[lore]>Hít đi hít nữa đi hít tiếp đi



10hourbust:
  type: item
  material: diamond
  display name: <&[item]><&8>10 Hour Bust
  allow in material recipes: false
  flags:
    type: ability
    ability: 10hourbust
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 1
  lore:
  - <&[lore]>Biến bạn thành n***a
  skills:
    Click: 10hourbustskill



progolf:
  type: item
  material: netherite_sword
  display name: <&[item]>Pro Golf
  allow in material recipes: false
  enchantments:
  - knockback:4
  flags:
    type: sword
    sword: progolf
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 3
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3.8
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 2
          slot: ANY
  lore:
  - <&[lore]>golf
backhandslap:
  type: item
  material: netherite_sword
  display name: <&[item]><&f><&l>Back hand slap
  allow in material recipes: false
  enchantments:
  - knockback:4
  flags:
    type: sword
    sword: backhand
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 7
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 4
          slot: ANY
  lore:
  - <&[lore]>do i amuse you?

scythe:
  type: item
  material: netherite_sword
  display name: <&[item]><&4>scythe
  allow in material recipes: false
  flags:
    type: sword
    sword: scythe
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 4
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: 10
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 3
          slot: ANY
  lore:
  - <&[lore]>Spam spam spam spam spam spam spam spam spam spam spam spam spam spam spam spam spam spam spam

banhammer:
  type: item
  material: netherite_sword
  display name: <&[item]><&d>BanHammer
  allow in material recipes: false
  flags:
    type: sword
    sword: banhammer
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 8
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3.8
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 10
          slot: ANY
  lore:
  - <&[lore]>builderman would be proud


basketbat:
  type: item
  material: netherite_sword
  display name: <&[item]><&f>Bat
  allow in material recipes: false
  enchantments:
  - knockback:1
  flags:
    type: sword
    sword: bat
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 9
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -3
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 3.7
          slot: ANY
  lore:
  - <&[lore]>apparently its a reliable self defense weapon against furries

pheonix:
  type: item
  material: netherite_sword
  display name: <&[item]><&6>Pheonix sword
  allow in material recipes: false
  flags:
    type: pheonix
    sword: pheonix
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 5
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -2
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 4
          slot: ANY
  lore:
  - <&[lore]><&4>FIREEEEEE
  skills:
    click: fireball

axee:
  type: item
  material: netherite_sword
  display name: <&[item]><&f>AXE
  allow in material recipes: false
  flags:
    type: sword
    sword: axe
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 6
    attribute_modifiers:
      generic_attack_speed:
        1:
          operation: add_number
          amount: -2
          slot: ANY
      generic_attack_damage:
        1:
          operation: add_number
          amount: 4
          slot: ANY
  lore:
  - <&[lore]><&f>axe.


bobm:
  type: item
  material: diamond
  display name: <&[item]><&e>bobm
  allow in material recipes: false
  flags:
    type: ability
    ability: bomb
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 3
  lore:
  - <&[lore]>Cảm tử
  skills:
    Click: blow

bowshovel:
  type: item
  material: diamond
  display name: <&[item]><&a>bow
  allow in material recipes: false
  flags:
    type: range
    range: bow
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 20
  lore:
  - <&[lore]>wait...that's not an arrow
  skills:
    Click: shootshovel

bottle:
  type: item
  material: diamond
  display name: <&[item]><&f>bottle
  allow in material recipes: false
  flags:
    type: range
    range: bottle
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 19
  lore:
  - <&[lore]>As week as shit
  skills:
    Click: bottleshoot

catt:
  type: item
  material: diamond
  display name: <&[item]><&f>cat
  allow in material recipes: false
  flags:
    type: range
    range: cat
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 4
  lore:
  - <&[lore]>The Battle Dog

blaster:
  type: item
  material: diamond
  display name: <&[item]><&a>Blaster
  allow in material recipes: false
  flags:
    type: range
    range: blaster
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 17
  lore:
  - <&[lore]>pew pew
  skills:
    Click: shootblaster

bullet:
  type: item
  material: diamond
  display name: <&[item]><&a>Blaster's bullet
  allow in material recipes: false
  flags:
    type: range
    range: bullet
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 18
  lore:
  - <&[lore]>How did you get me?

shovel:
  type: item
  material: diamond
  display name: <&[item]><&a>shovel
  allow in material recipes: false
  flags:
    type: range
    range: shovel
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 21
  lore:
  - <&[lore]>How did you get me?

nokia:
  type: item
  material: diamond
  display name: <&[item]><&f>nokia
  allow in material recipes: false
  flags:
    type: range
    range: nokia
  mechanisms:
    unbreakable: true
    hides: ALL
    custom_model_data: 5
  lore:
  - <&[lore]>UNBREAKABLE WEAPON

shootblaster:
  type: task
  script:
  - ratelimit <[player]> 0.5s
  - playsound <player> custom sound:blaster volume:1
  - shoot <player.location> <entity[snowball].with[item=bullet;gravity=false]> speed:2 height:1 script:bulletd shooter:<player>

shootshovel:
  type: task
  script:
  - ratelimit <[player]> 3.5s
  - playsound <player> custom sound:bow volume:1
  - shoot <player.location> <entity[snowball].with[item=shovel;gravity=false]> speed:1 height:1 script:bulletd shooter:<player>
shoveldamage:
  type: task
  script:
  - hurt 8 <[hit_entities]>
bottleshoot:
  type: task
  script:
  - ratelimit <[player]> 1.5s
  - playsound <player> custom sound:bottle volume:1
  - shoot <player.location> <entity[snowball].with[item=bottle;gravity=false]> speed:1 height:1 script:bottledamage shooter:<player>

bottledamage:
  type: task
  script:
  - hurt 2 <[hit_entities]>
  - Cast WEAKNESS duration:2s amplifier:127 <[hit_entities]> hide_particles no_icon
  - Cast slow duration:2s amplifier:127 <[hit_entities]> hide_particles
bulletd:
  type: task
  script:
  - hurt 4 <[hit_entities]>
10hourbustskill:
  type: task
  definitions: player
  script:
  - determine cancelled passively
  - take iteminhand
  - wait 1t
  - ratelimit <[player]> 1s
  - playsound <player> custom sound:10hourbust volume:1
  - equip <[player]> chest:<server.flag[chestplate]> legs:<server.flag[leggings]> boots:<server.flag[boots]>

fireball:
  type: task
  script:
  - ratelimit <player> 4s
  - if !<player.has_flag[cooldownpheonix]>:
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 10t
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 10t
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 10t
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 10t
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 10t
    - shoot <player.location.add[0,1,0]> <entity[snowball].with[item=<server.flag[fireball]>]> speed:1 origin:<player.location.add[0,2,0]> shooter:<player> script:fireballhit
    - playeffect effect:DUST_COLOR_TRANSITION at:<player.location> special_data:3|red|orange quantity:5
    - playsound <player> sound:ENTITY_GHAST_SHOOT volume:2
    - animate <player> animation:ARM_SWING
    - wait 4t
    - flag player cooldownpheonix expire:5s


fireballhit:
  type: task
  script:
  - hurt 8 <[hit_entities]>
  - explode power:0.1 <[location].add[0,1,0]>
  - playeffect effect:DUST_COLOR_TRANSITION at:<[location]> special_data:3|red|orange quantity:50 offset:2
  - spawn <entity[armor_stand].with[invulnerable=true;visible=false;gravity==false;has_ai=false]> <[location]> save:explosion2
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion1]>
  - wait 1t
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion2]>
  - wait 1t
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion3]>
  - wait 1t
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion4]>
  - wait 1t
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion5]>
  - wait 1t
  - equip <entry[explosion2].spawned_entity> head:<server.flag[explosion6]>
  - wait 1t
  - remove <entry[explosion2].spawned_entity>

slash:
  type: task
  debug: false
  script:
  - random:
    - playsound <player> custom sound:slash1 volume:1
    - playsound <player> custom sound:slash2 volume:1
  - spawn <entity[armor_stand].with[invulnerable=true;visible=false]> <player.location> save:slash
  - equip <entry[slash].spawned_entity> head:<server.flag[slash1]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash2]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash3]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash4]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash5]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash6]>
  - wait 1t
  - equip <entry[slash].spawned_entity> head:<server.flag[slash7]>
  - wait 1t
  - remove <entry[slash].spawned_entity>
cattt:
  type: task
  debug: false
  script:
  - if !<player.has_flag[cooldowncat]>:
    - playsound <player.location> sound:ENTITY_PLAYER_ATTACK_SWEEP pitch:1.5
    - shoot <player.location> <entity[snowball].with[item=catt]> speed:2 height:1 script:damage shooter:<player>
    - flag player cooldowncat expire:2s
    - playsound <player> custom sound:cat volume:1


blowanimation:
  type: task
  script:
  - spawn <entity[armor_stand].with[invulnerable=true;visible=false;gravity==false;has_ai=false]> <player.location> save:explosion
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion1]>
  - wait 1t
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion2]>
  - wait 1t
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion3]>
  - wait 1t
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion4]>
  - wait 1t
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion5]>
  - wait 1t
  - equip <entry[explosion].spawned_entity> head:<server.flag[explosion6]>
  - wait 1t
  - remove <entry[explosion].spawned_entity>




nokiaa:
  type: task
  debug: false
  script:
  - if !<player.has_flag[cooldownnokia]>:
    - playsound <player.location> sound:ENTITY_PLAYER_ATTACK_SWEEP pitch:1.5
    - shoot <player.location> <entity[snowball].with[item=nokia;gravity=false]> speed:2 height:1 script:damage2 shooter:<player>
    - flag player cooldownnokia expire:20s

damage2:
  type: task
  debug: false
  script:
  - hurt 1000 <[hit_entities]>

damage:
  type: task
  debug: false
  script:
  - hurt 7 <[hit_entities]>



blow:
  type: task
  definitions: player
  script:
  - ratelimit <[player]> 1s
  - take iteminhand
  - wait 5t
  - explode power:3.5 <player.location>
  - run blowanimation


items:
  type: world
  definitions: s
  events:
    on player unequips armor:
    - determine cancelled
    on player drops item:
    - determine cancelled
    on player right clicks armor_stand:
    - determine cancelled
    after player left clicks block with:pheonix:
    - run slash
    on player damages entity with:pheonix:
    - if <player.attack_cooldown_percent> == 100:
      - run slash
    on player right clicks block with:nokia:
    - run nokiaa
    on player right clicks block with:catt:
    - run cattt
    after player scrolls their hotbar:
    - if <player.item_in_hand.has_flag[sword]>:
      - if <player.item_in_hand.flag[sword]> == masamune:
        - playsound <player> custom sound:masamune2 volume:2
        - stop
      - else if <player.item_in_hand.flag[sword]> != masamune:
        - adjust <player> stop_sound
    - if !<player.item_in_hand.has_flag[sword]>:
      - adjust <player> stop_sound
    on player damages entity with:masamune:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:masamune volume:2
    on player left clicks block with:masamune:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:masamune volume:2
    on player damages entity with:scythe:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:scythe volume:1
    on player left clicks block with:scythe:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:scythe volume:1
    on player damages entity with:axee:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:axe volume:1
    on player left clicks block with:axee:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:axe volume:1
    on player damages entity with:backhandslap:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:backhandslap volume:1
    on player left clicks block with:backhandslap:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:backhandslap volume:1
    on player damages entity with:banhammer:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:banhammer volume:1
    on player left clicks block with:banhammer:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:banhammer volume:1
    on player damages entity with:basketbat:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:bat volume:1
    on player left clicks block with:basketbat:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:bat volume:1
    on player damages entity with:progolf:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:progolf volume:1
    on player left clicks block with:progolf:
    - if <player.attack_cooldown_percent> == 100:
      - playsound <player> custom sound:progolf volume:1
