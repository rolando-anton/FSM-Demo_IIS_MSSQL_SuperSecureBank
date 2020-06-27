EXEC SP_ADDLOGIN 'AOPerfLogin', 'ProspectHills!', 'master';
EXEC SP_ADDROLE 'AOPerfRole';
EXEC SP_ADDUSER 'AOPerfLogin', 'AOPerfUser', 'AOPerfRole';
GRANT VIEW SERVER STATE TO AOPerfLogin;
GRANT SELECT ON dbo.sysperfinfo TO AOPerfRole;
GRANT EXEC on xp_readerrorlog to AOPerfRole
