module Tcp(toText,fromText,TCPFile) where 
    
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,tail,head,filter) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe,catMaybes)
    import Data.Text.IO(readFile)
    import Data.List(intercalate) 
    import Data.Either(isRight,fromRight)
    import Utils(u,p)
    import Parse
    import Classes(TextEncode,fromText,toText)


    sp=(p "{r,1.22,3.44,6.71,3.33,4.44,5}")
    sp1=(p "{d,1.22,5.5,6.66,7.33,9,10")


   
   
    data TCPFile=Config Settings | Payload [Numeric] | Invalid String
   
    data Settings=Settings{ maxC::Int, minC::Int,cStep::Int,maxD::Int,minD::Int,dStep::Int}deriving(Show)
    
    instance TextEncode TCPFile where
        fromText  = parse
        toText   = serialize
    
    
    instance Show TCPFile where
        show (Config settings)="{type:Config , Settings:"++show settings++" }"
        show (Payload arr)="{type:Payload, data:"++foldl (\x y->x++","++y) "" (fmap show arr)++"}"
        show  (Invalid str)=str

    

    serialize::TCPFile->Text
    serialize (Config s)=let content= intercalate "," (map show  [maxC s,minC s,cStep s,maxD s,minD s,dStep s]) in 
                             enclose $ addHeader 'r' (p content)
    serialize (Payload arr)= enclose $ addHeader 'd' ( p $ arrayToString arr)
    
    
    arrayToString::Show a=>[a]->String
    arrayToString arr =intercalate "," $ map show arr

    addHeader::Char->Text->Text
    addHeader c t=Data.Text.concat [p [c],p ",",t]

    enclose::Text->Text
    enclose t= Data.Text.concat [p "{",t, p "}"]



    parse::Text->TCPFile
    parse text=let (FileData h c) = fromText  text::FileData  in
                  if isRight h then
                     makeFile (fromRight 'r' h) c
                  else Invalid "Could not process header"

    makeFile::Char->[Numeric]->TCPFile
    makeFile  'r' ls | length ls < 6 =  Invalid "Invalid number or type of parameters" 
                     | otherwise = let vals=fmap toInt (take 6 ls) in 
                        Config Settings{maxC=Prelude.head vals,minC=vals!!1,cStep=vals!!2,maxD=vals!!3,minD=vals!!4,dStep=vals!!5 } 
    makeFile  'd' ls = Payload  ls
    makeFIle   _  _  = Invalid "Invalid header"
                                     
    
    test::IO Text
    test = do
        val<-Data.Text.IO.readFile "1.txt"
        print . textToFileData $ val
        return val
    
                  
    
    
    

    
    
     


    

    