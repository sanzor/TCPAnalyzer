module MISC where 
    
    txt::String->Text
    txt =Data.Text.pack
    str::Text->String
    str =Data.Text.unpack 

    class Printer a where
    see::IO a->a
    wrap::a->IO a
    check::(a->b)->(a->b->IO b)

    instance Printer Text where
    check =
