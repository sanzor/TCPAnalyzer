module Main where 
    import System.Directory
    import System.IO
    import Data.Text
    import Control.Monad(forM,mapM,filterM)

    
    data File=Rfile Readme | Dfile Data
    data Readme=ReadMe{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int
    }
    data Data=Data{
        values::[Double]
    }

    dataPath="Data\\"
    main::IO()
    main=do 
        folders<-filterM isDirectory . getDirectoryContents $ dataPath
        files<-forM folders $ \folder->do
            return value
