# rbx-reflection-database

Inside this repository are two copies of Rojo's reflection database. These are utilized by Rojo and tools which use Rojo's parsing library (Lune, mostly) to gain information about classes and their properties. Most notably, this includes the data type of properties as well as their defaults.

An outdated reflection database can cause many problems. To that end, it's desirable to be able to load it from a remote source rather than bundling it. This repository serves a source of truth for those downloads. It is separate from the rbx-dom repo because tags will be made for every update to the database, and that would ruin rbx-dom. It is also not officially part of Rojo (yet!).

## Fetching

This repository is tagged with a GUID every time a database is committed. A release is made that's named after the Roblox version that it corresponds to as well.

The intention is that this repo will be targeted using [JSDelivr]. To that end, please use the tagged version to avoid getting a cached version!

- https://cdn.jsdelivr.net/gh/USER/rbx-reflection-database@HASH/database.msgpack
- https://cdn.jsdelivr.net/gh/USER/rbx-reflection-database@HASH/database.json

[JSDelivr]: https://github.com/jsdelivr/jsdelivr

## Generating a new database

The process of generating a new database is currently manual. Here's a step by step guide. You will need [Cargo] installed for this.

1. Download [`rbx-dom`][rbx-dom]
2. Run `cargo run -p rbx_reflector -- generate --patches patches PATH_TO_THIS_REPO/database.msgpack PATH_TO_THIS_REPO/database.json`
   Replace `PATH_TO_THIS_REPO` with the path to this repository
3. Wait for Studio to open and when it does, close any popups and save the file
4. Studio should automatically close and `rbx-reflector` should write both a JSON and MSGPACK database.

[Cargo]: https://doc.rust-lang.org/cargo/getting-started/installation.html
[rbx-dom]: https://github.com/rojo-rbx/rbx-dom
