module Main where 
    import Prelude hiding(readFile,writeFile)
    import Data.Text.IO(readFile,writeFile)
    import Data.List(intercalate)
    import Data.Text(Text)
    import System.Directory(getDirectoryContents,getCurrentDirectory)
    import qualified Data.Map as Map
    import Control.Monad(forM_,forM)
    import System.Environment(getArgs)
    import Data.Map(Map,fromList,insert)

    import Tcp(TCPFile)
    import Classes(TextEncode,
                   toText,
                   fromText)
    import Utils(u,p)
    
    

    main::IO()
    main=do
        let folderPath="files"
        fileNames<- fmap filterFiles $  getFiles folderPath
        let dic=[]
        let method fname= 
                    do 
                        let pwd= pathCombine [folderPath,fname]
                        txt<-readFile pwd
                        let content=fromText txt :: TCPFile
                        Data.Map.insert (fname,content) dic
                     in mapM_ method fileNames
        mapM_ (\(k,v)->print ("k:"++show k++" v:"++show v) dic
        putStrLn "Done"
        
        

         
    parse::Text->TCPFile
    parse =fromText  
    

    pathCombine::[String]->String
    pathCombine ls="." ++ foldl (\x y-> x++"/"++y) "" ls
        
    getFiles::FilePath->IO [String]
    getFiles  = getDirectoryContents

    filterFiles::[String]->[String]
    filterFiles = filter (\x-> head x /= '.')

   
   

   

    
