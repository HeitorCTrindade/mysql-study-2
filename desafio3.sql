SELECT
    u.name AS usuario,
    COUNT(*) AS qt_de_musicas_ouvidas,
    ROUND(SUM(m.duration) / 60, 2) AS total_minutos
FROM SpotifyClone.users u
    INNER JOIN SpotifyClone.history h ON u.users_id = h.users_id
    INNER JOIN SpotifyClone.musics m ON h.musics_id = m.musics_id
GROUP BY u.name
ORDER BY u.name ASC;
