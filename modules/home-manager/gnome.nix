{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.activation.removeExistingBackups = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    find ~/.config -name "*.hm-backup" -delete 2>/dev/null || true
  '';

  home.activation.fixSteamIcons = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # Never fail the Home Manager activation because of this best-effort patch.
    # Also leave breadcrumbs in the journal to debug unexpected failures.
    set +e

    log() {
      echo "fixSteamIcons: $*"
    }

    apps_dir="$HOME/.local/share/applications"
    log "apps_dir=$apps_dir"

    # Nothing to do if the directory doesn't exist.
    if [ ! -d "$apps_dir" ]; then
      log "skip: directory does not exist"
      exit 0
    fi

    found_any=0
    patched=0
    skipped=0
    errors=0

    for f in "$apps_dir"/*.desktop; do
      if [ ! -e "$f" ]; then
        # Glob didn't match anything.
        continue
      fi

      if [ ! -r "$f" ]; then
        log "skip: not readable: $f"
        skipped=$((skipped + 1))
        continue
      fi

      found_any=1

      # Extract AppID from: Exec=steam steam://rungameid/<AppID>
      id="$(
        grep -E '^Exec=steam steam://rungameid/[0-9]+' "$f" 2>/dev/null \
          | sed -n 's/^Exec=steam steam:\/\/rungameid\/\([0-9][0-9]*\).*$/\1/p' \
          | head -n 1
      )"

      if [ -z "$id" ]; then
        skipped=$((skipped + 1))
        continue
      fi

      # Only append if missing.
      if grep -q '^StartupWMClass=' "$f" 2>/dev/null; then
        continue
      fi

      # Ensure the file ends with a newline, then append our key.
      # All failures must be logged and must not fail activation.
      {
        # If last byte isn't newline, add one.
        tail -c 1 "$f" 2>/dev/null | grep -q '^$' || printf '\n' >> "$f"
        printf 'StartupWMClass=steam_app_%s\n' "$id" >> "$f"
      } || {
        log "error: failed to patch: $f (appid=$id)"
        errors=$((errors + 1))
        continue
      }

      patched=$((patched + 1))
    done

    log "done: found_any=$found_any patched=$patched skipped=$skipped errors=$errors"

    # Update desktop database if possible, but never fail.
    if [ "$found_any" -eq 1 ] && command -v update-desktop-database >/dev/null 2>&1; then
      update-desktop-database "$apps_dir" >/dev/null 2>&1 || log "warning: update-desktop-database failed (ignored)"
    else
      log "note: update-desktop-database not run (no files or command missing)"
    fi

    exit 0
  '';

  home.packages =
    with pkgs;
    [
      # Catppuccin theme components
      catppuccin
      magnetic-catppuccin-gtk
      catppuccin-cursors

      # Fonts
      jetbrains-mono

      # GNOME customization
      gnome-tweaks
      gdm-settings
    ]
    ++ (with pkgs.gnomeExtensions; [
      dash-to-dock
      unite
      blur-my-shell
      paperwm
      system-monitor
      night-theme-switcher
      user-themes
    ])
    ++ (with pkgs.myPackages.gnomeCursors; [
      hoshimi-miyabi
    ]);

  # GTK theming configuration
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        tweaks = [
          "rimless"
          "black"
        ];
        variant = "mocha";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Hoshimi-miyabi";
      size = 24;
    };
  };

  # Configure fonts
  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    name = "Hoshimi-miyabi";
    package = pkgs.myPackages.gnomeCursors.hoshimi-miyabi;
    size = 24; # or your preferred size
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Hoshimi-miyabi";
    XCURSOR_SIZE = "24";
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "extension-list@tu.berry"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "nightthemeswitcher@romainvigier.fr"
        "paperwm@paperwm.github.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "unite@hardpixel.eu"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/desktop/interface" = {
      cursor-theme = "Hoshimi-miyabi";
      cursor-size = 24;
    };
  };
}
