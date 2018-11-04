module TCPFile(toText,fromText,TCPFile) where 
    import TCPEncoding
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,tail,head,filter) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe,catMaybes)
    import Data.List(intercalate) 
   
    data TCPFile=Rfile (Maybe Readme) | Dfile  Samples | Empty
    data Header=Header { ftype::Char}

    instance Show TCPFile where
        show (Rfile t)="Rfile " ++"{"++content++"}" where
            content=case t of
                Nothing->""
                Just c -> show c
        show (Dfile c)="Dfile " ++"{"++show c ++ "}"

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    data Readme=Readme{ maxClients::Int, minClients::Int,stepClients::Int,maxDelay::Int,minDelay::Int,stepDelay::Int}deriving(Show)

    data FileData=FileData{ header::Header,rawContent::Text}
    
    (>>?)::Maybe a->(a->Maybe b)->Maybe b
    (Just t) >>? f=f t
    Nothing >>? _=Nothing


    
    getHeader::TCPFile->Header
    getHeader (Rfile _ ) = Header { ftype='r'}
    getHeader (Dfile _ )= Header{ftype='d'}
    getHeader _ = Header {ftype='e'}

    instance TextEncode Samples where
        toText s=Data.Text.concat ( mapMaybe select (values s)) where
                 select mDouble=case mDouble of 
                    Just value ->Just (pack.show $ value)
                    Nothing -> Nothing
        fromText text=Samples  (map (readMaybe.unpack) textArray) where
                 textArray=splitOn (pack ",") text

    instance TextEncode Readme where
        toText r=pack $ intercalate ","  (map  show [maxClients r,minClients r,stepClients r,maxDelay  r,minDelay r,stepDelay r])
        fromText txt =let len= length dat
                          dat= case len of 
                                6 ->Prelude.take 6 .readData $ txt
                                _ ->[0,0,0,0,0,0] in 
                Readme{maxClients=Prelude.head dat,minClients=dat!!1,stepClients=dat!!2,maxDelay=dat!!3,minDelay=dat!!4,stepDelay=dat!!5} where
                            

    
    
    instance TextEncode TCPFile where
        toText f=case f of 
               Rfile mr -> pack ("{"++ unpack (toText $ fromMaybe (Readme 0 0 1 2 3 2)  mr)++"}")
               Dfile s  -> toText  s
               Empty ->pack "Empty File"
        fromText txt = case readHeader txt >>? \h -> Just (FileData h txt) of
            Nothing -> makeFile
           
            

    
    readHeader::Text->Maybe Header
    readHeader txt=case Data.Text.head txt of 
        'r' ->Just (Header{ ftype='r'})
        'd' ->Just (Header {ftype ='d'})
        _  ->Nothing
    
    

    makeFile::FileData->TCPFile
    makeFile fd= case ftype.header $ fd of
            'r'-> Rfile (Just (fromText . rawContent $ fd))
            'd'->Dfile (fromText . rawContent $ fd)
            _  -> Empty 
            
                
    readData::Text->[Int]
    readData =catMaybes . maybeValues where
        maybeValues=mvalues.split.filterText "{}"
    
    mvalues::[Text]->[Maybe Int]
    mvalues arr=map (\x->(readMaybe::String->Maybe Int).unpack $ x) arr

    split::Text->[Text]
    split =splitOn (pack ",")
    
    filterText::[Char]->Text->Text
    filterText chars tx=Data.Text.filter (\x -> not (x `elem` chars)) tx

   
    
     


    

    