options(help_type = "html")

local({
  r <- getOption("repos")
  r["CRAN"] <- "http://cran.stat.auckland.ac.nz"
  options(repos = r)
})

FP <- file.path("Library", "Frameworks", "R.framework", "Versions", "3.0", "Resources")
Sys.setenv("R_HOME" = file.path(getwd(), FP))
.libPaths(file.path(getwd(), FP, "library"))


suppressPackageStartupMessages({
  library(grDevices)
  library(graphics)
  library(grid)
  suppressWarnings({
    library(png)
  })
})


dev.new(width = 3.5, height = 2)
grid.newpage()
splashImg <- readPNG(system.file("images", "inzightvit-splash.png",
                                 package = "vit"),
                     exists("rasterImage"))
grid.raster(splashImg, width = unit(3.5, "inches"), height = unit(2, "inches"))  


message("(Dept. of Statistics, Uni. of Auckland)")
message("")
message("Please wait while iNZightVIT loads...")

suppressWarnings({
  library(vit)
})

tmp <- dev.off()
# rm(tmp)  # gives an error "cannot remove from base namespace"

suppressPackageStartupMessages({
  suppressWarnings({
    iNZightVIT(disposeR = TRUE)
  })
})
