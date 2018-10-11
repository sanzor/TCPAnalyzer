module File where 
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,head,tail,take) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe)
    import Data.List(intercalate) 
   


    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    data File=Rfile (Maybe Readme) | Dfile  Samples | Empty

    data FileData=FileData{
        header::Char,
        rawContent::Text
    }



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
         fromText txt = Readme{
                        maxClients=Prelude.head dat,
                        minClients=dat!!1,
                        stepClients=dat!!2,
                        maxDelay=dat!!3,
                        minDelay=dat!!4,
                        stepDelay=dat!!5} where
                            dat=Prelude.take 6 . readData $ txt



    instance TextEncode File where
        toText f=case f of 
               Rfile mr -> pack ("{"++ unpack (toText $ fromMaybe (Readme 0 0 1 2 3 2)  mr)++"}")
               Dfile s  -> toText  s
               Empty ->pack "Empty File"
        fromText txt =readFileData (FileData (Data.Text.head txt) (Data.Text.tail txt))   

    readFileData::FileData->File
    readFileData fd=case header fd of
            'r'->Data.Text.take 6 . readData . rawContent $ fd
            'd'->readData . rawContent $ fd
            _  ->Empty
                    
    readData::Text->[Int]
    readData =catMaybes . readDataRaw .unpack 
    
    readDataRaw::String->Maybe [Int]
    readDataRaw (x:xs)=go [] [](x:xs) where
            go _ ls []         =if length length ls > 0  then Just ls else Nothing
            go small big (x:xs)= case x of
                                  '}' -> Just (small:big) 
                                  ',' -> go [] small:big  xs 
    instance Show File where
            show =unpack.fromText              