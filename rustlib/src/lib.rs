#[no_mangle]
pub extern "C" fn add(left: usize, right: usize) -> usize {
    left + right
}

#[repr(C)]
pub struct ComplexStruct {
    index: i8,
    enabled: bool,
}

#[no_mangle]
pub extern "C" fn hello() -> ComplexStruct {
    let r = ComplexStruct {
        index: 1,
        enabled: true,
    };
    println!("Returning index={}, enabled={}", r.index, r.enabled);
    return r;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
