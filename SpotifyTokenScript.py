# shows a user's playlists (need to be authenticated via oauth)

import pprint
import sys
import os
import subprocess

import spotipy

import spotipy.util as util
from Secrets import *

scope='playlist-read-private,playlist-modify-private,playlist-modify-public,playlist-read-collaborative,user-modify-playback-state,user-read-currently-playing,user-read-playback-state,user-top-read,user-read-recently-played,app-remote-control,streaming,user-read-birthdate,user-read-email,user-read-private,user-follow-read,user-follow-modify,user-library-modify,user-library-read'
username=SPOTIPY_USER

token = util.prompt_for_user_token(username,scope,client_id=SPOTIPY_CLIENT_ID,client_secret=SPOTIPY_CLIENT_SECRET,redirect_uri=SPOTIPY_REDIRECT_URI)

if token:
    print(token)

else:
    print("Can't get token for", username)

