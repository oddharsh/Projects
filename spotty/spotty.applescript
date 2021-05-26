local trackID
-- need tomake a pretty logo
tell application "Spotify" to activate -- opens spotify
repeat
	if isOpen() = true then
		try -- this is where the logic to detect song changes should do
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
		delay 0.3 -- Repeat this entire block every .3 seconds. A more efficient alt would be to repeat this when the song changes, though that's going to be more complex.
	else
		return
	end if
end repeat


on isOpen()
	local spotState
	tell application "System Events" to set spotState to exists (processes where name is "Spotify")
	return spotState
end isOpen

