script_name('AU')
script_version('1.1')

local prefix = '{FF0000}[AU] {FFFFFF}'
local mc = 0xFF0000

function main()
	if not isSampfuncsLoaded() or not isSampLoaded() then return end
	while not isSampAvailable() do wait(100) end

sampAddChatMessage(prefix..'AUTO-UPDATE', mc)
autoupdate("https://raw.githubusercontent.com/Xkelling/Admin-Scripts/main/update.ini", '['..string.upper(thisScript().name)..']: ', "http://vk.com/qrlk.mods")
sampRegisterChatCommand('cmd', function()
sampAddChatMessage(prefix..'Версия: '..thisScript().version, mc)
end)

	while true do
	wait(0)

	end
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage('{FF0000}[AU] {FFFFFF}Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion, mc)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      sampAddChatMessage('{FF0000}[AU] {FFFFFF}Обновление завершено!', mc)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage('{FF0000}[AU] {FFFFFF}Обновление прошло неудачно. Запускаю устаревшую версию...', mc)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              sampAddChatMessage('{FF0000}[AU] {FFFFFF}Обновление не требуется. Актуальная версия: '..thisScript().version, mc)
            end
          end
        else
          sampAddChatMessage('{FF0000}[AU] {FFFFFF}Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url, mc)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
