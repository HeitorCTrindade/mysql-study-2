SELECT
    a.name AS artista,
    alb.name AS album
FROM SpotifyClone.artists a
    INNER JOIN SpotifyClone.albums alb ON a.artists_id = alb.artists_id
WHERE
    a.name = "Elis Regina"
group by a.name, alb.name
ORDER BY alb.name;

