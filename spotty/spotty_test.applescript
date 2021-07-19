local trackID
tell application "Spotify" to activate -- launches spotify
on idle
	try
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
		if application "Spotify" is not running then return -- doesn't always work
	end try
	return 0.5 -- polls every .5 seconds. 
end idle

on quit
	tell application "Spotify" to quit
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