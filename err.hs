
File.hs:53:37: error:
    * Couldn't match expected type `t1 -> t2' with actual type `T.Text'
    * The operator `(<>)' takes two arguments,
      but its type `String -> T.Text' has only one
      In the first argument of `T.splitOn', namely `(("," <>))'
      In the expression: T.splitOn (("," <>)) text
   |
53 |         let ! lines =  T.splitOn  (("," <>))  text
   |                                     ^^^^^^

File.hs:58:39: error:
    * Couldn't match expected type `t3 -> t4' with actual type `T.Text'
    * The operator `(<>)' takes two arguments,
      but its type `String -> T.Text' has only one
      In the first argument of `T.splitOn', namely `("," <>)'
      In the expression: T.splitOn ("," <>) content
   |
58 |                 let values=T.splitOn ("," <>) content   -- de ce nu merge ( "," <>) ca la (1+)
   |                                       ^^^^^^

File.hs:60:37: error:
    * Couldn't match expected type `t0 a0' with actual type `T.Text'
    * In the first argument of `length', namely `content'
      In the expression: length content
      In a stmt of a 'do' block:
        case length content of
          6 -> return (Just (Rfile readme))
          _ -> error "invalid format"
   |
60 |                 case Prelude.length content of
   |                                     ^^^^^^^

File.hs:61:47: error:
    * Couldn't match expected type `Maybe Readme'
                  with actual type `Int -> Int -> Int -> Int -> Int -> Int -> Readme'
    * Probable cause: `readme' is applied to too few arguments
      In the first argument of `Rfile', namely `readme'
      In the first argument of `Just', namely `(Rfile readme)'
      In the first argument of `return', namely `(Just (Rfile readme))'
   |
61 |                      6 -> return (Just (Rfile readme))
   |                                               ^^^^^^

File.hs:66:25: error:
    * Couldn't match expected type `[Maybe Double] -> Maybe File'
                  with actual type `Maybe ([Maybe Double] -> File)'
    * The function `Just' is applied to two arguments,
      but its type `([Maybe Double] -> File)
                    -> Maybe ([Maybe Double] -> File)'
      has only one
      In the first argument of `return', namely `(Just Dfile content)'
      In a stmt of a 'do' block: return (Just Dfile content)
   |
66 |                 return (Just Dfile  content)
   |                         ^^^^^^^^^^^^^^^^^^^
