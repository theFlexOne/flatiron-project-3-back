# Flatiron Project 3 - Backend

_Flatiron Project 3 - Backend_ is a backend server to handle request from a frontend Music Library/Catalog, written in Ruby with Active Record & Sinatra. With this app, you can populate playlists with tracks from the backend database.

## Installation

Simply clone this repo 7 run `bundle install` from the root directory you cloned to.

## Usage

To use this backend server as intended, simply run `rake server` in the terminal, from the root directory you cloned the repo into. This will startup a server to listen for requests on `localhost:9292`. The database is already seeded with data from the spotify API, using my personal account. Trying to reset or reseed the database will fail without spotify credentials.

### Routes

These are the relative active routes the server will listen for:

---

- GET - /playlists
- GET - /playlists/:id

---

- GET - /albums
- GET - /albums/:id

---

- POST - /playlist_tracks
- DELETE - /playlist_tracks

---

## License

[MIT](https://choosealicense.com/licenses/mit/)
