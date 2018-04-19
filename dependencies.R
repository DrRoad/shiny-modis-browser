#### Load/update packages ####

pkgs <- data.frame(
  name = c("leaflet"),
  version = c("1.1.0"),
  stringsAsFactors = FALSE
)

for (i in 1:nrow(pkgs)) {
  if (!(pkgs$name[i] %in% installed.packages()) || 
      packageVersion(pkgs$name[i]) < pkgs$version[i]) {
    install.packages(pkgs$name[i], repos="http://cran.us.r-project.org")
  }
  library(pkgs$name[i], character.only = TRUE)
}
