module DataParse where 
    import Prelude hiding(head,tail)
    import Data.Text(head,tail,init,pack,unpack,Text,splitOn)
    import Data.Either
    import Text.Read(readEither)
    import Data.List(intercalate)

    data Numeric=I Int | D Double deriving Show

    data FileData=FileData{ header::Either String Char,content::[Numeric]}

    instance Show FileData where
        show (FileData h c)="FileData:{ header: "++ he++", content:"++co where
            he=either id (:[]) h
            co=intercalate "," (fmap show c)

    textToFileData::Text->FileData
    textToFileData tx=let h=readHead . head $ tx
                          c=rights $ fmap readNumeric (toList . tail $ tx) 
                      in FileData h c
    
    u::Text->String
    u =Data.Text.unpack

    p::String->Text
    p=Data.Text.pack
    
   
    
    readHead::Char->Either String Char
    readHead ch=case ch of 
        'r' ->Right 'r'
        'd' ->Right 'd'
        _  -> Left "Invalid character"
    
    
    toList::Text->[Text]
    toList =splitOn (p ",") . Data.Text.tail . Data.Text.init 
    

    

    readNumeric::Text->Either String Numeric
    readNumeric text=let str=u text in
                      if '.' `elem` str then 
                        fmap D (readEither str::Either String Double)
                      else
                        fmap I (readEither str::Either String Int)
   

                