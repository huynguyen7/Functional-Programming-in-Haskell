module Geometry.Sphere
( sphereArea
, sphereVolume
) where 

sphereArea :: Float -> Float
sphereArea r = 4*pi*(r^2)

sphereVolume :: Float -> Float
sphereVolume r = (4.0/3.0)*pi*(r^3)
