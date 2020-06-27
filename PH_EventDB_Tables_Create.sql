CREATE DATABASE PH_Events
 
GO
CREATE TABLE PH_Events.dbo.DDLEvents
(
    XMLEvent XML, 
    DatabaseName VARCHAR(64),
    EventTime DATETIME DEFAULT (GETDATE()),
    EventType VARCHAR(128),
    SPID VARCHAR(128),
    ServerName VARCHAR(128),
    LoginName VARCHAR(128),
    ObjectName VARCHAR(128),
    ObjectType VARCHAR(128),
    SchemaName VARCHAR(128),
    CommandText VARCHAR(128)
)
 
GO
CREATE TABLE PH_Events.dbo.LogonEvents
(
    XMLEvent XML,
    EventTime DATETIME,
    EventType VARCHAR(128),
    SPID VARCHAR(128),
    ServerName VARCHAR(128),
    LoginName VARCHAR(128),
    LoginType VARCHAR(128),
    SID VARCHAR(128),
    HostName VARCHAR(128),
    IsPooled VARCHAR(128),
    AppName VARCHAR(255)
) 
