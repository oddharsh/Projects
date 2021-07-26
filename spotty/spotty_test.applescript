local trackID
tell application "Spotify" to activate -- launches spotify
on idle
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
		if application "Spotify" is not running then beep 3 -- doesn't always work, the beep thing is a test
	return 0.5 -- polls every .5 seconds. 
end idle

on quit
	tell application "Spotify" to quit
	continue quit
end quit

on relaunch() -- quit, then relaunch and play
	tell application "Spotify"
		quit
		repeat until it is not running -- waits until spotify's properly quit
		end repeat
		launch
		play
	end tell
end relaunch