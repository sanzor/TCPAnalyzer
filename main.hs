module Main where 
    import System.Directory
    import  Data.Text 
    import Data.List  as L
    import qualified Data.Text.IO as I
    
    import Control.Monad(forM,mapM,filterM)

    data Folder=Folder{
        name::String,
        files::[File]
    }deriving(Show)
    instance Show File where
        show (Rfile readme)=Prelude.map show 
                                     [maxClients readme,
                                      minClients readme,
                                      stepClients readme,
                                      maxDelay readme,
                                      minDelay readme,
                                      stepDelay readme]
    instance Show Folder where
        show folder="{ folderName:"++ (name folder)+"\r\nData:\r\n"
                                   ++ (L.intercalate  "," (Prelude.map show files) ) 
    

    dataPath="Data\\"
    outPath="out"

    main::IO [Folder]
    main=do 
        folderNames<-filterM doesDirectoryExist (listDirectory dataPath)
        let folders=Prelude.map parseFolder folderNames


        
        
    
    parseFolder::Text->IO Folder
    makeFolder folderPath=do
        fileNames<-filterM doesDirectoryExist 
    
    
    

    makeFile::Text->IO File
    makeFile fileName=do
        contents<-readFile fileName>>= splitOn "\r\n"  
        return parseFile contents 