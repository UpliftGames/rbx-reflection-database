local net = require("@lune/net")
local process = require("@lune/process")

local VERSION_FETCH_URL = "https://clientsettingscdn.roblox.com/v2/client-version/WindowsStudio64"

export type VersionResult = {
	--- The version identifier for the current Studio release. This will be
	--- in the format `0.X.Y.Z`.
	version: string,
	--- The version GUID for the current Studio release. This will be in the
	--- format `version-GUID`.
	clientVersionUpload: string,
	--- The version identifier for the current Studio bootstrapper. This will
	--- be in the format `X.Y.Z.W`. It is unrelated to the Studio version.
	bootstrapperVersion: string,
}

local result = net.request({
	url = VERSION_FETCH_URL,
	method = "GET",
	headers = {
		["User-Agent"] = "Dekkonot/DatabaseTracker 0.0.1 micah@uplift.games",
	},
})

if not result.ok then
	print(`could not fetch current version. result from roblox: {result.statusCode} {result.statusMessage}`)
	print(result.body)
	process.exit(1)
end

return net.jsonDecode(result.body) :: VersionResult
