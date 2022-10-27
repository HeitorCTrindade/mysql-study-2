SELECT
    a.name AS artista,
    alb.name AS album,
    COUNT(*) AS seguidores
FROM SpotifyClone.artists a
    INNER JOIN SpotifyClone.albums alb ON a.artists_id = alb.artists_id
    INNER JOIN SpotifyClone.folowers f ON f.artists_id = a.artists_id
group by a.name, alb.name
ORDER BY
    seguidores DESC,
    a.name,
    alb.name;
