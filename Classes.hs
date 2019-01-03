module Classes(TextEncode,toText,fromText) where
    import Data.Text(Text)

    class TextEncode a where
      toText::a-> Text
      fromText::Text-> a