module Crack where
import Catedra
import Aritmetica
import RSA


--(8)
romper :: Clpub -> Clpri
romper (e, n) = (inversoMultiplicativo e phi, n)
    where phi = (p - 1) * (q - 1)
          p = fst (factorizarProductoDe2Primos n)
          q = snd (factorizarProductoDe2Primos n)

factorizarProductoDe2Primos :: Integer -> (Integer, Integer)
factorizarProductoDe2Primos n = auxFactorizar n (criba (div n 2))

auxFactorizar :: Integer -> [Integer] -> (Integer, Integer)
auxFactorizar n (x:xs)
    | n `esDivisible` x = (x, n `div` x)
    | otherwise         = auxFactorizar n xs
      where esDivisible :: Integer -> Integer -> Bool
            esDivisible n k = mod n k == 0
{-
Asumimos que n es producto de dos primos. Programamos, entonces, una
funciòn que toma a "n" y la compara con el primer primo de la criba.
Si este divide a "n" me duelve el elemento y el que se obtiene de la
divisiòn como par ordenado. Si no lo divide, prueba con el siguiente
elemento de la criba. Luego podemos calcular phi y por ende el valor
de "d".
-}

--(9)
espia :: Clpub -> Cifrado -> Mensaje
espia (_, _) [] = []
espia (e, n) xs = decodificador (clavePr) xs
    where clavePr = romper (e, n)
{-
Obtiene la clave privada con la función romper
y con ella decodifica el mensaje 
-} 
