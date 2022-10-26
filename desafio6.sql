SELECT (
        SELECT MIN(value)
        FROM
            SpotifyClone.subscription_plan
    ) AS faturamento_minimo, (
        SELECT MAX(value)
        FROM
            SpotifyClone.subscription_plan
    ) AS faturamento_maximo,
    CAST( (AVG(s.value)) AS DECIMAL(5, 2)) AS faturamento_medio,
    ROUND(SUM(s.value), 2) AS faturamento_total
FROM SpotifyClone.users u
    INNER JOIN SpotifyClone.subscription_plan s ON s.subscription_plan_id = u.subscription_plan_id;
