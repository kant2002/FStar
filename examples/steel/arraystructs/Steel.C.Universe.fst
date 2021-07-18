module Steel.C.Universe
open Steel.C.PCM
include FStar.Universe
module P = FStar.PCM

(* Raising to a greater universe *)

#push-options "--print_universes"

let raise_pcm'
  (#a: Type u#a)
  (p: pcm' a)
: Tot (pcm' (raise_t u#a u#b a))
=
  let pp = fstar_pcm'_of_pcm' p in
  pcm'_of_fstar_pcm' ({
    P.composable = (fun (x: raise_t u#a u#b a) y -> pp.P.composable (downgrade_val x) (downgrade_val y));
    P.op = (fun x y -> raise_val (pp.P.op (downgrade_val x) (downgrade_val y)));
    P.one = raise_val p.one;
  })

let raise_pcm0
  (#a: Type u#a)
  (p: pcm0 a)
: Tot (pcm0 (raise_t u#a u#b a))
= let pp = fstar_pcm_of_pcm p in
  pcm_of_fstar_pcm ({
    P.p = fstar_pcm'_of_pcm' (raise_pcm' u#a u#b p.p);
    P.comm = (fun x y -> pp.P.comm (downgrade_val x) (downgrade_val y));
    P.assoc = (fun x y z -> pp.P.assoc (downgrade_val x) (downgrade_val y) (downgrade_val z));
    P.assoc_r = (fun x y z -> pp.P.assoc_r (downgrade_val x) (downgrade_val y) (downgrade_val z));
    P.is_unit = (fun x -> pp.P.is_unit (downgrade_val x));
    P.refine = (fun x -> pp.P.refine (downgrade_val x));
  })

let raise_pcm
  (#a: Type u#a)
  (p: pcm a)
: Tot (pcm (raise_t u#a u#b a))
= let res = raise_pcm0 u#a u#b p in
  let aux1
    (x: raise_t a)
    (y: raise_t a { composable res x y })
  : Lemma
    (requires (op res x y == one res))
    (ensures (x == one res /\ y == one res))
    [SMTPat (composable res x y)]
  =
    let x' = downgrade_val x in
    let y' = downgrade_val y in
    assert (composable p x' y');
    assert (op p x' y' == downgrade_val (raise_val (one p)));
    assert (op res x y == one res)
  in
  let aux2
    (x: raise_t a)
  : Lemma
    (requires (p_refine res x))
    (ensures (exclusive res x))
    [SMTPat (p_refine res x)]
  =
    let aux
      (frame: raise_t a)
    : Lemma
      (requires (composable res x frame))
      (ensures (frame == one res))
      [SMTPat (composable res x frame)]
    =
      let x' = downgrade_val x in
      assert (p_refine p x');
      let frame' = downgrade_val frame in
      assert (composable p x' frame');
      assert (frame' == one p);
      assert (frame == raise_val frame')
    in
    ()
  in
  res

open Steel.C.Connection

let raise_pcm_morphism
  (#a: Type u#a)
  (p: pcm a)
: Tot (morphism p (raise_pcm u#a u#b p))
=
  mkmorphism
    raise_val
    ()
    (fun _ _ -> ())

let raise_pcm_morphism_inverse
  (#a: Type u#a)
  (p: pcm a)
: Tot (morphism (raise_pcm u#a u#b p) p)
=
  mkmorphism
    downgrade_val
    ()
    (fun _ _ -> ())

let raise_pcm_isomorphism
  (#a: Type u#a)
  (p: pcm a)
: Tot (isomorphism p (raise_pcm u#a u#b p))
=
  mkisomorphism
    (raise_pcm_morphism p)
    (raise_pcm_morphism_inverse p)
    ()
    ()
    (fun _ -> ())
    (fun _ -> ())
