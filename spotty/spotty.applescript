activate application "Spotify" -- launches spotify
on idle
	poll()
	return 0.5 -- polls every 0.5 seconds. 
end idle

on reopen
	activate application "Spotify" -- allows us to interact with spotify from spotty's dock icon
end reopen

on quit
	quit application "Spotify" -- this only does stuff if we're quitting spotty before spotify
	continue quit
end quit

on getTrack()
	tell application "Spotify" to get id of current track
end getTrack

on poll()
	try
		if (offset of "ad" in getTrack()) = 9 then relaunch() -- checks if the track is an ad and relaunches if it is
	end try
end poll

on relaunch() -- quit, then relaunch and play
	tell application "System Events" to do shell script "kill -9 " & unix id of process "Spotify"
	repeat until application "Spotify" is not running -- waits until spotify's properly quit
	end repeat
	tell application "Spotify"
		run -- supposedly better than launch
		play
	end tell
end relaunch