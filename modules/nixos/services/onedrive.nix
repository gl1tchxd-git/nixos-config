{ pkgs, lib, ... }: {
    services.onedrive = { 
        enable = true;
        package = pkgs.unstable.onedrive;
    };
}