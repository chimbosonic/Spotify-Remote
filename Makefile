TOKEN:=$(shell python3 ./SpotifyTokenScript.py)
URI:=
SEARCH:=
PLAYLIST_ID:=
DEVICE_ID:=
TYPE:=playlist
DID:= "?device_id=${DEVICE_ID}"
ifeq ($(DEVICE_ID),)
DID = 
endif

URIF:= --data "{\"context_uri\":\"${URI}\"}"
ifeq ($(URI),)
URIF =
endif
TOKEN_HEADER =  -H "Authorization: Bearer ${TOKEN}"
HEADER = -H "Accept: application/json" -H "Content-Type: application/json" ${TOKEN_HEADER}


play:
	-@curl -X "PUT" "https://api.spotify.com/v1/me/player/play${DID}" ${URIF} ${HEADER}

pause:
	-@curl -X "PUT" "https://api.spotify.com/v1/me/player/pause" ${HEADER}

next:
	-@curl -X "POST" "https://api.spotify.com/v1/me/player/next" ${HEADER}

prev:
	-@curl -X "POST" "https://api.spotify.com/v1/me/player/previous" ${HEADER}

status:
	-@echo "Playing:"
	-@curl -s -X GET "https://api.spotify.com/v1/me/player/currently-playing" ${TOKEN_HEADER} | jq '{name: .item.name,  artists: .item.artists | [ .[] | .name ], uri: .item.uri}'

list-playlists:	
	-@curl -X GET "https://api.spotify.com/v1/me/playlists" ${TOKEN_HEADER} | jq ' .items[] | {name: .name, uri: .uri}'

search-track:
	-@curl -X "GET" "https://api.spotify.com/v1/search?q='${SEARCH}'&type=track" ${HEADER} | jq ".tracks.items[] | { Name: .name, Artists: .artists | [ .[] | .name ] , URI: .uri}"

search-playlist:
	-@curl -X "GET" "https://api.spotify.com/v1/search?q='${SEARCH}'&type=playlist" ${HEADER} | jq ".playlists.items[] | { Name: .name, NumberOFSongs: .tracks.total, By: .owner.display_name, URI: .uri}"

add-to-playlist:
	-@curl -X "POST" "https://api.spotify.com/v1/playlists/${PLAYLIST_ID}/tracks?uris=${URI}" ${HEADER}

get-devices:
	-@curl -X "GET" "https://api.spotify.com/v1/me/player/devices" ${HEADER}

auth:
	python3 ./SpotifyTokenScript.py
