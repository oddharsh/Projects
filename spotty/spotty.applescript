local trackID
tell application "Spotify" to activate -- launches spotify
on idle
	try
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
	end try
	if application "Spotify" is not running then quit -- this seems to work sometimes?
	return 0.5 -- polls every .5 seconds. 
end idle

on reopen
	tell application "Spotify" to activate
end reopen

on quit
	tell application "Spotify" to quit -- this only does stuff if we're quitting spotty before spotify
	continue quit
end quit

on relaunch() -- quit, then relaunch and play
	tell application "Spotify"
		quit
		repeat until application "Spotify" is not running -- waits until spotify's properly quit
			delay 0.05
		end repeat
		launch
		repeat until application "Spotify" is running -- waits until spotify can handle play event
			delay 0.05
		end repeat
		play
	end tell
end relaunch