
FileOps.hs:15:17: error:
    * Couldn't match type `[a0] -> [b0]' with `[Char]'
      Expected type: String
        Actual type: [a0] -> [b0]
    * Probable cause: `mapMaybe' is applied to too few arguments
      In the expression: mapMaybe (unDfile f)
      In an equation for `showFile': showFile f = mapMaybe (unDfile f)
   |
15 |     showFile f =mapMaybe ( unDfile  f)
   |                 ^^^^^^^^^^^^^^^^^^^^^^

FileOps.hs:15:28: error:
    * Couldn't match expected type `a0 -> Maybe b0'
                  with actual type `[Double]'
    * Possible cause: `unDfile' is applied to too many arguments
      In the first argument of `mapMaybe', namely `(unDfile f)'
      In the expression: mapMaybe (unDfile f)
      In an equation for `showFile': showFile f = mapMaybe (unDfile f)
   |
15 |     showFile f =mapMaybe ( unDfile  f)
   |                            ^^^^^^^^^^

FileOps.hs:20:23: error:
    * Couldn't match expected type `[Double]'
                  with actual type `Samples'
    * In the expression: f
      In an equation for `unDfile': unDfile (Dfile f) = f
   |
20 |     unDfile (Dfile f)=f
   |                       ^
