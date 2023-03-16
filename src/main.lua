function sotTime()
    local hr =
    math.modf((os.date("%H")*60*60+os.date("%M")*60+os.date("%S")) / 60)
    local sr =
    os.date("%S")
    hr = hr - math.modf(hr/24) * 24
    local ho, ap
    if(hr > 12) then
        ho = hr - 12
        ap = "pm"
    else
        ho = hr
        ap = "am"
    end
    return (ho.." : "..sr..ap)
end

--^^^FUNCTIONS^^^

local api = require('telegram-bot-lua.core').configure('6245582395:AAGsYtANsejczNU2ALEZurTWpi2rZHkJxOw')
local utf8 = require('lua-utf8')

local che = false

function api.on_message(message)
    os.setlocale ( 'ru_RU.KOI8-R' )
    local Message = message.text

    if Message
            and
            utf8.lower(Message) == 'корабль'
    then
        api.send_message(
                message.chat.id,
                'чё'
        )
        che = true

    elseif Message
            and Message:match('ничё')
            and che
    then
        api.send_message(
                message.chat.id,
                'иди нахуй'
        )
        che = false
    elseif Message
            and Message:match('Корабль сколько времени')
    then
        api.send_message(
                message.chat.id,
                sotTime()
        )
    end
    end

    api.run()