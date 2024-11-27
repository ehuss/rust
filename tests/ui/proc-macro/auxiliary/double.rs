#![feature(proc_macro_quote)]

use proc_macro::*;

// Outputs another copy of the struct.  Useful for testing the tokens
// seen by the proc_macro.
#[proc_macro_derive(Double)]
pub fn derive(input: TokenStream) -> TokenStream {
    quote!(mod foo { $input })
}
