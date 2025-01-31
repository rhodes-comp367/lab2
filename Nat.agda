module Nat where

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
refl = ?

-- adding zero & a natural gives the same natural.
plus-zero1 : (m : Nat) → Nat= (plus zero m) m
plus-zero1 = ?

-- adding a natural & zero gives the same natural.
plus-zero2 : (m : Nat) → Nat= (plus m zero) m
plus-zero2 = ?

