config.omniauth :github,
                ENV["GITHUB_CLIENT_ID"],
                ENV["GITHUB_CLIENT_SECRET"],
                scope: "user:email"