select name, year FROM albums
where year = 2018;

select name, duration FROM tracks
ORDER BY duration desc
limit 1;

select name FROM tracks
where duration >= 210;

select name FROM collections
WHERE year between 2018 and 2020;

select name FROM artists
where name NOT LIKE '% %';

select name FROM tracks
WHERE name like '%My%';