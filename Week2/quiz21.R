library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

myapp <- oauth_app("gitapp",
                   key = "4ef0dadb07b27fb7ccf0",
                   secret = "b7cca02ff8e92c4c8e5ae1cd3625baa82a00f2f1")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
content <- fromJSON(toJSON(content(req)))

which(content$name=='datasharing')
content[11,]$created_at