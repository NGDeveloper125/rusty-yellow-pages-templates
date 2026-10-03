// Derive the two crate names from the project name unless the caller supplied
// them with `--define`. Both are built from `crate_name`, the snake_case form
// of the project name, because a Rust identifier cannot contain a hyphen.
if !variable::is_set("wasm_name") {
    variable::set("wasm_name", variable::get("crate_name") + "_wasm");
}
if !variable::is_set("lib_name") {
    variable::set("lib_name", variable::get("crate_name") + "_lib");
}
