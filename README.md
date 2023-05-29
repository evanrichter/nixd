<div align="center">
  <h1>nixd</code></h1>

  <p>
    <strong>Nix language server</strong>
  </p>
</div>

## About

This is a Nix language server that directly uses (i.e., is linked with) the official Nix library (https://github.com/NixOS/nix).

Some notable features provided by linking with the Nix library include:

- Diagnostics and evaluation that produce identical results as the real Nix command.
- Shared eval caches (flake, file) with your system's Nix.
- Native support for cross-file analysis.
- Precise Nix language support. We do not maintain "yet another parser & evaluator".
- Support for built-ins, including Nix plugins.


## Features Preview

Handle evaluations exactly same as nix evaluator:


![infinte-recursion](docs/9ed5e08a-e439-4b09-ba78-d83dc0a8a03f.png)

Support *all* builtins:

![eval-builtin-json](docs/59655838-36a8-4145-9717-f2009e0efef9.png)

And diagnostic:

![eval-builtin-diagnostic](docs/f6e10994-41e4-4a03-84a2-ef275fb402fd.png)

Evaluation `nixpkgs`

![eval-nixpkgs](docs/abe2fafc-d139-4741-89af-53339312a1af.png)

Print internal AST Node type, and evalution result just as same as `nix repl`:

![eval-ast](docs/c7e8a8c7-5c0e-4736-868f-1e2c345468fd.png)

Complete dynamic envs, like `with` expression:

![complete-with](docs/ae629b9f-95cb-48df-aa1d-4f5f94c3c06a.png)


## Installation

### Build the project

This project is working in progress, and does not vendored dedicated derivation yet.
However, if you'd like to help us improve this work, please enter the devShell, and build this project via meson.

Here are a short snippet used in our CI, should works fine and reproducible in your environment.

```
meson setup build/ --buildtype=${{ matrix.buildtype }} -Db_sanitize=${{ matrix.sanitizer }} -Db_ndebug=${{ matrix.ndebug }}
meson compile -C build
meson test -C build
```

### Editors

We do not provide a custom editor extension or plugins now, configuring nixd like other nix lsp should work out of box.
