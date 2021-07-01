local trackID
tell application "Spotify" to activate -- launches spotify

repeat while application "Spotify" is running -- the actual script portion
	try
		tell application "Spotify" to set trackID to id of current track -- grab track ID
		if (offset of "ad" in trackID) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
	end try
	delay 0.5 -- polls every .5 seconds. A more efficient alt would be to run this when the song changes, though that's going to be more complex.
end repeat

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