local currentTrackPopularity, currentTrackDuration, currentTrackName, currentAlbum, currentDisc, playCount, Surl
tell application "Spotify"
	set currentTrackPopularity to popularity of current track
	set currentTrackDuration to duration of current track
	set currentTrackName to name of current track
	set currentArtist to artist of current track
	set currentAlbum to album of current track
	set currentDisc to disc number of current track
	set playCount to played count of current track
	set trackNumber to track number of current track
	set Surl to spotify url of current track
	set Sid to id of current track
end tell
return {currentTrackPopularity, currentTrackDuration, currentTrackName, currentArtist, currentAlbum, currentDisc, playCount, trackNumber, Surl, Sid}
