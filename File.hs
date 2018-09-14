module File where 


    data File=Rfile (Maybe Readme) | Dfile  Samples
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)