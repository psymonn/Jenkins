# Jenkins

Jenkins Console for HTML-Reporting:
To allow Jenkins to run inline CSS and JavaScript in the HTML Report we will need to configure the Content Security Policy.

System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "style-src 'self' 'unsafe-inline';")

System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "")

These settings do not persist when Jenkins is restarted. They can be added to the JAVA_ARGS for startup as seen in this StackOverflow Comment:

https://stackoverflow.com/questions/37618892/jenkins-content-security-policy/37623540#37623540

Create you own internal powershell repo: https://www.nuget.org/downloads

https://kevinmarquette.github.io/2017-05-30-Powershell-your-first-PSScript-repository/
