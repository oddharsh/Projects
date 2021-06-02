local trackID, playerState, loggedID
-- todo: fix glitch when left idle for too long
tell application "Spotify" to activate -- opens spotify
repeat
	if isOpen() = true then -- better open tester
		try 
			tell application "Spotify" -- grabbing data from current track to id it
				set trackID to id of current track
				set playerState to (player state as string) 
			end tell
		end try
		if playerState = "playing" and trackID ­ loggedID then
			if (offset of "ad" in trackID) = 9 then
				tell application "Spotify" 
          			quit -- quit, then relaunch and play
					delay 1
          			launch
          			-- delay 1; unsure whether this is necessary?
          			play
          		end tell
			end if 
				set loggedID to trackID
				delay 0.3
		else if playerState = "paused"-- when spotify's paused
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