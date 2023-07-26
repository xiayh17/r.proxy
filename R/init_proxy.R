#' Initialization proxy settings
#'
#' When user use it in the first time or reset proxy, this will run and store setting in home directory.
#'
#' @return a file in home directory
#' @export
#'
#' @examples
#' \dontrun{
#' init_proxy()
#' }
init_proxy <- function() {

  message("This maybe the first time proxy4you be load. \nPlease complete below configrations:)")
  message("Default setting can be accessed by Enter with nothing")

  socks5 <- readline("[socks5 proxy] {Default as 127.0.0.1:7890} (address:port): ")

  https <- readline("[https proxy] {Default as 127.0.0.1:7890} (address:port): ")

  http <- readline("[http proxy] {Default as 127.0.0.1:7890} (address:port): ")

  all <- c(http,https,socks5)

  res <- lapply(all, function(x)
    if (nchar(x) == 0) {
      x = '127.0.0.1:7890'
    } else {
      x = x
    }
  )

  res <- as.character(res)

  protocols = c("http", "https", "socks5")
  prefix = c("http", "http", "socks5")

  proxys <- paste0(prefix,"://",res)

  names(proxys) <- protocols

  text <- paste0(names(proxys)," = ",proxys)
  writeLines(text, "~/.Rproxy")
  message("Your setting have been save in ~/.Rproxy")
}

.check_rproxy <- function() {

  if (file.exists("~/.Rproxy")) {

  } else {
    init_proxy()
  }

}
