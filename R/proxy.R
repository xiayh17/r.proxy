#' Set proxy
#'
#' set proxy for http https and socks5
#'
#'
#' @return set proxy for http https and socks5
#' @export
#'
#' @examples
#' \dontrun{
#' proxy()
#' }
proxy <- function() {

  .check_rproxy()

  config_info <- .read_rproxy()

  Sys.setenv(http_proxy=config_info[['http']],
             https_proxy=config_info[['https']],
             all_proxy=config_info[['socks5']])
  message("Proxy info: ")
  message("http:   ", Sys.getenv("http_proxy"))
  message("https:  ", Sys.getenv("https_proxy"))
  message("socks5: ", Sys.getenv("all_proxy"))
  check_ip()
}

#' Reset proxy
#'
#' unset proxy http https and socks5
#'
#' @return unset proxy http https and socks5
#' @export
#'
#' @examples
#' \dontrun{
#' noproxy()
#' }
noproxy <- function() {
  Sys.unsetenv(c("https_proxy","http_proxy","all_proxy"))
  message("Proxy was cleaned!")
  message(Sys.getenv(c("https_proxy","http_proxy","all_proxy")))
  check_ip()
}


.read_rproxy <- function() {
  txt <- readLines("~/.Rproxy")

  index <- c('http','https','socks5')

  res <- lapply(index, function(x) {
    m <- regexpr(paste0(x, " = .*"), txt)
    line <- regmatches(txt, m)
    gsub(paste0(x," = "),"",line)
  })

  res <- as.character(res)
  names(res) <- index
  return(res)
}

