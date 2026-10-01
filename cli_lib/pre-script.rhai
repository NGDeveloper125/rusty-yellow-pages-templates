// Derive the two crate names from the project name unless the caller supplied
// them with `--define`. Rust identifiers cannot contain hyphens, so both are
// built from `crate_name`, which is the snake_case form of the project name.
if !variable::is_set("cli_name") {
    variable::set("cli_name", variable::get("crate_name") + "_cli");
}
if !variable::is_set("lib_name") {
    variable::set("lib_name", variable::get("crate_name") + "_lib");
}
