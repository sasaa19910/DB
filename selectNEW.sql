

SELECT COUNT(artist_id)
  FROM artistsgenres a;


SELECT COUNT(tr.name) 
  FROM albums al
  JOIN tracks tr 
  ON al.id = tr.album_id
 WHERE year between 2019 
   AND 2020;


SELECT al.name, avg(tr.duration) 
  FROM albums al
  JOIN tracks tr 
  ON tr.album_id = al.id
 GROUP BY al.name;


SELECT ar.name 
  FROM artistalbum a
  JOIN artists ar 
  ON ar.id = a.artist_id
  JOIN albums al 
  ON al.id = a.album_id
 WHERE YEAR != (
	SELECT YEAR 
	  FROM albums
	 WHERE YEAR = 2020)
 GROUP BY ar.name;


SELECT col.name 
  FROM collections col
  JOIN tracks tr 
  ON col.id = tr.id 
  JOIN albums al
  ON tr.album_id = al.id 
  JOIN artists ar
  ON al.id = ar.id
 WHERE ar.name
  LIKE 'Nirvana';


SELECT a.name, COUNT(*)
  FROM artistsgenres arg
  JOIN artists ar
  ON ar.id = arg.artist_id
  JOIN genres g
  ON g.id = arg.genre_id
  JOIN albums a
  ON a.id = ar.id
  GROUP BY a.name
  HAVING COUNT(*) > 1
  ORDER BY COUNT(*) DESC;


SELECT t.name 
  FROM tracks t
  LEFT JOIN collectionstracks c 
  ON c.track_id = t.id
 WHERE c.collection_id IS NULL
 GROUP BY t.name;


SELECT ar.name, MIN(t.duration)
  FROM artists ar
  JOIN tracks t
  ON t.id  = ar.id
  JOIN albums a 
  ON a.id = t.album_id
 WHERE t.duration <= (
 SELECT min(tracks.duration) 
   FROM tracks)
  GROUP BY ar.name;


SELECT ar.name 
  FROM artists ar
  JOIN albums al 
  ON ar.id = al.id
  JOIN tracks tr
  ON al.id = tr.album_id 
 WHERE tr.duration <= (
 SELECT min(tracks.duration)
   FROM tracks)
  GROUP BY ar.name;


SELECT a.name, count(t.album_id)
  FROM albums a
  JOIN tracks t 
  ON a.id = t.album_id
  GROUP BY a.name
  HAVING COUNT(t.album_id) = 1;




