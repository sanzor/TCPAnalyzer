module Utils where
    import System.IO(FilePath)
    import Data.Text
    import  qualified Data.Text.IO(readFile,writeFile) 
    
    read::FilePath->IO Text
    read =Data.Text.IO.readFile

    write::FilePath->Text->IO ()
    write =Data.Text.IO.writeFile 

    u::Text->String
    u =Data.Text.unpack

    p::String->Text
    p=Data.Text.pack