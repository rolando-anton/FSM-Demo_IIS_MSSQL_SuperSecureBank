CREATE TRIGGER PH_LoginEvents
ON ALL SERVER WITH EXECUTE AS self
FOR LOGON
AS
BEGIN
DECLARE @event XML
SET @event = EVENTDATA()
INSERT INTO PH_Events.dbo.LogonEvents (EventTime,EventType,SPID,ServerName,LoginName,LoginType,SID,HostName,IsPooled,AppName,XMLEvent)
VALUES(CAST(CAST(@event.query('/EVENT_INSTANCE/PostTime/text()') AS VARCHAR(64)) AS DATETIME),
       CAST(@event.query('/EVENT_INSTANCE/EventType/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/SPID/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/ServerName/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/LoginName/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/LoginType/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/SID/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/ClientHost/text()') AS VARCHAR(128)),
       CAST(@event.query('/EVENT_INSTANCE/IsPooled/text()') AS VARCHAR(128)),
       APP_NAME(),
       @event)
END; 
