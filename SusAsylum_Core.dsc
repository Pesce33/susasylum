core_events:
  type: world
  events:
    on server start:
    - ~filecopy origin:map1 destination:../../map1 overwrite
    - ~filecopy origin:map2 destination:../../map2 overwrite
    - ~filecopy origin:map3 destination:../../map3 overwrite
    - ~filecopy origin:lobby1 destination:../../lobby1 overwrite
    - ~filecopy origin:lobby2 destination:../../lobby2 overwrite
    - ~filecopy origin:lobby3 destination:../../lobby3 overwrite
    - ~filecopy origin:lobby4 destination:../../lobby4 overwrite
    - ~createworld map1
    - ~createworld map2
    - ~createworld map3
    - ~createworld lobby1
    - ~createworld lobby2
    - ~createworld lobby3
    - ~createworld lobby4
    - flag server voted:0
    - run core
    - flag server status:lobby
    on player tries to attack entity with:air:
    - determine cancelled
    on player changes gamemode to survival:
    - if <player.has_flag[login]>:
      - flag player login:!
      - teleport <player> <server.flag[spawnloc]>
      - title 8s fade_in:1s fade_out:1s title:丗
    on player joins:
    - flag player login
   # - teleport <player> <server.flag[loginspawn]>
   # - flag player typing:password
   # - equip <player> head:<server.flag[bhelmet]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
   # - if <player.has_flag[password]>:
   #   - flag player requip:login
   #   - adjust <player> walk_speed:-1
   #   - narrate "<&a>Nhập mật khẩu của bạn ở chat"
   # - if !<player.has_flag[password]>:
   #   - flag player requip:register
   #   - wait 2t
   #   - narrate "<&a>Đăng kí bằng cách mật khẩu của bạn ở chat"
   #   - adjust <player> walk_speed:-1
    on player jumps:
    - if <player.has_flag[requip]>:
      - determine cancelled
    #cosmetic name: <name>cosmetic
    on player click_type clicks in inventory slot:46:
    - if <context.clicked_inventory.inventory_type> != CRAFTING:
      - stop
    - else if <context.clicked_inventory.inventory_type> == CRAFTING:
      - determine cancelled
    on player click_type clicks in inventory:
    - if <context.item.has_flag[type]> || <context.item> == netherite_sword || <context.item> == netherite_axe || <context.item> == diamond_hoe || <context.item> == wooden_hoe:
      - determine cancelled
    on player drags in inventory:
    - determine cancelled
    on weather rains in world:
    - determine cancelled
    on player swaps items:
    - determine cancelled
    after player kills player:
    - if <server.flag[status]> == ffa:
      - flag <context.damager> tkills:<context.damager.flag[tkills]>
    - if <context.damager.flag[kills]> == null:
      - flag <context.damager> kills:0
    - else if <context.damager.flag[kills]> != null:
      - flag <context.damager> kills:<context.damager.flag[kills].add[1]>
    on entity changes food level:
    - determine cancelled passively
    on player exhaustion level increases:
    - determine cancelled passively
    on player death:
    - if !<player.inventory.contains_item[masamune]>:
      - determine cancelled passively
      - run death
    - else if <player.inventory.contains_item[masamune]>:
      - if !<player.has_flag[masamunecd]>:
        - determine cancelled passively
        - playeffect effect:DUST_COLOR_TRANSITION at:<player.eye_location.ray_trace[range=4;entities=*;fluids=true;nonsolids=true;default=air]> quantity:20 visibility:60 velocity:1 special_data:2|black|black
        - adjust <player> health:20
        - flag <player> masamunecd
      - else if <player.has_flag[masamunecd]>:
        - determine cancelled passively
        - run death
    on player clicks in inventory slot:2|3|4|5:
    - if <context.clicked_inventory.inventory_type> != CRAFTING:
      - stop
    - define clickgui <map[2=default;3=default;4=default;5=default].get[<context.slot>]>
    - choose <[clickgui]>:
      - case default:
        - inventory open d:MENU1
        - playsound <player> custom sound:openmenu volume:1
    on player teleports:
    - if <player.has_flag[login]>:
      - determine cancelled

    on player breaks:
    - determine cancelled
    on player places block:
    - determine cancelled
    on entity damaged by fall:
    - determine cancelled
    on entity damaged by cramming:
    - determine cancelled
 
    on player right clicks entity:
    - if <context.entity.has_flag[map1npc]>:
      - ratelimit <player> 0.5s
      - if <player.has_flag[voted]>:
        - if <player.flag[voted]> == map1:
          #playsound command
          - stop
        - else if <player.flag[voted]> == map2:
          - announce "<&f><player.name> đã vote cho map 1!"
          - flag server map1:<server.flag[map1].add[1]>
          - flag server map2:<server.flag[map2].remove[1]>
          - flag player voted:map1
          #playsound command
          - stop
        - else if <player.flag[voted]> == map3:
          - announce "<&f><player.name> đã vote cho map 1!"
          - flag server map1:<server.flag[map1].add[1]>
          - flag server map3:<server.flag[map3].remove[1]>
          - flag player voted:map1
          #playsound command
          - stop
      - else if !<player.has_flag[voted]>:
          - announce "<&f><player.name> đã vote cho map 1!"
          - flag server map1:<server.flag[map1].add[1]>
          - flag player voted:map1
    - else if <context.entity.has_flag[map2npc]>:
      - ratelimit <player> 0.5s
      - if <player.has_flag[voted]>:
        - if <player.flag[voted]> == map2:
        #playsound command
          - stop
        - else if <player.flag[voted]> == map1:
          - announce "<&f><player.name> đã vote cho map 2!"
          - flag server map2:<server.flag[map2].add[1]>
          - flag server map1:<server.flag[map1].remove[1]>
          - flag player voted:map2
        #playsound command
          - stop
        - else if <player.flag[voted]> == map3:
          - announce "<&f><player.name> đã vote cho map 2!"
          - flag server map2:<server.flag[map2].add[1]>
          - flag server map3:<server.flag[map3].remove[1]>
          - flag player voted:map2
        #playsound command
          - stop
      - else if !<player.has_flag[voted]>:
          - announce "<&f><player.name> đã vote cho map 2!"
          - flag server map2:<server.flag[map2].add[1]>
          - flag player voted:map2
    - else if <context.entity.has_flag[map3npc]>:
      - ratelimit <player> 0.5s
      - if <player.has_flag[voted]>:
        - if <player.flag[voted]> == map3:
        #playsound command
          - stop
        - else if <player.flag[voted]> == map1:
          - announce "<&f><player.name> đã vote cho map 3!"
          - flag server map3:<server.flag[map3].add[1]>
          - flag server map1:<server.flag[map1].remove[1]>
          - flag player voted:map3
        #playsound command
          - stop
        - else if <player.flag[voted]> == map2:
          - announce "<&f><player.name> đã vote cho map 3!"
          - flag server map3:<server.flag[map3].add[1]>
          - flag server map2:<server.flag[map2].remove[1]>
          - flag player voted:map3
        #playsound command
          - stop
      - else if !<player.has_flag[voted]>:
          - announce "<&f><player.name> đã vote cho map 3!"
          - flag server map3:<server.flag[map3].add[1]>
          - flag player voted:map3
    on player quits:
    - adjust <server.players> walk_speed:0.2
    - take quantity:99999999 item:item
    - flag <server.players> typing:!
    - flag player voted:!
    - flag player requip:!
    on shutdown:
    - flag <server.players> voted:!
    - flag <server.players> requip:!
    - flag <server.players> typing:!
    - remove <server.npcs_flagged[map1]>
    - remove <server.npcs_flagged[map2]>
    - remove <server.npcs_flagged[map3]>
    - adjust <server.players> walk_speed:0.2
death:
  type: task
  debug: false
  definitions: spawn|chose1|chose2|chose3|mode|map1|map2|map3|random|chosedmap
  script:
  - if <server.flag[status]> == ffa:
    - take quantity:99999999 item:item
    - flag <player> masamunecd:!
    - equip <player> head:<server.flag[bhelmet]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
    - adjust <player> gamemode:spectator
    - create player <player.name> <player.location.add[0,1,0]> save:death
    - animate <entry[death].created_npc> animation:SLEEP
    - if <list[<server.online_players>].size> >= 2:
      - adjust <player> spectate:<server.online_players.random>
    - else if <list[<server.online_players>].size> < 2:
      - teleport <player> <server.flag[spawnloc]>
    - wait 5s
    - equip <player> head:<server.flag[bhelmet]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
    - Remove <entry[death].created_npc>
    - teleport <player> <server.flag[spawnloc]>
    - adjust <player> gamemode:survival
    - run core.weapon
  - else if <server.flag[status]> == lobby:
    - take quantity:99999999 item:item
    - flag <player> masamunecd:!
    - equip <player> head:<server.flag[bhelmet]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
    - adjust <player> gamemode:spectator
    - create player <player.name> <player.location.add[0,1,0]> save:death
    - animate <entry[death].created_npc> animation:SLEEP
    - if <list[<server.online_players>].size> >= 2:
      - adjust <player> spectate:<server.online_players.random>
    - else if <list[<server.online_players>].size> < 2:
      - teleport <player> <server.flag[spawnloc]>
    - wait 5s
    - equip <player> head:<server.flag[bhelmet]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
    - Remove <entry[death].created_npc>
    - teleport <player> <server.flag[spawnloc]>
    - adjust <player> gamemode:survival
core:
  type: task
  script:
  - flag server status:lobby
  - flag server statuscd expire:46s
  - run core.lobby
  - wait 45s
  - run core.chosingmap
  - if <list[<server.online_players>].size> >= 2:
    - flag server map:!
    - flag <server.online_players> voted:!
    - flag server chosedmap:!
    - wait 1s
    - run core.spawn
    - flag server map:!
    - flag <server.online_players> voted:!
    - flag server chosedmap:!
    - remove <server.npcs_flagged[map1]>
    - remove <server.npcs_flagged[map2]>
    - remove <server.npcs_flagged[map3]>
    - stop
  - else if <list[<server.online_players>].size> <= 1:
    - announce "<&f>Delay start map vì không đủ thành viên!"
    - run core
    - remove <server.npcs_flagged[map1]>
    - remove <server.npcs_flagged[map2]>
    - remove <server.npcs_flagged[map3]>
  chosingmap:
  - if <server.flag[map1]> > <server.flag[map2]>:
    - if <server.flag[map1]> > <server.flag[map3]>:
      - run play.chose1
    - else if <server.flag[map1]> < <server.flag[map3]>:
      - run play.chose3
    - else if <server.flag[map1]> = <server.flag[map3]>:
      - random:
        - run core.chose1
        - run core.chose3
  - else if <server.flag[map1]> < <server.flag[map2]>:
    - if <server.flag[map2]> > <server.flag[map3]>:
      - run core.chose2
    - else if <server.flag[map2]> < <server.flag[map3]>:
      - run core.chose3
    - else if <server.flag[map2]> == <server.flag[map3]>:
      - random:
        - run core.chose2
        - run core.chose3
  - else if <server.flag[map1]> == <server.flag[map2]>:
    - if <server.flag[map2]> == <server.flag[map3]>:
      - random:
        - run core.chose1
        - run core.chose2
        - run core.chose3
    - else if <server.flag[map2]> < <server.flag[map3]>:
      - run core.chose3
    - else if <server.flag[map2]> > <server.flag[map3]>:
      - random:
        - run core.chose1
        - run core.chose2
  lobby:
  - random:
    - flag server lobby:lobby1
    - flag server lobby:lobby2
    - flag server lobby:lobby3
    - flag server lobby:lobby4
  - if <server.flag[status]> == lobby:
      - if <server.flag[lobby]> == lobby1:
        - create player map1 <location[lobby1-vote1]> save:map1
        - create player map2 <location[lobby1-vote2]> save:map2
        - create player map3 <location[lobby1-vote3]> save:map3
      - else if <server.flag[lobby]> == lobby2:
        - create player map1 <location[lobby2-vote1]> save:map1
        - create player map2 <location[lobby2-vote2]> save:map2
        - create player map3 <location[lobby2-vote3]> save:map3
      - else if <server.flag[lobby]> == lobby3:
        - create player map1 <location[lobby3-vote1]> save:map1
        - create player map2 <location[lobby3-vote2]> save:map2
        - create player map3 <location[lobby3-vote3]> save:map3
      - else if <server.flag[lobby]> == lobby4:
        - create player map1 <location[lobby4-vote1]> save:map1
        - create player map2 <location[lobby4-vote2]> save:map2
        - create player map3 <location[lobby4-vote3]> save:map3
  - invisible <entry[map1].created_npc> true
  - invisible <entry[map2].created_npc> true
  - invisible <entry[map3].created_npc> true
  - equip <entry[map1].created_npc> head:<server.flag[map1icon]>
  - equip <entry[map2].created_npc> head:<server.flag[map2icon]>
  - equip <entry[map3].created_npc> head:<server.flag[map3icon]>
  - flag <entry[map1].created_npc> map1npc
  - flag <entry[map2].created_npc> map2npc
  - flag <entry[map3].created_npc> map3npc

  - flag server status:lobby
  - run core.spawn
  - title 8s fade_in:1s fade_out:1s title:丗
  - wait 2s
  - teleport <player> <server.flag[spawnloc]>
  - wait 1s
  - flag <server.online_players> tkills:0


  spawn:
  - if <server.flag[status]> == lobby:
      - if <server.flag[lobby]> == lobby1:
        - flag server spawnloc:<location[lobbyspawn1]>
      - else if <server.flag[lobby]> == lobby2:
        - flag server spawnloc:<location[lobbyspawn2]>
      - else if <server.flag[lobby]> == lobby3:
        - flag server spawnloc:<location[lobbyspawn3]>
      - else if <server.flag[lobby]> == lobby4:
        - flag server spawnloc:<location[lobbyspawn4]>
  - if <server.flag[status]> == ffa:
      - if <server.flag[chosedmap]> == map1:
        - random:
          - flag server spawnloc:<location[map1-1]>
          - flag server spawnloc:<location[map1-2]>
          - flag server spawnloc:<location[map1-3]>
          - flag server spawnloc:<location[map1-4]>
          - flag server spawnloc:<location[map1-5]>
          - flag server spawnloc:<location[map1-6]>
      - else if <server.flag[chosedmap]> == map2:
        - random:
          - flag server spawnloc:<location[map2-1]>
          - flag server spawnloc:<location[map2-2]>
          - flag server spawnloc:<location[map2-3]>
      - else if <server.flag[chosedmap]> == map3:
        - random:
          - flag server spawnloc:<location[map3-1]>
          - flag server spawnloc:<location[map3-2]>
          - flag server spawnloc:<location[map3-3]>
  chose1:
    - flag server chosedmap:map1
    - flag server status:ffa
    - run core.spawn
    - flag server statuscd expire:4m
    - flag <server.online_players> tkills:0
    - teleport <player> <server.flag[spawnloc]>
    - title 8s fade_in:1s fade_out:1s title:丗
    - run core.weapon
    - wait 4m
    - run core.end
  chose2:
    - flag server chosedmap:map2
    - flag server status:ffa
    - run core.spawn
    - flag server statuscd expire:4m
    - flag <server.online_players> tkills:0
    - teleport <player> <server.flag[spawnloc]>
    - title 8s fade_in:1s fade_out:1s title:丗
    - run core.allplayerweapon
    - wait 4m
    - run core.end
  chose3:
    - flag server chosedmap:map3
    - flag server status:ffa
    - run core.spawn
    - flag server statuscd expire:4m
    - flag <server.online_players> tkills:0
    - teleport <player> <server.flag[spawnloc]>
    - title 8s fade_in:1s fade_out:1s title:丗
    - run core.allplayerweapon
    - wait 4m
    - run core.end
  weapon:
    - random:
      - give progolf
      - give scythe
      - give netherite_sword
      - give masamune
      - give airforcombat
      - give netherite_axe
      - give wooden_hoe
      - give diamond_hoe
      - give pheonix
      # add custom item with flag /ex flag server (itemname):<player.item_in_hand>
      # get by /ex give <server.flag[(itemname)]
  allplayerweapon:
    - random:
      - give progolf player:<server.players>
      - give scythe player:<server.players>
      - give netherite_sword player:<server.players>
      - give masamune player:<server.players>
      - give airforcombat player:<server.players>
      - give netherite_axe player:<server.players>
      - give wooden_hoe player:<server.players>
      - give diamond_hoe player:<server.players>
      - give pheonix player:<server.players>
  end:
    end:
    - foreach <server.online_players_flagged[discord]> as:eplayer:
      - money give quantity:<[eplayer].flag[tkills]> players:<[eplayer]>
    - wait 5s
    - adjust <server.online_players> speed:0
    - run core
