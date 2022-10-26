SELECT
    CAST( (MIN(s.value)) AS DECIMAL(5, 2)) AS faturamento_minimo,
    CAST( (MAX(s.value)) AS DECIMAL(5, 2)) AS faturamento_maximo,
    CAST( (AVG(s.value)) AS DECIMAL(5, 2)) AS faturamento_medio,
    CAST( (SUM(s.value)) AS DECIMAL(5, 2)) AS faturamento_total
FROM SpotifyClone.users u
    INNER JOIN SpotifyClone.subscription_plan s ON s.subscription_plan_id = u.subscription_plan_id;
