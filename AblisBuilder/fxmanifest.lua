fx_version 'adamant'

game 'gta5'

author 'Abteww'

client_scripts({
    "Alib/RMenu.lua",
    "Alib/menu/RageUI.lua",
    "Alib/menu/Menu.lua",
    "Alib/menu/MenuController.lua",
    "Alib/components/*.lua",
    "Alib/menu/elements/*.lua",
    "Alib/menu/items/*.lua",
    "Alib/menu/panels/*.lua",
    "Alib/menu/windows/*.lua",
    'client/*.lua' 
})

server_script {
 'server/*.lua',
 '@oxmysql/lib/MySQL.lua',
}