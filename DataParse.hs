module DataParse where 
    import Prelude hiding(head,tail)
    import Data.Text(head,tail,init,pack,unpack,Text,splitOn)
    import Data.Either
    import Text.Read(readEither)
    import Data.List(intercalate)

   

    data FileData=FileData{ header::Either String Char,content::[Int]}

    instance Show FileData where
        show (FileData h c)="header:"++ (show (fromRight 'a' h))++", content:"++ intercalate "," (map show c) where
           
    
    


    fileData::Text->Either String FileData
    fileData tx=let h=readHead . head $ tx
                    c=rights $ fmap readInt (toList . tail $ tx) 
                in Right (FileData h c)
    
    u::Text->String
    u =Data.Text.unpack

    p::String->Text
    p=Data.Text.pack

    up::Text->Char
    up t=u t!!0
    
    pu::Char->Text
    pu c=p [c]
    
    readHead::Char->Either String Char
    readHead ch=case ch of 
        'r' ->Right 'r'
        'd' ->Right 'd'
        _  -> Left "Invalid character"
    
    
    toList::Text->[Text]
    toList =splitOn (p ",") . Data.Text.tail . Data.Text.init 

    readInt::Text->Either String Int
    readInt =(readEither::String->Either String Int).unpack 
   

                
   
    
    