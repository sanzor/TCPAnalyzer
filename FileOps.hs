module FileOps where 
    import qualified Data.Text as T
    import qualified Data.Text.IO as I
    import Text.Read
    import Data.Maybe
    import Data.List(intercalate)
    import File

    instance Show File where 
        show =showFile
    
    showFile::File->String
    showFile (Rfile Nothing) ="empty readme file"
    showFile (Rfile (Just x))=show x
    showFile (Dfile (Samples ls))=intercalate ","  [show el| Just el <-ls]

    
    unRfile::File->Maybe Readme
    unRfile (Rfile (Just x))=Just x
    unRfile _=Nothing
    
    unDfile::File->Samples
    unDfile (Dfile samples)= samples
    unDfile _=Samples[Nothing]


                
        
    
