module Aritmetica where
import Catedra
import Data.Tuple
import Data.Bits


--(1)
mcdExt :: Integer -> Integer -> (Integer, (Integer, Integer))
mcdExt a 0 = (a, (1, 0))
mcdExt a b = (g, (s, t))
  where s = t1
        t = s1 - t1 * q
        q = div a b
        (g, (s1, t1)) = mcdExt b r
        r = mod a b

--(2)
criba :: Integer -> Set Integer
criba 2 = []
criba n = pasosCriba [2..n - 1] n

pasosCriba :: Set Integer -> Integer -> Set Integer
pasosCriba (x:xs) n
  | x ^ 2 > n = (x:xs)
  | otherwise = x : pasosCriba (cribaAux (x : xs)) n
{-
vamos formando la lista con el primero elemento, que siempre va a ser 2,
y hacemos un "tachado" en la lista de los múltiplos del primero elemento,
que siempre va a ser un primo. Se repite este procedimiento hasta que se 
alcance la condición de la criba.
-}

cribaAux :: Set Integer -> Set Integer
cribaAux [x] = []
cribaAux (x:xs)
  | esDivisible = cribaAux (x : tail xs)
  | otherwise = head xs : cribaAux (x : tail xs)
    where esDivisible = mod (head xs) x == 0
{-
La función siempre se queda con el primer elemento de la lista y va
eliminando el segundo.
En el caso base siempre queda únicamente el numero primo contra el que
checkeamos en una lista, por lo tanto lo descartamos.
-}

--(3)
coprimoCon :: Integer -> Integer
coprimoCon n = auxCoprimoCon n (n - 2)

auxCoprimoCon :: Integer -> Integer -> Integer
auxCoprimoCon n m
  | sonCoprimos = m
  | otherwise = auxCoprimoCon n (m - 1)
    where sonCoprimos = g == 1
          (g, (_, _)) = mcdExt n m
{-
Elige siempre el primer coprimo menor a n - 2 
calculando el mcd entre n y los sucesivos números menores a n - 2 
hasta encontrar el primero 
-}

--(4)
inversoMultiplicativo :: Integer -> Integer -> Integer
inversoMultiplicativo n m
  | s < 0 = normalizar m s
  | otherwise = s
    where (_, (s, _)) = mcdExt n m
          normalizar a b
            | b < 0 = normalizar a (b + a)
            | otherwise = b
{-
La función mcdExt devuelve en la primer coordenada
siempre un inverso multiplicativo de a módulo m
La función auxiliar normalizar devuelve siempre el inverso positivo
ya que la coordenada puede ser negativa
-} 

-- Función de regalo para exponenciar "rápido"
modExp :: Integer -> Integer -> Integer -> Integer
modExp b 0 m = 1
modExp b e m = t * modExp ((b * b) `mod` m) (shiftR e 1) m `mod` m
  where t = if testBit e 0 then b `mod` m else 1
