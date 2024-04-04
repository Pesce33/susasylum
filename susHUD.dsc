updatehealth:
  type: task
  script:
    - define ph <player.health>
    - define 0 <&chr[4E14]>
    - define 20 <&chr[Eff4]>
    - define 19 <&chr[Eff5]>
    - define 18 <&chr[Eff6]>
    - define 17 <&chr[Eff7]>
    - define 16 <&chr[Eff8]>
    - define 15 <&chr[Eff9]>
    - define 14 <&chr[4E00]>
    - define 13 <&chr[4E01]>
    - define 12 <&chr[4E02]>
    - define 11 <&chr[4E03]>
    - define 10 <&chr[4E04]>
    - define 9 <&chr[4E05]>
    - define 8 <&chr[4E06]>
    - define 7 <&chr[4E07]>
    - define 6 <&chr[4E08]>
    - define 5 <&chr[4E09]>
    - define 4 <&chr[4E10]>
    - define 3 <&chr[4E11]>
    - define 2 <&chr[4E12]>
    - define 1 <&chr[4E13]>
    - define 21 <&chr[4E15]>
    - if <player.gamemode> = survival:
      - if <[ph]> >= 20:
        - sidebar set_line scores:1 values:<[21]>
      - if <[ph]> = 20:
        - sidebar set_line scores:1 values:<[20]>
      - if <[ph]> >= 19 && <[ph]> < 20:
        - sidebar set_line scores:1 values:<[19]>
      - if <[ph]> >= 18 && <[ph]> < 19:
        - sidebar set_line scores:1 values:<[18]>
      - if <[ph]> >= 17 && <[ph]> < 18:
        - sidebar set_line scores:1 values:<[17]>
      - if <[ph]> >= 16 && <[ph]> < 17:
        - sidebar set_line scores:1 values:<[16]>
      - if <[ph]> >= 15 && <[ph]> < 16:
        - sidebar set_line scores:1 values:<[15]>
      - if <[ph]> >= 14 && <[ph]> < 15:
        - sidebar set_line scores:1 values:<[14]>
      - if <[ph]> >= 13 && <[ph]> < 14:
        - sidebar set_line scores:1 values:<[13]>
      - if <[ph]> >= 12 && <[ph]> < 13:
        - sidebar set_line scores:1 values:<[12]>
      - if <[ph]> >= 11 && <[ph]> < 12:
        - sidebar set_line scores:1 values:<[11]>
      - if <[ph]> >= 10 && <[ph]> < 11:
        - sidebar set_line scores:1 values:<[10]>
      - if <[ph]> >= 9 && <[ph]> < 10:
        - sidebar set_line scores:1 values:<[9]>
      - if <[ph]> >= 8 && <[ph]> < 9:
        - sidebar set_line scores:1 values:<[8]>
      - if <[ph]> >= 7 && <[ph]> < 8:
          - sidebar set_line scores:1 values:<[7]>
      - if <[ph]> >= 6 && <[ph]> < 7:
          - sidebar set_line scores:1 values:<[6]>
      - if <[ph]> >= 5 && <[ph]> < 6:
          - sidebar set_line scores:1 values:<[5]>
      - if <[ph]> >= 4 && <[ph]> < 5:
          - sidebar set_line scores:1 values:<[4]>
      - if <[ph]> >= 3 && <[ph]> < 4:
          - sidebar set_line scores:1 values:<[3]>
      - if <[ph]> >= 2 && <[ph]> < 3:
          - sidebar set_line scores:1 values:<[2]>
      - if <[ph]> >= 0.1 && <[ph]> < 2:
          - sidebar set_line scores:1 values:<[1]>
      - if <[ph]> = 0:
          - sidebar set_line scores:1 values:<[0]>
    - else if <player.gamemode> = spectator:
      - sidebar set_line scores:1 values:<[0]>
      - stop
    - else if <player.gamemode> = creative:
      - sidebar set_line scores:1 values:<[21]>
      - stop
refesh:
  type: task
  script:
    - define line <&a><element[<&sp>].repeat[80].strikethrough>
    - ratelimit <player> 5t
    - inventory close
    - clickable save:onchat:
      - flag player disablechat:!
      - narrate "<&a>Bạn đã mở chat!"
      - run refesh
    - clickable save:offchat:
      - flag player disablechat
      - narrate "<&a>Bạn đã tắt chat!"
      - run refesh
    - clickable save:ondchat:
      - flag player disabledchat:!
      - narrate "<&a>Bạn đã mở discord chat!"
      - run refesh
    - clickable save:offdchat:
      - flag player disabledchat
      - narrate "<&a>Bạn đã tắt discord chat!"
      - run refesh
    - clickable save:onfact:
      - flag player disabledfact:!
      - narrate "<&a>Bạn đã mở fact! (thoát ra vô lại để áp dụng!)"
      - run refesh
    - clickable save:offfact:
      - flag player disabledfact
      - narrate "<&a>Bạn đã tắt fact!"
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <element[<&l>SusAsylum<&f>].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l><< <&b><&k>X" color:YELLOW players:<player>
      - run refesh
    - clickable save:onip:
      - flag player disabledip:!
      - narrate "<&a>Bạn đã mở Ip server bar! (thoát ra vô lại để áp dụng!)"
      - run refesh
    - clickable save:offip:
      - flag player disabledip
      - bossbar logo "title:" color:YELLOW players:<player>
      - narrate "<&a>Bạn đã tắt Ip server bar!"
      - run refesh
    - clickable save:onfriend:
      - flag player disabledfriend:!
      - narrate "<&a>Bạn đã mở Friend request"
      - run refesh
    - clickable save:offfriend:
      - flag player disabledfriend
      - narrate "<&a>Bạn đã tắt Friend request!"
      - run refesh
    - clickable save:refesh:
      - run refesh
    - narrate <[line]>
    - narrate "<&a>                        <&l>Adjust Settings"
    - narrate "<&a><&a>Chat <player.has_flag[disablechat].if_true[<element[<&4><&l>[Off]].on_click[<entry[onchat].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offchat].command>]><reset>]>"
    - narrate "<&a><&a>Discord Chat <player.has_flag[disabledchat].if_true[<element[<&4><&l>[Off]].on_click[<entry[ondchat].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offdchat].command>]><reset>]>"
    - narrate "<&a><&a>Random Stoopid fact <player.has_flag[disabledfact].if_true[<element[<&4><&l>[Off]].on_click[<entry[onfact].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offfact].command>]><reset>]>"
    - narrate "<&a><&a>Ip server bar <player.has_flag[disabledip].if_true[<element[<&4><&l>[Off]].on_click[<entry[onip].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offip].command>]><reset>]>"
    - narrate "<&a><&a>Friend request <player.has_flag[disabledfriend].if_true[<element[<&4><&l>[Off]].on_click[<entry[onfriend].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offfriend].command>]><reset>]>"
    - narrate "                                        <element[<&a><&l>[Refesh]].on_click[<entry[refesh].command>]><reset>"
    - narrate <[line]>
healthbar:
  type: world
  events:
    after player heals:
    - run updatehealth
    after player damaged:
    - run updatehealth
    after player joins:
    - run updatehealth
    after player changes gamemode:
    - run updatehealth

playerhud:
  type: world
  events:
    after player scrolls their hotbar:
    - if <player.item_in_hand.has_flag[type]>:
      - if <player.item_in_hand.flag[type]> == sword:
        - bossbar skill "title:<&chr[F80E]><&color[240,240,20]><&chr[4E53]>" color:YELLOW players:<player>
      - if <player.item_in_hand.flag[type]> == range:
        - bossbar skill "title:<&chr[F80E]><&color[240,240,20]><&chr[4E59]>" color:YELLOW players:<player>
      - if <player.item_in_hand.flag[type]> == ability:
        - bossbar skill "title:<&chr[F80E]><&color[240,240,20]><&chr[4E60]>" color:YELLOW players:<player>
      - if <player.item_in_hand.flag[type]> == pheonix:
        - bossbar skill "title:<&chr[F80E]><&color[240,240,20]><&chr[4E61]>" color:YELLOW players:<player>
    - else if !<player.item_in_hand.has_flag[type]>:
      - bossbar skill title:<&color[240,240,20]> color:YELLOW players:<player>
    on player joins:
      - define client           <player.client_brand||null>
      - define client_blacklist <list[Lunar|Feather|Badlion|unknown]>
      - if <player.is_online> && <[client].contains_any_text[<[client_blacklist]>]>:
        - playsound <player> sound:BLOCK_NOTE_BLOCK_PLING pitch:1.5
        - define line <&8><element[<&sp>].repeat[80].strikethrough>
        - narrate <[line]>
        - narrate "<&4><&l>Lưu ý!"
        - narrate "<&c>Có vẻ như bạn đang dùng 1 client minecraft không hỗ trợ trong server này"
        - narrate "<&7>Client của bạn: <&4><player.client_brand>"
        - narrate "<&7>Client không hỗ trợ: <&4>Lunar client; Feather client; Badlion;..."
        - define line <&8><element[<&sp>].repeat[80].strikethrough>
      - adjust <player> "tab_list_info:<n><n>丠<n>两<n><n><n><n><n><n><n><element[Online Players:].color_gradient[from=#fcd869;to=#fab56b]> <element[<list[<server.online_players>].size>].color_gradient[from=#6bb5d4;to=#6bb5d4]><&f><n><element[Mode:].color_gradient[from=#fcd869;to=#fab56b]> <element[<server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]><&f><n>丘<n>丙<n><n><n><n>乔<n><n>|<n><n><n><n><n><n><n><n><n><n><n><n><n><n><n><n>"
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <element[<&l>SusAsylum<&f>].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l><< <&b><&k>X" color:YELLOW players:<server.online_players>
      - bossbar logo "title:" color:YELLOW players:<server.players_flagged[!disabledip]>
      - adjust <player> "send_server_brand:<&a>[<&b><&k>a<&f><&a>] <&e><&l>SusAsylum<&f> <&a>[<&b><&k>a<&f><&a>]<&4> <&4>wellcome <&4><player.name><&f>"
    after delta time secondly:
    - foreach <server.online_players> as:player:
      - equip <[player]> chest:<server.flag[bchestplate]> legs:<server.flag[bleggings]> boots:<server.flag[bboots]>
      - adjust <[player]> "tab_list_info:<n><n>丠<n>两<n><n><n><n><n><n><n><element[Online Players:].color_gradient[from=#fcd869;to=#fab56b]> <element[<list[<server.online_players>].size>].color_gradient[from=#6bb5d4;to=#6bb5d4]><&f><n><element[Mode:].color_gradient[from=#fcd869;to=#fab56b]> <element[<server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]><&f><n>丘<n>丙<n><n><n><n>乔<n><n>|<n><n><n><n><n><n><n><n><n><n><n><n><n><n><n><n>"
      - if !<[player].has_flag[using]>:
        - equip <[player]> head:<server.flag[bhelmet]>
        - equip <[player]> offhand:air
      - else if <[player].has_flag[using]>:
        - if <[player].flag[using]> == chainsaw1:
          - equip <[player]> head:<server.flag[<[player].flag[equipitem]>cosmetic]>
          - equip <[player]> offhand:air
        - if <[player].flag[using]> == chainsaw2:
          - equip <[player]> head:<server.flag[bhelmet]>
          - equip <[player]> offhand:<server.flag[<[player].flag[equipitem]>cosmetic]>
    after delta time minutely:
    - random:
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <element[<&l>Fact: you can't reset your character in this server... or can you?<&f>].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l><< <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <element[<&l>SusAsylum<&f>].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l><< <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&d><&l>1+1=3<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&4><&l>AMOG US<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&e><&l>KhoaSoma Gave me free HOSTING FOR THIS PROJECT :OO<&f><&l>< < <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&a><&l>Rule 3,141592653589: No N-WORD<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&b><&l>I gOT FReE bObuX fRoM THis SeRVEr<&f><&l ><< <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&f>nerd kid<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&a><&l>I Need Coins <&f><&l><< <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&c><&l>SussyAsylum<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&d><&l>56709<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&f><&l>Protip: Don't Die!<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&a><&l>THE ONE PEICE, THE ONE PEICE IS FAKEEEEEE<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&e><&l>FREEFIRE <&4><&l>MAX<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&d><&l>Hammer stickle team is shit<&f><&l> << <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
      - bossbar annocument "title:<&b><&k>X <&f><&l>>> <&d><&c>Your jodans are fake<&f><&l ><< <&b><&k>X" color:YELLOW players:<server.players_flagged[!disablefact]>
    on server list ping:
    - random:
      - define motd "        <&a><&k><&l>k<&r> <&f><&l>🔥 <element[<&l>SusAsylum Max].color_gradient[from=#fcc600;to=#fce28d]> | <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🔥 <&a><&k><&l>k<&r><&r><&nl>                       <&e><&l>ProTip: Don't die"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>         <&e><&l>ProTip: You can kill your enemies by using weapon"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>          <&e><&l>ProTip: Press SPACE to jump"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>          <&a><&l>Minecraft pvp server but..."
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                 <&b><&l>Nerds are illegal"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                            <&d>🎵"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                          <&a><&l>Tree"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                       <&f><&l>Nah, i'd win"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                  <&f>[Content Deleted]"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                      <&f><&l>Skibidi toilet"
      - define motd "          <&a><&k><&l>k<&r> <&f><&l>🛡 <element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l>| <element[<&l><server.flag[status]>].color_gradient[from=#6bb5d4;to=#6bb5d4]> <&f><&l>🛡 <&a><&k><&l>k<&r><&r><&nl>                       <&c><&l>You Gay"
    - random:
      - define maxp "-1"
      - define maxp "32767"
      - define maxp "19132"
      - define maxp "25565"
      - define maxp "0"
      - define maxp "1000000000"
    - determine passively MOTD:<[motd]>
    - determine passively max_players:<[maxp]>


Menu1:
    type: inventory
    inventory: chest
    title: "<&f>乇<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [] [shop1] [] [shop2] [] [shop3] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Menu2:
    type: inventory
    inventory: chest
    title: "<&f>么<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [shop1] [shop3] [shop2] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Menu3:
    type: inventory
    inventory: chest
    title: "<&f>义<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [blank7] [blank7] [blank7] [] [] []
    - [] [] [] [blank7] [blank7] [blank7] [] [] []
    - [] [discord] [report] [cpw] [fact] [bugreport] [friends] [disablest] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

Menu4:
    type: inventory
    inventory: chest
    title: "<&f>乐<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

cosmetic:
    type: inventory
    inventory: chest
    title: "<&f>乑<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [chainsaw] [chainsaw2] [none] [none] [none] [none] [none] []
    - [] [none] [none] [none] [none] [none] [none] [none] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

cosmeticinv:
    type: inventory
    inventory: chest
    title: "<&f>乑<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [<player.has_flag[buyedchainsaw].if_true[chainsaw].if_false[none]>] [<player.has_flag[buyedchainsaw2].if_true[chainsaw2].if_false[none]>] [none] [none] [none] [none] [none] []
    - [] [none] [none] [none] [none] [none] [none] [none] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []

buymenu:
    type: inventory
    inventory: chest
    title: "<&f>乒<&e><Player.money>"
    definitions: buyitem
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [] [<[buyitem]>] [] [] [blank5] [blank5] [blank5] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []



adminpanel:
    type: inventory
    inventory: chest
    title: "<&f>乇<&e><Player.money>"
    gui: true
    slots:
    - [blank1] [blank2] [blank3] [blank4] [blank6] [] [] [] [exit]
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [mapad] [playerad] [itemad] [] [] []
    - [] [] [] [] [tagad] [] [] [] []
    - [] [] [] [] [] [] [] [] []
    - [] [] [] [] [] [] [] [] []
tagad:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 22
mapad:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 24
friends:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 29
playerad:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 23
itemad:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 25
disablest:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 30
blank1:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
blank2:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
blank3:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
blank4:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
resetcharacter:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 11
discord:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 12
cpw:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 26
fact:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 27
bugreport:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 28
report:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 13
blank5:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
blank6:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
blank7:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
shop1:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 7
shop2:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 8
shop3:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 9
exit:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 6
chainsaw:
    type: item
    material: gold_ingot
    display name: "<&6>Chainsaw-man's head"
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 1
    lore:
    - <&a>Giá:<&e> 1000 xu
chainsaw2:
    type: item
    material: gold_ingot
    display name: "<&6>Chainsaw-man's backpack"
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 2
    lore:
    - <&a>Giá:<&e> 1000 xu
none:
    type: item
    material: diamond
    display name: " "
    mechanisms:
      unbreakable: true
      hides: ALL
      custom_model_data: 10

buttons:
    definitions: buyitem|price|reportname|reporter|chat
    type: world
    events:
        on entity damaged:
        - define damage <&c><&l>-<context.damage.mul[5].round_down>
        - if <context.final_damage> == 0:
          - stop
        - else if <context.final_damage> != 0:
          - spawn <entity[armor_stand].with[invulnerable=true;visible=false;gravity=false;custom_name=<[damage]>;custom_name_visible=true]> <context.entity.location.random_offset[0.2,0.2,0.2]> save:damage
          - wait 20t
          - remove <entry[damage].spawned_entity>
        on player chats:
        - if <player.has_flag[typing]>:
          - determine passively cancelled
          - if <player.flag[typing]> == cpw:
            - flag player typing:!
            - if <context.message> == <player.flag[password]>:
              - flag player typing:newpw
              - define line <&a><element[<&sp>].repeat[80].strikethrough>
              - narrate <[line]>
              - narrate "<&a>Nhập mật khẩu mới"
              - narrate <[line]>
              - stop
            - else if <context.message> != <player.flag[password]>:
              - narrate "<&4>Sai mật khẩu!"
              - inventory open d:menu3
          - if <player.flag[typing]> == newpw:
            - flag player typing:!
            - define password <player.chat_history[1]>
            - if <[password].matches_character_set[abcdefghijklmnopqrstuvwxyz1234567890QWERTYUIOPLKJHGFDSAZXCVBNM_-]>:
              - flag player password:<[password]>
              - narrate "<&a>Đổi mật khẩu thành công!"
              - inventory open d:menu3
            - else if <[password].matches_character_set[abcdefghijklmnopqrstuvwxyz1234567890QWERTYUIOPLKJHGFDSAZXCVBNM_-]>:
              - narrate "<&4>Mật khẩu bao gồm: A-Z; a-z; 1-9; _; -"
              - narrate "<&4>Xin vui lòng nhập lại!"
          - if <player.flag[typing]> == fact:
            - flag player typing:!
            - narrate "<&a><&l>Submit fact thành công!"
            - define reportresult <discord_embed.with_map[title=SusAsylum FACTS;description=**Tên người submit:** <player.name><n>**Fact:** <context.message>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#FF0000]>
            - ~discordmessage id:SusAsylum channel:<server.flag[facts]> embed:<[reportresult]>
            - inventory open d:menu3
            - stop
          - if <player.flag[typing]> == coins:
            - flag player typing:!
            - if <context.message.matches_character_set[0123456789]>:
              - narrate "<&a>Bạn đã nhận <&e><context.message> Coins <&a>!"
              - money give players:<player> quantity:<context.message>
              - stop
            - else if !<context.message.matches_character_set[0123456789]>:
              - narrate "<&4>Thứ bạn vừa nhập không phải là số!"
              - stop
          - if <player.flag[typing]> == op:
            - flag player typing:!
            - define playerid <context.message.as[player]>
            - if <[playerid].is_online>:
              - clickable save:kick:
                - kick <[playerid]> "reason:<element[<&l>SusAsylum].color_gradient[from=#fcd869;to=#fab56b]><n><&4>Bạn đã bị kick!"
              - define line <&a><element[<&sp>].repeat[80].strikethrough>
              - clickable save:teleport1:
                - teleport <player> <[playerid].location>
                - narrate "<&a>Dịch chuyển thành công!"
              - clickable save:teleport2:
                - teleport <[playerid]> <player.location>
                - narrate "<&a>Dịch chuyển thành công!"
              - clickable save:ban:
                - kick <[playerid]> "reason:<element[<&l>SusAsylum].color_gradient[from=#fcd869;to=#fab56b]><n><&4>Bạn đã bị Ban!"
              - clickable save:freeze:
                - narrate "<&a>Đóng băng thành công!"
                - narrate "<&b>Bạn đã bị đóng băng!" targets:<[playerid]>
                - adjust <[playerid]> freeze_duration:999999s
                - adjust <[playerid]> walk_speed:0
                - cast JUMP <[playerid]> duration:999999s amplifier:-10
              - clickable save:unfreeze:
                - narrate "<&a>Hủy băng thành công!"
                - narrate "<&b>Bạn được hủy đóng băng!" targets:<[playerid]>
                - adjust <[playerid]> freeze_duration:1s
                - adjust <[playerid]> walk_speed:0.2
                - cast JUMP <[playerid]> remove
              - narrate <[line]>
              - narrate "              <&a><&l><context.message>"
              - narrate "<element[<&c>[Kick]].on_click[<entry[Kick].command>]><reset>"
              - narrate "<element[<&4>[Ban]].on_click[<entry[Ban].command>]><reset>"
              - narrate "<element[<&a>[Teleport You to <context.message>]].on_click[<entry[teleport1].command>]><reset>"
              - narrate "<element[<&a>[Teleport <context.message> to you]].on_click[<entry[teleport2].command>]><reset>"
              - narrate "<element[<&b>[Freeze]].on_click[<entry[freeze].command>]><reset>"
              - narrate "<element[<&b>[UnFreeze]].on_click[<entry[unfreeze].command>]><reset>"

              - narrate <[line]>
              - stop
            - if !<[playerid].is_online>:
              - narrate "<&4>Người chơi không online!"
              - stop
          - if <player.flag[typing]> == bug:
            - flag player typing:!
            - narrate "<&a><&l>Tố cáo lỗi thành công!"
            - define reportresult <discord_embed.with_map[title=SusAsylum FACTS;description=**Tên người tố cáo:** <player.name><n>**Lỗi:** <context.message>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#FF0000]>
            - ~discordmessage id:SusAsylum channel:<server.flag[bug]> embed:<[reportresult]>
            - inventory open d:menu3
            - stop
          - if <player.flag[typing]> == remove:
            - flag player typing:!
            - define sender <player.name>
            - define number <context.message>
            - if <[number].matches_character_set[0123456789]>:
              - if <player.flag[friends].size> >= <[number]>:
                - narrate "<&a>Bạn đã xóa thành công <player.flag[friends].get[<[number]>]>"
                - flag player friends:<list[<player.flag[friends]>].remove[<[number]>]>
                - if <player.flag[friends].size> <= 0:
                  - flag player friends:!
              - else if <player.flag[friends].size> <= <[number]>:
                - narrate "<&4>Thứ tự không hợp lệ!" targets:<player>
                - inventory open d:menu3
            - else if !<[number].matches_character_set[0123456789]>
            - inventory open d:menu3
            - stop
          - if <player.flag[typing]> == add:
            - flag player typing:!
            - define sender <player.name>
            - define friend <context.message.as[player]>
            - if <[friend].is_online>:
              - if !<[friend].is_in[<player.flag[friends]>]>:
                - if <[friend]> != <player> && !<[friend].has_flag[disablefriend]> :
                  - clickable save:x:
                    - narrate "<&4>Bạn đã hủy lời mời kết bạn từ <[sender]>" targets:<[friend]>
                    - narrate "<&4><[sender]> đã hủy lời mời kết bạn của bạn!" targets:<[friend]>
                  - clickable save:accept:
                    - narrate "<&a><&l>Bạn đã đồng ý yêu cầu kết bạn từ <[sender]>!" targets:<[friend]>
                    - narrate "<&a><&l><context.message> đã đồng ý yêu cầu kết bạn!" targets:<player>
                    - flag <player> friends:<list[<player.has_flag[friends].if_true[<player.flag[friends]>|].if_false[]><[friend]>]>
                    - flag <[friend]> friends:<list[<[friend].flag[friends]>|<[sender]>]>
                  - narrate "<&a><&l>Đã gửi lời mời kết bạn thành công"
                  - narrate "<&a><&l><[sender]> gửi lời mời kết bạn cho bạn" targets:<context.message.as[player]>
                  - narrate "<element[<&a><&l>[Đồng ý]].on_hover[<&a>Bấm để đồng ý!].on_click[<entry[accept].command>]> <element[<&4><&l>[Hủy]].on_hover[<&4>Bấm để hủy yêu cầu kết bạn!].on_click[<entry[x].command>]>" targets:<context.message.as[player]>
                - else if <[friend]> == <player>:
                  - narrate "<&4>Tự kỉ?"
                - else if <[friend].has_flag[disablefriend]>:
                  - narrate "<&4>Người này đã tắt yêu cầu kết bạn!"
              - else if <context.message.is_in[<player.flag[friends]>]>:
                - narrate "<&4>Bạn đã kết bạn với người này rồi!"
            - else if !<[friend].is_online>:
              - narrate "<&4><&l>Người chơi không tồn tại!"
              - inventory open d:menu3
            - stop
          - if <player.flag[typing]> == name:
            - flag player typing:!
            - define reporter <player.name>
            - flag server tempreportuser:<player.chat_history[1]>
            - define playerintotal <server.players>
            - define line <&a><element[<&sp>].repeat[80].strikethrough>
            - narrate <[line]>
            - narrate "<&a>Nhập lý do tố cáo"
            - narrate <[line]>
            - flag player typing:reason
            - stop
          - else if <player.flag[typing]> == reason:
            - define line <&a><element[<&sp>].repeat[80].strikethrough>
            - flag player typing:!
            - define reporter <player.name>
            - define reportname <server.flag[tempreportuser]>
            - define reportreason <player.chat_history[1]>
            - narrate <[line]>
            - narrate "<&a>Tố cáo thành công!"
            - narrate <[line]>
            - define reportresult <discord_embed.with_map[title=SusAsylum Player Report;description=Tên người chơi: <server.flag[tempreportuser]><n>Lí do tố cáo: <[reportreason]><n>Tố cáo bởi: <[reporter]>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#FF0000]>
            - ~discordmessage id:SusAsylum channel:<server.flag[report]> "<discord_user[950706452262174751].mention> <discord_user[744189538930393108].mention> <discord_user[974882364415176716].mention>" embed:<[reportresult]>
            - stop
          #- else if <player.flag[typing]> == password:
          #  - define password <player.chat_history[1]>
          #  - if <player.flag[requip]> == register:
          #    - if <[password].matches_character_set[abcdefghijklmnopqrstuvwxyz1234567890QWERTYUIOPLKJHGFDSAZXCVBNM_-]>:
          #      - flag player password:<[password]>
          #      - narrate "<&a>Đăng kí thành công!"
          #      - flag player requip:!
          #      - flag player typing:!
          #      - adjust <player> walk_speed:0.2
          #      - teleport <player> <server.flag[spawnloc]>
          #      - title 8s fade_in:1s fade_out:1s title:丗
          #    - else if <[password].matches_character_set[abcdefghijklmnopqrstuvwxyz1234567890QWERTYUIOPLKJHGFDSAZXCVBNM_-]>:
          #      - narrate "<&4>Mật khẩu bao gồm: A-Z; a-z; 1-9; _; -"
          #      - narrate "<&4>Xin vui lòng nhập lại!"
          #  - if <player.flag[requip]> == login:
          #    - if <[password]> == <player.flag[password]>:
          #      - narrate "<&a>Đăng nhập thành công!"
          #      - teleport <player> <server.flag[spawnloc]>
          #      - title 8s fade_in:1s fade_out:1s title:丗
          #      - flag player requip:!
          #      - flag player typing:!
          #      - adjust <player> walk_speed:0.2
          #    - else if <[password]> != <player.flag[password]>:
          #      - kick <player> "reason:<&4>Sai mật khẩu!"
        - else if !<player.has_flag[typing]>:

          - if !<player.has_flag[color]>:
            - flag player color:255,255,255
          - define message "<player.has_flag[title].if_true[<player.flag[title]> ].if_false[]><&color[<player.flag[color]>]><player.name><player.has_flag[deco].if_true[ <player.flag[deco]>].if_false[]><&f>: <player.has_flag[chatcolor].if_true[<player.flag[chatcolor]>].if_false[]><context.message>"
          - determine passively cancelled
          - narrate <[message]> targets:<server.players_flagged[!disablechat]>
          - define discordmessage "<player.name>: <context.message>"
          - ~discordmessage id:SusAsylum channel:<server.flag[log]> <[discordmessage]>

        # - ~discordmessage id:SusAsylum channel:<server.flag[report]> "Đã ban thành công <[player]>!"
        # - kick <[player]> "reason:<element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]><n><&4><&l>Bạn đã bị ban khỏi server!<n><&4><&l>Lý do:<&f> <[reason]><n><&4><&l>Thời hạn ban: <&f>Cho đến khi bạn cầu xin admin unban<n><n><n><n><n><n><&b><&o>Nếu bạn bị ban oan thì có thể unban tại https://discord.gg/aBJvxvz5RZ<n><&f>xin chia buồn là bạn sẽ phải nhập link discord bằng tay"
        # - ban <[player]> "reason:<element[<&l>SusAsylum].color_gradient[from=#fcc600;to=#fce28d]><n><&4><&l>Bạn đã bị ban khỏi server!<n><&4><&l>Lý do:<&f> <[reason]><n><&4><&l>Thời hạn ban: <&f>Cho đến khi bạn cầu xin admin unban<n><n><n><n><n><n><&b><&o>Nếu bạn bị ban oan thì có thể unban tại https://discord.gg/aBJvxvz5RZ<n><&f>xin chia buồn là bạn sẽ phải nhập link discord bằng tay"

        after discord message received channel:1182295368113868860:
        - if <context.new_message.author.name> != SusAsylum:
          - narrate "<&f>乕<&e> <element[<context.new_message.author.name>].color_gradient[from=#fcc600;to=#fce28d]><&f><n><&f> <&f> <&f> <&f> <&f> <&f> <context.new_message.text>" targets:<server.players_flagged[!disabledchat]>
          #  <context.new_message.author.roles.color> <context.new_message.author.name>
          # <element[<context.new_message.author.name>].color_gradient[from=#fcc600;to=#fce28d]>
        after discord message received:
        - if <context.new_message.author> != SusAsylum:
          - if <context.new_message.text.contains_text[ip server]>:
            - define ip <discord_embed.with_map[title=SusAsylum;description=Ip: SusAsylum.mcplay.eu<n>Version: 1.17+<n>Info: A Copy version of ItemAsylum<n> on roblox<n>Join now or Death💀;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#fcc600]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - if <context.new_message.text.contains_text[!ip]>:
            # - define ip <discord_embed.with_map[title=SusAsylum;description=Ip: SusAsylum.mcplay.eu<n>Version: 1.17+<n>Info: A Copy version of ItemAsylum<n> on roblox<n>Join now or Death💀;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#fcc600]>
            - define ip <discord_embed.with_map[title=SusAsylum;description=Server Đang Trong Bảo Trì!;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#FF0000]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - if <context.new_message.text.contains_text[như cc]>:
            - define ip <discord_embed.with_map[title=SusAsylum;description=Cái đb mẹ m chơi đc thì chơi k chơi thì cúc;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#FF0000]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - if <context.new_message.text.contains_text[sao chơi]>:
            - define ip <discord_embed.with_map[title=SusAsylum;description=Cách chơi:<n>Khi mới vô, cách người chơi sẽ ở trong lobby để vote map<n>và các chế độ chơi.<n>Có các chế độ chơi như:<n>FFA: Giết người tự do, mỗi khi chết sẽ có dồ ngẫu nhiên<n>Kit: Mỗi khi hồi sinh sẽ được lựa chọn 1 trong 3 kit ngẫu nhiên, càng nhiều kills càng tốt<n>Jgn: 1 Người chơi sẽ biến thành boss và những người còn lại phải giết được boss (mỗi người 7 mạng)<n>Zs: Chế độ zombie, sống sót lâu nhất có thể<n>Boss: như cái tên (mỗi người 7 mạng)<n>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#fcc600]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - if <context.new_message.text.contains_text[!howtoplay]>:
            - define ip <discord_embed.with_map[title=SusAsylum;description=Cách chơi:<n>Khi mới vô, cách người chơi sẽ ở trong lobby để vote map<n>và các chế độ chơi.<n>Có các chế độ chơi như:<n>FFA: Giết người tự do, mỗi khi chết sẽ có dồ ngẫu nhiên<n>Kit: Mỗi khi hồi sinh sẽ được lựa chọn 1 trong 3 kit ngẫu nhiên, càng nhiều kills càng tốt<n>Jgn: 1 Người chơi sẽ biến thành boss và những người còn lại phải giết được boss (mỗi người 7 mạng)<n>Zs: Chế độ zombie, sống sót lâu nhất có thể<n>Boss: như cái tên (mỗi người 7 mạng)<n>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#fcc600]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - if <context.new_message.text.contains_text[có j hot]>:
            - define ip <discord_embed.with_map[title=SusAsylum;description=Có mẹ mày<n>Dùng !howtoplay để biết thêm<n>;thumbnail=https://i.imgur.com/9eKvaKw.png;color=#fcc600]>
            - ~discordmessage id:SusAsylum reply:<context.new_message> <[ip]>
          - foreach <server.online_players_flagged[discord]> as:user:
            - if <context.new_message.text.contains_text[<[user].flag[discord]>]>:
              - define success <discord_embed.with_map[author_icon_url=https://mc-heads.net/avatar/<[user]>;author_name=Đã xác minh thành công dưới tên <[user].name>!;color=#00ff00]>
              - ~discordmessage id:SusAsylum user:<context.new_message.author> <[success]>
              - flag <[user]> discordstatus:verified
              - flag <[user]> discord:<context.new_message.author>
              - advancement id:verifieddiscord icon:nokia "title:<&a><&l>Verified" "description:<&a>You are now verified user" frame:challenge
              - advancement id:verifieddiscord grant:<[user]>
              - narrate "<&a><&l>Xác minh thành công!" targets:<[user]>


        after server start:
        - ~discordconnect id:SusAsylum token:<secret[discord_bot_token]>
        - ~discord id:SusAsylum status "SusAsylum" "status:ONLINE" "activity:PLAYING"
        - define embed <discord_embed.with_map[title=**Server đã mở!**;color=#00ff00]>
        - ~discordmessage id:SusAsylum channel:<server.flag[log]> <[embed]>
        after player clicks * in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - playsound <player> sound:susasylum custom pitch:1
        after player clicks blank1 in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - inventory open d:MENU1
        after player clicks blank2 in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - inventory open d:MENU2
        after player clicks blank3 in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - inventory open d:MENU3
        after player clicks blank4 in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - inventory open d:MENU4
        after player clicks exit in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:closemenu volume:1

        after player clicks blank6 in menu1|menu2|menu3|menu4|cosmetic|cosmeticinv|buymenu|adminpanel:
        - ratelimit <player> 5t
        - if <player.has_flag[admin]>:
          - inventory open d:adminpanel
        - else if !<player.has_flag[admin]>:
          - narrate "<&4>Blud think he is admin"
        after player clicks chainsaw in cosmetic:
        - ratelimit <player> 5t
        - define buyitem chainsaw
        - flag player buyitem:chainsaw
        - flag player price:1000
        - inventory open d:buymenu
        after player clicks chainsaw2 in cosmetic:
        - ratelimit <player> 5t
        - define buyitem chainsaw2
        - flag player buyitem:chainsaw2
        - flag player price:1000
        - inventory open d:buymenu
        after player clicks shop1 in MENU2:
        - ratelimit <player> 5t
        - narrate "<&4>Comming Soon"
        after player clicks shop2 in MENU2:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - clickable save:title1:
          - define title "<&d>[Kẹo corn🍭]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 2000:
              - money take players:<player> quantity:2000
              - narrate "<&a>Bạn mua title <&d>[Kẹo corn🍭]"
              - flag player "title:<&d>[Kẹo corn🍭]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&d>[Kẹo corn🍭]]>
              - stop
            - if <player.money> <= 2000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title2:
          - define title "<&8>[GIGACHAD]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 3000:
              - money take players:<player> quantity:3000
              - narrate "<&a>Bạn mua title <&8>[GIGACHAD]"
              - flag player "title:<&8>[GIGACHAD]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&8>[GIGACHAD]]>
              - stop
            - if <player.money> <= 3000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title3:
          - define title "<&c>[Sus]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 2000:
              - money take players:<player> quantity:2000
              - narrate "<&a>Bạn mua title <&c>[Sus]"
              - flag player "title:<&c>[Sus]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&c>[Sus]]>
              - stop
            - if <player.money> <= 2000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title4:
          - define title "<&e>[Nah, I<&sq>d win]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 3500:
              - money take players:<player> quantity:3500
              - narrate "<&a>Bạn mua title <&e>[Nah, I<&sq>d win]"
              - flag player "title:<&e>[Nah, I<&sq>d win]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&e>[Nah, I<&sq>d win]]>
              - stop
            - if <player.money> <= 3500:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title5:
          - define title "<&b>[Pro PVP]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 4000:
              - money take players:<player> quantity:4000
              - narrate "<&a>Bạn mua title <&b>[Pro PVP]"
              - flag player "title:<&b>[Pro PVP]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&b>[Pro PVP]]>
              - stop
            - if <player.money> <= 4000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title6:
          - define title "<&4>[Come from ohio]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 4000:
              - money take players:<player> quantity:4000
              - narrate "<&a>Bạn mua title <&4>[Come from ohio]"
              - flag player "title:<&4>[Come from ohio]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&4>[Come from ohio]]>
              - stop
            - if <player.money> <= 4000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title7:
          - define title "<&a>[Speedrunner]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 2000:
              - money take players:<player> quantity:2000
              - narrate "<&a>Bạn mua title <&a>[Speedrunner]"
              - flag player "title:<&a>[Speedrunner]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&a>[Speedrunner]]>
              - stop
            - if <player.money> <= 2000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - clickable save:title8:
          - define title "<&e>[Huyền thoại<&c> FIFAI]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 5000:
              - money take players:<player> quantity:5000
              - narrate "<&a>Bạn mua title <&e>[Huyền thoại<&c> FIFAI]"
              - flag player "title:<&e>[Huyền thoại<&c> FIFAI]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&e>[Huyền thoại<&c> FIFAI]]>
              - stop
            - if <player.money> <= 5000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop
        - clickable save:title9:
          - define title "<&d>[HT1]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 5000:
              - money take players:<player> quantity:5000
              - narrate "<&a>Bạn mua title <&d>[HT1]"
              - flag player "title:<&d>[HT1]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&d>[HT1]]>
              - stop
            - if <player.money> <= 5000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop
        - clickable save:title10:
          - define title "<&f>[<&k>UNKNOWN<&f>]"
          - if !<[title].is_in[<player.flag[titlelist]>]>:
            - if <player.money> >= 6000:
              - money take players:<player> quantity:6000
              - narrate "<&a>Bạn mua title <&f>[<&k>UNKNOWN<&f>]"
              - flag player "title:<&f>[<&k>UNKNOWN<&f>]"
              - flag player titlelist:<list[<player.flag[titlelist]>|<&f>[<&k>UNKNOWN<&f>]]>
              - stop
            - if <player.money> <= 6000:
              - narrate "<&4>You Broke as sh*t"
              - stop
          - if <[title].is_in[<player.flag[titlelist]>]>:
            - narrate "<&4>Bạn đã mua title này trước đó!"
            - stop

        - narrate <[line]>
        - narrate "<&a>                        <&l>Title Store"
        - narrate "<&d>[Kẹo corn🍭] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>2000 Coins].on_click[<entry[title1].command>]><reset>"
        - narrate "<&8>[GIGACHAD] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>3000 Coins].on_click[<entry[title2].command>]><reset>"
        - narrate "<&c>[Sus] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>2000 Coins].on_click[<entry[title3].command>]><reset>"
        - narrate "<&e>[Nah, I<&sq>d win] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>3500 Coins].on_click[<entry[title4].command>]><reset>"
        - narrate "<&b>[Pro PVP] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>4000 Coins].on_click[<entry[title5].command>]><reset>"
        - narrate "<&4>[Come from ohio] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>4000 Coins].on_click[<entry[title6].command>]><reset>"
        - narrate "<&a>[Speedrunner] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>2000 Coins].on_click[<entry[title7].command>]><reset>"
        - narrate "<&e>[Huyền thoại<&c> FIFAI] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>5000 Coins].on_click[<entry[title8].command>]><reset>"
        - narrate "<&d>[HT1] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>5000 Coins].on_click[<entry[title9].command>]><reset>"
        - narrate "<&f>[<&k>UNKNOWN<&f>] <player.name> <&a>- <element[<&a><&l>Buy].on_hover[<&e>6000 Coins].on_click[<entry[title10].command>]><reset>"
        - narrate "<&a>                                     <&l>Tiền của bạn: <&e><player.money>"


        - narrate <[line]>
        after player clicks shop3 in MENU2:
        - ratelimit <player> 5t
        - inventory open d:cosmetic
        after player clicks shop1 in MENU1:
        - ratelimit <player> 5t
        - narrate "<&4>Comming Soon"
        after player clicks shop2 in MENU1:
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:equip1:
          - if <element[<&d>[Kẹo corn🍭]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&d>[Kẹo corn🍭]"
              - flag player "title:<&d>[Kẹo corn🍭]"
          - else if !<element[<&d>[Kẹo corn🍭]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip2:
          - if <element[<&8>[GIGACHAD]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&8>[GIGACHAD]"
              - flag player "title:<&8>[GIGACHAD]"
          - else if !<element[<&8>[GIGACHAD]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip3:
          - if <element[<&c>[Sus]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&c>[Sus]"
              - flag player "title:<&c>[Sus]"
          - else if !<element[<&c>[Sus]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip4:
          - if <element[<&e>[Nah, I<&sq>d win]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&e>[Nah, I<&sq>d win]"
              - flag player "title:<&e>[Nah, I<&sq>d win]"
          - else if !<element[<&e>[Nah, I<&sq>d win]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip5:
          - if <element[<&b>[Pro PVP]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&b>[Pro PVP]"
              - flag player "title:<&b>[Pro PVP]"
          - else if !<element[<&b>[Pro PVP]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip6:
          - if <element[<&4>[Come from ohio]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&4>[Come from ohio]"
              - flag player "title:<&4>[Come from ohio]"
          - else if !<element[<&4>[Come from ohio]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip7:
          - if <element[<&a>[Speedrunner]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&a>[Speedrunner]"
              - flag player "title:<&a>[Speedrunner]"
          - else if !<element[<&a>[Speedrunner]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip8:
          - if <element[<&e>[Huyền thoại<&c> FIFAI]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&e>[Huyền thoại<&c> FIFAI]"
              - flag player "title:<&e>[Huyền thoại<&c> FIFAI]"
          - else if !<element[<&e>[Huyền thoại<&c> FIFAI]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip9:
          - if <element[<&d>[HT1]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&d>[HT1]"
              - flag player "title:<&d>[HT1]"
          - else if !<element[<&d>[HT1]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:equip10:
          - if <element[<&f>[<&k>UNKNOWN<&f>]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&a>Bạn đã sử dụng title <&f>[<&k>UNKNOWN<&f>]"
              - flag player "title:<&f>[<&k>UNKNOWN<&f>]"
          - else if !<element[<&f>[<&k>UNKNOWN<&f>]].is_in[<player.flag[titlelist]>]>:
              - narrate "<&4>Error 314!"
        - clickable save:remove:
          - narrate "<&a>Bạn đã xóa title hiện tại!"
          - flag player title:!


        - narrate <[line]>
        - narrate "<&a>                        <&l>Title"
        - narrate "<&d>[Kẹo corn🍭] <player.name>  <&a>- <element[<&d>[Kẹo corn🍭]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip1].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&8>[GIGACHAD] <player.name>  <&a>- <element[<&8>[GIGACHAD]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip2].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&c>[Sus] <player.name>  <&a>- <element[<&c>[Sus]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip3].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&e>[Nah, I<&sq>d win] <player.name>  <&a>- <element[<&e>[Nah, I<&sq>d win]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip4].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&b>[Pro PVP] <player.name>  <&a>- <element[<&b>[Pro PVP]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip5].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&4>[Come from ohio] <player.name>  <&a>- <element[<&4>[Come from ohio]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip6].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&a>[Speedrunner] <player.name>  <&a>- <element[<&a>[Speedrunner]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip7].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&e>[Huyền thoại<&c> FIFAI] <player.name>  <&a>- <element[<&e>[Huyền thoại<&c> FIFAI]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip8].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&d>[HT1] <player.name>  <&a>- <element[<&d>[HT1]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip9].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate "<&f>[<&k>UNKNOWN<&f>] <player.name>  <&a>- <element[<&f>[<&k>UNKNOWN<&f>]].is_in[<player.flag[titlelist]>].if_true[<element[<&a><&l>Trang bị].on_hover[<&e>Bấm để sử dụng].on_click[<entry[equip10].command>]><reset>].if_false[<element[<&7><&o>Bạn chưa mua title này!]>]>"
        - narrate ""
        - narrate "<element[<&4><&l>[REMOVE TITLE]].on_hover[<&4>Bấm để xóa title hiện tại].on_click[<entry[remove].command>]><reset>"
        - narrate <[line]>
        after player clicks shop3 in MENU1:
        - ratelimit <player> 5t
        - inventory open d:cosmeticinv
        after player clicks itemad in adminpanel:
        - ratelimit <player> 5t
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        after player clicks playerad in adminpanel:
        - ratelimit <player> 5t
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:spectate:
          - adjust <player> gamemode:spectator
        - clickable save:survival:
          - adjust <player> gamemode:survival
        - clickable save:coins:
          - flag player typing:coins
          - narrate <[line]>
          - narrate "<&a>Nhập số coins bạn muốn lấy"
          - narrate <[line]>
        - clickable save:vanish:
          - adjust <player> vanish:true
        - clickable save:unvanish:
          - adjust <player> vanish:false
        - clickable save:you:
          - narrate <[line]>
          - narrate "                      <&a><&l><player.name>"
          - narrate <element[<&a><&l>[Chế độ quan sát]].on_click[<entry[spectate].command>]><reset>
          - narrate <element[<&a><&l>[Chế độ sinh tồn]].on_click[<entry[survival].command>]><reset>
          - narrate <element[<&a><&l>[Lấy xu]].on_click[<entry[coins].command>]><reset>
          - narrate <element[<&a><&l>[Tàn hình]].on_click[<entry[vanish].command>]><reset>
          - narrate <element[<&4><&l>[Hủy Tàn hình]].on_click[<entry[unvanish].command>]><reset>

          - narrate <[line]>
        - clickable save:other:
          - narrate <[line]>
          - narrate "<&a>Nhập tên người chơi!"
          - narrate <[line]>
          - flag player typing:op
        - narrate <[line]>
        - narrate "<&a>                 <&l>Điều khiển người chơi"
        - narrate ""
        - narrate "                 <element[<&a>[You]].on_click[<entry[you].command>]><reset>       <element[<&a>[Other Player]].on_click[<entry[other].command>]><reset> "
        - narrate <[line]>

        after player clicks map in adminpanel:
        - ratelimit <player> 5t
        - narrate "<&4>Comming Soon"
        after player clicks tagad in adminpanel:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - clickable save:type0:
          - flag player color:!
          - narrate "<&a>Bạn đã đổi tên thành <&f><player.name>"
        - clickable save:type1:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,0]><player.name>"
          - flag player color:240,240,0
        - clickable save:type2:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,4]><player.name>"
          - flag player color:240,240,4
        - clickable save:type3:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,8]><player.name>"
          - flag player color:240,240,8
        - clickable save:type4:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,12]><player.name>"
          - flag player color:240,240,12
        - clickable save:type5:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,16]><player.name>"
          - flag player color:240,240,16
        - clickable save:type6:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,24]><player.name>"
          - flag player color:240,240,24
        - clickable save:type7:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,28]><player.name>"
          - flag player color:240,240,28
        - clickable save:type8:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,32]><player.name>"
          - flag player color:240,240,32
        - clickable save:type9:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,36]><player.name>"
          - flag player color:240,240,36
        - clickable save:type10:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,44]><player.name>"
          - flag player color:240,240,44
        - clickable save:type11:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,48]><player.name>"
          - flag player color:240,240,48
        - clickable save:type12:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,52]><player.name>"
          - flag player color:240,240,52
        - clickable save:type13:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,56]><player.name>"
          - flag player color:240,240,56
        - clickable save:type14:
          - narrate "<&a>Bạn đã đổi tên thành <&color[94,171,136]><player.name>"
          - flag player color:94,171,136
        - clickable save:type15:
          - narrate "<&a>Bạn đã đổi tên thành <&color[240,240,80]><player.name>"
          - flag player color:240,240,80
        - narrate <[line]>
        - narrate "<&f><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type0].command>]><reset>"
        - narrate "<&color[240,240,0]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type1].command>]><reset>"
        - narrate "<&color[240,240,4]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type2].command>]><reset>"
        - narrate "<&color[240,240,8]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type3].command>]><reset>"
        - narrate "<&color[240,240,12]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type4].command>]><reset>"
        - narrate "<&color[240,240,16]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type5].command>]><reset>"
        - narrate "<&color[240,240,24]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type6].command>]><reset>"
        - narrate "<&color[240,240,28]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type7].command>]><reset>"
        - narrate "<&color[240,240,32]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type8].command>]><reset>"
        - narrate "<&color[240,240,36]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type9].command>]><reset>"
        - narrate "<&color[240,240,44]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type10].command>]><reset>"
        - narrate "<&color[240,240,48]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type11].command>]><reset>"
        - narrate "<&color[240,240,52]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type12].command>]><reset>"
        - narrate "<&color[240,240,56]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type13].command>]><reset>"
        - narrate "<&color[94,171,136]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type14].command>]><reset>"
        - narrate "<&color[240,240,80]><player.name>  <&a>- <element[<&a>Chose].on_click[<entry[type15].command>]><reset>"

        - narrate <[line]>
        - if !<player.has_flag[color]>:
          - flag player color:255,255,255
        - adjust <player> name:<&color[<player.flag[color]>]><player.name><&f>
        on player joins:
        - if !<player.has_flag[color]>:
          - flag player color:255,255,255
        - define embed <discord_embed.with_map[author_icon_url=https://mc-heads.net/avatar/<player.name>;author_name=<player.name> đã tham gia server;color=#00ff00]>
        - ~discordmessage id:SusAsylum channel:<server.flag[log]> <[embed]>

        on player quits:
        - define embed <discord_embed.with_map[author_icon_url=https://mc-heads.net/avatar/<player.name>;author_name=<player.name> đã thoát server;color=#ff0000]>
        # ;title=**<player.name> đã thoát server**
        - ~discordmessage id:SusAsylum channel:<server.flag[log]> <[embed]>
        on shutdown:
        - define embed <discord_embed.with_map[title=**Server đã đóng!**;color=#ff0000]>
        - ~discordmessage id:SusAsylum channel:<server.flag[log]> <[embed]>
        after player clicks none in cosmetic:
        - ratelimit <player> 5t
        - narrate "<&4>Comming Soon"
        after player clicks none in menu3:
        - ratelimit <player> 5t
        - narrate "<&4>Comming Soon"
        after player clicks none in cosmeticinv:
        - ratelimit <player> 5t
        - narrate "<&4>Bạn chưa mua vật phẩm này!"
        after player clicks chainsaw in cosmeticinv:
        - ratelimit <player> 5t
        - flag player equipitem:chainsaw1
        - flag player type:head
        - run equipitem
        after player clicks chainsaw2 in cosmeticinv:
        - ratelimit <player> 5t
        - flag player equipitem:chainsaw2
        - flag player type:hand
        - run equipitem
        after player clicks blank7 in MENU3:
        - ratelimit <player> 5t
        - kill <player>
        after player clicks discord in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - if <player.has_flag[discordstatus]>:
          - if <player.flag[discordstatus]> == verifying:
            - narrate <[line]>
            - narrate "<&a>                <&l>DISCORD VERIFY"
            - narrate "<&a><&l>Mã của bạn là: <&a><player.flag[discord]>"
            - narrate "<&a><&l>Mã sẽ hết hạn sau: <&a><player.flag_expiration[discord].from_now.formatted||0.01s>"
            - narrate "<&a><&l>Cách xác minh: <&a>Gửi mã cho bot SusAsylum để xác minh"
            - narrate "<&a><&l>Discord: <&a><&click[https://discord.gg/aBJvxvz5RZ].type[OPEN_URL]><element[discord.gg/aBJvxvz5RZ].color[<color[#2ec94e]>].on_hover[<&9>Join my discord to verify]><&end_click>"
            - narrate <[line]>
            - stop
          - else if <player.flag[discordstatus]> == verified:
            - narrate "<&4>Bạn đã xác minh trước đó!"
            - stop
        - if !<player.has_flag[discordstatus]>:
          - flag player discordstatus:verifying expire:5m
          - flag player discord:<util.random.int[111111].to[999999]> expire:5m
          - narrate <[line]>
          - narrate "<&a>                     <&l>DISCORD VERIFY"
          - narrate "<&a><&l>Mã của bạn là: <&a><player.flag[discord]>"
          - narrate "<&a><&l>Mã sẽ hết hạn sau: <&a><player.flag_expiration[discord].from_now.formatted||0.01s>"
          - narrate "<&a><&l>Cách xác minh: <&a>Gửi mã cho bot SusAsylum để xác minh"
          - narrate "<&a><&l>Discord: <&a><&click[https://discord.gg/aBJvxvz5RZ].type[OPEN_URL]><element[discord.gg/aBJvxvz5RZ].color[<color[#2ec94e]>].on_hover[<&9>Join my discord to verify]><&end_click>"
          - narrate <[line]>
          - stop
        on player tries to attack entity:
        - if <player.attack_cooldown_percent> != 100:
          - determine cancelled
        after player clicks report in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:x:
          - flag player typing:!
          - narrate "<&4>Bạn đã hủy yêu cầu report"
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - narrate <[line]>
        - narrate "<&a>                        <&l>REPORT  <element[<&4><&l>[x]].on_click[<entry[x].command>]><reset>"
        - narrate "<&a>Nhập tên người chơi mà bạn muốn tố cáo"
        - narrate <[line]>
        - flag player typing:name expire:5m
        after player clicks bugreport in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:x:
          - flag player typing:!
          - narrate "<&4>Bạn đã hủy yêu cầu report"
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - narrate <[line]>
        - narrate "<&a>                        <&l>BUG REPORT  <element[<&4><&l>[x]].on_click[<entry[x].command>]><reset>"
        - narrate "<&a>Nhập bug muốn tố cáo"
        - narrate <[line]>
        - flag player typing:bug expire:5m
        after player clicks disablest in MENU3:
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - ratelimit <player> 5t
        - inventory close
        - clickable save:onchat:
          - flag player disablechat:!
          - narrate "<&a>Bạn đã mở chat!"
          - run refesh
        - clickable save:offchat:
          - flag player disablechat
          - narrate "<&a>Bạn đã tắt chat!"
          - run refesh
        - clickable save:ondchat:
          - flag player disabledchat:!
          - narrate "<&a>Bạn đã mở discord chat!"
          - run refesh
        - clickable save:offdchat:
          - flag player disabledchat
          - narrate "<&a>Bạn đã tắt discord chat!"
          - run refesh
        - clickable save:onfact:
          - flag player disabledfact:!
          - narrate "<&a>Bạn đã mở fact! (thoát ra vô lại để áp dụng!)"
          - run refesh
        - clickable save:offfact:
          - flag player disabledfact
          - narrate "<&a>Bạn đã tắt fact!"
          - bossbar annocument "title:<&b><&k>X <&f><&l>>> <element[<&l>SusAsylum<&f>].color_gradient[from=#fcc600;to=#fce28d]> <&f><&l><< <&b><&k>X" color:YELLOW players:<player>
          - run refesh
        - clickable save:onip:
          - flag player disabledip:!
          - narrate "<&a>Bạn đã mở Ip server bar! (thoát ra vô lại để áp dụng!)"
          - run refesh
        - clickable save:offip:
          - flag player disabledip
          - bossbar logo "title:" color:YELLOW players:<player>
          - narrate "<&a>Bạn đã tắt Ip server bar!"
          - run refesh
        - clickable save:onfriend:
          - flag player disabledfriend:!
          - narrate "<&a>Bạn đã mở Friend request"
          - run refesh
        - clickable save:offfriend:
          - flag player disabledfriend
          - narrate "<&a>Bạn đã tắt Friend request!"
          - run refesh
        - clickable save:refesh:
          - run refesh
        - narrate <[line]>
        - narrate "<&a>                        <&l>Adjust Settings"
        - narrate "<&a><&a>Chat <player.has_flag[disablechat].if_true[<element[<&4><&l>[Off]].on_click[<entry[onchat].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offchat].command>]><reset>]>"
        - narrate "<&a><&a>Discord Chat <player.has_flag[disabledchat].if_true[<element[<&4><&l>[Off]].on_click[<entry[ondchat].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offdchat].command>]><reset>]>"
        - narrate "<&a><&a>Random Stoopid fact <player.has_flag[disabledfact].if_true[<element[<&4><&l>[Off]].on_click[<entry[onfact].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offfact].command>]><reset>]>"
        - narrate "<&a><&a>Ip server bar <player.has_flag[disabledip].if_true[<element[<&4><&l>[Off]].on_click[<entry[onip].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offip].command>]><reset>]>"
        - narrate "<&a><&a>Friend request <player.has_flag[disabledfriend].if_true[<element[<&4><&l>[Off]].on_click[<entry[onfriend].command>]><reset>].if_false[<element[<&a><&l>[On]].on_click[<entry[offfriend].command>]><reset>]>"
        - narrate "                                        <element[<&a><&l>[Refesh]].on_click[<entry[refesh].command>]><reset>"
        - narrate <[line]>

        after player clicks fact in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:x:
          - flag player typing:!
          - narrate "<&4>Bạn đã hủy yêu cầu submit fact"
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - narrate <[line]>
        - narrate "<&a>                        <&l>SUBMIT FACT  <element[<&4><&l>[x]].on_click[<entry[x].command>]><reset>"
        - narrate "<&a>Fact của bạn có thể xuất hiện ở phía trên màn hình, motd server,..."
        - narrate "<&a>Nhập fact mà bạn muốn gửi"
        - narrate <[line]>
        - flag player typing:fact expire:5m
        after player clicks friends in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - clickable save:add:
          - flag player typing:add expire:5m
          - narrate <[line]>
          - narrate "<&a>                        <&l>Friends"
          - narrate "<&a>Nhập tên người chơi"
          - narrate <[line]>
        - clickable save:remove:
          - flag player typing:remove expire:5m
          - narrate <[line]>
          - narrate "<&c>                        <&l><&m>Friends"
          - narrate "<&c>Nhập số thứ tự của người chơi muốn xóa "
          - narrate <[line]>
        - clickable save:msg:
          - narrate <[line]>
          - narrate "<&c>                        <&e>Friends"
          - narrate "<&e>Comming Soon (im to lazy)"
          - narrate <[line]>
        - narrate <[line]>
        - narrate "<&a>                        <&l>Friends"
        - narrate "<player.has_flag[friends].if_true[<&a><player.flag[friends].separated_by[<n>]>].if_false[<n><&4><&l>Bạn không có bạn bè (quả là 1 kẻ cô đơn)]>"
        - narrate ""
        - narrate "<element[<&a><&l>[Add Friends]].on_hover[<&a>Bấm để gửi yêu cầu kết bạn!].on_click[<entry[add].command>]><reset> <element[<&e><&l>[Message]].on_hover[<&e>Bấm nhắn tin với bạn bè!].on_click[<entry[msg].command>]><reset> <element[<&c><&l>[Remove friends]].on_hover[<&c>Bấm để xóa kết bạn bạn!].on_click[<entry[remove].command>]><reset>"
        - narrate <[line]>
        after player clicks cpw in MENU3:
        - ratelimit <player> 5t
        - inventory close
        - playsound <player> custom sound:execute volume:1
        - clickable save:x:
          - flag player typing:!
          - narrate "<&4>Bạn đã hủy yêu cầu thay đổi mật khẩu"
        - define line <&a><element[<&sp>].repeat[80].strikethrough>
        - narrate <[line]>
        - narrate "<&a>                    <&l>Change password  <element[<&4><&l>[x]].on_click[<entry[x].command>]><reset>"
        - narrate "<&a>Nhập mật khẩu cũ"
        - narrate <[line]>
        - flag player typing:cpw expire:5m
equipitem:
  type: task
  script:
    - ratelimit <player> 5t
    - if !<player.has_flag[using]>:
      - narrate "<&a>Đã trang bị vật phẩm"
      - flag player using:<player.flag[equipitem]>
      - stop
    - else if <player.has_flag[using]>:
      - if <player.flag[equipitem]> == <player.flag[using]>:
        - narrate "<&4>Đã bỏ vật phẩm"
        - flag player equip<player.flag[equipitem]>:!
        - flag player using:!
        - flag player type:!
        - flag player equipitem:!
        - stop
      - else if <player.flag[equipitem]> != <player.flag[using]>:
        - random:
          - narrate "<&4>Bạn không thể sử dụng 2 cosmetic cùng lúc"
          - narrate "<&4>m định đội cả thế giới lên đầu à? bỏ cosmetic kia đi rồi mới đeo cái này vô"
          - narrate "<&4>Sử dụng 2 cosmetic cùng lúc là phạm luật!!"
          - narrate "<&4>Yêu cầu anh tháo cosmetic cũ trước khi sử dụng cosmetic này"
          - stop



buttons2:
    type: world
    events:
        after player clicks blank5 in buymenu:
        - define buyitem <server.flag[buyitem]>
        - define price <server.flag[price]>
        - ratelimit <player> 5t
        - run buyitem

buyitem:
    type: task
    script:
    - define buyitem <server.flag[buyitem]>
    - define price <server.flag[price]>
    - if <player.has_flag[buyed<[buyitem]>]>:
      - narrate "<&4>Bạn đã mua món này trước đó!"
      - stop
    - else if !<player.has_flag[buyed<[buyitem]>]>:
      - if <Player.money> >= <[price]>:
        - money take quantity:<[price]>
        - random:
          - narrate "<&a>Thẻ hợp lệ!"
          - narrate "<&a>Mua thành công!"
          - narrate "<&a>Chúc mừng bạn đã mua <server.flag[buyitem]> bằng tiền mẹ bạn dành 10 năm cho bạn đi học đại học"
          - narrate "<&a>Đây là món thứ bao nhiêu bạn mua rồi khai thật đi!!"
          - narrate "<&a>$$$"
          - narrate "<&a>You successfully spend your mom's credit card!"
          - narrate "<&a>You successfully spend your mom's debit card!"
        - flag player buyed<[buyitem]>
        - stop
      - else if <Player.money> < <[price]>:
        - random:
          - narrate "<&4>Bạn không đủ tiền để làm điều này"
          - narrate '<&4>Bạn nghèo như cái con "bộ phận sinh dục nam", bạn biến đi cho tôi nhờ'
          - narrate "<&4>Nghèo như mày mà đòi mua đồ hàng hiệu"
          - narrate "<&4>Chim cúc, m dell đủ tiền"
          - narrate <&4>Nghèo.
          - narrate "<&4>Thôi m nghèo quá m cúc đi cho tao còn bán hàng"
          - narrate "<&4>Tiền trong tài khoản không đủ, vui lòng thử lại sau!"
      - else if <[price]> = null:
        - narrate "<&4>Nếu bạn thấy tin nhắn này, hãy báo cho admin vì đây có thể là 1 cái lỗi"
      - else if <[buyitem]> == null:
        - narrate "<&4>Error.shop.001: no item to buy"