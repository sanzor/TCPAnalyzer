module File where 
    
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,head,tail) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe)
    import Data.List(intercalate) 

    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    data File=Rfile (Maybe Readme) | Dfile  Samples
    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    class TextEncode  a where
        toText::a->Text
        fromText::Text->a

    instance TextEncode Samples where
        toText s=Data.Text.concat ( mapMaybe select (values s)) where
             select mDouble=case mDouble of 
                Just value ->Just (pack.show $ value)
                Nothing -> Nothing
        fromText text=Samples  (map (readMaybe.unpack) (splitOn (pack ",") text))
    
    instance TextEncode Readme where
        toText r=pack $ intercalate ","  (map  show [maxClients r,minClients r,stepClients r,maxDelay  r,minDelay r,stepDelay r])
    instance TextEncode File where
       toText f=case f of 
         (Rfile mr) ->undefined
         (Dfile s)  ->undefined
       fromText tx= case Data.Text.head  tx of
         'r' ->undefined
         'd' ->undefined
        
   
    parseText::Text->Maybe [Double]
    parseText (x:xs)=go [] [](x:xs) where
        go _ ls []=if length ls == 6 then Just ls else Nothing
        go small big (x:xs)=case x of
                              ',' ->go []  ((read::Text->Double). unpack small):big xs


    instance Show File where
        show =unpack.fromText 
