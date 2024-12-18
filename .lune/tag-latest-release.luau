local process = require("@lune/process")

local version = require("./roblox-version")

local version_parts = string.split(version.version, ".")

local version_string = `{version_parts[2]}.{version_parts[3]}`

print("Roblox version:", version.version)
print("Roblox GUID:", version.clientVersionUpload)

if process.env.CI then
	-- Assume GitHub CLI is installed and use that
	local result = process.spawn("gh", {
		"release",
		"create",
		version.clientVersionUpload,
		"-t",
		`v{version_string}`,
		"-n",
		`Updated reflection database to Roblox v{version_string}`,
	})
	if not result.ok then
		print("GH CLI failed:")
		print(result.stderr)
	end
else
	-- Use git to make a tag and push it.
	process.spawn(
		"git",
		{ "tag", "-a", version.clientVersionUpload, "-m", `Updated reflection database to Roblox v{version_string}` }
	)
	process.spawn("git", { "push", "origin", "--tags" })
end
