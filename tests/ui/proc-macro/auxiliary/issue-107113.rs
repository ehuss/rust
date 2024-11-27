use proc_macro::TokenStream;

#[proc_macro_attribute]
pub fn main(_: TokenStream, item: TokenStream) -> TokenStream {
    "fn main() -> std::io::Result<()> { () } ".parse().unwrap()
}
