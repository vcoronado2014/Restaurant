USE Savina_db
GO
UPDATE 
	requests SET creatorUserId = 80
WHERE 
	creatorUserId = 69 and createdAt between  '2017-09-20' and '2017-10-02'
GO
