SELECT
    COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.users u
    INNER JOIN SpotifyClone.history h ON h.users_id = u.users_id
WHERE
    u.name = "Barbara Liskov";
