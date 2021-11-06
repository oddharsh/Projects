tell application "Spotify" to activate -- launches spotify
on idle
	repeat while application "Spotify" is running
		check()
		delay 0.5
	end repeat
	quit
end idle

on quit -- binds spotty and spotify so that spotify quits when we quit spotty
	tell application "Spotify" to quit
	continue quit
end quit

on getTrack()
	tell application "Spotify" to get id of current track
end getTrack

on relaunch() -- quit, then relaunch and play
	tell application "Spotify"
		quit
		repeat until it is not running -- waits until spotify's properly quit
		end repeat
		launch
		play
	end tell
end relaunch

on check()
	if (offset of "ad" in getTrack()) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
end check