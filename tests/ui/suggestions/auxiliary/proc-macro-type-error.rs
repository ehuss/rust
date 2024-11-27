#![feature(proc_macro_quote)]

use proc_macro::{quote, TokenStream};

#[proc_macro_attribute]
pub fn hello(_: TokenStream, _: TokenStream) -> TokenStream {
    quote!(
        fn f(_: &mut i32) {}
        fn g() {
            f(123);
        }
    )
}
