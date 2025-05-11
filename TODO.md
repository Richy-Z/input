# To-Do List

- ensure that keycode enumerations are dynamic instead of static currently
  - should be determined based off of platform, ideally with automatic autocompletion inside of vscode too

- document the library
- add LSP comments
  - each keycode is merged into one big thing but just for the LSP
  - all values will be `-1`
  - Comments saying "Supported: macOS, Linux, Windows"
  - test right click event on macos
  - normalise scroll values across all platforms
  - figure out what to normalise macos values to (or literally what we will be normalising to)
