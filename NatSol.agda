module NatSol where

data Nat : Set where
  zero : Nat
  suc : Nat → Nat

plus : Nat → Nat → Nat
plus zero n = n
plus (suc m) n = suc (plus m n)

data Nat= : Nat → Nat → Set where
  zero= : Nat= zero zero
  suc= : {m n : Nat} → Nat= m n → Nat= (suc m) (suc n)

-- reflexivity of natural equality.
refl : (n : Nat) → Nat= n n
refl zero = zero=
refl (suc e) = suc= (refl e)

-- adding zero & a natural gives the same natural.
plus-zero1 : (m : Nat) → Nat= (plus zero m) m
plus-zero1 m = refl m

-- adding a natural & zero gives the same natural.
plus-zero2 : (m : Nat) → Nat= (plus m zero) m
plus-zero2 zero = zero=
plus-zero2 (suc m) = suc= (plus-zero2 m)

-- symmetry of natural equality.
sym : {m n : Nat} → Nat= m n → Nat= n m
sym zero= = zero=
sym (suc= e) = suc= (sym e)

-- transitivity of natural equality.
trans : {l m n : Nat} → Nat= l m → Nat= m n → Nat= l n
trans zero= zero= = zero=
trans (suc= e) (suc= f) = suc= (trans e f)

-- helper function for `plus-com`.
plus-suc : (m n : Nat) → Nat= (plus m (suc n)) (suc (plus m n))
plus-suc zero n = suc= (refl n)
plus-suc (suc m) n = suc= (plus-suc m n)

-- commutativity of `plus`.
plus-com : (m n : Nat) → Nat= (plus m n) (plus n m)
plus-com m zero = plus-zero2 m
plus-com m (suc n) = trans (plus-suc m n) (suc= (plus-com m n))

