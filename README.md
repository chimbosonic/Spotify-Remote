# Spotify Remote Control Via Curl, Make and Jq

This project was created for the purpose of controlling a Spotify device from the command line regardless of Operating System.

It uses Spotify's WebApi to achieve this. The Authentication flow is made easy by using a small python script that uses spotipy library.

This is project is in no way a serious project whoever if you want to contribute to it please do Pull Requests.

## Installation

To install just clone this repo and install spotipy :
```bash
git clone {url}
cd Spotify-Remote
pip3 install -r requirements.txt
```

## Requirements

1. spotipy library and python3
2. curl
3. jq
4. make
  
## Usage
On first use
You will need to create a Spotify Client ID [here](https://developer.spotify.com/dashboard/applications)
After you have created the Client ID you will need to create a file called Secrets.py . You can use the example template. The Redirect_URI can be anything you like but localhost is recommended.

To get your initial Authentication token run:
```bash
make auth
```
Make sure to follow the on screen instrutions.

## Usage Instructions

### Play
```bash
make play DID={DeviceID} URI={Track/Playlist URI}
```

### Pause
```bash
make pause
```

### Next Song
```bash
make next
```

### Previous Song
```bash
make prev
```

### Show current playing song
```bash
make status
```

### List Current Users Playlists
```bas
make list-playlist
```
### Search for Track
```bash
make search-track SEARCH="Search Terms"
```

### Search for playlists
```bash
make search-playlist SEARCH="Search Terms"
```

### Add track to existing Playlist
```bash
make add-to-playlist PLAYLIST_ID={playlist uri} URI={tracks uri}
```

### Get list of playback devices
```bash
make get-devices
```

