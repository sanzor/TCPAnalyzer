module TCP(toText,fromText,TCPFile) where 
    import DataParse
    import Text.Read(readMaybe)
    import Data.Text(splitOn,Text,concat,pack,unpack,tail,head,filter) 
    import Data.Maybe(Maybe,mapMaybe,fromMaybe,catMaybes)
    import Data.List(intercalate) 
    import Data.Either(isRight,fromRight)

   
    data TCPFile=Rfile Readme | Dfile [Numeric] | Invalid String
   
    data Readme=Readme{ maxC::Int, minC::Int,cStep::Int,maxD::Int,minD::Int,dStep::Int}deriving(Show)
   
    class TextEncode a where
        toText::a-> Text
        fromText::Text-> a
    
    instance TextEncode TCPFile where
        fromText  = parse

        toText f=undefined

    parse::Text->TCPFile
    parse text=let (FileData h c)=textToFileData text in
                  if isRight h then
                     makeFile (fromRight 'r' h) c
                  else Invalid "Could not process header"

    makeFile::Char->[Numeric]->TCPFile
    makeFile  'r' ls= if length ls !=6  then  Invalid "Invalid number or type of parameters" 
                      else let  vals= fmap either id (round) in
                                Rfile Readme{maxC=Prelude.head vals,minC=vals!!1,cStep=vals!!2,maxD=vals!!3,minD=vals!!4,dStep=vals!!5 }                        
    makeFile  'd' x = Dfile . map (fromIntegral x)
    makeFile   h  _ =Invalid "Invalid header :"++[h]

    
                  
    
    
    

    
    
     


    

    