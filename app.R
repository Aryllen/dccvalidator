# Launch the ShinyApp (Do not remove this comment)
# To deploy, run: rsconnect::deployApp()
# Or use the blue button on top of this file

if (Sys.getenv("R_CONFIG_ACTIVE") == "") {
  Sys.setenv(R_CONFIG_ACTIVE = "default")
}
pkgload::load_all()
options("golem.app.prod" = TRUE)
dccvalidator::run_app() # add parameters here (if any)
