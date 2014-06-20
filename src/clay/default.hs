{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment

import qualified Data.Text.Lazy.IO as TXT

import Prelude hiding (div, span)
import Clay

main :: IO ()
main =
  do args <- getArgs
     case args of
       "compact" : _
          -> TXT.putStr (renderWith compact [] theStylesheet)
       _  -> putCss theStylesheet

theStylesheet :: Css
theStylesheet = do -- Overall site-wide styling rules.

    body ? do color         "#333"
              margin        0 auto 0 auto
              width         $   pct 80
              fontSize      $   px 16
              fontFamily    ["Helvetica Neue Light", "Helvetica Neue", "Helvetica"] [sansSerif]
              fontWeight    $   weight 300
              lineHeight    $   em 1.5

    div # "#header" ? do marginBottom    $  px 44
                         marginTop       $  px 44
                         height          $  px 45
                         "#navigation"   ?
                            do height (px 45)
                               a ? do color         $ black
                                      fontSize      $ px 18
                                      fontWeight    $ bold
                                      marginLeft    $ px 12
                                      textDecoration none
                                      textTransform  uppercase

    div # "#footer" ? do color      "#555"
                         fontSize   $ px 12
                         marginTop  $ px 30
                         padding    12 0 12 0
                         textAlign  $ alignSide sideRight

    div # "#logo" ? do
        a ? do float           $ floatLeft
               fontSize        $ px 32
               fontWeight      $ bold
               textDecoration  $ none
               color           "#E82A37"
               height          $ px 30
               
               transitionProperty "color"
               transitionDuration $ sec 0.5
               transitionTimingFunction linear
               
        a # hover ? color "#F33088"
        
    div # ".info" ? do color    $ rgb 170 170 170
                       fontSize $ px 14
        
    h1 ? fontSize (px 20)
    h2 ? fontSize (px 15)
    
    a ? do color            "#0881B3"
           textDecoration   none

    a # hover   ? textDecoration underline
    a # visited ? color "#0881B3"
    
    ".recent-posts" ? li ? do listStyleType none
                              color "#aaa"

    ".band" ? do height     $ px 5
                 width      $ pct 100
                 backgroundColor "#E82A37"
                 position absolute
                 left   $ px 0
                 top    $ px 0

    ".twitter" ? do marginLeft auto
                    width $ px 56

    hr ? do margin 60 0 7 0
            borderWidth 0
            borderTop solid (px 1) "#eeeeee"
            borderBottom solid (px 1) "#ffffff"
            
    "#content" ? ul ? paddingLeft 0