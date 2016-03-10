
open Prims
# 36 "FStar.Parser.Dep.fst"
type map =
Prims.string FStar_Util.smap

# 38 "FStar.Parser.Dep.fst"
let check_and_strip_suffix : Prims.string  ->  Prims.string Prims.option = (fun f -> (
# 39 "FStar.Parser.Dep.fst"
let suffixes = (".fsti")::(".fst")::(".fsi")::(".fs")::[]
in (
# 40 "FStar.Parser.Dep.fst"
let matches = (FStar_List.map (fun ext -> (
# 41 "FStar.Parser.Dep.fst"
let lext = (FStar_String.length ext)
in (
# 42 "FStar.Parser.Dep.fst"
let l = (FStar_String.length f)
in if ((l > lext) && ((FStar_String.substring f (l - lext) lext) = ext)) then begin
(let _137_4 = (FStar_String.substring f 0 (l - lext))
in Some (_137_4))
end else begin
None
end))) suffixes)
in (match ((FStar_List.filter FStar_Util.is_some matches)) with
| Some (m)::_56_17 -> begin
Some (m)
end
| _56_22 -> begin
None
end))))

# 55 "FStar.Parser.Dep.fst"
let is_interface : Prims.string  ->  Prims.bool = (fun f -> ((FStar_String.get f ((FStar_String.length f) - 1)) = 'i'))

# 58 "FStar.Parser.Dep.fst"
let print_map : map  ->  Prims.unit = (fun m -> (let _137_13 = (let _137_12 = (FStar_Util.smap_keys m)
in (FStar_List.unique _137_12))
in (FStar_List.iter (fun k -> (let _137_11 = (let _137_10 = (FStar_Util.smap_try_find m k)
in (FStar_Util.must _137_10))
in (FStar_Util.print2 "%s: %s\n" k _137_11))) _137_13)))

# 64 "FStar.Parser.Dep.fst"
let lowercase_module_name : Prims.string  ->  Prims.string = (fun f -> (match ((let _137_16 = (FStar_Util.basename f)
in (check_and_strip_suffix _137_16))) with
| Some (longname) -> begin
(FStar_String.lowercase longname)
end
| None -> begin
(let _137_18 = (let _137_17 = (FStar_Util.format1 "not a valid FStar file: %s\n" f)
in FStar_Absyn_Syntax.Err (_137_17))
in (Prims.raise _137_18))
end))

# 74 "FStar.Parser.Dep.fst"
let build_map : Prims.string Prims.list  ->  map = (fun filenames -> (
# 75 "FStar.Parser.Dep.fst"
let include_directories = (FStar_Options.get_include_path ())
in (
# 76 "FStar.Parser.Dep.fst"
let include_directories = (FStar_List.map FStar_Util.normalize_file_path include_directories)
in (
# 77 "FStar.Parser.Dep.fst"
let include_directories = (FStar_List.unique include_directories)
in (
# 78 "FStar.Parser.Dep.fst"
let cwd = (let _137_21 = (FStar_Util.getcwd ())
in (FStar_Util.normalize_file_path _137_21))
in (
# 79 "FStar.Parser.Dep.fst"
let map = (FStar_Util.smap_create 41)
in (
# 80 "FStar.Parser.Dep.fst"
let _56_48 = (FStar_List.iter (fun d -> if (FStar_Util.file_exists d) then begin
(
# 82 "FStar.Parser.Dep.fst"
let files = (FStar_Util.readdir d)
in (FStar_List.iter (fun f -> (
# 84 "FStar.Parser.Dep.fst"
let f = (FStar_Util.basename f)
in (match ((check_and_strip_suffix f)) with
| Some (longname) -> begin
(
# 87 "FStar.Parser.Dep.fst"
let key = (FStar_String.lowercase longname)
in (
# 88 "FStar.Parser.Dep.fst"
let full_path = if (d = cwd) then begin
f
end else begin
(FStar_Util.join_paths d f)
end
in (match ((FStar_Util.smap_try_find map key)) with
| Some (existing_file) -> begin
if ((not ((is_interface existing_file))) || (is_interface f)) then begin
(FStar_Util.smap_add map key full_path)
end else begin
()
end
end
| None -> begin
(FStar_Util.smap_add map key full_path)
end)))
end
| None -> begin
()
end))) files))
end else begin
()
end) include_directories)
in (
# 107 "FStar.Parser.Dep.fst"
let _56_51 = (FStar_List.iter (fun f -> (let _137_25 = (lowercase_module_name f)
in (FStar_Util.smap_add map _137_25 f))) filenames)
in map))))))))

# 116 "FStar.Parser.Dep.fst"
let enter_namespace : map  ->  map  ->  Prims.string  ->  Prims.bool = (fun original_map working_map prefix -> (
# 117 "FStar.Parser.Dep.fst"
let found = (FStar_ST.alloc false)
in (
# 118 "FStar.Parser.Dep.fst"
let prefix = (Prims.strcat prefix ".")
in (
# 119 "FStar.Parser.Dep.fst"
let _56_63 = (let _137_35 = (let _137_34 = (FStar_Util.smap_keys original_map)
in (FStar_List.unique _137_34))
in (FStar_List.iter (fun k -> if (FStar_Util.starts_with k prefix) then begin
(
# 121 "FStar.Parser.Dep.fst"
let suffix = (FStar_String.substring k (FStar_String.length prefix) ((FStar_String.length k) - (FStar_String.length prefix)))
in (
# 124 "FStar.Parser.Dep.fst"
let filename = (let _137_33 = (FStar_Util.smap_try_find original_map k)
in (FStar_Util.must _137_33))
in (
# 125 "FStar.Parser.Dep.fst"
let _56_61 = (FStar_Util.smap_add working_map suffix filename)
in (FStar_ST.op_Colon_Equals found true))))
end else begin
()
end) _137_35))
in (FStar_ST.read found)))))

# 131 "FStar.Parser.Dep.fst"
let string_of_lid : FStar_Ident.lident  ->  Prims.bool  ->  Prims.string = (fun l last -> (
# 132 "FStar.Parser.Dep.fst"
let suffix = if last then begin
(l.FStar_Ident.ident.FStar_Ident.idText)::[]
end else begin
[]
end
in (
# 133 "FStar.Parser.Dep.fst"
let names = (let _137_41 = (FStar_List.map (fun x -> x.FStar_Ident.idText) l.FStar_Ident.ns)
in (FStar_List.append _137_41 suffix))
in (FStar_String.concat "." names))))

# 138 "FStar.Parser.Dep.fst"
let lowercase_join_longident : FStar_Ident.lident  ->  Prims.bool  ->  Prims.string = (fun l last -> (let _137_46 = (string_of_lid l last)
in (FStar_String.lowercase _137_46)))

# 142 "FStar.Parser.Dep.fst"
let check_module_declaration_against_filename : FStar_Ident.lident  ->  Prims.string  ->  Prims.unit = (fun lid filename -> (
# 143 "FStar.Parser.Dep.fst"
let k' = (lowercase_join_longident lid true)
in if ((let _137_53 = (let _137_52 = (let _137_51 = (FStar_Util.basename filename)
in (check_and_strip_suffix _137_51))
in (FStar_Util.must _137_52))
in (FStar_String.lowercase _137_53)) <> k') then begin
(let _137_55 = (let _137_54 = (string_of_lid lid true)
in (_137_54)::(filename)::[])
in (FStar_Util.fprint FStar_Util.stderr "Warning: the module declaration \"module %s\" found in file %s does not match its filename. Dependencies will be incorrect.\n" _137_55))
end else begin
()
end))

# 149 "FStar.Parser.Dep.fst"
exception Exit

# 149 "FStar.Parser.Dep.fst"
let is_Exit = (fun _discr_ -> (match (_discr_) with
| Exit (_) -> begin
true
end
| _ -> begin
false
end))

# 153 "FStar.Parser.Dep.fst"
let collect_one : Prims.string FStar_Util.smap  ->  Prims.string  ->  Prims.string Prims.list = (fun original_map filename -> (
# 154 "FStar.Parser.Dep.fst"
let deps = (FStar_ST.alloc [])
in (
# 155 "FStar.Parser.Dep.fst"
let add_dep = (fun d -> if (not ((let _137_64 = (FStar_ST.read deps)
in (FStar_List.existsb (fun d' -> (d' = d)) _137_64)))) then begin
(let _137_66 = (let _137_65 = (FStar_ST.read deps)
in (d)::_137_65)
in (FStar_ST.op_Colon_Equals deps _137_66))
end else begin
()
end)
in (
# 159 "FStar.Parser.Dep.fst"
let working_map = (FStar_Util.smap_copy original_map)
in (
# 161 "FStar.Parser.Dep.fst"
let record_open = (fun lid -> (
# 162 "FStar.Parser.Dep.fst"
let key = (lowercase_join_longident lid true)
in (match ((FStar_Util.smap_try_find original_map key)) with
| Some (filename) -> begin
(let _137_69 = (lowercase_module_name filename)
in (add_dep _137_69))
end
| None -> begin
(
# 167 "FStar.Parser.Dep.fst"
let r = (enter_namespace original_map working_map key)
in if (not (r)) then begin
(let _137_71 = (let _137_70 = (string_of_lid lid true)
in (_137_70)::[])
in (FStar_Util.fprint FStar_Util.stderr "Warning: no modules in namespace %s and no file with that name either\n" _137_71))
end else begin
()
end)
end)))
in (
# 176 "FStar.Parser.Dep.fst"
let auto_open = (
# 177 "FStar.Parser.Dep.fst"
let index_of = (fun s l -> (
# 178 "FStar.Parser.Dep.fst"
let found = (FStar_ST.alloc (- (1)))
in (FStar_All.try_with (fun _56_94 -> (match (()) with
| () -> begin
(
# 180 "FStar.Parser.Dep.fst"
let _56_103 = (FStar_List.iteri (fun i x -> if (s = x) then begin
(
# 182 "FStar.Parser.Dep.fst"
let _56_101 = (FStar_ST.op_Colon_Equals found i)
in (Prims.raise Exit))
end else begin
()
end) l)
in (- (1)))
end)) (fun _56_93 -> (match (_56_93) with
| Exit -> begin
(FStar_ST.read found)
end)))))
in (
# 191 "FStar.Parser.Dep.fst"
let ordered = ("fstar")::("prims")::("fstar.functionalextensionality")::("fstar.set")::("fstar.heap")::("fstar.st")::("fstar.all")::[]
in (
# 193 "FStar.Parser.Dep.fst"
let desired_opens = (FStar_Absyn_Const.fstar_ns_lid)::(FStar_Absyn_Const.prims_lid)::(FStar_Absyn_Const.st_lid)::(FStar_Absyn_Const.all_lid)::[]
in (
# 194 "FStar.Parser.Dep.fst"
let me = (let _137_82 = (let _137_81 = (let _137_80 = (FStar_Util.basename filename)
in (check_and_strip_suffix _137_80))
in (FStar_Util.must _137_81))
in (FStar_String.lowercase _137_82))
in (
# 195 "FStar.Parser.Dep.fst"
let index_or_length = (fun s l -> (
# 196 "FStar.Parser.Dep.fst"
let i = (index_of s l)
in if (i < 0) then begin
(FStar_List.length l)
end else begin
i
end))
in (
# 199 "FStar.Parser.Dep.fst"
let my_index = (index_or_length me ordered)
in (FStar_List.filter (fun lid -> ((let _137_88 = (lowercase_join_longident lid true)
in (index_or_length _137_88 ordered)) < my_index)) desired_opens)))))))
in (
# 202 "FStar.Parser.Dep.fst"
let _56_115 = (FStar_List.iter record_open auto_open)
in (
# 204 "FStar.Parser.Dep.fst"
let rec collect_fragment = (fun _56_1 -> (match (_56_1) with
| FStar_Util.Inl (file) -> begin
(collect_file file)
end
| FStar_Util.Inr (decls) -> begin
(collect_decls decls)
end))
and collect_file = (fun _56_2 -> (match (_56_2) with
| modul::[] -> begin
(collect_module modul)
end
| modules -> begin
(
# 214 "FStar.Parser.Dep.fst"
let _56_142 = (FStar_Util.fprint FStar_Util.stderr "Warning: file %s does not respect the one module per file convention\n" ((filename)::[]))
in (FStar_List.iter collect_module modules))
end))
and collect_module = (fun _56_3 -> (match (_56_3) with
| (FStar_Parser_AST.Module (lid, decls)) | (FStar_Parser_AST.Interface (lid, decls, _)) -> begin
(
# 220 "FStar.Parser.Dep.fst"
let _56_153 = (check_module_declaration_against_filename lid filename)
in (collect_decls decls))
end))
and collect_decls = (fun decls -> (FStar_List.iter (fun x -> (collect_decl x.FStar_Parser_AST.d)) decls))
and collect_decl = (fun _56_4 -> (match (_56_4) with
| FStar_Parser_AST.Open (lid) -> begin
(record_open lid)
end
| FStar_Parser_AST.ToplevelLet (_56_161, _56_163, patterms) -> begin
(FStar_List.iter (fun _56_170 -> (match (_56_170) with
| (_56_168, t) -> begin
(collect_term t)
end)) patterms)
end
| FStar_Parser_AST.KindAbbrev (_56_172, binders, t) -> begin
(
# 232 "FStar.Parser.Dep.fst"
let _56_177 = (collect_term t)
in (collect_binders binders))
end
| (FStar_Parser_AST.Main (t)) | (FStar_Parser_AST.Assume (_, _, t)) | (FStar_Parser_AST.SubEffect ({FStar_Parser_AST.msource = _; FStar_Parser_AST.mdest = _; FStar_Parser_AST.lift_op = t})) | (FStar_Parser_AST.Val (_, _, t)) -> begin
(collect_term t)
end
| FStar_Parser_AST.Tycon (_56_200, ts) -> begin
(FStar_List.iter collect_tycon ts)
end
| FStar_Parser_AST.Exception (_56_205, t) -> begin
(FStar_Util.iter_opt t collect_term)
end
| FStar_Parser_AST.NewEffect (_56_210, ed) -> begin
(collect_effect_decl ed)
end
| FStar_Parser_AST.Pragma (_56_215) -> begin
()
end))
and collect_tycon = (fun _56_5 -> (match (_56_5) with
| FStar_Parser_AST.TyconAbstract (_56_219, binders, k) -> begin
(
# 250 "FStar.Parser.Dep.fst"
let _56_224 = (collect_binders binders)
in (FStar_Util.iter_opt k collect_term))
end
| FStar_Parser_AST.TyconAbbrev (_56_227, binders, k, t) -> begin
(
# 253 "FStar.Parser.Dep.fst"
let _56_233 = (collect_binders binders)
in (
# 254 "FStar.Parser.Dep.fst"
let _56_235 = (FStar_Util.iter_opt k collect_term)
in (collect_term t)))
end
| FStar_Parser_AST.TyconRecord (_56_238, binders, k, identterms) -> begin
(
# 257 "FStar.Parser.Dep.fst"
let _56_244 = (collect_binders binders)
in (
# 258 "FStar.Parser.Dep.fst"
let _56_246 = (FStar_Util.iter_opt k collect_term)
in (FStar_List.iter (fun _56_251 -> (match (_56_251) with
| (_56_249, t) -> begin
(collect_term t)
end)) identterms)))
end
| FStar_Parser_AST.TyconVariant (_56_253, binders, k, identterms) -> begin
(
# 261 "FStar.Parser.Dep.fst"
let _56_259 = (collect_binders binders)
in (
# 262 "FStar.Parser.Dep.fst"
let _56_261 = (FStar_Util.iter_opt k collect_term)
in (FStar_List.iter (fun _56_268 -> (match (_56_268) with
| (_56_264, t, _56_267) -> begin
(FStar_Util.iter_opt t collect_term)
end)) identterms)))
end))
and collect_effect_decl = (fun _56_6 -> (match (_56_6) with
| FStar_Parser_AST.DefineEffect (_56_271, binders, t, decls) -> begin
(
# 267 "FStar.Parser.Dep.fst"
let _56_277 = (collect_binders binders)
in (
# 268 "FStar.Parser.Dep.fst"
let _56_279 = (collect_term t)
in (collect_decls decls)))
end
| FStar_Parser_AST.RedefineEffect (_56_282, binders, t) -> begin
(
# 271 "FStar.Parser.Dep.fst"
let _56_287 = (collect_binders binders)
in (collect_term t))
end))
and collect_binders = (fun binders -> (FStar_List.iter collect_binder binders))
and collect_binder = (fun _56_7 -> (match (_56_7) with
| ({FStar_Parser_AST.b = FStar_Parser_AST.Annotated (_, t); FStar_Parser_AST.brange = _; FStar_Parser_AST.blevel = _; FStar_Parser_AST.aqual = _}) | ({FStar_Parser_AST.b = FStar_Parser_AST.TAnnotated (_, t); FStar_Parser_AST.brange = _; FStar_Parser_AST.blevel = _; FStar_Parser_AST.aqual = _}) -> begin
(collect_term t)
end
| _56_315 -> begin
()
end))
and collect_term = (fun t -> (collect_term' t.FStar_Parser_AST.tm))
and collect_term' = (fun _56_8 -> (match (_56_8) with
| FStar_Parser_AST.Wild -> begin
()
end
| FStar_Parser_AST.Const (_56_320) -> begin
()
end
| FStar_Parser_AST.Op (_56_323, ts) -> begin
(FStar_List.iter collect_term ts)
end
| FStar_Parser_AST.Tvar (_56_328) -> begin
()
end
| (FStar_Parser_AST.Var (lid)) | (FStar_Parser_AST.Name (lid)) -> begin
(
# 299 "FStar.Parser.Dep.fst"
let key = (lowercase_join_longident lid false)
in (match ((FStar_Util.smap_try_find working_map key)) with
| Some (filename) -> begin
(let _137_120 = (lowercase_module_name filename)
in (add_dep _137_120))
end
| None -> begin
if (((FStar_List.length lid.FStar_Ident.ns) > 0) && ((FStar_ST.read FStar_Options.debug) <> [])) then begin
(let _137_122 = (let _137_121 = (string_of_lid lid false)
in (_137_121)::[])
in (FStar_Util.fprint FStar_Util.stderr "Warning: unbound module reference %s\n" _137_122))
end else begin
()
end
end))
end
| FStar_Parser_AST.Construct (_56_338, termimps) -> begin
(FStar_List.iter (fun _56_345 -> (match (_56_345) with
| (t, _56_344) -> begin
(collect_term t)
end)) termimps)
end
| FStar_Parser_AST.Abs (pats, t) -> begin
(
# 311 "FStar.Parser.Dep.fst"
let _56_350 = (collect_patterns pats)
in (collect_term t))
end
| FStar_Parser_AST.App (t1, t2, _56_355) -> begin
(
# 314 "FStar.Parser.Dep.fst"
let _56_358 = (collect_term t1)
in (collect_term t2))
end
| FStar_Parser_AST.Let (_56_361, patterms, t) -> begin
(
# 317 "FStar.Parser.Dep.fst"
let _56_370 = (FStar_List.iter (fun _56_369 -> (match (_56_369) with
| (_56_367, t) -> begin
(collect_term t)
end)) patterms)
in (collect_term t))
end
| FStar_Parser_AST.Seq (t1, t2) -> begin
(
# 320 "FStar.Parser.Dep.fst"
let _56_376 = (collect_term t1)
in (collect_term t2))
end
| FStar_Parser_AST.If (t1, t2, t3) -> begin
(
# 323 "FStar.Parser.Dep.fst"
let _56_383 = (collect_term t1)
in (
# 324 "FStar.Parser.Dep.fst"
let _56_385 = (collect_term t2)
in (collect_term t3)))
end
| (FStar_Parser_AST.Match (t, bs)) | (FStar_Parser_AST.TryWith (t, bs)) -> begin
(
# 328 "FStar.Parser.Dep.fst"
let _56_393 = (collect_term t)
in (collect_branches bs))
end
| FStar_Parser_AST.Ascribed (t1, t2) -> begin
(
# 331 "FStar.Parser.Dep.fst"
let _56_399 = (collect_term t1)
in (collect_term t2))
end
| FStar_Parser_AST.Record (t, idterms) -> begin
(FStar_Util.iter_opt t collect_term)
end
| FStar_Parser_AST.Project (t, _56_407) -> begin
(collect_term t)
end
| (FStar_Parser_AST.Product (binders, t)) | (FStar_Parser_AST.Sum (binders, t)) -> begin
(
# 339 "FStar.Parser.Dep.fst"
let _56_416 = (collect_binders binders)
in (collect_term t))
end
| (FStar_Parser_AST.QForall (binders, ts, t)) | (FStar_Parser_AST.QExists (binders, ts, t)) -> begin
(
# 343 "FStar.Parser.Dep.fst"
let _56_425 = (collect_binders binders)
in (
# 344 "FStar.Parser.Dep.fst"
let _56_427 = (FStar_List.iter (FStar_List.iter collect_term) ts)
in (collect_term t)))
end
| FStar_Parser_AST.Refine (binder, t) -> begin
(
# 347 "FStar.Parser.Dep.fst"
let _56_433 = (collect_binder binder)
in (collect_term t))
end
| FStar_Parser_AST.NamedTyp (_56_436, t) -> begin
(collect_term t)
end
| FStar_Parser_AST.Paren (t) -> begin
(collect_term t)
end
| (FStar_Parser_AST.Requires (t, _)) | (FStar_Parser_AST.Ensures (t, _)) | (FStar_Parser_AST.Labeled (t, _, _)) -> begin
(collect_term t)
end))
and collect_patterns = (fun ps -> (FStar_List.iter collect_pattern ps))
and collect_pattern = (fun p -> (collect_pattern' p.FStar_Parser_AST.pat))
and collect_pattern' = (fun _56_9 -> (match (_56_9) with
| FStar_Parser_AST.PatWild -> begin
()
end
| FStar_Parser_AST.PatConst (_56_462) -> begin
()
end
| FStar_Parser_AST.PatApp (p, ps) -> begin
(
# 370 "FStar.Parser.Dep.fst"
let _56_468 = (collect_pattern p)
in (collect_patterns ps))
end
| (FStar_Parser_AST.PatVar (_)) | (FStar_Parser_AST.PatName (_)) | (FStar_Parser_AST.PatTvar (_)) -> begin
()
end
| (FStar_Parser_AST.PatList (ps)) | (FStar_Parser_AST.PatOr (ps)) | (FStar_Parser_AST.PatTuple (ps, _)) -> begin
(collect_patterns ps)
end
| FStar_Parser_AST.PatRecord (lidpats) -> begin
(FStar_List.iter (fun _56_491 -> (match (_56_491) with
| (_56_489, p) -> begin
(collect_pattern p)
end)) lidpats)
end
| FStar_Parser_AST.PatAscribed (p, t) -> begin
(
# 383 "FStar.Parser.Dep.fst"
let _56_496 = (collect_pattern p)
in (collect_term t))
end))
and collect_branches = (fun bs -> (FStar_List.iter collect_branch bs))
and collect_branch = (fun _56_502 -> (match (_56_502) with
| (pat, t1, t2) -> begin
(
# 391 "FStar.Parser.Dep.fst"
let _56_503 = (collect_pattern pat)
in (
# 392 "FStar.Parser.Dep.fst"
let _56_505 = (FStar_Util.iter_opt t1 collect_term)
in (collect_term t2)))
end))
in (
# 396 "FStar.Parser.Dep.fst"
let ast = (FStar_Parser_Driver.parse_file filename)
in (
# 397 "FStar.Parser.Dep.fst"
let _56_508 = (collect_file ast)
in (FStar_ST.read deps)))))))))))

# 400 "FStar.Parser.Dep.fst"
type color =
| White
| Gray
| Black

# 400 "FStar.Parser.Dep.fst"
let is_White = (fun _discr_ -> (match (_discr_) with
| White (_) -> begin
true
end
| _ -> begin
false
end))

# 400 "FStar.Parser.Dep.fst"
let is_Gray = (fun _discr_ -> (match (_discr_) with
| Gray (_) -> begin
true
end
| _ -> begin
false
end))

# 400 "FStar.Parser.Dep.fst"
let is_Black = (fun _discr_ -> (match (_discr_) with
| Black (_) -> begin
true
end
| _ -> begin
false
end))

# 403 "FStar.Parser.Dep.fst"
let collect : Prims.string Prims.list  ->  ((Prims.string * Prims.string Prims.list) Prims.list * Prims.string Prims.list) = (fun filenames -> (
# 406 "FStar.Parser.Dep.fst"
let graph = (FStar_Util.smap_create 41)
in (
# 411 "FStar.Parser.Dep.fst"
let m = (build_map filenames)
in (
# 414 "FStar.Parser.Dep.fst"
let rec discover_one = (fun key -> if ((FStar_Util.smap_try_find graph key) = None) then begin
(
# 416 "FStar.Parser.Dep.fst"
let filename = (let _137_138 = (FStar_Util.smap_try_find m key)
in (FStar_Util.must _137_138))
in (
# 417 "FStar.Parser.Dep.fst"
let deps = (collect_one m filename)
in (
# 418 "FStar.Parser.Dep.fst"
let _56_517 = (FStar_Util.smap_add graph key (deps, White))
in (FStar_List.iter discover_one deps))))
end else begin
()
end)
in (
# 421 "FStar.Parser.Dep.fst"
let _56_519 = (let _137_139 = (FStar_List.map lowercase_module_name filenames)
in (FStar_List.iter discover_one _137_139))
in (
# 424 "FStar.Parser.Dep.fst"
let print_graph = (fun _56_522 -> (match (()) with
| () -> begin
(let _137_148 = (let _137_147 = (FStar_Util.smap_keys graph)
in (FStar_List.unique _137_147))
in (FStar_List.iter (fun k -> (let _137_146 = (let _137_145 = (let _137_144 = (let _137_143 = (FStar_Util.smap_try_find graph k)
in (FStar_Util.must _137_143))
in (Prims.fst _137_144))
in (FStar_String.concat " " _137_145))
in (FStar_Util.print2 "%s: %s\n" k _137_146))) _137_148))
end))
in (
# 430 "FStar.Parser.Dep.fst"
let topologically_sorted = (FStar_ST.alloc [])
in (
# 433 "FStar.Parser.Dep.fst"
let rec discover = (fun key -> (
# 434 "FStar.Parser.Dep.fst"
let _56_529 = (let _137_151 = (FStar_Util.smap_try_find graph key)
in (FStar_Util.must _137_151))
in (match (_56_529) with
| (direct_deps, color) -> begin
(match (color) with
| Gray -> begin
(
# 437 "FStar.Parser.Dep.fst"
let _56_531 = (FStar_Util.print1 "Warning: recursive dependency on module %s\n" key)
in (
# 438 "FStar.Parser.Dep.fst"
let _56_533 = (FStar_Util.print_string "Here\'s the (non-transitive) dependency graph:\n")
in (
# 439 "FStar.Parser.Dep.fst"
let _56_535 = (print_graph ())
in (
# 440 "FStar.Parser.Dep.fst"
let _56_537 = (FStar_Util.print_string "\n")
in (FStar_All.exit 1)))))
end
| Black -> begin
direct_deps
end
| White -> begin
(
# 448 "FStar.Parser.Dep.fst"
let _56_541 = (FStar_Util.smap_add graph key (direct_deps, Gray))
in (
# 449 "FStar.Parser.Dep.fst"
let all_deps = (let _137_155 = (let _137_154 = (FStar_List.map (fun dep -> (let _137_153 = (discover dep)
in (dep)::_137_153)) direct_deps)
in (FStar_List.flatten _137_154))
in (FStar_List.unique _137_155))
in (
# 453 "FStar.Parser.Dep.fst"
let _56_545 = (FStar_Util.smap_add graph key (all_deps, Black))
in (
# 455 "FStar.Parser.Dep.fst"
let _56_547 = (let _137_157 = (let _137_156 = (FStar_ST.read topologically_sorted)
in (key)::_137_156)
in (FStar_ST.op_Colon_Equals topologically_sorted _137_157))
in all_deps))))
end)
end)))
in (
# 460 "FStar.Parser.Dep.fst"
let must_find = (fun k -> (let _137_160 = (FStar_Util.smap_try_find m k)
in (FStar_Util.must _137_160)))
in (
# 463 "FStar.Parser.Dep.fst"
let by_target = (let _137_165 = (FStar_Util.smap_keys graph)
in (FStar_List.map (fun k -> (
# 464 "FStar.Parser.Dep.fst"
let deps = (let _137_162 = (discover k)
in (FStar_List.rev _137_162))
in (let _137_164 = (must_find k)
in (let _137_163 = (FStar_List.map must_find deps)
in (_137_164, _137_163))))) _137_165))
in (
# 467 "FStar.Parser.Dep.fst"
let topologically_sorted = (let _137_166 = (FStar_ST.read topologically_sorted)
in (FStar_List.map must_find _137_166))
in (by_target, topologically_sorted))))))))))))

# 474 "FStar.Parser.Dep.fst"
let print_make : (Prims.string * Prims.string Prims.list) Prims.list  ->  Prims.unit = (fun deps -> (FStar_List.iter (fun _56_558 -> (match (_56_558) with
| (f, deps) -> begin
(
# 476 "FStar.Parser.Dep.fst"
let deps = (FStar_List.map (fun s -> (FStar_Util.replace_string s " " "\\ ")) deps)
in (FStar_Util.print2 "%s: %s\n" f (FStar_String.concat " " deps)))
end)) deps))

# 480 "FStar.Parser.Dep.fst"
let print_nubuild : Prims.string Prims.list  ->  Prims.unit = (fun l -> (FStar_List.iter FStar_Util.print_endline (FStar_List.rev l)))

# 483 "FStar.Parser.Dep.fst"
let print : ((Prims.string * Prims.string Prims.list) Prims.list * Prims.string Prims.list)  ->  Prims.unit = (fun deps -> (match ((FStar_ST.read FStar_Options.dep)) with
| Some ("nubuild") -> begin
(print_nubuild (Prims.snd deps))
end
| Some ("make") -> begin
(print_make (Prims.fst deps))
end
| Some (_56_568) -> begin
(Prims.raise (FStar_Absyn_Syntax.Err ("unknown tool for --dep\n")))
end
| None -> begin
()
end))




