fx_version 'adamant'
games { 'gta5' }

author 'Leon Kappes'
description 'Advendcalender'
version '1.0.0'

-- What to run
client_scripts {
    'client.lua'
}
server_script 'server.lua'
shared_script 'config.lua'

ui_page 'html/index.html'
file {
    'html/index.html',
    'html/_nuxt/*.js',
    'html/*.js',
}