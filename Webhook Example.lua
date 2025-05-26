-- Peteware Roblox JobId & PlaceId webhook sender
-- Credits: Peteware

local HttpService = game:GetService("HttpService")

local webhookURL = "YOUR_DISCORD_WEBHOOK_URL_HERE"

local data = {
    username = "Peteware Assistant",
    avatar_url = "https://media.discordapp.net/attachments/1276618605215219722/1370449278857641994/peteware.png?ex=68203299&is=681ee119&hm=b3b9e1caf3824fd08598ede191cea7c2b5a45788d25aa8b389a5f8e51053fcba&=&format=webp&quality=lossless&width=537&height=602",
    embeds = {{
        title = "Roblox Server Info",
        description = "Current server info fetched by Peteware script.",
        color = 0xFF9100,
        thumbnail = {
            url = "https://media.discordapp.net/attachments/1276618605215219722/1370449278857641994/peteware.png?ex=68203299&is=681ee119&hm=b3b9e1caf3824fd08598ede191cea7c2b5a45788d25aa8b389a5f8e51053fcba&=&format=webp&quality=lossless&width=537&height=602"
        },
        fields = {
            {
                name = "PlaceId",
                value = tostring(game.PlaceId),
                inline = true
            },
            {
                name = "JobId",
                value = tostring(game.JobId),
                inline = true
            },
            {
                name = "Credits",
                value = "Peteware - https://github.com/PetewareScripts",
                inline = false
            }
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }}
}

local success, response = pcall(function()
    return HttpService:PostAsync(webhookURL, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
end)

if success then
    print("Webhook sent successfully.")
else
    warn("Failed to send webhook: " .. tostring(response))
end
