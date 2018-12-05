module TCP(toText,fromText,TCPFile) where 
    import DataParse
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,tail,head,filter) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe,catMaybes)
    import Data.List(intercalate) 
    
   
    data TCPFile=Rfile (Maybe Readme) | Dfile  Samples | Empty

   
    class TextEncode a where
        toText::a-> Text
        fromText::Text-> a

    instance Show TCPFile where
        show (Rfile t)="Rfile " ++"{"++content++"}" where
            content=case t of
                Nothing->""
                Just c -> show c
        show (Dfile c)="Dfile " ++"{"++show c ++ "}"

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    data Readme=Readme{ maxClients::Int, minClients::Int,stepClients::Int,maxDelay::Int,minDelay::Int,stepDelay::Int}deriving(Show)
    
    (>>?)::Maybe a->(a->Maybe b)->Maybe b
    (Just t) >>? f=f t
    Nothing >>? _=Nothing


    instance TextEncode Samples where
        toText s=Data.Text.concat ( mapMaybe select (values s)) where
                 select mDouble=case mDouble of 
                    Just value ->Just (pack.show $ value)
                    Nothing -> Nothing


        fromText text=Samples  (map (readMaybe.unpack) cols) where
                 cols=splitOn (pack ",") text
                 
    instance TextEncode Readme where
        toText r=pack $ intercalate ","  (map  show [maxClients r,minClients r,stepClients r,maxDelay  r,minDelay r,stepDelay r])
        fromText txt =let len= length txt
                          dat= case len of 
                                6 ->Prelude.take 6 .readData $ txt
                                _ ->[0,0,0,0,0,0] in 
                Readme{maxClients=Prelude.head dat,minClients=dat!!1,stepClients=dat!!2,maxDelay=dat!!3,minDelay=dat!!4,stepDelay=dat!!5} 
                            
                     
    
    
    instance TextEncode TCPFile where
        toText f=case f of 
               Rfile mr -> pack ("{"++ unpack (toText $ fromMaybe (Readme 0 0 1 2 3 2)  mr)++"}")
               Dfile s  -> toText  s
               Empty ->pack "Empty File"
        fromText  = textToFile
            
            
           
    textToFile::Text->TCPFile
    textToFile input=fromMaybe Empty (header input >>? (\h -> Just (FileData h input)) >>?  makeFile)
        

    makeFile::FileData->Maybe TCPFile
    makeFile fd= case ftype.header $ fd of
            'r'->Just (Rfile (Just (fromText . rawContent $ fd)))
            'd'->Just (Dfile (fromText . rawContent $ fd))
            _  ->Nothing 
    
    
    

    
    
     


    

    