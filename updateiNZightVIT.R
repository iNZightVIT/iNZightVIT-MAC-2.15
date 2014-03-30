# This is the update script for MAC
library(RCurl)

# First set up some global variables that will be used by the updater function
isWindows <- FALSE
isLinux <- FALSE
isOSX <- TRUE
.libPaths(Sys.getenv("R_LIBRARIES"))
library(utils)
OSstring <- "OSX"
downloadMethod <- "curl"
# We need to set the directory properly:
setwd(strsplit(Sys.getenv("R_HOME"), "Library/Frameworks")[[1]][1])

useOldR <- TRUE

UPDATER_VERSION <- numeric_version(1.0)
updater.location <- file.path(getwd(), "updateiNZightVIT.R")
update.ext <- "-MAC-sl"  # this will be "-WIN", "-MAC", "-MAC-snowleopard" etc...

source_https <- function(url, ...) {
  # load package
    require(RCurl)

  # Download the new file to a temporary location and source it.
    sapply(c(url, ...), function(u) {
        text <- getURL(u, followlocation = TRUE,
                       cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
        ftmp <- tempfile()
        con <- file(ftmp, open = "w")
        writeLines(text, con)
        close(con)
        source(ftmp)
    })
}
source_https("https://www.stat.auckland.ac.nz/~wild/downloads/iNZight/update.R")
#source(file.choose())  # this is for debugging
updateDistribution()
