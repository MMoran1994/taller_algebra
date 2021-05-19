module RSA where
import Catedra
import Aritmetica


--(5)
claves :: Integer -> Integer -> (Integer, Integer, Integer)
claves p q = (e, d, n)
  where n   = p * q
        e   = coprimoCon phi
        d   = inversoMultiplicativo e phi
        phi = (p - 1) * (q - 1)

--(6)
codificador :: Clpub -> Mensaje -> Cifrado
codificador (_, _) []  = []
codificador (e, n) x = auxCod (e, n) (aEnteros x)
{-
La función traduce todo el mensaje a ASCII y
se lo entrega a auxCod
-}

auxCod :: Clpub -> [Integer] -> Cifrado
auxCod (e, n) []     = []
auxCod (e, n) (x:xs)  
   | sonCoprimos     = (modExp x e n) : (auxCod (e, n) xs)
   | otherwise       = - x : (auxCod (e, n) xs)
      where sonCoprimos = g == 1
            (g, (_, _)) = mcdExt x n
{-
Se encarga de codificar según el protocolo RSA
al mensaje chequeando si cada carácter traducido
es coprimo con la clave pública
-}
--(7)
decodificador :: Clpri -> Cifrado -> Mensaje
decodificador (_, _) []     = []
decodificador (d, n) (x:xs) = aChars (auxDecod (d, n) (x:xs))

auxDecod :: (Integer, Integer) -> [Integer] -> [Integer]
auxDecod (_, _) []     = []
auxDecod (d, n) (x:xs)
   | x >= 0    = (modExp x d n) : (auxDecod (d, n) xs)
   | otherwise = - x : (auxDecod (d, n) xs)
{-
Hace lo mismo que el codificador pero a la inversa
-}
