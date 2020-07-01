CREATE VIEW vmoviesinfo AS(
SELECT 
	movies.id,
    movies.local_name,
    movies.english_name,
    movies.release_year,
    leadActor.LeadActor,
    leadActress.LeadActress,
    movCrew.Director,
    movCrew.Producer,
    MovCrew.Writer,
    gen.genre,
    multimedia.poster
FROM `movies`
INNER JOIN(	SELECT 
           		movieId,
           		CONCAT(person.first_name, ' ', person.last_name) AS LeadActor 
           	FROM `moviecast` 
           	INNER JOIN `person` ON moviecast.actorId = person.id
			WHERE moviecast.actorId = 1) leadActor 
            ON leadActor.movieId = movies.id
INNER JOIN(	SELECT 
           		movieId,
           		CONCAT(person.first_name, ' ', person.last_name) AS LeadActress 
           	FROM `moviecast` INNER JOIN `person` ON moviecast.actorId = person.id
			WHERE moviecast.actorId = 2) leadActress 
            ON leadActor.movieId = movies.id
INNER JOIN (SELECT 
                moviecrew.movieId as id,
                dir.Director as Director,
                pro.Producer as Producer,
                wri.Writer as Writer
            FROM `moviecrew`
            INNER JOIN (
                SELECT 
                  director.id, 
                  concat(person.first_name, ' ' , person.last_name)as Director
                FROM `director` 
                INNER JOIN `person` ON director.personId = person.id) dir 
                ON moviecrew.directorId = dir.id
            INNER JOIN (
                SELECT 
                	producer.id, 
                	concat(person.first_name, ' ' , person.last_name)as Producer
                FROM `producer` 
                INNER JOIN `person` ON producer.personId = person.id) pro 
                ON moviecrew.producerId = pro.id
            INNER JOIN (
                SELECT 
                   writer.id, 
                   concat(person.first_name, ' ' , person.last_name)as Writer
                FROM `writer` 
                INNER JOIN `person` ON writer.personId = person.id) wri 
                ON moviecrew.writerId = wri.id) movCrew
            ON movies.id = movCrew.id
INNER JOIN (SELECT 
				moviegenre.movieId as movieId,
    			GROUP_CONCAT(genre.genre)as genre
			FROM `moviegenre` 
			INNER JOIN `genre` ON moviegenre.genreId = genre.id  ) gen 
			ON gen.movieId = movies.id
INNER JOIN `multimedia` ON movies.id = multimedia.movieId
)