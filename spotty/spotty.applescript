local trackID
-- need to make a pretty logo
tell application "Spotify" to activate -- launches spotify

repeat while application "Spotify" is running -- the actual script portion
	try
		tell application "Spotify" -- grabbing data from current track to id it
			set trackID to id of current track
		end tell
		if (offset of "ad" in trackID) = 9 then -- basically checking if the track is tagged as an ad
			tell application "Spotify" to quit -- quit, then relaunch and play
			delay 1
			tell application "Spotify"
				launch
				delay 1
				play
			end tell
		end if
	end try
	delay 0.5 -- Repeat this entire block every .5 seconds. A more efficient alt would be to run this when the song changes, though that's going to be more complex.
end repeat