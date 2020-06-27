USE master;
GO
CREATE TRIGGER PH_Database_Level_Events on DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS
AS
DECLARE @eventData AS XML;
SET @eventData = EVENTDATA();
INSERT INTO PH_Events.dbo.DDLEvents(EventTime, EventType, SPID, ServerName, LoginName, ObjectName, ObjectType, SchemaName, DatabaseName, CommandText, XMLEvent)
VALUES(cast(@eventData.query('data(//PostTime)') as varchar(64)),
       cast(@eventData.query('data(//EventType)') as varchar(128)),
           cast(@eventData.query('data(//SPID)') as varchar(128)),
           cast(@eventData.query('data(//ServerName)') as varchar(128)),
       cast(@eventData.query('data(//LoginName)') as varchar(128)),
       cast(@eventData.query('data(//ObjectName)') as varchar(128)),
           cast(@eventData.query('data(//ObjectType)') as varchar(128)),
           cast(@eventData.query('data(//SchemaName)') as varchar(128)),
           cast(@eventData.query('data(//DatabaseName)') as varchar(64)),
           cast(@eventData.query('data(//TSQLCommand/CommandText)') AS NVARCHAR(MAX)),
       @eventData
); 
