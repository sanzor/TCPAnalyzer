module TCPEncoding where 
    import Data.Text
    class TextEncode  a where
        toText::a->Text
        fromText::Text->a