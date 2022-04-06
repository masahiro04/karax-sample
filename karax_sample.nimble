# Package

version       = "0.1.0"
author        = "masahirookubo"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["index.js"]
binDir        = "public/js"

backend       = "js"

# Dependencies

requires "nim >= 1.6.4"
requires "karax == 1.2.1"

