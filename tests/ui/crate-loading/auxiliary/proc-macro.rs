#![crate_name = "reproduction"]

use proc_macro::TokenStream;

#[proc_macro]
pub fn mac(input: TokenStream) -> TokenStream {
    input
}
