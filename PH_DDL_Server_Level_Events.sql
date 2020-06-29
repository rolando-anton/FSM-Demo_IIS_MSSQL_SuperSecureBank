CREATE TRIGGER PH_DDL_Server_Level_Events
ON ALL SERVER
 
FOR DDL_ENDPOINT_EVENTS, DDL_LOGIN_EVENTS, DDL_GDR_SERVER_EVENTS, DDL_AUTHORIZATION_SERVER_EVENTS, CREATE_DATABASE, ALTER_DATABASE, DROP_DATABASE AS DECLARE @eventData AS XML;
SET @eventData = EVENTDATA();

insert into PH_Events.dbo.DDLEvents(EventTime, EventType, SPID, ServerName, LoginName, ObjectName, ObjectType, SchemaName, DatabaseName, CommandText, XMLEvent)
values(cast(@eventData.query('data(//PostTime)') as varchar(64)),
       cast(@eventData.query('data(//EventType)') as varchar(128)),
       cast(@eventData.query('data(//SPID)') as varchar(128)),
       cast(@eventData.query('data(//ServerName)') as varchar(128)),
       cast(@eventData.query('data(//LoginName)') as varchar(128)),
       cast(@eventData.query('data(//ObjectName)') as varchar(128)),
       cast(@eventData.query('data(//ObjectType)') as varchar(128)),
       cast(@eventData.query('data(//SchemaName)') as varchar(128)),
       cast(@eventData.query('data(//DatabaseName)') as varchar(64)),
       cast(@eventData.query('data(//TSQLCommand/CommandText)') AS NVARCHAR(MAX)),
       @eventData); 
