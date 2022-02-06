activate application "Spotify" -- launches spotify
on idle
	poll()
	return 0.5 -- polls every 0.5 seconds. 
end idle

on reopen
	tell application "Spotify" to play
	--activate application "Spotify" -- allows us t:o interact with spotify from spotty's dock icon
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
	tell application "Spotify"
		quit
		repeat until it is not running
		end repeat
		run -- supposedly better than launch
		repeat until it is running
		end repeat
		next track
		play
	end tell
end relaunch