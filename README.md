# Unturned Item Icons

Flat `{id}.png` icons for Unturned plugins (AdamiteInventory, AdvancedEconomy Store UI, etc.).

## URL pattern

```
https://raw.githubusercontent.com/OrionYes-sys/UnturnedItemIcons/main/{id}.png
```

Example: `https://raw.githubusercontent.com/OrionYes-sys/UnturnedItemIcons/main/10.png`

## AdvancedEconomy config

In your server's `Plugins/AdvancedEconomy/AdvancedEconomy.configuration.xml`:

```xml
<ItemIconBaseUrl>https://raw.githubusercontent.com/OrionYes-sys/UnturnedItemIcons/main</ItemIconBaseUrl>
<ItemIconUseGuid>false</ItemIconUseGuid>
<EnableStoreUI>true</EnableStoreUI>
```

- `ItemIconBaseUrl` — base URL; the plugin appends `/{itemId}.png`
- `ItemIconUseGuid` — keep `false` for this repo (icons are named by item ID, not GUID)
- `EnableStoreUI` — must be `true` for icons to show in the store UI

Reload the plugin or restart the server after editing the config.
