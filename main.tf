terraform {
  required_providers {
    spotify = {
      version = "0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = flatten([
    data.spotify_search_track.drake.tracks[*].id,
    data.spotify_track.nonstop.id
  ])
}

data "spotify_search_track" "drake" {
  artist = "Drake"
  limit = 15
  year = "2020"
}

data "spotify_track" "nonstop" {
  url = "https://open.spotify.com/track/0TlLq3lA83rQOYtrqBqSct?si=a0e0a80fdc904105"
}