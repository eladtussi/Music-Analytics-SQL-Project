
/*Query 1: Count total songs*/

SELECT COUNT(*) AS total_songs
FROM songs;


/*Query 2: Count unique artists*/

SELECT COUNT(DISTINCT artist_name) AS unique_artists
FROM songs;



/* Query 3: Count unique genres*/

SELECT COUNT(DISTINCT genre) AS unique_genres
FROM songs;



/*Query 4: Top 10 artists by number of songs*/

SELECT artist_name, COUNT(*) AS total_songs
FROM songs
GROUP BY artist_name
ORDER BY total_songs DESC
LIMIT 10;


 
/*Query 5: Top 10 most popular songs*/

SELECT track_name, artist_name, popularity
FROM songs
ORDER BY popularity DESC
LIMIT 10;



/*Query 6: Average song duration in minutes*/

SELECT ROUND(AVG(duration_ms) / 60000.0, 2) AS avg_song_length_minutes
FROM songs;



/*Query 7: Distribution of time signatures*/

SELECT time_signature, COUNT(*) AS num_songs
FROM songs
GROUP BY time_signature
ORDER BY num_songs DESC;



/*Query 8: Average energy by genre*/

SELECT genre, ROUND(AVG(energy), 2) AS avg_energy
FROM songs
GROUP BY genre
ORDER BY avg_energy DESC
LIMIT 10;



/*Query 9: Correlation check between danceability and popularity*/

SELECT ROUND(AVG(danceability), 2) AS avg_danceability,
       ROUND(AVG(popularity), 2) AS avg_popularity
FROM songs;



/*Query 10: Top 3 most popular songs per genre*/

WITH ranked_songs AS (
    SELECT
        genre,
        track_name,
        artist_name,
        popularity,
        ROW_NUMBER() OVER (PARTITION BY genre ORDER BY popularity DESC) AS rank
    FROM songs
)
SELECT *
FROM ranked_songs
WHERE rank <= 3;



/*Query 11: Correlation between danceability and popularity*/

SELECT
    ROUND(danceability, 1) AS danceability_bucket,
    AVG(popularity) AS avg_popularity,
    COUNT(*) AS num_songs
FROM songs
GROUP BY danceability_bucket
ORDER BY danceability_bucket;



