local trackID
local playerState
repeat
	if isOpen() = true then -- better open tester
		try
			tell application "Spotify" -- grabbing data from current track to id it
				set trackID to id of current track
				set playerState to (player state as string)
			end tell
		end try
		if playerState = "playing" then
			if (offset of "ad" in trackID) = 9 then
				tell application "Spotify" to quit -- might want to figure out how to make this better by cutting out the delays / making them shorter
				delay 1
				tell application "Spotify"
					launch
					play
				end tell
				delay 0.3
			end if
		else
			delay 2 -- idle delay to check if it's playing; is slower to save cpu
		end if
	else
		return -- kills script if spotify isn't open
	end if
end repeat


on isOpen()
	local spotState
	tell application "System Events" to set spotState to exists (processes where name is "Spotify")
	return spotState
end isOpen