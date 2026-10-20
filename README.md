# axum-server-kotlin in Kotlin

[![GitHub link](https://img.shields.io/badge/GitHub-KotlinMania%2Faxum-server-kotlin-blue.svg)](https://github.com/KotlinMania/axum-server-kotlin)
[![Maven Central](https://img.shields.io/maven-central/v/io.github.kotlinmania/axum-server-kotlin)](https://central.sonatype.com/artifact/io.github.kotlinmania/axum-server-kotlin)
[![Build status](https://img.shields.io/github/actions/workflow/status/KotlinMania/axum-server-kotlin/ci.yml?branch=main)](https://github.com/KotlinMania/axum-server-kotlin/actions)

This is a Kotlin Multiplatform line-by-line transliteration port of [`programatik29/axum-server`](https://github.com/programatik29/axum-server) (crate `axum-server`).

**Original Project:** This port is based on [`programatik29/axum-server`](https://github.com/programatik29/axum-server). All design credit and project intent belong to the upstream authors; this repository is a faithful port to Kotlin Multiplatform with no behavioural changes intended.

### Porting status

This is an **in-progress port**. The goal is feature parity with the upstream Rust crate while providing a native Kotlin Multiplatform API. Every Kotlin file carries a `// port-lint: source <path>` header naming its upstream Rust counterpart so the AST-distance tool can track provenance.

---

## Upstream README — `programatik29/axum-server`

> The text below is reproduced from [`https://github.com/programatik29/axum-server`](https://github.com/programatik29/axum-server). It is the upstream project's own description and remains under the upstream authors' authorship; links have been rewritten to absolute upstream URLs where appropriate so they continue to resolve from this repository.

[![License](https://img.shields.io/crates/l/axum-server)](https://choosealicense.com/licenses/mit/)
[![Crates.io](https://img.shields.io/crates/v/axum-server)](https://crates.io/crates/axum-server)
[![Docs](https://img.shields.io/crates/v/axum-server?color=blue&label=docs)](https://docs.rs/axum-server/)

# axum-server

axum-server is a [hyper] server implementation designed to be used with [axum] framework.

This project is maintained by community independently from [axum].

## Features

- HTTP/1 and HTTP/2
- HTTPS through [rustls].
- High performance through [hyper].
- Using [tower] make service API.
- Very good [axum] compatibility. Likely to work with future [axum] releases.

## Usage Example

A simple hello world application can be served like:

```rust
use axum::{routing::get, Router};
use std::net::SocketAddr;

#[tokio::main]
async fn main() {
    let app = Router::new().route("/", get(|| async { "Hello, world!" }));

    let addr = SocketAddr::from(([127, 0, 0, 1], 3000));
    println!("listening on {}", addr);
    axum_server::bind(addr)
        .serve(app.into_make_service())
        .await
        .unwrap();
}
```

You can find more examples [here](/examples).

## Minimum Supported Rust Version

axum-server's MSRV is `1.82`.

## Safety

This crate uses `#![forbid(unsafe_code)]` to ensure everything is implemented in 100% safe Rust.

## License

This project is licensed under the [MIT license](LICENSE).

[axum]: https://crates.io/crates/axum
[hyper]: https://crates.io/crates/hyper
[rustls]: https://crates.io/crates/rustls
[tower]: https://crates.io/crates/tower

---

## About this Kotlin port

### Installation

```kotlin
dependencies {
    implementation("io.github.kotlinmania:axum-server-kotlin:0.1.2")
}
```

### Building

```bash
./gradlew build
./gradlew test
```

### Targets

- macOS arm64
- Linux x64
- Windows mingw-x64
- iOS arm64 / simulator-arm64 (Swift export + XCFramework)
- JS (browser + Node.js)
- Wasm-JS (browser + Node.js)
- Android (API 24+)

### Porting guidelines

See [AGENTS.md](AGENTS.md) and [CLAUDE.md](CLAUDE.md) for translator discipline, port-lint header convention, and Rust → Kotlin idiom mapping.

### License

This Kotlin port is distributed under the same license terms as the upstream [`programatik29/axum-server`](https://github.com/programatik29/axum-server). See [LICENSE](LICENSE) (and any sibling `LICENSE-*` / `NOTICE` files mirrored from upstream) for the full text.

Original work copyrighted by the axum-server authors.  
Kotlin port: Copyright (c) 2026 Sydney Renee and The Solace Project.

### Acknowledgments

Thanks to the [`programatik29/axum-server`](https://github.com/programatik29/axum-server) maintainers and contributors for the original Rust implementation. This port reproduces their work in Kotlin Multiplatform; bug reports about upstream design or behavior should go to the upstream repository.
