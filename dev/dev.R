library("usethis")

usethis::create_github_token()
gitcreds::gitcreds_set()
usethis::use_git_remote("origin", url =
                          NULL, overwrite = TRUE)


use_github(
  organisation = "iom",
  private = FALSE,
  visibility =  "public",
  protocol = git_protocol(),
  host = NULL
)


