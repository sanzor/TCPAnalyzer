module Funct where 
    (>>?)::Maybe a->(a->Maybe b)->Maybe b
    (Just a) >>? f=f a
    Nothing >>? _ =Nothing


    f1::Int->Maybe Bool
    f1 a=if a >2 then Just (a `div` 2==0 )  else Nothing

    f2::Bool ->  Char
    f2 b=if b then 'a' else 'b'

    f3::Char ->Maybe Int
    f3 c=if c=='a' then Just 1 else Nothing
    
    fm::Int->Maybe Int
    fm x= f1 x >>? (Just . f2 ) >>? f3