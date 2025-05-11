# ⌨️ `Richy-Z/input`

Native input event handling for Luvit. Supports keyboard events on macOS using low-level system APIs.

Cross-platform support and mouse events coming soon.

## ✨ Features

This input library currently has the following features:

- Native keyboard event handling on macOS (via FFI)
- Simple event emitter API
- Low-level and non-blocking input capture

Coming soon:

- Cross-platform support for Windows and Linux, also using FFI
- Mouse input handling for macOS
- Mouse input handling for other platforms

## 📥 Installation & Use

Use lit to install the library. Don't worry, there are no upstream bugs, so you don't have to manually clone the repository.

```sh
lit install Richy-Z/input
```

### Usage Example

This library is event-based, following the common patterns used in Luvit. You can use the `:on` method to provide new callbacks for when an event happens.

```lua
local input = require("input")

input:on("key_press", function(keycode)
    print("Key pressed", keycode)
end)

input:on("key_release", function(keycode)
    print("Key released", keycode)
end)

-- start the event loop
input:run()
```

> [!TIP]
> Please note that `keycode` for the `key_press` and `key_release` events will always be a number.
>
> **Currently only macOS keycodes are supported.**
>
> To convert this to a human readable format, you would want to use the enumerations:
>
> ```lua
> local enums = input.enums
> local k = enums.macOS
> ```
>
> Using the platform-specific enumeration, you can call your enum with the raw keycode to get a human-readable string:
>
> ```lua
> print(k(126)) -- "ARROW_UP"
> ```
>
> Likewise, you can also index the enumeration with your human-readable key to get back the raw keycode:
>
> ```lua
> print(k.ARROW_UP) -- 125
> ```

Here’s a properly structured **Keycodes** section explaining all of this clearly and formally, while keeping it approachable:

## 🎹 Keycodes

This library currently handles raw keycodes directly from the underlying system APIs. These keycodes are platform-specific by design.

- **Currently supported**: macOS
- **Coming soon**: Windows, Linux

### Current platform-specific usage

For now, keycode enumerations are static and must be accessed through the platform-specific enumeration:

```lua
local k = input.enums.macOS
print(k(126))      -- "ARROW_UP"
print(k.ARROW_UP)  -- 126
```

### Unified/Dynamic keycodes in the future

When cross-platform support is introduced, a **unified keycode system** will be provided under `input.enums.keycode`.
This will dynamically resolve the appropriate keycodes for your platform whilst keeping the human-readable keys consistent across platforms (e.g. `ARROW_UP` will exist everywhere.).

This means that you will be able to simply use the unified keycodes to make your code cross-platform immediately without having to switch between `enums.macOS` and a supposed `enums.Windows` in the future.

#### 🛠️ Platform-Specific Keys

If you need access to keys that are unique to a particular platform (such as macOS-specific media controls or function keys), you can always continue to use the platform enumeration directly:

```lua
local macKeys = input.enums.macOS
print(macKeys.MISSION_CONTROL) -- macOS-specific key (example)
```
