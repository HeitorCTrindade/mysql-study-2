SELECT 
	m.name AS cancao,
    COUNT(m.name) AS reproducoes           
FROM 
	SpotifyClone.history h
	INNER JOIN SpotifyClone.musics m ON h.musics_id = m.musics_id
group by m.name
ORDER BY reproducoes DESC, cancao limit 2;
