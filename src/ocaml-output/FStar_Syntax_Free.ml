open Prims
type free_vars_and_fvars =
  (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
let new_uv_set:
  Prims.unit ->
    (FStar_Syntax_Syntax.uvar*
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax) FStar_Util.set
  =
  fun uu____6  ->
    FStar_Util.new_set
      (fun uu____11  ->
         fun uu____12  ->
           match (uu____11, uu____12) with
           | ((x,uu____30),(y,uu____32)) ->
               let uu____49 = FStar_Syntax_Unionfind.uvar_id x in
               let uu____50 = FStar_Syntax_Unionfind.uvar_id y in
               uu____49 - uu____50)
      (fun uu____51  ->
         match uu____51 with
         | (x,uu____57) -> FStar_Syntax_Unionfind.uvar_id x)
let new_universe_uvar_set:
  Prims.unit -> FStar_Syntax_Syntax.universe_uvar FStar_Util.set =
  fun uu____65  ->
    FStar_Util.new_set
      (fun x  ->
         fun y  ->
           let uu____69 = FStar_Syntax_Unionfind.univ_uvar_id x in
           let uu____70 = FStar_Syntax_Unionfind.univ_uvar_id y in
           uu____69 - uu____70)
      (fun x  -> FStar_Syntax_Unionfind.univ_uvar_id x)
let no_uvs: FStar_Syntax_Syntax.uvars = new_uv_set ()
let no_universe_uvars: FStar_Syntax_Syntax.universe_uvar FStar_Util.set =
  new_universe_uvar_set ()
let no_free_vars:
  (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set) =
  let uu____76 = FStar_Syntax_Syntax.new_fv_set () in
  ({
     FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names;
     FStar_Syntax_Syntax.free_uvars = no_uvs;
     FStar_Syntax_Syntax.free_univs = no_universe_uvars;
     FStar_Syntax_Syntax.free_univ_names =
       FStar_Syntax_Syntax.no_universe_names
   }, uu____76)
let singleton_fvar:
  FStar_Syntax_Syntax.fv ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun fv  ->
    let uu____87 =
      let uu____89 = FStar_Syntax_Syntax.new_fv_set () in
      FStar_Util.set_add
        (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v uu____89 in
    ({
       FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names;
       FStar_Syntax_Syntax.free_uvars = no_uvs;
       FStar_Syntax_Syntax.free_univs = no_universe_uvars;
       FStar_Syntax_Syntax.free_univ_names =
         FStar_Syntax_Syntax.no_universe_names
     }, uu____87)
let singleton_bv:
  FStar_Syntax_Syntax.bv ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun x  ->
    let uu____100 =
      let uu____101 =
        let uu____103 = FStar_Syntax_Syntax.new_bv_set () in
        FStar_Util.set_add x uu____103 in
      {
        FStar_Syntax_Syntax.free_names = uu____101;
        FStar_Syntax_Syntax.free_uvars = no_uvs;
        FStar_Syntax_Syntax.free_univs = no_universe_uvars;
        FStar_Syntax_Syntax.free_univ_names =
          FStar_Syntax_Syntax.no_universe_names
      } in
    let uu____107 = FStar_Syntax_Syntax.new_fv_set () in
    (uu____100, uu____107)
let singleton_uv:
  (((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax option FStar_Unionfind.p_uvar*
    FStar_Syntax_Syntax.version)*
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax) ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun x  ->
    let uu____136 =
      let uu____137 =
        let uu____149 = new_uv_set () in FStar_Util.set_add x uu____149 in
      {
        FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names;
        FStar_Syntax_Syntax.free_uvars = uu____137;
        FStar_Syntax_Syntax.free_univs = no_universe_uvars;
        FStar_Syntax_Syntax.free_univ_names =
          FStar_Syntax_Syntax.no_universe_names
      } in
    let uu____173 = FStar_Syntax_Syntax.new_fv_set () in
    (uu____136, uu____173)
let singleton_univ:
  FStar_Syntax_Syntax.universe_uvar ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun x  ->
    let uu____182 =
      let uu____183 =
        let uu____185 = new_universe_uvar_set () in
        FStar_Util.set_add x uu____185 in
      {
        FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names;
        FStar_Syntax_Syntax.free_uvars = no_uvs;
        FStar_Syntax_Syntax.free_univs = uu____183;
        FStar_Syntax_Syntax.free_univ_names =
          FStar_Syntax_Syntax.no_universe_names
      } in
    let uu____189 = FStar_Syntax_Syntax.new_fv_set () in
    (uu____182, uu____189)
let singleton_univ_name:
  FStar_Syntax_Syntax.univ_name ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun x  ->
    let uu____198 =
      let uu____199 =
        let uu____201 = FStar_Syntax_Syntax.new_universe_names_fifo_set () in
        FStar_Util.fifo_set_add x uu____201 in
      {
        FStar_Syntax_Syntax.free_names = FStar_Syntax_Syntax.no_names;
        FStar_Syntax_Syntax.free_uvars = no_uvs;
        FStar_Syntax_Syntax.free_univs = no_universe_uvars;
        FStar_Syntax_Syntax.free_univ_names = uu____199
      } in
    let uu____209 = FStar_Syntax_Syntax.new_fv_set () in
    (uu____198, uu____209)
let union f1 f2 =
  let uu____239 =
    let uu____240 =
      FStar_Util.set_union (fst f1).FStar_Syntax_Syntax.free_names
        (fst f2).FStar_Syntax_Syntax.free_names in
    let uu____244 =
      FStar_Util.set_union (fst f1).FStar_Syntax_Syntax.free_uvars
        (fst f2).FStar_Syntax_Syntax.free_uvars in
    let uu____268 =
      FStar_Util.set_union (fst f1).FStar_Syntax_Syntax.free_univs
        (fst f2).FStar_Syntax_Syntax.free_univs in
    let uu____272 =
      FStar_Util.fifo_set_union (fst f1).FStar_Syntax_Syntax.free_univ_names
        (fst f2).FStar_Syntax_Syntax.free_univ_names in
    {
      FStar_Syntax_Syntax.free_names = uu____240;
      FStar_Syntax_Syntax.free_uvars = uu____244;
      FStar_Syntax_Syntax.free_univs = uu____268;
      FStar_Syntax_Syntax.free_univ_names = uu____272
    } in
  let uu____283 = FStar_Util.set_union (snd f1) (snd f2) in
  (uu____239, uu____283)
let rec free_univs:
  FStar_Syntax_Syntax.universe ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun u  ->
    let uu____294 = FStar_Syntax_Subst.compress_univ u in
    match uu____294 with
    | FStar_Syntax_Syntax.U_zero  -> no_free_vars
    | FStar_Syntax_Syntax.U_bvar uu____298 -> no_free_vars
    | FStar_Syntax_Syntax.U_unknown  -> no_free_vars
    | FStar_Syntax_Syntax.U_name uname -> singleton_univ_name uname
    | FStar_Syntax_Syntax.U_succ u1 -> free_univs u1
    | FStar_Syntax_Syntax.U_max us ->
        FStar_List.fold_left
          (fun out  ->
             fun x  -> let uu____311 = free_univs x in union out uu____311)
          no_free_vars us
    | FStar_Syntax_Syntax.U_unif u1 -> singleton_univ u1
let rec free_names_and_uvs':
  FStar_Syntax_Syntax.term -> Prims.bool -> free_vars_and_fvars =
  fun tm  ->
    fun use_cache  ->
      let aux_binders bs from_body =
        let from_binders =
          FStar_All.pipe_right bs
            (FStar_List.fold_left
               (fun n1  ->
                  fun uu____412  ->
                    match uu____412 with
                    | (x,uu____422) ->
                        let uu____423 =
                          free_names_and_uvars x.FStar_Syntax_Syntax.sort
                            use_cache in
                        union n1 uu____423) no_free_vars) in
        union from_binders from_body in
      let t = FStar_Syntax_Subst.compress tm in
      match t.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_delayed uu____428 -> failwith "Impossible"
      | FStar_Syntax_Syntax.Tm_name x -> singleton_bv x
      | FStar_Syntax_Syntax.Tm_uvar (x,t1) -> singleton_uv (x, t1)
      | FStar_Syntax_Syntax.Tm_type u -> free_univs u
      | FStar_Syntax_Syntax.Tm_bvar uu____477 -> no_free_vars
      | FStar_Syntax_Syntax.Tm_fvar fv -> singleton_fvar fv
      | FStar_Syntax_Syntax.Tm_constant uu____479 -> no_free_vars
      | FStar_Syntax_Syntax.Tm_unknown  -> no_free_vars
      | FStar_Syntax_Syntax.Tm_uinst (t1,us) ->
          let f = free_names_and_uvars t1 use_cache in
          FStar_List.fold_left
            (fun out  ->
               fun u  -> let uu____498 = free_univs u in union out uu____498)
            f us
      | FStar_Syntax_Syntax.Tm_abs (bs,t1,uu____504) ->
          let uu____527 = free_names_and_uvars t1 use_cache in
          aux_binders bs uu____527
      | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
          let uu____543 = free_names_and_uvars_comp c use_cache in
          aux_binders bs uu____543
      | FStar_Syntax_Syntax.Tm_refine (bv,t1) ->
          let uu____553 = free_names_and_uvars t1 use_cache in
          aux_binders [(bv, None)] uu____553
      | FStar_Syntax_Syntax.Tm_app (t1,args) ->
          let uu____580 = free_names_and_uvars t1 use_cache in
          free_names_and_uvars_args args uu____580 use_cache
      | FStar_Syntax_Syntax.Tm_match (t1,pats) ->
          let uu____610 =
            let uu____626 = free_names_and_uvars t1 use_cache in
            FStar_List.fold_left
              (fun n1  ->
                 fun uu____642  ->
                   match uu____642 with
                   | (p,wopt,t2) ->
                       let n11 =
                         match wopt with
                         | None  -> no_free_vars
                         | Some w -> free_names_and_uvars w use_cache in
                       let n2 = free_names_and_uvars t2 use_cache in
                       let n3 =
                         let uu____692 = FStar_Syntax_Syntax.pat_bvs p in
                         FStar_All.pipe_right uu____692
                           (FStar_List.fold_left
                              (fun n3  ->
                                 fun x  ->
                                   let uu____706 =
                                     free_names_and_uvars
                                       x.FStar_Syntax_Syntax.sort use_cache in
                                   union n3 uu____706) n1) in
                       let uu____710 = union n11 n2 in union n3 uu____710)
              uu____626 in
          FStar_All.pipe_right pats uu____610
      | FStar_Syntax_Syntax.Tm_ascribed (t1,asc,uu____729) ->
          let u1 = free_names_and_uvars t1 use_cache in
          let u2 =
            match fst asc with
            | FStar_Util.Inl t2 -> free_names_and_uvars t2 use_cache
            | FStar_Util.Inr c2 -> free_names_and_uvars_comp c2 use_cache in
          (match snd asc with
           | None  -> union u1 u2
           | Some tac ->
               let uu____808 = union u1 u2 in
               let uu____812 = free_names_and_uvars tac use_cache in
               union uu____808 uu____812)
      | FStar_Syntax_Syntax.Tm_let (lbs,t1) ->
          let uu____828 =
            let uu____835 = free_names_and_uvars t1 use_cache in
            FStar_List.fold_left
              (fun n1  ->
                 fun lb  ->
                   let uu____847 =
                     let uu____851 =
                       free_names_and_uvars lb.FStar_Syntax_Syntax.lbtyp
                         use_cache in
                     let uu____855 =
                       free_names_and_uvars lb.FStar_Syntax_Syntax.lbdef
                         use_cache in
                     union uu____851 uu____855 in
                   union n1 uu____847) uu____835 in
          FStar_All.pipe_right (snd lbs) uu____828
      | FStar_Syntax_Syntax.Tm_meta
          (t1,FStar_Syntax_Syntax.Meta_pattern args) ->
          let uu____876 = free_names_and_uvars t1 use_cache in
          FStar_List.fold_right
            (fun a  -> fun acc  -> free_names_and_uvars_args a acc use_cache)
            args uu____876
      | FStar_Syntax_Syntax.Tm_meta
          (t1,FStar_Syntax_Syntax.Meta_monadic (uu____899,t')) ->
          let uu____909 = free_names_and_uvars t1 use_cache in
          let uu____913 = free_names_and_uvars t' use_cache in
          union uu____909 uu____913
      | FStar_Syntax_Syntax.Tm_meta (t1,uu____918) ->
          free_names_and_uvars t1 use_cache
and free_names_and_uvars:
  (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax ->
    Prims.bool ->
      (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun t  ->
    fun use_cache  ->
      let t1 = FStar_Syntax_Subst.compress t in
      let uu____928 = FStar_ST.read t1.FStar_Syntax_Syntax.vars in
      match uu____928 with
      | Some n1 when
          let uu____937 = should_invalidate_cache n1 use_cache in
          Prims.op_Negation uu____937 ->
          let uu____938 = FStar_Syntax_Syntax.new_fv_set () in
          (n1, uu____938)
      | uu____941 ->
          (FStar_ST.write t1.FStar_Syntax_Syntax.vars None;
           (let n1 = free_names_and_uvs' t1 use_cache in
            FStar_ST.write t1.FStar_Syntax_Syntax.vars (Some (fst n1)); n1))
and free_names_and_uvars_args:
  ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
    FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set) ->
      Prims.bool ->
        (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun args  ->
    fun acc  ->
      fun use_cache  ->
        FStar_All.pipe_right args
          (FStar_List.fold_left
             (fun n1  ->
                fun uu____980  ->
                  match uu____980 with
                  | (x,uu____992) ->
                      let uu____997 = free_names_and_uvars x use_cache in
                      union n1 uu____997) acc)
and free_names_and_uvars_binders:
  FStar_Syntax_Syntax.binders ->
    (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set) ->
      Prims.bool ->
        (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun bs  ->
    fun acc  ->
      fun use_cache  ->
        FStar_All.pipe_right bs
          (FStar_List.fold_left
             (fun n1  ->
                fun uu____1016  ->
                  match uu____1016 with
                  | (x,uu____1026) ->
                      let uu____1027 =
                        free_names_and_uvars x.FStar_Syntax_Syntax.sort
                          use_cache in
                      union n1 uu____1027) acc)
and free_names_and_uvars_comp:
  (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
    Prims.bool ->
      (FStar_Syntax_Syntax.free_vars* FStar_Ident.lident FStar_Util.set)
  =
  fun c  ->
    fun use_cache  ->
      let uu____1035 = FStar_ST.read c.FStar_Syntax_Syntax.vars in
      match uu____1035 with
      | Some n1 ->
          let uu____1044 = should_invalidate_cache n1 use_cache in
          if uu____1044
          then
            (FStar_ST.write c.FStar_Syntax_Syntax.vars None;
             free_names_and_uvars_comp c use_cache)
          else
            (let uu____1053 = FStar_Syntax_Syntax.new_fv_set () in
             (n1, uu____1053))
      | uu____1056 ->
          let n1 =
            match c.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.GTotal (t,None ) ->
                free_names_and_uvars t use_cache
            | FStar_Syntax_Syntax.Total (t,None ) ->
                free_names_and_uvars t use_cache
            | FStar_Syntax_Syntax.GTotal (t,Some u) ->
                let uu____1084 = free_univs u in
                let uu____1088 = free_names_and_uvars t use_cache in
                union uu____1084 uu____1088
            | FStar_Syntax_Syntax.Total (t,Some u) ->
                let uu____1099 = free_univs u in
                let uu____1103 = free_names_and_uvars t use_cache in
                union uu____1099 uu____1103
            | FStar_Syntax_Syntax.Comp ct ->
                let us =
                  let uu____1109 =
                    free_names_and_uvars ct.FStar_Syntax_Syntax.result_typ
                      use_cache in
                  free_names_and_uvars_args
                    ct.FStar_Syntax_Syntax.effect_args uu____1109 use_cache in
                FStar_List.fold_left
                  (fun us1  ->
                     fun u  ->
                       let uu____1121 = free_univs u in union us1 uu____1121)
                  us ct.FStar_Syntax_Syntax.comp_univs in
          (FStar_ST.write c.FStar_Syntax_Syntax.vars (Some (fst n1)); n1)
and should_invalidate_cache:
  FStar_Syntax_Syntax.free_vars -> Prims.bool -> Prims.bool =
  fun n1  ->
    fun use_cache  ->
      (Prims.op_Negation use_cache) ||
        ((let uu____1132 =
            FStar_All.pipe_right n1.FStar_Syntax_Syntax.free_uvars
              FStar_Util.set_elements in
          FStar_All.pipe_right uu____1132
            (FStar_Util.for_some
               (fun uu____1191  ->
                  match uu____1191 with
                  | (u,uu____1197) ->
                      let uu____1202 = FStar_Syntax_Unionfind.find u in
                      (match uu____1202 with
                       | Some uu____1204 -> true
                       | uu____1205 -> false))))
           ||
           (let uu____1207 =
              FStar_All.pipe_right n1.FStar_Syntax_Syntax.free_univs
                FStar_Util.set_elements in
            FStar_All.pipe_right uu____1207
              (FStar_Util.for_some
                 (fun u  ->
                    let uu____1213 = FStar_Syntax_Unionfind.univ_find u in
                    match uu____1213 with
                    | Some uu____1215 -> true
                    | None  -> false))))
let names: FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.bv FStar_Util.set
  =
  fun t  ->
    let uu____1220 =
      let uu____1221 = free_names_and_uvars t true in fst uu____1221 in
    uu____1220.FStar_Syntax_Syntax.free_names
let uvars:
  FStar_Syntax_Syntax.term ->
    (((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax option FStar_Unionfind.p_uvar*
      FStar_Syntax_Syntax.version)*
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax) FStar_Util.set
  =
  fun t  ->
    let uu____1232 =
      let uu____1233 = free_names_and_uvars t true in fst uu____1233 in
    uu____1232.FStar_Syntax_Syntax.free_uvars
let univs:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set
  =
  fun t  ->
    let uu____1242 =
      let uu____1243 = free_names_and_uvars t true in fst uu____1243 in
    uu____1242.FStar_Syntax_Syntax.free_univs
let univnames:
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.univ_name FStar_Util.fifo_set
  =
  fun t  ->
    let uu____1252 =
      let uu____1253 = free_names_and_uvars t true in fst uu____1253 in
    uu____1252.FStar_Syntax_Syntax.free_univ_names
let fvars: FStar_Syntax_Syntax.term -> FStar_Ident.lident FStar_Util.set =
  fun t  -> let uu____1263 = free_names_and_uvars t false in snd uu____1263
let names_of_binders:
  FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.bv FStar_Util.set =
  fun bs  ->
    let uu____1272 =
      let uu____1273 = free_names_and_uvars_binders bs no_free_vars true in
      fst uu____1273 in
    uu____1272.FStar_Syntax_Syntax.free_names