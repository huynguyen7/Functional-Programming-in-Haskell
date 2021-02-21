module Geometry.Cube
( cubeArea
, cubeVolume
) where

cubeArea :: Float -> Float
cubeArea x = 6*(x^2)

cubeVolume :: Float -> Float
cubeVolume x = x^3
