--[[
PLEASE READ - IMPORTANT

© 2025 Peteware
This project is part of Peteware V1, an open-source Roblox script collection.

Licensed under the MIT License.  
See the full license at:  
https://github.com/PetewareScripts/Peteware-V1/blob/main/LICENSE

**Attribution required:** You must give proper credit to Peteware when using or redistributing this project or its derivatives.

This software is provided "AS IS" without warranties of any kind.  
Violations of license terms may result in legal action.

Thank you for respecting the license and supporting open source software!

Peteware Development Team
]]

--// Services & Setup
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId
local jobId = game.JobId
local githubBase = "https://petewarescripts.github.io/Roblox-Joiner/"
local githubJoinLink = string.format("%s/?placeId=%d&jobId=%s", githubBase, placeId, jobId)

--// Webhook Sending
local webhookURL = "YOUR_DISCORD_WEBHOOK_URL_HERE"

local data = {
    username = "Petah Assistant",
    avatar_url = "https://media.discordapp.net/attachments/1276618605215219722/1370544872993329162/stewie-gun.gif?ex=681fe2e1&is=681e9161&hm=257497f332ffab8ba50af15641d62fc2647ef1fa01a3fd166dbfe0f5886d2dbf&=",
    embeds = {{
        title = "Roblox Server Info",
        description = "Fetched by Peteware.",
        color = 16740099,
        thumbnail = {
            url = "https://media.discordapp.net/attachments/1276618605215219722/1370449278857641994/peteware.png?ex=68203299&is=681ee119&hm=b3b9e1caf3824fd08598ede191cea7c2b5a45788d25aa8b389a5f8e51053fcba&=&format=webp&quality=lossless&width=537&height=602"
        },
        fields = {
            {
                name = "PlaceId",
                value = tostring(placeId),
                inline = true
            },
            {
                name = "JobId",
                value = tostring(jobId),
                inline = true
            },
            {
                name = "Server Join Link",
                value = string.format("[Join Server](%s)", githubJoinLink),
                inline = false
            },
            {
                name = "Credits",
                value = "**Peteware -** https://discord.gg/4UjSNcPCdh",
                inline = false
            }
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }}
}

if httprequest then
    pcall(function()
        httprequest({
            Url = webhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end
