SELECT name AS nome_musica,
CASE
	WHEN name LIKE '%Bard%' THEN REPLACE(name, 'Bard', 'QA')
	WHEN name LIKE '%Amar%' THEN REPLACE(name, 'Amar', 'Code Review')
	WHEN name LIKE '%Pais%' THEN REPLACE(name, 'Pais', 'Pull Requests')
	WHEN name LIKE '%SOUL%' THEN REPLACE(name, 'SOUL', 'CODE')
	WHEN name LIKE '%SUPERSTAR%' THEN REPLACE(name, 'SUPERSTAR', 'SUPERDEV')
	ELSE name
END AS novo_nome
FROM SpotifyClone.musics
WHERE 
  name LIKE '%Bard%' OR 
  name LIKE '%Amar%' OR 
  name LIKE '%Pais%' OR 
  name LIKE '%SOUL%' OR 
  name LIKE '%SUPERSTAR%'
ORDER BY name DESC;
