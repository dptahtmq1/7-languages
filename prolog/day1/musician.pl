musician_genre(musicianA, genreA).
musician_genre(musicianB, genreB).
musician_genre(musicianC, genreA).

genre_instrument(genreA, guitar).
genre_instrument(genreA, drum).
genre_instrument(genreA, base).
genre_instrument(genreB, guitar).

musician_instrument(X, Y) :- musician_genre(X, Z), genre_instrument(Z, Y).