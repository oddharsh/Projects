local trackID
local playerState
-- todo: rewrite logic to detect when song changes, fix glitch when left idle for too long
tell application "Spotify" to activate -- opens spotify
repeat
	if isOpen() = true then -- better open tester
		try -- this is where the logic to detect song changes should go
			tell application "Spotify" -- grabbing data from current track to id it
				set trackID to id of current track
				set playerState to (player state as string) 
			end tell
		end try
		if playerState = "playing" then
			if (offset of "ad" in trackID) = 9 then
				tell application "Spotify" 
          			quit -- quit, then relaunch and play
					delay 1
          			launch
          			-- delay 1; unsure whether this is necessary?
          			play
          		end tell
				delay 0.3
			end if
		else -- when spotify's paused
			delay 3 -- idle delay for script to check if spotify is playing; is slower to save cpu
		end if
	else -- when spotify's closed
		return -- kills script if spotify isn't open
	end if
end repeat

on isOpen()
	local spotState
	tell application "System Events" to set spotState to exists (processes where name is "Spotify")
	return spotState
end isOpen