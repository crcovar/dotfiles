-- cssls setup to ignore tailwindcss unknown at rules
return {
  settings = {
    css = {
      lint = {
        unknownAtRules = "ignore",
      }
    }
  }
}
