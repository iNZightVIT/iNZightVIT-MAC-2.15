options(help_type = "html")

local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
  options(repos = r)
})

FP <- file.path("Library", "Frameworks", "R.framework", "Versions", "2.15", "Resources")
.libPaths(file.path(getwd(), FP, "library"))


suppressPackageStartupMessages({
  library(grDevices)
  library(graphics)
  library(grid)
  suppressWarnings({
    trypng <- try(library(png))
  })
})


if (!inherits(trypng, "try-error")) {
    dev.new(width = 3.5, height = 2)
    grid.newpage()
    splashImg <- readPNG(system.file("images", "inzightvit-splash.png",
                                     package = "vit"),
                         exists("rasterImage"))
    grid.raster(splashImg, width = unit(3.5, "inches"), height = unit(2, "inches"))
}

message("(Dept. of Statistics, Uni. of Auckland)")
message("")
message("Please wait while iNZightVIT loads...")

suppressWarnings({
  library(vit)
})

tmp <- try(dev.off())
# rm(tmp)  # gives an error "cannot remove from base namespace"

suppressPackageStartupMessages({
  suppressWarnings({
    iNZightVIT(disposeR = TRUE)
  })
})
