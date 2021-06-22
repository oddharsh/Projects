local trackID, playerState
-- todo: fix glitch when left idle for too long -- it's got something to do with the idle timer
tell application "Spotify" to activate -- opens spotify
repeat while application "Spotify" is running -- better open tester
	try
		tell application "Spotify" -- grabbing data from current track to id it
			set trackID to id of current track
			set playerState to (player state as string)
		end tell
		if playerState = "playing" then
			if (offset of "ad" in trackID) = 9 then relaunch()
			delay 0.5 -- polls every 0.5 while playing
		else
			delay 5 -- slower idle poll, should also help the sudoku issue 
		end if
	end try
end repeat

on relaunch() -- quit, then relaunch and play
	try
	tell application "Spotify" to quit
	delay 1 -- experiment with lower delays
	tell application "Spotify"
		launch
		--delay 0.5 -- unsure if this breaks
		play
	end tell
end try
end relaunch