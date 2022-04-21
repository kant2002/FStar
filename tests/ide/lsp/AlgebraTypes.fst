module AlgebraTypes
 
type binary_relation (a: Type) = a -> a -> bool
 
[@@"opaque_to_smt"]
let is_reflexive  (#a:Type) (r: binary_relation a) = forall (x:a).     x `r` x
