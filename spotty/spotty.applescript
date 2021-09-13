local trackID
activate application "Spotify" -- launches spotify
on idle
	check()
	--if application "Spotify" is not running then tell me to quit -- this seems to work sometimes?
	return 0.5 -- polls every 0.5 seconds. 
end idle

on reopen
	activate application "Spotify" -- allows us to interact with spotify from spotty's dock icon
end reopen

on quit
	quit application "Spotify" -- this only does stuff if we're quitting spotty before spotify
	continue quit
end quit

on check()
	try
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
		-- maybe just stick the relauncher in here?
	end try
end check

on relaunch() -- quit, then relaunch and play
	tell application "Spotify"
		quit
		repeat until it is not running -- waits until spotify's properly quit
		end repeat
		run -- supposedly better than launch
		play
	end tell
end relaunch