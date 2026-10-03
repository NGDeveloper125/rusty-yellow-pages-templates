# rusty-yellow-pages-templates

Rust project templates for [Rusty Yellow Pages](https://rustyyellowpages.dev/more/templates/),
generated with [cargo-generate](https://cargo-generate.github.io/cargo-generate/).

Each directory at the root is one template: a project layout — crates, modules
and configuration — plus one worked example of whatever the template covers.
The example code is meant to be replaced.

## Using a template

cargo-generate is a separate subcommand, installed once:

```
cargo install cargo-generate
```

Then, naming the template and the project:

```
cargo generate --git https://github.com/NGDeveloper125/rusty-yellow-pages-templates cli_lib --name billing
```

Crate names are derived from the project name unless given explicitly:

```
cargo generate --git https://github.com/NGDeveloper125/rusty-yellow-pages-templates cli_lib --name shop -d cli_name=shop_console -d lib_name=shop_engine
```

Repeating the URL is avoidable with a favourite in `$CARGO_HOME/cargo-generate.toml`:

```toml
[favorites.cli_lib]
git = "https://github.com/NGDeveloper125/rusty-yellow-pages-templates"
subfolder = "cli_lib"
```

```
cargo generate cli_lib --name billing
```

## Templates

| Template | Generates |
| --- | --- |
| [`cli_lib`](cli_lib) | A workspace with a console crate and a library crate, the path dependency and the call between them already written. |
| [`wasm_lib`](wasm_lib) | A workspace with a wasm-bindgen module and the library it calls, plus a page that loads and runs it. |

Each template is documented on the site, which covers what it generates and
which settings it sets: <https://rustyyellowpages.dev/more/templates/>

## Adding a template

1. Create a directory at the root, named as the template is invoked.
2. Put the project files in it, with `{{placeholder}}` wherever a name is
   substituted. Directory and file names are substituted too.
3. Declare the placeholders in `cargo-generate.toml`. Liquid is **not** expanded
   inside a placeholder's `default`, so a default computed from the project name
   belongs in a `pre-script.rhai` hook instead.
4. Derive crate names from `crate_name`, the snake_case form of the project
   name, rather than from `project-name`, which is kebab-case. Hyphens are not
   valid in Rust identifiers.
5. Add the template's page to the site repository: an entry in `TEMPLATES` in
   `tools/sitegen/src/more.rs`, and prose in `pages/more/templates/<name>.md`.

CI needs no change — every directory containing a `cargo-generate.toml` is
generated, built, tested and linted. A crate declaring
`crate-type = ["cdylib"]` is additionally packaged with `wasm-pack` for
`wasm32-unknown-unknown`, since building a wasm crate for the host proves
nothing about wasm.

## Licence

MIT. The generated code carries no attribution requirement: a project generated
from a template here is yours.
