use proc_macro::TokenStream;

#[proc_macro_derive(Clona)]
pub fn derive_clonea(input: TokenStream) -> TokenStream {
    "".parse().unwrap()
}
