SELECT 
	u.name AS usuario,
    IF (MAX(YEAR(h.reprodution_date)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS status_usuario           
FROM 
	SpotifyClone.users u
	INNER JOIN SpotifyClone.history h ON h.users_id = u.users_id
group by u.name
ORDER BY u.name;
