module Folder where 
    import qualified Data.Map as Map

    mylookup::Eq a=>a->[(a,b)]->Maybe b
    mylookup _ []=Nothing
    mylookup key ((k,v):xs) | key==k = Just v
                            | otherwise = mylookup key xs
    
    