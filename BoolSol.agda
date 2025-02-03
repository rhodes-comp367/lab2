module BoolSol where

data Bool : Set where
  false : Bool
  true : Bool

and : Bool → Bool → Bool
and false _ = false
and true x = x

data Bool= : Bool → Bool → Set where
  false= : Bool= false false
  true= : Bool= true true

-- reflexivity of boolean equality.
refl : (x : Bool) → Bool= x x
refl false = false=
refl true = true=

-- the `and` operation is associative.
and-assoc : (x y z : Bool) → Bool= (and (and x y) z) (and x (and y z))
and-assoc false _ _ = false=
and-assoc true y z = refl (and y z)

-- symmetry of boolean equality (explicit arguments).
sym-explicit : (x y : Bool) → Bool= x y → Bool= y x
sym-explicit _ _ false= = false=
sym-explicit _ _ true= = true=

-- symmetry of boolean equality (implicit arguments).
sym : {x y : Bool} → Bool= x y → Bool= y x
sym false= = false=
sym true= = true=

-- transitivity of boolean equality.
trans : {x y z : Bool} → Bool= x y → Bool= y z → Bool= x z
trans false= false= = false=
trans true= true= = true=

