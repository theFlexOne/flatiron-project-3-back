# Flatiron Project 3 - Backend

_Flatiron Project 3 - Backend_ is a backend server to handle request from a frontend Music Library/Catalog, written in Ruby with Active Record & Sinatra.

## Installation

Simply clone this repo.

## Usage

In the terminal, from this project's root directory, run:

```bash
rake server
```

This will setup the server to start listening to requests from the corresponding frontend application.

### Routes

These are the active routes the server will listen for:

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
