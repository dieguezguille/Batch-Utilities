@ECHO OFF

START chrome https://app.slack.com/client/TAY2BPG0M/CAX77JXSL https://3.basecamp.com/4363155/projects https://silentiumapps.atlassian.net/secure/BrowseProjects.jspa
START code -r
START %APPDATA%\Spotify\Spotify.exe
START %LOCALAPPDATA%\Discord\Update.exe --processStart Discord.exe

EXIT