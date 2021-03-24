---
layout: default
title:  Mengenal tipe data struct di Rust
date:   2021-03-25
parent: rust
---

`Struct` with method

```rust
struct Cat {
    name: String
}

impl Cat {
    fn get_name(&self) -> Self {
        Self {
            name: self.name.to_string()
        }
    } 
}

fn main() {
    let cat = Cat { name: String::from("Empush") };
    println!("{}", cat.get_name().name) // Empush
}
```

---

Implement `Default` to define default value in `Struct`.

```rust
struct Cat {
    name: String
}

impl Default for Cat {
    fn default() -> Self {
        Self {
            name: "Empush".to_string()
        }
    }
}

fn main() {
    let cat = Cat::default();
    println!("{}", cat.name) // "Empush"
}
```

Implement `Display` to define default display in `Struct`.

```rust
use std::fmt::{Display, Formatter, Result as FormatterResult};

struct Cat {
    name: String
}

impl Default for Cat {
    fn default() -> Self {
        Self {
            name: "Empush".to_string()
        }
    }
}

impl Display for Cat {
    fn fmt(&self, f: &mut Formatter<'_>) -> FormatterResult {
        write!(f, "{}", self.name)
    }
}

fn main() {
    println!("{}", Cat::default()) // Empush
}
```

---

`Struct` with `trait` combine with `Display`

```rust
use std::fmt::{Display, Formatter, Result as FormatterResult};

trait Animal {
   fn set_name(name: &'static str) -> Self;
   fn get_name(&self) -> Self;
}

struct Cat {
    name: String
}

impl Animal for Cat {
    fn set_name(name: &'static str) -> Self {
        Self {
            name: name.to_string()
        }
    }

    fn get_name(&self) -> Self {
        Self {
            name: self.name.to_string()
        }
    }
}

impl Display for Cat {
    fn fmt(&self, f: &mut Formatter<'_>) -> FormatterResult {
        write!(f, "{}", self.name)
    }
}

fn main() {
    let cat = Cat::set_name("Miau");
    println!("{}", cat.get_name()) // Miau
}
```
