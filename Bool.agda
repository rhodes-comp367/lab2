module Bool where

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
refl = ?

-- the `and` operation is associative.
and-assoc : (x y z : Bool) → Bool= (and (and x y) z) (and x (and y z))
and-assoc = ?

-- symmetry of boolean equality (explicit arguments).
sym-explicit : (x y : Bool) → Bool= x y → Bool= y x
sym-explicit = ?

-- symmetry of boolean equality (implicit arguments).
sym : {x y : Bool} → Bool= x y → Bool= y x
sym = ?

-- transitivity of boolean equality.
trans : {x y z : Bool} → Bool= x y → Bool= y z → Bool= x z
trans = ?

