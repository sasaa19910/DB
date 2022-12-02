SELECT name, COUNT(artist_id)                                1
  FROM genres g
  LEFT JOIN artistsgenres a ON g.id = a.genre_id
 GROUP BY name;


SELECT al.name, count(tr.name)                                  2
  FROM albums al
  JOIN tracks tr 
  ON al.id = tr.album_id 
 WHERE year BETWEEN 2019 
   AND 2020
 GROUP BY al.name;

SELECT al.name, ROUND(AVG(duration), 1)                      3
  FROM albums al
  JOIN tracks tr 
  ON al.id = tr.album_id
 GROUP BY al.name;


SELECT ar.name                                               4
  FROM artists ar
  JOIN albums al 
    ON ar.id = al.id 
 WHERE YEAR != (
	SELECT YEAR 
	FROM albums
	WHERE YEAR = 2020
);

SELECT col.name                                                5
  FROM collections col
  JOIN tracks tr 
    ON col.id = tr.id 
  JOIN albums al 
    ON tr.album_id = al.id 
  JOIN artists ar 
    ON al.id = ar.id
 WHERE ar.name 
  LIKE 'Nirvana';

SELECT al.name                                                 6
  FROM albums al
  JOIN artistalbum aa 
    ON al.id = aa.album_id 
  JOIN artistsgenres ag 
    ON aa.artist_id  = ag.artist_id
 GROUP BY al.name
  HAVING count(ag.genre_id) >= 2;

SELECT tr.name, ct.collection_id                                   7
  FROM tracks tr
  LEFT JOIN collectionstracks ct 
    ON tr.id = ct.track_id 
 WHERE ct.collection_id 
   IS NULL;

SELECT ar.name                                                    8
  FROM artists ar
  JOIN albums al 
    ON ar.id = al.id
  JOIN tracks tr 
    ON al.id = tr.album_id 
 WHERE tr.duration <= (
	SELECT min(tracks.duration) 
	  FROM tracks
)
 GROUP BY ar.name;


SELECT al.name                                        9
  FROM albums al
  JOIN tracks tr 
    ON al.id = tr.album_id 
 GROUP BY al.name
  HAVING count(tr.id) <= (
	SELECT count(tr.id) FROM albums al
	JOIN tracks tr ON al.id = tr.album_id
	GROUP BY al.name
	ORDER BY count(tr.id)
	LIMIT 1
);


