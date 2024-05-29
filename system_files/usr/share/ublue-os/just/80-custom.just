# Create a Fedora (bsherman custom) container
distrobox-fedora-custom:
  distrobox create --nvidia --image ghcr.io/bsherman/fedora-toolbox-custom:FEDORA_MAJOR_VERSION -n fedora-custom -Y

# Setup flathub remote, remove fedora remote if present
setup-flatpak-repos:
  flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak uninstall --system --noninteractive `flatpak list --all --columns origin,application|grep ^fedora|awk '{print $2}'|xargs`
  flatpak remote-delete --system fedora --force

# Install typical GNOME apps
install-apps-gnome:
  flatpak install --noninteractive --system flathub \\
    org.gnome.Calculator \\
    org.gnome.Calendar \\
    org.gnome.Characters \\
    org.gnome.Connections \\
    org.gnome.Contacts \\
    org.gnome.Evince \\
    org.gnome.Logs \\
    org.gnome.Loupe \\
    org.gnome.Maps \\
    org.gnome.NautilusPreviewer \\
    org.gnome.TextEditor \\
    org.gnome.Weather \\
    org.gnome.baobab \\
    org.gnome.clocks \\
    org.gnome.font-viewer \\
    org.gnome.SimpleScan \\
    org.gnome.SoundRecorder \\
    org.fedoraproject.MediaWriter \\
    org.mozilla.firefox \\
    com.github.tchx84.Flatseal \\
    com.mattjakeman.ExtensionManager \\
    io.github.celluloid_player.Celluloid \\
    it.mijorus.gearlever \\
    io.missioncenter.MissionCenter \\
    org.gustavoperedo.FontDownloader

# Install Creative Media Apps
install-apps-creative:
  flatpak install -y --system \\
    nl.hjdskes.gcolor3 \\
    org.audacityteam.Audacity \\
    org.gimp.GIMP \\
    org.inkscape.Inkscape \\
    org.kde.kdenlive \\
    org.kde.krita

# Install standard apps
install-apps-standard:
  flatpak install -y --system \\
    com.microsoft.Edge \\
    net.mullvad.MullvadBrowser \\
    com.belmoussaoui.Obfuscate \\
    org.onlyoffice.desktopeditors \\
    one.ablaze.floorp \\
    com.github.zadam.trilium \\
    com.sindresorhus.Caprine \\
    org.signal.Signal \\
    io.github.shiftey.Desktop \\
    org.localsend.localsend_app \\
    org.kde.okular \\
    com.discordapp.Discord \\
    org.gnome.DejaDup \\
    de.haeckerfelix.Fragments \\
    com.github.iwalton3.jellyfin-media-player \\
    com.github.zocker_160.SyncThingy \\
    io.github.fabrialberio.pinapp


# Give browsers permission to create PWAs (Progressive Web Apps)
install-pwa-flatpak-overrides:
  flatpak override --system --filesystem=~/.local/share/applications --filesystem=~/.local/share/icons com.google.Chrome
  flatpak override --system --filesystem=~/.local/share/applications --filesystem=~/.local/share/icons com.brave.Browser
  flatpak override --system --filesystem=~/.local/share/applications --filesystem=~/.local/share/icons com.microsoft.Edge

# Install educational games
install-games-educational:
  flatpak install -y --system \\
    org.kde.kturtle \\
    edu.mit.Scratch \\
    com.tux4kids.tuxmath \\
    com.tux4kids.tuxtype \\
    org.tuxpaint.Tuxpaint

# Install light/casual games
install-games-light:
  flatpak install -y --system \\
    net.sourceforge.lgames.LTris \\
    org.frozen_bubble.frozen-bubble \\
    org.gnome.Aisleriot \\
    org.gnome.Mines

# Install Linux games
install-games-linux:
  flatpak install -y --system \\
    io.github.retux_game.retux \\
    net.sourceforge.ExtremeTuxRacer \\
    net.supertuxkart.SuperTuxKart \\
    org.supertuxproject.SuperTux \\
    org.armagetronad.ArmagetronAdvanced \\
    party.supertux.supertuxparty

# Install Minecraft games
install-games-minecraft:
  flatpak install -y --system \\
    com.mojang.Minecraft \\
    io.mrarm.mcpelauncher \\
    org.prismlauncher.PrismLauncher

# Install Steam with MangoHud, Gamescope and Prototricks
install-games-steam:
  flatpak install -y --system \\
    org.freedesktop.Platform.VulkanLayer.MangoHud//22.08 \\
    com.github.Matoking.protontricks \\
    com.valvesoftware.Steam \\
    com.valvesoftware.Steam.Utility.gamescope

# Get Gnome extensions standard
get-gnome-extensions-standard:
    pip install --upgrade gnome-extensions-cli
    #WeatherOClock
    gext install 5470    
    #Pano-Clipboard Manager
    gext install 5278
    #just-perfection
    gext install 3843
    #[QSTweak]-Quick-Setting-Tweaker 
    gext install 5446
    #Status-Area-Horizontal-Spacing
    gext install 355
    #Thinkpad-Battery-Threshold 
    gext install 4798
    #ThinkPad Thermal
    gext install 986
    #caffein
    gext install 517


# Install virtualization stack (libvirt/virt-manager/etc)
install-virtualization:
  rpm-ostree install libvirt-client libvirt-daemon-kvm virt-install virt-manager

# Un-install virtualization stack (libvirt/virt-manager/etc)
uninstall-virtualization:
  rpm-ostree uninstall libvirt-client libvirt-daemon-kvm virt-install virt-manager

# Install system flatpaks
install-rebase-flatpaks:
    #!/bin/bash
    BLUEFIN_DX_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/ublue-os/bluefin/main/bluefin_flatpaks/flatpaks | tr '\n' ' ')"
    STANDARD_FLATPAK_LIST="$(curl https://raw.githubusercontent.com/kanutten/bluetrain/main/flatpaks/standard_flatpaks | tr '\n' ' ')"
    echo "Installing Bluefin-dx Flatpaks.."
    flatpak --system -y install ${BLUEFIN_DX_FLATPAK_LIST}
    echo "Installing Standard Flatpaks.."
    flatpak --system -y install ${STANDARD_FLATPAK_LIST}

# Create a bluefin-cli (jorge custom) container
distrobox-bluefin-cli-jorge-custom:
  distrobox create --nvidia --image ghcr.io/castrojo/bluefin-cli:latest -n bluefin-cli-ctm -Y

# Install ms-fonts
Install-Microsoft-Fonts:
    #!/bin/bash
    mkdir -p ~/.local/share/fonts/mscorefonts
    cd ~/Nextcloud/Documents/Privat/Homelab/ms-fonts/
    cp -v fonts/*.ttf fonts/*.fon ~/.local/share/fonts/mscorefonts/

