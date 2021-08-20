terraform {
  required_providers {
    spotify = {
      version = "~> 0.1.5"
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
    spotify_search_track.by_artist.tracks[*].id,
  ])
}

data "spotify_search_track" "by_artist" {
  artists = ["Ariana Grande"]
  limit = 10
}