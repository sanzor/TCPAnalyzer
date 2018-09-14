module FileOps where 
    import qualified Data.Text as T
    import qualified Data.Text.IO as I
    import Text.Read
    import Data.Maybe
    import File

    
    instance Show File where 
        show =showFile
    
    showFile::File->String
    showFile (Rfile Nothing) ="empty readme file"
    showFile (Rfile (Just x))=show x
    showFile f =mapMaybe ( unDfile  f)

    unRfile::File->Maybe Readme
    unRfile (Rfile (Just x))=Just x
    unRfile _=Nothing
    
    unDfile::File->Samples
    unDfile (Dfile f)= f
    unDfile _=Samples[Nothing]


                
        
    
