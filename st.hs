if Prelude.length lines ==1 then 
    do
        content<-parseRfile lines
        return (Just (Rfile   content)) 
    
else
    do
        content<-parseDfile lines
        return  (Just (Dfile content ))