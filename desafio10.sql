SELECT
    m.name AS nome,
    COUNT(*) AS reproducoes
FROM SpotifyClone.musics m
    INNER JOIN SpotifyClone.history h ON h.musics_id = m.musics_id
    INNER JOIN SpotifyClone.users u ON u.users_id = h.users_id
WHERE
    u.subscription_plan_id in (1, 2)
group by nome
ORDER BY nome ASC;
