on run
	local trackID, playerState
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
				idle
			end if
		end try
	end repeat
	quit
end run

on relaunch() -- quit, then relaunch and play
	tell application "Spotify" to quit
	repeat until application "Spotify" is not running -- smarter alt to fixed delay
		delay 0.05
	end repeat
	tell application "Spotify"
		launch
		repeat until application "Spotify" is running -- smarter alt to fixed delay
			delay 0.05
		end repeat
		play
	end tell
end relaunch

on idle --idle handler with a longer poll time for when spotify is paused
	return 5
    -- unsure about how to make it go back to the run handler when playerState = "playing"
end idle

on quit --WIP quit handler, need to figure out how to make this trigger on command + Q
	--tell application "Spotify" to quit
	continue quit
	return
end quit