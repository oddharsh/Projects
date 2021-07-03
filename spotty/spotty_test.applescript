on run
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
				idle
			end if
		end try
	end repeat
	quit
end run

on idle --idle handler that is triggered when spotify is paused; basically need to say smth about how if it sees player is running it runs again?
	return 5
end idle

on quit --WIP quit handler, need to figure out how to make this trigger on command + Q
	--tell application "Spotify" to quit
	continue quit
	return
end quit