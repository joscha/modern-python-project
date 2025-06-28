{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  overlays = [
    (final: prev: {
      uv =
        (import inputs.nixpkgs-unstable {
          system = prev.stdenv.system;
        }).uv;
    })
  ];

  packages =
    [
      pkgs.git
      pkgs.python312Packages.setuptools
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      pkgs.terminal-notifier
    ];

  languages.python.enable = true;
  languages.python.uv.enable = true;
  languages.python.uv.sync.enable = true;
  languages.python.uv.sync.allExtras = true;
  languages.python.venv.enable = true;
  languages.python.version = "3.12";

  scripts.build.exec = ''
    uv build
  '';

  scripts.format.exec = ''
    markdownlint --fix .
    pre-commit run --all-files
  '';

  scripts.test-all.exec = ''
    pytest -s -vv "$@"
  '';

  scripts.test-snapshot-update.exec = ''
    test-all --snapshot-update
  '';

  scripts.test-watch.exec = ''
    ptw .
  '';

  scripts.deps-upgrade.exec = ''
    uv \
      sync \
      --all-extras \
      --upgrade
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    test-all
  '';

  git-hooks.hooks = {
    shellcheck.enable = true;
    shellcheck.excludes = [
      ".envrc"
    ];
    typos.enable = true;
    ruff.enable = true;
    ruff-format.enable = true;
    check-toml.enable = true;
    commitizen.enable = true;
    nixfmt-rfc-style.enable = true;
    mdformat.enable = true;
    mdformat.package = pkgs.mdformat.withPlugins (
      ps: with ps; [
        mdformat-frontmatter
      ]
    );
    markdownlint.enable = true;
    trufflehog.enable = true;
  };

}
