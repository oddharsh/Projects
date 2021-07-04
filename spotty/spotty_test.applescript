local trackID
tell application "Spotify" to activate -- launches spotify
on idle
	try
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
	end try
	if application "Spotify" is not running then quit
	return 0.5 -- polls every .5 seconds. 
end idle

on quit
	tell application "Spotify" to quit
	continue quit
end quit

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