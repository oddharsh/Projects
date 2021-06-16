local trackID, playerState
-- todo: fix glitch when left idle for too long
tell application "Spotify" to activate -- opens spotify
repeat while application "Spotify" is running -- better open tester
	try
		tell application "Spotify" -- grabbing data from current track to id it
			set trackID to id of current track
			set playerState to (player state as string)
		end tell
		if playerState = "playing" then
			if (offset of "ad" in trackID) = 9 then
				tell application "Spotify" to quit -- quit, then relaunch and play; need to see if I can streamline or reduce delays
				delay 1
				tell application "Spotify"
					launch
					delay 1
					play
				end tell
			end if
			delay 0.5 -- polls every 0.5 while playing
		else
			delay 5
		end if
	end try
end repeat