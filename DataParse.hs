module DataParse where 
    import Prelude hiding (span,tail,head,init)
    import Data.Text(head,tail,init,pack,unpack,Text,splitOn,span,index)
    import Data.Either
    import Text.Read(readEither)
    import Data.List(intercalate)
    import Utils(u,p)

    data Numeric=I Int | D Double 
    instance Show Numeric where
        show (I x)=show x
        show (D y)=show y

    instance Num Numeric where
        (+) (I a) (I b) =I (a+b)
        (+) (D a) (I b) =D (a+ fromIntegral b)
        (+) (I a) (D b)=D (fromIntegral a+b)
        (-) (D a) (I b)= D (a- fromIntegral b)
        (-) (I a) (D b)=D(fromIntegral a -b)
    
    toInt::Numeric->Int
    toInt (I x)=x
    toInt (D x)= round x
    toDouble::Numeric->Double
    toDouble (D x)=x
    toDouble (I x)=fromIntegral x


    data FileData=FileData{ header::Either String Char,content::[Numeric]}

    instance Show FileData where
        show (FileData h c)="FileData:{ header: "++ he++", content:"++co++"}" where
            he=either id (:[]) h
            co=intercalate "," (fmap show c)

    textToFileData::Text->FileData
    textToFileData tx=let   (g,payload)=span (/='{') tx
                            vals=rights $ fmap  readNumeric  (toList payload) in
                            FileData (readHead payload) vals 
                  
                 
    readHead::Text->Either String Char
    readHead tx=case index tx 1 of 
        'r' ->Right 'r'
        'd' ->Right 'd'
        _  -> Left "Invalid character"
    
    
    toList::Text->[Text]
    toList =splitOn (p ",") . tail . init 
    

    

    readNumeric::Text->Either String Numeric
    readNumeric text=let str=u text in
                      if '.' `elem` str then 
                        fmap D (readEither str::Either String Double)
                      else
                        fmap I (readEither str::Either String Int)
   

                