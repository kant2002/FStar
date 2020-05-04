module Steel.PCM.FractionalPermission

open FStar.Real
open Steel.PCM

#set-options "--fuel 0 --ifuel 1"

[@erasable]
noeq type perm : Type u#a =
  | MkPerm: v:real{v >=. 0.0R} -> perm

let perm_one : perm = MkPerm 1.0R

let perm_zero : perm = MkPerm 0.0R

let readable (p: perm) : GTot bool =
  MkPerm?.v p >. 0.0R

let writeable (p: perm) : GTot bool =
  MkPerm?.v p = 1.0R

let half_perm (p: perm) : GTot (perm) =
  MkPerm ((MkPerm?.v p) /. two)

let sum_perm (p1 p2: perm u#a) : GTot (perm u#a) =
  MkPerm (MkPerm?.v p1 +.  MkPerm?.v p2)

let lesser_equal_perm (p1 p2:perm u#a) : GTot bool =
  MkPerm?.v p1 <=.  MkPerm?.v p2

noeq type with_perm (a: Type u#a) = {
  value: a;
  perm: perm
}

let composable_with_perm' (#a: Type u#a) (x y: with_perm a) : prop =
  x.value == y.value /\
  lesser_equal_perm (sum_perm x.perm y.perm) perm_one

let composable_with_perm (#a: Type u#a) : symrel (with_perm a) =
  fun (x y: with_perm a) -> composable_with_perm' x y


let compose_with_perm
  (#a: Type u#a)
  (x: with_perm a)
  (y: with_perm a{x `composable_with_perm ` y}) =
  {
   value = x.value;
   perm = sum_perm x.perm y.perm
  }

let frac_perm_pcm' (#a: Type u#a) (def: a) : pcm' (with_perm a) = {
  composable = composable_with_perm;
  op = compose_with_perm;
  one = { value = def; perm = perm_zero }
}

let frac_perm_pcm (#a: Type u#a) (def: a) : pcm (with_perm a) = {
  p = frac_perm_pcm' def;
  comm = (fun _ _ -> admit());
  assoc = (fun _ _ _ -> admit());
  assoc_r = (fun _ _ _ -> admit());
  is_unit = (fun _ -> admit())
}