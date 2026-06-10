{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  dotenv.disableHint = true;

  packages = with pkgs; [
    git
  ];

  enterTest = ''
    git --version
  '';

  languages = {
    javascript = {
      enable = true;
      npm.enable = true;
      yarn.enable = true;
      yarn.install.enable = true;
    };
    nix.enable = true;
    typescript.enable = true;
  };

  git-hooks.hooks.eslint.enable = true;
  git-hooks.hooks.eslint.settings.binPath = "node_modules/.bin/eslint";
  git-hooks.hooks.treefmt.enable = true;

  treefmt = {
    enable = true;
    config = {
      programs = {
        nixfmt.enable = true;
        prettier.enable = true;
      };
    };
  };
}
