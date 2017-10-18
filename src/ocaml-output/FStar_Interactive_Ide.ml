
open Prims
open FStar_Pervasives
exception ExitREPL of (Prims.int)


let uu___is_ExitREPL : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ExitREPL (uu____8) -> begin
true
end
| uu____9 -> begin
false
end))


let __proj__ExitREPL__item__uu___ : Prims.exn  ->  Prims.int = (fun projectee -> (match (projectee) with
| ExitREPL (uu____17) -> begin
uu____17
end))


let push : FStar_TypeChecker_Env.env  ->  Prims.string  ->  FStar_TypeChecker_Env.env = (fun env msg -> (

let res = (FStar_Universal.push_context env msg)
in ((FStar_Options.push ());
res;
)))


let pop : FStar_TypeChecker_Env.env  ->  Prims.string  ->  Prims.unit = (fun env msg -> ((FStar_Universal.pop_context env msg);
(FStar_Options.pop ());
))

type push_kind =
| SyntaxCheck
| LaxCheck
| FullCheck


let uu___is_SyntaxCheck : push_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| SyntaxCheck -> begin
true
end
| uu____41 -> begin
false
end))


let uu___is_LaxCheck : push_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LaxCheck -> begin
true
end
| uu____46 -> begin
false
end))


let uu___is_FullCheck : push_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| FullCheck -> begin
true
end
| uu____51 -> begin
false
end))


let set_check_kind : FStar_TypeChecker_Env.env  ->  push_kind  ->  FStar_TypeChecker_Env.env = (fun env check_kind -> (

let uu___257_60 = env
in (

let uu____61 = (FStar_ToSyntax_Env.set_syntax_only env.FStar_TypeChecker_Env.dsenv (Prims.op_Equality check_kind SyntaxCheck))
in {FStar_TypeChecker_Env.solver = uu___257_60.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___257_60.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___257_60.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___257_60.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___257_60.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___257_60.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___257_60.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___257_60.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___257_60.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___257_60.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___257_60.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___257_60.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___257_60.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___257_60.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___257_60.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___257_60.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___257_60.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___257_60.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = (Prims.op_Equality check_kind LaxCheck); FStar_TypeChecker_Env.lax_universes = uu___257_60.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.failhard = uu___257_60.FStar_TypeChecker_Env.failhard; FStar_TypeChecker_Env.nosynth = uu___257_60.FStar_TypeChecker_Env.nosynth; FStar_TypeChecker_Env.tc_term = uu___257_60.FStar_TypeChecker_Env.tc_term; FStar_TypeChecker_Env.type_of = uu___257_60.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___257_60.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___257_60.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___257_60.FStar_TypeChecker_Env.qname_and_index; FStar_TypeChecker_Env.proof_ns = uu___257_60.FStar_TypeChecker_Env.proof_ns; FStar_TypeChecker_Env.synth = uu___257_60.FStar_TypeChecker_Env.synth; FStar_TypeChecker_Env.is_native_tactic = uu___257_60.FStar_TypeChecker_Env.is_native_tactic; FStar_TypeChecker_Env.identifier_info = uu___257_60.FStar_TypeChecker_Env.identifier_info; FStar_TypeChecker_Env.tc_hooks = uu___257_60.FStar_TypeChecker_Env.tc_hooks; FStar_TypeChecker_Env.dsenv = uu____61})))


let with_captured_errors' : 'Auu____68 . FStar_TypeChecker_Env.env  ->  (FStar_TypeChecker_Env.env  ->  'Auu____68 FStar_Pervasives_Native.option)  ->  'Auu____68 FStar_Pervasives_Native.option = (fun env f -> (FStar_All.try_with (fun uu___259_91 -> (match (()) with
| () -> begin
(f env)
end)) (fun uu___258_99 -> (match (uu___258_99) with
| FStar_All.Failure (msg) -> begin
(

let msg1 = (Prims.strcat "ASSERTION FAILURE: " (Prims.strcat msg (Prims.strcat "\n" (Prims.strcat "F* may be in an inconsistent state.\n" (Prims.strcat "Please file a bug report, ideally with a " "minimized version of the program that triggered the error.")))))
in ((

let uu____105 = (

let uu____112 = (

let uu____117 = (FStar_TypeChecker_Env.get_range env)
in ((msg1), (uu____117)))
in (uu____112)::[])
in (FStar_TypeChecker_Err.add_errors env uu____105));
(FStar_Util.print_error msg1);
FStar_Pervasives_Native.None;
))
end
| FStar_Errors.Error (msg, r) -> begin
((FStar_TypeChecker_Err.add_errors env ((((msg), (r)))::[]));
FStar_Pervasives_Native.None;
)
end
| FStar_Errors.Err (msg) -> begin
((

let uu____140 = (

let uu____147 = (

let uu____152 = (FStar_TypeChecker_Env.get_range env)
in ((msg), (uu____152)))
in (uu____147)::[])
in (FStar_TypeChecker_Err.add_errors env uu____140));
FStar_Pervasives_Native.None;
)
end
| FStar_Errors.Stop -> begin
FStar_Pervasives_Native.None
end))))


let with_captured_errors : 'Auu____167 . FStar_TypeChecker_Env.env  ->  (FStar_TypeChecker_Env.env  ->  'Auu____167 FStar_Pervasives_Native.option)  ->  'Auu____167 FStar_Pervasives_Native.option = (fun env f -> (

let uu____187 = (FStar_Options.trace_error ())
in (match (uu____187) with
| true -> begin
(f env)
end
| uu____190 -> begin
(with_captured_errors' env f)
end)))

type timed_fname =
{tf_fname : Prims.string; tf_modtime : FStar_Util.time}


let __proj__Mktimed_fname__item__tf_fname : timed_fname  ->  Prims.string = (fun projectee -> (match (projectee) with
| {tf_fname = __fname__tf_fname; tf_modtime = __fname__tf_modtime} -> begin
__fname__tf_fname
end))


let __proj__Mktimed_fname__item__tf_modtime : timed_fname  ->  FStar_Util.time = (fun projectee -> (match (projectee) with
| {tf_fname = __fname__tf_fname; tf_modtime = __fname__tf_modtime} -> begin
__fname__tf_modtime
end))


let t0 : FStar_Util.time = (FStar_Util.now ())


let tf_of_fname : Prims.string  ->  timed_fname = (fun fname -> (

let uu____215 = (FStar_Parser_ParseIt.get_file_last_modification_time fname)
in {tf_fname = fname; tf_modtime = uu____215}))


let dummy_tf_of_fname : Prims.string  ->  timed_fname = (fun fname -> {tf_fname = fname; tf_modtime = t0})


let string_of_timed_fname : timed_fname  ->  Prims.string = (fun uu____223 -> (match (uu____223) with
| {tf_fname = fname; tf_modtime = modtime} -> begin
(match ((Prims.op_Equality modtime t0)) with
| true -> begin
(FStar_Util.format1 "{ %s }" fname)
end
| uu____226 -> begin
(

let uu____227 = (FStar_Util.string_of_time modtime)
in (FStar_Util.format2 "{ %s; %s }" fname uu____227))
end)
end))

type push_query =
{push_kind : push_kind; push_code : Prims.string; push_line : Prims.int; push_column : Prims.int; push_peek_only : Prims.bool}


let __proj__Mkpush_query__item__push_kind : push_query  ->  push_kind = (fun projectee -> (match (projectee) with
| {push_kind = __fname__push_kind; push_code = __fname__push_code; push_line = __fname__push_line; push_column = __fname__push_column; push_peek_only = __fname__push_peek_only} -> begin
__fname__push_kind
end))


let __proj__Mkpush_query__item__push_code : push_query  ->  Prims.string = (fun projectee -> (match (projectee) with
| {push_kind = __fname__push_kind; push_code = __fname__push_code; push_line = __fname__push_line; push_column = __fname__push_column; push_peek_only = __fname__push_peek_only} -> begin
__fname__push_code
end))


let __proj__Mkpush_query__item__push_line : push_query  ->  Prims.int = (fun projectee -> (match (projectee) with
| {push_kind = __fname__push_kind; push_code = __fname__push_code; push_line = __fname__push_line; push_column = __fname__push_column; push_peek_only = __fname__push_peek_only} -> begin
__fname__push_line
end))


let __proj__Mkpush_query__item__push_column : push_query  ->  Prims.int = (fun projectee -> (match (projectee) with
| {push_kind = __fname__push_kind; push_code = __fname__push_code; push_line = __fname__push_line; push_column = __fname__push_column; push_peek_only = __fname__push_peek_only} -> begin
__fname__push_column
end))


let __proj__Mkpush_query__item__push_peek_only : push_query  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {push_kind = __fname__push_kind; push_code = __fname__push_code; push_line = __fname__push_line; push_column = __fname__push_column; push_peek_only = __fname__push_peek_only} -> begin
__fname__push_peek_only
end))


type optmod_t =
FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option

type repl_task =
| LDInterleaved of (timed_fname * timed_fname)
| LDSingle of timed_fname
| LDInterfaceOfCurrentFile of timed_fname
| PushFragment of FStar_Parser_ParseIt.input_frag


let uu___is_LDInterleaved : repl_task  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LDInterleaved (_0) -> begin
true
end
| uu____324 -> begin
false
end))


let __proj__LDInterleaved__item___0 : repl_task  ->  (timed_fname * timed_fname) = (fun projectee -> (match (projectee) with
| LDInterleaved (_0) -> begin
_0
end))


let uu___is_LDSingle : repl_task  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LDSingle (_0) -> begin
true
end
| uu____350 -> begin
false
end))


let __proj__LDSingle__item___0 : repl_task  ->  timed_fname = (fun projectee -> (match (projectee) with
| LDSingle (_0) -> begin
_0
end))


let uu___is_LDInterfaceOfCurrentFile : repl_task  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LDInterfaceOfCurrentFile (_0) -> begin
true
end
| uu____364 -> begin
false
end))


let __proj__LDInterfaceOfCurrentFile__item___0 : repl_task  ->  timed_fname = (fun projectee -> (match (projectee) with
| LDInterfaceOfCurrentFile (_0) -> begin
_0
end))


let uu___is_PushFragment : repl_task  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PushFragment (_0) -> begin
true
end
| uu____378 -> begin
false
end))


let __proj__PushFragment__item___0 : repl_task  ->  FStar_Parser_ParseIt.input_frag = (fun projectee -> (match (projectee) with
| PushFragment (_0) -> begin
_0
end))


type env_t =
FStar_TypeChecker_Env.env

type repl_state =
{repl_line : Prims.int; repl_column : Prims.int; repl_fname : Prims.string; repl_deps_stack : (repl_task * repl_state) Prims.list; repl_curmod : optmod_t; repl_env : env_t; repl_stdin : FStar_Util.stream_reader; repl_names : FStar_Interactive_CompletionTable.table}


let __proj__Mkrepl_state__item__repl_line : repl_state  ->  Prims.int = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_line
end))


let __proj__Mkrepl_state__item__repl_column : repl_state  ->  Prims.int = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_column
end))


let __proj__Mkrepl_state__item__repl_fname : repl_state  ->  Prims.string = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_fname
end))


let __proj__Mkrepl_state__item__repl_deps_stack : repl_state  ->  (repl_task * repl_state) Prims.list = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_deps_stack
end))


let __proj__Mkrepl_state__item__repl_curmod : repl_state  ->  optmod_t = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_curmod
end))


let __proj__Mkrepl_state__item__repl_env : repl_state  ->  env_t = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_env
end))


let __proj__Mkrepl_state__item__repl_stdin : repl_state  ->  FStar_Util.stream_reader = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_stdin
end))


let __proj__Mkrepl_state__item__repl_names : repl_state  ->  FStar_Interactive_CompletionTable.table = (fun projectee -> (match (projectee) with
| {repl_line = __fname__repl_line; repl_column = __fname__repl_column; repl_fname = __fname__repl_fname; repl_deps_stack = __fname__repl_deps_stack; repl_curmod = __fname__repl_curmod; repl_env = __fname__repl_env; repl_stdin = __fname__repl_stdin; repl_names = __fname__repl_names} -> begin
__fname__repl_names
end))


type completed_repl_task =
(repl_task * repl_state)


type repl_stack_t =
(repl_task * repl_state) Prims.list


let repl_stack : (repl_task * repl_state) Prims.list FStar_ST.ref = (FStar_Util.mk_ref [])


let pop_repl : repl_state  ->  repl_state = (fun st -> (

let uu____620 = (FStar_ST.op_Bang repl_stack)
in (match (uu____620) with
| [] -> begin
(failwith "Too many pops")
end
| ((uu____689, st'))::stack -> begin
((pop st.repl_env "#pop");
(FStar_ST.op_Colon_Equals repl_stack stack);
st';
)
end)))


let push_repl : push_kind  ->  repl_task  ->  repl_state  ->  FStar_TypeChecker_Env.env = (fun push_kind task st -> ((

let uu____775 = (

let uu____782 = (FStar_ST.op_Bang repl_stack)
in (((task), (st)))::uu____782)
in (FStar_ST.op_Colon_Equals repl_stack uu____775));
(

let uu____909 = (set_check_kind st.repl_env push_kind)
in (push uu____909 ""));
))


let nothing_left_to_pop : repl_state  ->  Prims.bool = (fun st -> (

let uu____914 = (

let uu____915 = (FStar_ST.op_Bang repl_stack)
in (FStar_List.length uu____915))
in (Prims.op_Equality uu____914 (FStar_List.length st.repl_deps_stack))))

type name_tracking_event =
| NTAlias of (FStar_Ident.lid * FStar_Ident.ident * FStar_Ident.lid)
| NTOpen of (FStar_Ident.lid * FStar_ToSyntax_Env.open_module_or_namespace)
| NTInclude of (FStar_Ident.lid * FStar_Ident.lid)
| NTBinding of FStar_TypeChecker_Env.binding


let uu___is_NTAlias : name_tracking_event  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NTAlias (_0) -> begin
true
end
| uu____1033 -> begin
false
end))


let __proj__NTAlias__item___0 : name_tracking_event  ->  (FStar_Ident.lid * FStar_Ident.ident * FStar_Ident.lid) = (fun projectee -> (match (projectee) with
| NTAlias (_0) -> begin
_0
end))


let uu___is_NTOpen : name_tracking_event  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NTOpen (_0) -> begin
true
end
| uu____1069 -> begin
false
end))


let __proj__NTOpen__item___0 : name_tracking_event  ->  (FStar_Ident.lid * FStar_ToSyntax_Env.open_module_or_namespace) = (fun projectee -> (match (projectee) with
| NTOpen (_0) -> begin
_0
end))


let uu___is_NTInclude : name_tracking_event  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NTInclude (_0) -> begin
true
end
| uu____1099 -> begin
false
end))


let __proj__NTInclude__item___0 : name_tracking_event  ->  (FStar_Ident.lid * FStar_Ident.lid) = (fun projectee -> (match (projectee) with
| NTInclude (_0) -> begin
_0
end))


let uu___is_NTBinding : name_tracking_event  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NTBinding (_0) -> begin
true
end
| uu____1125 -> begin
false
end))


let __proj__NTBinding__item___0 : name_tracking_event  ->  FStar_TypeChecker_Env.binding = (fun projectee -> (match (projectee) with
| NTBinding (_0) -> begin
_0
end))


let query_of_ids : FStar_Ident.ident Prims.list  ->  FStar_Interactive_CompletionTable.query = (fun ids -> (FStar_List.map FStar_Ident.text_of_id ids))


let query_of_lid : FStar_Ident.lident  ->  FStar_Interactive_CompletionTable.query = (fun lid -> (query_of_ids (FStar_List.append lid.FStar_Ident.ns ((lid.FStar_Ident.ident)::[]))))


let update_names_from_event : Prims.string  ->  FStar_Interactive_CompletionTable.table  ->  name_tracking_event  ->  FStar_Interactive_CompletionTable.table = (fun cur_mod_str table evt -> (

let is_cur_mod = (fun lid -> (Prims.op_Equality lid.FStar_Ident.str cur_mod_str))
in (match (evt) with
| NTAlias (host, id, included) -> begin
(match ((is_cur_mod host)) with
| true -> begin
(

let uu____1165 = (query_of_lid included)
in (FStar_Interactive_CompletionTable.register_alias table (FStar_Ident.text_of_id id) [] uu____1165))
end
| uu____1166 -> begin
table
end)
end
| NTOpen (host, (included, kind)) -> begin
(match ((is_cur_mod host)) with
| true -> begin
(

let uu____1174 = (query_of_lid included)
in (FStar_Interactive_CompletionTable.register_open table (Prims.op_Equality kind FStar_ToSyntax_Env.Open_module) [] uu____1174))
end
| uu____1175 -> begin
table
end)
end
| NTInclude (host, included) -> begin
(

let uu____1178 = (match ((is_cur_mod host)) with
| true -> begin
[]
end
| uu____1179 -> begin
(query_of_lid host)
end)
in (

let uu____1180 = (query_of_lid included)
in (FStar_Interactive_CompletionTable.register_include table uu____1178 uu____1180)))
end
| NTBinding (binding) -> begin
(

let lids = (match (binding) with
| FStar_TypeChecker_Env.Binding_lid (lid, uu____1188) -> begin
(lid)::[]
end
| FStar_TypeChecker_Env.Binding_sig (lids, uu____1190) -> begin
lids
end
| FStar_TypeChecker_Env.Binding_sig_inst (lids, uu____1196, uu____1197) -> begin
lids
end
| uu____1202 -> begin
[]
end)
in (FStar_List.fold_left (fun tbl lid -> (

let ns_query = (match ((Prims.op_Equality lid.FStar_Ident.nsstr cur_mod_str)) with
| true -> begin
[]
end
| uu____1213 -> begin
(query_of_ids lid.FStar_Ident.ns)
end)
in (FStar_Interactive_CompletionTable.insert tbl ns_query (FStar_Ident.text_of_id lid.FStar_Ident.ident) lid))) table lids))
end)))


let commit_name_tracking' : FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option  ->  FStar_Interactive_CompletionTable.table  ->  name_tracking_event Prims.list  ->  FStar_Interactive_CompletionTable.table = (fun cur_mod names1 name_events -> (

let cur_mod_str = (match (cur_mod) with
| FStar_Pervasives_Native.None -> begin
""
end
| FStar_Pervasives_Native.Some (md) -> begin
(

let uu____1236 = (FStar_Syntax_Syntax.mod_name md)
in uu____1236.FStar_Ident.str)
end)
in (

let updater = (update_names_from_event cur_mod_str)
in (FStar_List.fold_left updater names1 name_events))))


let commit_name_tracking : repl_state  ->  name_tracking_event Prims.list  ->  repl_state = (fun st name_events -> (

let names1 = (commit_name_tracking' st.repl_curmod st.repl_names name_events)
in (

let uu___260_1255 = st
in {repl_line = uu___260_1255.repl_line; repl_column = uu___260_1255.repl_column; repl_fname = uu___260_1255.repl_fname; repl_deps_stack = uu___260_1255.repl_deps_stack; repl_curmod = uu___260_1255.repl_curmod; repl_env = uu___260_1255.repl_env; repl_stdin = uu___260_1255.repl_stdin; repl_names = names1})))


let fresh_name_tracking_hooks : Prims.unit  ->  (name_tracking_event Prims.list FStar_ST.ref * FStar_ToSyntax_Env.dsenv_hooks * FStar_TypeChecker_Env.tcenv_hooks) = (fun uu____1269 -> (

let events = (FStar_Util.mk_ref [])
in (

let push_event = (fun evt -> (

let uu____1281 = (

let uu____1284 = (FStar_ST.op_Bang events)
in (evt)::uu____1284)
in (FStar_ST.op_Colon_Equals events uu____1281)))
in ((events), ({FStar_ToSyntax_Env.ds_push_open_hook = (fun dsenv op -> (

let uu____1441 = (

let uu____1442 = (

let uu____1447 = (FStar_ToSyntax_Env.current_module dsenv)
in ((uu____1447), (op)))
in NTOpen (uu____1442))
in (push_event uu____1441))); FStar_ToSyntax_Env.ds_push_include_hook = (fun dsenv ns -> (

let uu____1453 = (

let uu____1454 = (

let uu____1459 = (FStar_ToSyntax_Env.current_module dsenv)
in ((uu____1459), (ns)))
in NTInclude (uu____1454))
in (push_event uu____1453))); FStar_ToSyntax_Env.ds_push_module_abbrev_hook = (fun dsenv x l -> (

let uu____1467 = (

let uu____1468 = (

let uu____1475 = (FStar_ToSyntax_Env.current_module dsenv)
in ((uu____1475), (x), (l)))
in NTAlias (uu____1468))
in (push_event uu____1467)))}), ({FStar_TypeChecker_Env.tc_push_in_gamma_hook = (fun uu____1480 s -> (push_event (NTBinding (s))))})))))


let track_name_changes : env_t  ->  (env_t * (env_t  ->  (env_t * name_tracking_event Prims.list))) = (fun env -> (

let set_hooks = (fun dshooks tchooks env1 -> (

let uu____1520 = (FStar_Universal.with_tcenv env1 (fun dsenv -> (

let uu____1528 = (FStar_ToSyntax_Env.set_ds_hooks dsenv dshooks)
in ((()), (uu____1528)))))
in (match (uu____1520) with
| ((), tcenv') -> begin
(FStar_TypeChecker_Env.set_tc_hooks tcenv' tchooks)
end)))
in (

let uu____1530 = (

let uu____1535 = (FStar_ToSyntax_Env.ds_hooks env.FStar_TypeChecker_Env.dsenv)
in (

let uu____1536 = (FStar_TypeChecker_Env.tc_hooks env)
in ((uu____1535), (uu____1536))))
in (match (uu____1530) with
| (old_dshooks, old_tchooks) -> begin
(

let uu____1551 = (fresh_name_tracking_hooks ())
in (match (uu____1551) with
| (events, new_dshooks, new_tchooks) -> begin
(

let uu____1585 = (set_hooks new_dshooks new_tchooks env)
in ((uu____1585), ((fun env1 -> (

let uu____1598 = (set_hooks old_dshooks old_tchooks env1)
in (

let uu____1599 = (

let uu____1602 = (FStar_ST.op_Bang events)
in (FStar_List.rev uu____1602))
in ((uu____1598), (uu____1599))))))))
end))
end))))


let string_of_repl_task : repl_task  ->  Prims.string = (fun uu___242_1674 -> (match (uu___242_1674) with
| LDInterleaved (intf, impl) -> begin
(

let uu____1677 = (string_of_timed_fname intf)
in (

let uu____1678 = (string_of_timed_fname impl)
in (FStar_Util.format2 "LDInterleaved (%s, %s)" uu____1677 uu____1678)))
end
| LDSingle (intf_or_impl) -> begin
(

let uu____1680 = (string_of_timed_fname intf_or_impl)
in (FStar_Util.format1 "LDSingle %s" uu____1680))
end
| LDInterfaceOfCurrentFile (intf) -> begin
(

let uu____1682 = (string_of_timed_fname intf)
in (FStar_Util.format1 "LDInterfaceOfCurrentFile %s" uu____1682))
end
| PushFragment (frag) -> begin
(FStar_Util.format1 "PushFragment { code = %s }" frag.FStar_Parser_ParseIt.frag_text)
end))


let tc_one : FStar_TypeChecker_Env.env  ->  Prims.string FStar_Pervasives_Native.option  ->  Prims.string  ->  FStar_TypeChecker_Env.env = (fun env intf_opt modf -> (

let uu____1700 = (FStar_Universal.tc_one_file env intf_opt modf)
in (match (uu____1700) with
| (uu____1709, env1) -> begin
env1
end)))


let run_repl_task : optmod_t  ->  env_t  ->  repl_task  ->  (optmod_t * env_t) = (fun curmod env task -> (match (task) with
| LDInterleaved (intf, impl) -> begin
(

let uu____1741 = (tc_one env (FStar_Pervasives_Native.Some (intf.tf_fname)) impl.tf_fname)
in ((curmod), (uu____1741)))
end
| LDSingle (intf_or_impl) -> begin
(

let uu____1743 = (tc_one env FStar_Pervasives_Native.None intf_or_impl.tf_fname)
in ((curmod), (uu____1743)))
end
| LDInterfaceOfCurrentFile (intf) -> begin
(

let uu____1745 = (FStar_Universal.load_interface_decls env intf.tf_fname)
in ((curmod), (uu____1745)))
end
| PushFragment (frag) -> begin
(FStar_Universal.tc_one_fragment curmod env frag)
end))


let repl_ld_tasks_of_deps : Prims.string Prims.list  ->  repl_task Prims.list  ->  repl_task Prims.list = (fun deps final_tasks -> (

let wrap = dummy_tf_of_fname
in (

let rec aux = (fun deps1 final_tasks1 -> (match (deps1) with
| (intf)::(impl)::deps' when (FStar_Universal.needs_interleaving intf impl) -> begin
(

let uu____1792 = (aux deps' final_tasks1)
in (LDInterleaved ((((wrap intf)), ((wrap impl)))))::uu____1792)
end
| (intf_or_impl)::deps' -> begin
(

let uu____1799 = (aux deps' final_tasks1)
in (LDSingle ((wrap intf_or_impl)))::uu____1799)
end
| [] -> begin
final_tasks1
end))
in (aux deps final_tasks))))


let deps_and_repl_ld_tasks_of_our_file : Prims.string  ->  (Prims.string Prims.list * repl_task Prims.list) = (fun filename -> (

let get_mod_name = (fun fname -> (FStar_Parser_Dep.lowercase_module_name fname))
in (

let our_mod_name = (get_mod_name filename)
in (

let has_our_mod_name = (fun f -> (

let uu____1823 = (get_mod_name f)
in (Prims.op_Equality uu____1823 our_mod_name)))
in (

let prims_fname = (FStar_Options.prims ())
in (

let deps = (

let uu____1828 = (FStar_Dependencies.find_deps_if_needed FStar_Parser_Dep.VerifyFigureItOut ((filename)::[]))
in (prims_fname)::uu____1828)
in (

let uu____1831 = (FStar_List.partition has_our_mod_name deps)
in (match (uu____1831) with
| (same_name, real_deps) -> begin
(

let intf_tasks = (match (same_name) with
| (intf)::(impl)::[] -> begin
((

let uu____1866 = (

let uu____1867 = (FStar_Parser_Dep.is_interface intf)
in (not (uu____1867)))
in (match (uu____1866) with
| true -> begin
(

let uu____1868 = (

let uu____1869 = (FStar_Util.format1 "Expecting an interface, got %s" intf)
in FStar_Errors.Err (uu____1869))
in (FStar_Exn.raise uu____1868))
end
| uu____1870 -> begin
()
end));
(

let uu____1872 = (

let uu____1873 = (FStar_Parser_Dep.is_implementation impl)
in (not (uu____1873)))
in (match (uu____1872) with
| true -> begin
(

let uu____1874 = (

let uu____1875 = (FStar_Util.format1 "Expecting an implementation, got %s" impl)
in FStar_Errors.Err (uu____1875))
in (FStar_Exn.raise uu____1874))
end
| uu____1876 -> begin
()
end));
(LDInterfaceOfCurrentFile ((dummy_tf_of_fname intf)))::[];
)
end
| (impl)::[] -> begin
[]
end
| uu____1878 -> begin
(

let mods_str = (FStar_String.concat " " same_name)
in (

let message = "Too many or too few files matching %s: %s"
in ((

let uu____1884 = (

let uu____1885 = (FStar_Util.format2 message our_mod_name mods_str)
in FStar_Errors.Err (uu____1885))
in (FStar_Exn.raise uu____1884));
[];
)))
end)
in (

let tasks = (repl_ld_tasks_of_deps real_deps intf_tasks)
in ((real_deps), (tasks))))
end))))))))


let update_task_timestamps : repl_task  ->  repl_task = (fun uu___243_1896 -> (match (uu___243_1896) with
| LDInterleaved (intf, impl) -> begin
(

let uu____1899 = (

let uu____1904 = (tf_of_fname intf.tf_fname)
in (

let uu____1905 = (tf_of_fname impl.tf_fname)
in ((uu____1904), (uu____1905))))
in LDInterleaved (uu____1899))
end
| LDSingle (intf_or_impl) -> begin
(

let uu____1907 = (tf_of_fname intf_or_impl.tf_fname)
in LDSingle (uu____1907))
end
| LDInterfaceOfCurrentFile (intf) -> begin
(

let uu____1909 = (tf_of_fname intf.tf_fname)
in LDInterfaceOfCurrentFile (uu____1909))
end
| PushFragment (frag) -> begin
PushFragment (frag)
end))


let run_repl_transaction : repl_state  ->  push_kind  ->  Prims.bool  ->  repl_task  ->  (Prims.bool * repl_state) = (fun st push_kind must_rollback task -> (

let env = (push_repl push_kind task st)
in (

let uu____1932 = (track_name_changes env)
in (match (uu____1932) with
| (env1, finish_name_tracking) -> begin
(

let check_success = (fun uu____1970 -> ((

let uu____1973 = (FStar_Errors.get_err_count ())
in (Prims.op_Equality uu____1973 (Prims.parse_int "0"))) && (not (must_rollback))))
in (

let uu____1974 = (

let uu____1981 = (with_captured_errors env1 (fun env2 -> (

let uu____1995 = (run_repl_task st.repl_curmod env2 task)
in (FStar_All.pipe_left (fun _0_66 -> FStar_Pervasives_Native.Some (_0_66)) uu____1995))))
in (match (uu____1981) with
| FStar_Pervasives_Native.Some (curmod, env2) when (check_success ()) -> begin
((curmod), (env2), (true))
end
| uu____2026 -> begin
((st.repl_curmod), (env1), (false))
end))
in (match (uu____1974) with
| (curmod, env2, success) -> begin
(

let uu____2040 = (finish_name_tracking env2)
in (match (uu____2040) with
| (env', name_events) -> begin
(

let st1 = (

let uu___261_2058 = st
in {repl_line = uu___261_2058.repl_line; repl_column = uu___261_2058.repl_column; repl_fname = uu___261_2058.repl_fname; repl_deps_stack = uu___261_2058.repl_deps_stack; repl_curmod = curmod; repl_env = env2; repl_stdin = uu___261_2058.repl_stdin; repl_names = uu___261_2058.repl_names})
in (

let st2 = (match (success) with
| true -> begin
(commit_name_tracking st1 name_events)
end
| uu____2060 -> begin
(pop_repl st1)
end)
in ((success), (st2))))
end))
end)))
end))))


let run_repl_ld_transactions : repl_state  ->  repl_task Prims.list  ->  (repl_state, repl_state) FStar_Util.either = (fun st tasks -> (

let debug1 = (fun verb task -> (

let uu____2084 = (FStar_Options.debug_any ())
in (match (uu____2084) with
| true -> begin
(

let uu____2085 = (string_of_repl_task task)
in (FStar_Util.print2 "%s %s" verb uu____2085))
end
| uu____2086 -> begin
()
end)))
in (

let rec revert_many = (fun st1 uu___244_2099 -> (match (uu___244_2099) with
| [] -> begin
st1
end
| ((task, _st'))::entries -> begin
((

let uu____2124 = (Obj.magic (()))
in ());
(debug1 "Reverting" task);
(

let uu____2126 = (pop_repl st1)
in (revert_many uu____2126 entries));
)
end))
in (

let rec aux = (fun st1 tasks1 previous -> (match (((tasks1), (previous))) with
| ([], []) -> begin
FStar_Util.Inl (st1)
end
| ((task)::tasks2, []) -> begin
((debug1 "Loading" task);
(

let uu____2171 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right uu____2171 FStar_Pervasives.ignore));
(

let timestamped_task = (update_task_timestamps task)
in (

let push_kind = (

let uu____2174 = (FStar_Options.lax ())
in (match (uu____2174) with
| true -> begin
LaxCheck
end
| uu____2175 -> begin
FullCheck
end))
in (

let uu____2176 = (run_repl_transaction st1 push_kind false timestamped_task)
in (match (uu____2176) with
| (success, st2) -> begin
(match (success) with
| true -> begin
(

let uu____2191 = (

let uu___262_2192 = st2
in (

let uu____2193 = (FStar_ST.op_Bang repl_stack)
in {repl_line = uu___262_2192.repl_line; repl_column = uu___262_2192.repl_column; repl_fname = uu___262_2192.repl_fname; repl_deps_stack = uu____2193; repl_curmod = uu___262_2192.repl_curmod; repl_env = uu___262_2192.repl_env; repl_stdin = uu___262_2192.repl_stdin; repl_names = uu___262_2192.repl_names}))
in (aux uu____2191 tasks2 []))
end
| uu____2258 -> begin
FStar_Util.Inr (st2)
end)
end))));
)
end
| ((task)::tasks2, (prev)::previous1) when (

let uu____2271 = (update_task_timestamps task)
in (Prims.op_Equality (FStar_Pervasives_Native.fst prev) uu____2271)) -> begin
((debug1 "Skipping" task);
(aux st1 tasks2 previous1);
)
end
| (tasks2, previous1) -> begin
(

let uu____2283 = (revert_many st1 previous1)
in (aux uu____2283 tasks2 []))
end))
in (aux st tasks (FStar_List.rev st.repl_deps_stack))))))


let json_to_str : FStar_Util.json  ->  Prims.string = (fun uu___245_2291 -> (match (uu___245_2291) with
| FStar_Util.JsonNull -> begin
"null"
end
| FStar_Util.JsonBool (b) -> begin
(FStar_Util.format1 "bool (%s)" (match (b) with
| true -> begin
"true"
end
| uu____2293 -> begin
"false"
end))
end
| FStar_Util.JsonInt (i) -> begin
(

let uu____2295 = (FStar_Util.string_of_int i)
in (FStar_Util.format1 "int (%s)" uu____2295))
end
| FStar_Util.JsonStr (s) -> begin
(FStar_Util.format1 "string (%s)" s)
end
| FStar_Util.JsonList (uu____2297) -> begin
"list (...)"
end
| FStar_Util.JsonAssoc (uu____2300) -> begin
"dictionary (...)"
end))

exception UnexpectedJsonType of ((Prims.string * FStar_Util.json))


let uu___is_UnexpectedJsonType : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnexpectedJsonType (uu____2318) -> begin
true
end
| uu____2323 -> begin
false
end))


let __proj__UnexpectedJsonType__item__uu___ : Prims.exn  ->  (Prims.string * FStar_Util.json) = (fun projectee -> (match (projectee) with
| UnexpectedJsonType (uu____2339) -> begin
uu____2339
end))


let js_fail : 'Auu____2350 . Prims.string  ->  FStar_Util.json  ->  'Auu____2350 = (fun expected got -> (FStar_Exn.raise (UnexpectedJsonType (((expected), (got))))))


let js_int : FStar_Util.json  ->  Prims.int = (fun uu___246_2362 -> (match (uu___246_2362) with
| FStar_Util.JsonInt (i) -> begin
i
end
| other -> begin
(js_fail "int" other)
end))


let js_str : FStar_Util.json  ->  Prims.string = (fun uu___247_2368 -> (match (uu___247_2368) with
| FStar_Util.JsonStr (s) -> begin
s
end
| other -> begin
(js_fail "string" other)
end))


let js_list : 'Auu____2377 . (FStar_Util.json  ->  'Auu____2377)  ->  FStar_Util.json  ->  'Auu____2377 Prims.list = (fun k uu___248_2390 -> (match (uu___248_2390) with
| FStar_Util.JsonList (l) -> begin
(FStar_List.map k l)
end
| other -> begin
(js_fail "list" other)
end))


let js_assoc : FStar_Util.json  ->  (Prims.string * FStar_Util.json) Prims.list = (fun uu___249_2408 -> (match (uu___249_2408) with
| FStar_Util.JsonAssoc (a) -> begin
a
end
| other -> begin
(js_fail "dictionary" other)
end))


let js_pushkind : FStar_Util.json  ->  push_kind = (fun s -> (

let uu____2433 = (js_str s)
in (match (uu____2433) with
| "syntax" -> begin
SyntaxCheck
end
| "lax" -> begin
LaxCheck
end
| "full" -> begin
FullCheck
end
| uu____2434 -> begin
(js_fail "push_kind" s)
end)))


let js_reductionrule : FStar_Util.json  ->  FStar_TypeChecker_Normalize.step = (fun s -> (

let uu____2439 = (js_str s)
in (match (uu____2439) with
| "beta" -> begin
FStar_TypeChecker_Normalize.Beta
end
| "delta" -> begin
FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant)
end
| "iota" -> begin
FStar_TypeChecker_Normalize.Iota
end
| "zeta" -> begin
FStar_TypeChecker_Normalize.Zeta
end
| "reify" -> begin
FStar_TypeChecker_Normalize.Reify
end
| "pure-subterms" -> begin
FStar_TypeChecker_Normalize.PureSubtermsWithinComputations
end
| uu____2440 -> begin
(js_fail "reduction rule" s)
end)))

type completion_context =
| CKCode
| CKOption of Prims.bool
| CKModuleOrNamespace of (Prims.bool * Prims.bool)


let uu___is_CKCode : completion_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CKCode -> begin
true
end
| uu____2457 -> begin
false
end))


let uu___is_CKOption : completion_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CKOption (_0) -> begin
true
end
| uu____2463 -> begin
false
end))


let __proj__CKOption__item___0 : completion_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CKOption (_0) -> begin
_0
end))


let uu___is_CKModuleOrNamespace : completion_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| CKModuleOrNamespace (_0) -> begin
true
end
| uu____2481 -> begin
false
end))


let __proj__CKModuleOrNamespace__item___0 : completion_context  ->  (Prims.bool * Prims.bool) = (fun projectee -> (match (projectee) with
| CKModuleOrNamespace (_0) -> begin
_0
end))


let js_optional_completion_context : FStar_Util.json FStar_Pervasives_Native.option  ->  completion_context = (fun k -> (match (k) with
| FStar_Pervasives_Native.None -> begin
CKCode
end
| FStar_Pervasives_Native.Some (k1) -> begin
(

let uu____2511 = (js_str k1)
in (match (uu____2511) with
| "symbol" -> begin
CKCode
end
| "code" -> begin
CKCode
end
| "set-options" -> begin
CKOption (false)
end
| "reset-options" -> begin
CKOption (true)
end
| "open" -> begin
CKModuleOrNamespace (((true), (true)))
end
| "let-open" -> begin
CKModuleOrNamespace (((true), (true)))
end
| "include" -> begin
CKModuleOrNamespace (((true), (false)))
end
| "module-alias" -> begin
CKModuleOrNamespace (((true), (false)))
end
| uu____2512 -> begin
(js_fail "completion context (code, set-options, reset-options, open, let-open, include, module-alias)" k1)
end))
end))

type lookup_context =
| LKSymbolOnly
| LKModule
| LKOption
| LKCode


let uu___is_LKSymbolOnly : lookup_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LKSymbolOnly -> begin
true
end
| uu____2517 -> begin
false
end))


let uu___is_LKModule : lookup_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LKModule -> begin
true
end
| uu____2522 -> begin
false
end))


let uu___is_LKOption : lookup_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LKOption -> begin
true
end
| uu____2527 -> begin
false
end))


let uu___is_LKCode : lookup_context  ->  Prims.bool = (fun projectee -> (match (projectee) with
| LKCode -> begin
true
end
| uu____2532 -> begin
false
end))


let js_optional_lookup_context : FStar_Util.json FStar_Pervasives_Native.option  ->  lookup_context = (fun k -> (match (k) with
| FStar_Pervasives_Native.None -> begin
LKSymbolOnly
end
| FStar_Pervasives_Native.Some (k1) -> begin
(

let uu____2542 = (js_str k1)
in (match (uu____2542) with
| "symbol-only" -> begin
LKSymbolOnly
end
| "code" -> begin
LKCode
end
| "set-options" -> begin
LKOption
end
| "reset-options" -> begin
LKOption
end
| "open" -> begin
LKModule
end
| "let-open" -> begin
LKModule
end
| "include" -> begin
LKModule
end
| "module-alias" -> begin
LKModule
end
| uu____2543 -> begin
(js_fail "lookup context (symbol-only, code, set-options, reset-options, open, let-open, include, module-alias)" k1)
end))
end))


type position =
(Prims.string * Prims.int * Prims.int)

type query' =
| Exit
| DescribeProtocol
| DescribeRepl
| Segment of Prims.string
| Pop
| Push of push_query
| VfsAdd of (Prims.string FStar_Pervasives_Native.option * Prims.string)
| AutoComplete of (Prims.string * completion_context)
| Lookup of (Prims.string * lookup_context * position FStar_Pervasives_Native.option * Prims.string Prims.list)
| Compute of (Prims.string * FStar_TypeChecker_Normalize.step Prims.list FStar_Pervasives_Native.option)
| Search of Prims.string
| GenericError of Prims.string
| ProtocolViolation of Prims.string 
 and query =
{qq : query'; qid : Prims.string}


let uu___is_Exit : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exit -> begin
true
end
| uu____2628 -> begin
false
end))


let uu___is_DescribeProtocol : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DescribeProtocol -> begin
true
end
| uu____2633 -> begin
false
end))


let uu___is_DescribeRepl : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DescribeRepl -> begin
true
end
| uu____2638 -> begin
false
end))


let uu___is_Segment : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Segment (_0) -> begin
true
end
| uu____2644 -> begin
false
end))


let __proj__Segment__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| Segment (_0) -> begin
_0
end))


let uu___is_Pop : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pop -> begin
true
end
| uu____2657 -> begin
false
end))


let uu___is_Push : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Push (_0) -> begin
true
end
| uu____2663 -> begin
false
end))


let __proj__Push__item___0 : query'  ->  push_query = (fun projectee -> (match (projectee) with
| Push (_0) -> begin
_0
end))


let uu___is_VfsAdd : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| VfsAdd (_0) -> begin
true
end
| uu____2683 -> begin
false
end))


let __proj__VfsAdd__item___0 : query'  ->  (Prims.string FStar_Pervasives_Native.option * Prims.string) = (fun projectee -> (match (projectee) with
| VfsAdd (_0) -> begin
_0
end))


let uu___is_AutoComplete : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| AutoComplete (_0) -> begin
true
end
| uu____2719 -> begin
false
end))


let __proj__AutoComplete__item___0 : query'  ->  (Prims.string * completion_context) = (fun projectee -> (match (projectee) with
| AutoComplete (_0) -> begin
_0
end))


let uu___is_Lookup : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lookup (_0) -> begin
true
end
| uu____2757 -> begin
false
end))


let __proj__Lookup__item___0 : query'  ->  (Prims.string * lookup_context * position FStar_Pervasives_Native.option * Prims.string Prims.list) = (fun projectee -> (match (projectee) with
| Lookup (_0) -> begin
_0
end))


let uu___is_Compute : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Compute (_0) -> begin
true
end
| uu____2815 -> begin
false
end))


let __proj__Compute__item___0 : query'  ->  (Prims.string * FStar_TypeChecker_Normalize.step Prims.list FStar_Pervasives_Native.option) = (fun projectee -> (match (projectee) with
| Compute (_0) -> begin
_0
end))


let uu___is_Search : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Search (_0) -> begin
true
end
| uu____2853 -> begin
false
end))


let __proj__Search__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| Search (_0) -> begin
_0
end))


let uu___is_GenericError : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| GenericError (_0) -> begin
true
end
| uu____2867 -> begin
false
end))


let __proj__GenericError__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| GenericError (_0) -> begin
_0
end))


let uu___is_ProtocolViolation : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ProtocolViolation (_0) -> begin
true
end
| uu____2881 -> begin
false
end))


let __proj__ProtocolViolation__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| ProtocolViolation (_0) -> begin
_0
end))


let __proj__Mkquery__item__qq : query  ->  query' = (fun projectee -> (match (projectee) with
| {qq = __fname__qq; qid = __fname__qid} -> begin
__fname__qq
end))


let __proj__Mkquery__item__qid : query  ->  Prims.string = (fun projectee -> (match (projectee) with
| {qq = __fname__qq; qid = __fname__qid} -> begin
__fname__qid
end))


let query_needs_current_module : query'  ->  Prims.bool = (fun uu___250_2905 -> (match (uu___250_2905) with
| Exit -> begin
false
end
| DescribeProtocol -> begin
false
end
| DescribeRepl -> begin
false
end
| Segment (uu____2906) -> begin
false
end
| Pop -> begin
false
end
| Push ({push_kind = uu____2907; push_code = uu____2908; push_line = uu____2909; push_column = uu____2910; push_peek_only = false}) -> begin
false
end
| VfsAdd (uu____2911) -> begin
false
end
| GenericError (uu____2918) -> begin
false
end
| ProtocolViolation (uu____2919) -> begin
false
end
| Push (uu____2920) -> begin
true
end
| AutoComplete (uu____2921) -> begin
true
end
| Lookup (uu____2926) -> begin
true
end
| Compute (uu____2939) -> begin
true
end
| Search (uu____2948) -> begin
true
end))


let interactive_protocol_vernum : Prims.int = (Prims.parse_int "2")


let interactive_protocol_features : Prims.string Prims.list = ("autocomplete")::("autocomplete/context")::("compute")::("compute/reify")::("compute/pure-subterms")::("describe-protocol")::("describe-repl")::("exit")::("lookup")::("lookup/context")::("lookup/documentation")::("lookup/definition")::("peek")::("pop")::("push")::("search")::("segment")::("vfs-add")::[]

exception InvalidQuery of (Prims.string)


let uu___is_InvalidQuery : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| InvalidQuery (uu____2958) -> begin
true
end
| uu____2959 -> begin
false
end))


let __proj__InvalidQuery__item__uu___ : Prims.exn  ->  Prims.string = (fun projectee -> (match (projectee) with
| InvalidQuery (uu____2967) -> begin
uu____2967
end))

type query_status =
| QueryOK
| QueryNOK
| QueryViolatesProtocol


let uu___is_QueryOK : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryOK -> begin
true
end
| uu____2972 -> begin
false
end))


let uu___is_QueryNOK : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryNOK -> begin
true
end
| uu____2977 -> begin
false
end))


let uu___is_QueryViolatesProtocol : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryViolatesProtocol -> begin
true
end
| uu____2982 -> begin
false
end))


let try_assoc : 'Auu____2991 'Auu____2992 . 'Auu____2992  ->  ('Auu____2992 * 'Auu____2991) Prims.list  ->  'Auu____2991 FStar_Pervasives_Native.option = (fun key a -> (

let uu____3015 = (FStar_Util.try_find (fun uu____3029 -> (match (uu____3029) with
| (k, uu____3035) -> begin
(Prims.op_Equality k key)
end)) a)
in (FStar_Util.map_option FStar_Pervasives_Native.snd uu____3015)))


let wrap_js_failure : Prims.string  ->  Prims.string  ->  FStar_Util.json  ->  query = (fun qid expected got -> (

let uu____3052 = (

let uu____3053 = (

let uu____3054 = (json_to_str got)
in (FStar_Util.format2 "JSON decoding failed: expected %s, got %s" expected uu____3054))
in ProtocolViolation (uu____3053))
in {qq = uu____3052; qid = qid}))


let unpack_interactive_query : FStar_Util.json  ->  query = (fun json -> (

let assoc1 = (fun errloc key a -> (

let uu____3081 = (try_assoc key a)
in (match (uu____3081) with
| FStar_Pervasives_Native.Some (v1) -> begin
v1
end
| FStar_Pervasives_Native.None -> begin
(

let uu____3085 = (

let uu____3086 = (FStar_Util.format2 "Missing key [%s] in %s." key errloc)
in InvalidQuery (uu____3086))
in (FStar_Exn.raise uu____3085))
end)))
in (

let request = (FStar_All.pipe_right json js_assoc)
in (

let qid = (

let uu____3101 = (assoc1 "query" "query-id" request)
in (FStar_All.pipe_right uu____3101 js_str))
in (FStar_All.try_with (fun uu___264_3108 -> (match (()) with
| () -> begin
(

let query = (

let uu____3110 = (assoc1 "query" "query" request)
in (FStar_All.pipe_right uu____3110 js_str))
in (

let args = (

let uu____3118 = (assoc1 "query" "args" request)
in (FStar_All.pipe_right uu____3118 js_assoc))
in (

let arg = (fun k -> (assoc1 "[args]" k args))
in (

let try_arg = (fun k -> (

let uu____3135 = (try_assoc k args)
in (match (uu____3135) with
| FStar_Pervasives_Native.Some (FStar_Util.JsonNull) -> begin
FStar_Pervasives_Native.None
end
| other -> begin
other
end)))
in (

let uu____3143 = (match (query) with
| "exit" -> begin
Exit
end
| "pop" -> begin
Pop
end
| "describe-protocol" -> begin
DescribeProtocol
end
| "describe-repl" -> begin
DescribeRepl
end
| "segment" -> begin
(

let uu____3144 = (

let uu____3145 = (arg "code")
in (FStar_All.pipe_right uu____3145 js_str))
in Segment (uu____3144))
end
| "peek" -> begin
(

let uu____3146 = (

let uu____3147 = (

let uu____3148 = (arg "kind")
in (FStar_All.pipe_right uu____3148 js_pushkind))
in (

let uu____3149 = (

let uu____3150 = (arg "code")
in (FStar_All.pipe_right uu____3150 js_str))
in (

let uu____3151 = (

let uu____3152 = (arg "line")
in (FStar_All.pipe_right uu____3152 js_int))
in (

let uu____3153 = (

let uu____3154 = (arg "column")
in (FStar_All.pipe_right uu____3154 js_int))
in {push_kind = uu____3147; push_code = uu____3149; push_line = uu____3151; push_column = uu____3153; push_peek_only = (Prims.op_Equality query "peek")}))))
in Push (uu____3146))
end
| "push" -> begin
(

let uu____3155 = (

let uu____3156 = (

let uu____3157 = (arg "kind")
in (FStar_All.pipe_right uu____3157 js_pushkind))
in (

let uu____3158 = (

let uu____3159 = (arg "code")
in (FStar_All.pipe_right uu____3159 js_str))
in (

let uu____3160 = (

let uu____3161 = (arg "line")
in (FStar_All.pipe_right uu____3161 js_int))
in (

let uu____3162 = (

let uu____3163 = (arg "column")
in (FStar_All.pipe_right uu____3163 js_int))
in {push_kind = uu____3156; push_code = uu____3158; push_line = uu____3160; push_column = uu____3162; push_peek_only = (Prims.op_Equality query "peek")}))))
in Push (uu____3155))
end
| "autocomplete" -> begin
(

let uu____3164 = (

let uu____3169 = (

let uu____3170 = (arg "partial-symbol")
in (FStar_All.pipe_right uu____3170 js_str))
in (

let uu____3171 = (

let uu____3172 = (try_arg "context")
in (FStar_All.pipe_right uu____3172 js_optional_completion_context))
in ((uu____3169), (uu____3171))))
in AutoComplete (uu____3164))
end
| "lookup" -> begin
(

let uu____3177 = (

let uu____3190 = (

let uu____3191 = (arg "symbol")
in (FStar_All.pipe_right uu____3191 js_str))
in (

let uu____3192 = (

let uu____3193 = (try_arg "context")
in (FStar_All.pipe_right uu____3193 js_optional_lookup_context))
in (

let uu____3198 = (

let uu____3207 = (

let uu____3216 = (try_arg "location")
in (FStar_All.pipe_right uu____3216 (FStar_Util.map_option js_assoc)))
in (FStar_All.pipe_right uu____3207 (FStar_Util.map_option (fun loc -> (

let uu____3274 = (

let uu____3275 = (assoc1 "[location]" "filename" loc)
in (FStar_All.pipe_right uu____3275 js_str))
in (

let uu____3276 = (

let uu____3277 = (assoc1 "[location]" "line" loc)
in (FStar_All.pipe_right uu____3277 js_int))
in (

let uu____3278 = (

let uu____3279 = (assoc1 "[location]" "column" loc)
in (FStar_All.pipe_right uu____3279 js_int))
in ((uu____3274), (uu____3276), (uu____3278)))))))))
in (

let uu____3280 = (

let uu____3283 = (arg "requested-info")
in (FStar_All.pipe_right uu____3283 (js_list js_str)))
in ((uu____3190), (uu____3192), (uu____3198), (uu____3280))))))
in Lookup (uu____3177))
end
| "compute" -> begin
(

let uu____3296 = (

let uu____3305 = (

let uu____3306 = (arg "term")
in (FStar_All.pipe_right uu____3306 js_str))
in (

let uu____3307 = (

let uu____3312 = (try_arg "rules")
in (FStar_All.pipe_right uu____3312 (FStar_Util.map_option (js_list js_reductionrule))))
in ((uu____3305), (uu____3307))))
in Compute (uu____3296))
end
| "search" -> begin
(

let uu____3327 = (

let uu____3328 = (arg "terms")
in (FStar_All.pipe_right uu____3328 js_str))
in Search (uu____3327))
end
| "vfs-add" -> begin
(

let uu____3329 = (

let uu____3336 = (

let uu____3339 = (try_arg "filename")
in (FStar_All.pipe_right uu____3339 (FStar_Util.map_option js_str)))
in (

let uu____3346 = (

let uu____3347 = (arg "contents")
in (FStar_All.pipe_right uu____3347 js_str))
in ((uu____3336), (uu____3346))))
in VfsAdd (uu____3329))
end
| uu____3350 -> begin
(

let uu____3351 = (FStar_Util.format1 "Unknown query \'%s\'" query)
in ProtocolViolation (uu____3351))
end)
in {qq = uu____3143; qid = qid})))))
end)) (fun uu___263_3354 -> (match (uu___263_3354) with
| InvalidQuery (msg) -> begin
{qq = ProtocolViolation (msg); qid = qid}
end
| UnexpectedJsonType (expected, got) -> begin
(wrap_js_failure qid expected got)
end)))))))


let read_interactive_query : FStar_Util.stream_reader  ->  query = (fun stream -> (FStar_All.try_with (fun uu___266_3364 -> (match (()) with
| () -> begin
(

let uu____3365 = (FStar_Util.read_line stream)
in (match (uu____3365) with
| FStar_Pervasives_Native.None -> begin
(FStar_Exn.raise (ExitREPL ((Prims.parse_int "0"))))
end
| FStar_Pervasives_Native.Some (line) -> begin
(

let uu____3369 = (FStar_Util.json_of_string line)
in (match (uu____3369) with
| FStar_Pervasives_Native.None -> begin
{qq = ProtocolViolation ("Json parsing failed."); qid = "?"}
end
| FStar_Pervasives_Native.Some (request) -> begin
(unpack_interactive_query request)
end))
end))
end)) (fun uu___265_3375 -> (match (uu___265_3375) with
| InvalidQuery (msg) -> begin
{qq = ProtocolViolation (msg); qid = "?"}
end
| UnexpectedJsonType (expected, got) -> begin
(wrap_js_failure "?" expected got)
end))))


let json_of_opt : 'Auu____3385 . ('Auu____3385  ->  FStar_Util.json)  ->  'Auu____3385 FStar_Pervasives_Native.option  ->  FStar_Util.json = (fun json_of_a opt_a -> (

let uu____3403 = (FStar_Util.map_option json_of_a opt_a)
in (FStar_Util.dflt FStar_Util.JsonNull uu____3403)))


let json_of_pos : FStar_Range.pos  ->  FStar_Util.json = (fun pos -> (

let uu____3410 = (

let uu____3413 = (

let uu____3414 = (FStar_Range.line_of_pos pos)
in FStar_Util.JsonInt (uu____3414))
in (

let uu____3415 = (

let uu____3418 = (

let uu____3419 = (FStar_Range.col_of_pos pos)
in FStar_Util.JsonInt (uu____3419))
in (uu____3418)::[])
in (uu____3413)::uu____3415))
in FStar_Util.JsonList (uu____3410)))


let json_of_range_fields : Prims.string  ->  FStar_Range.pos  ->  FStar_Range.pos  ->  FStar_Util.json = (fun file b e -> (

let uu____3432 = (

let uu____3439 = (

let uu____3446 = (

let uu____3451 = (json_of_pos b)
in (("beg"), (uu____3451)))
in (

let uu____3452 = (

let uu____3459 = (

let uu____3464 = (json_of_pos e)
in (("end"), (uu____3464)))
in (uu____3459)::[])
in (uu____3446)::uu____3452))
in ((("fname"), (FStar_Util.JsonStr (file))))::uu____3439)
in FStar_Util.JsonAssoc (uu____3432)))


let json_of_use_range : FStar_Range.range  ->  FStar_Util.json = (fun r -> (

let uu____3485 = (FStar_Range.file_of_use_range r)
in (

let uu____3486 = (FStar_Range.start_of_use_range r)
in (

let uu____3487 = (FStar_Range.end_of_use_range r)
in (json_of_range_fields uu____3485 uu____3486 uu____3487)))))


let json_of_def_range : FStar_Range.range  ->  FStar_Util.json = (fun r -> (

let uu____3492 = (FStar_Range.file_of_range r)
in (

let uu____3493 = (FStar_Range.start_of_range r)
in (

let uu____3494 = (FStar_Range.end_of_range r)
in (json_of_range_fields uu____3492 uu____3493 uu____3494)))))


let json_of_issue_level : FStar_Errors.issue_level  ->  FStar_Util.json = (fun i -> FStar_Util.JsonStr ((match (i) with
| FStar_Errors.ENotImplemented -> begin
"not-implemented"
end
| FStar_Errors.EInfo -> begin
"info"
end
| FStar_Errors.EWarning -> begin
"warning"
end
| FStar_Errors.EError -> begin
"error"
end)))


let json_of_issue : FStar_Errors.issue  ->  FStar_Util.json = (fun issue -> (

let uu____3503 = (

let uu____3510 = (

let uu____3517 = (

let uu____3524 = (

let uu____3529 = (

let uu____3530 = (

let uu____3533 = (match (issue.FStar_Errors.issue_range) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (r) -> begin
(

let uu____3539 = (json_of_use_range r)
in (uu____3539)::[])
end)
in (

let uu____3540 = (match (issue.FStar_Errors.issue_range) with
| FStar_Pervasives_Native.Some (r) when (

let uu____3546 = (FStar_Range.def_range r)
in (

let uu____3547 = (FStar_Range.use_range r)
in (Prims.op_disEquality uu____3546 uu____3547))) -> begin
(

let uu____3548 = (json_of_def_range r)
in (uu____3548)::[])
end
| uu____3549 -> begin
[]
end)
in (FStar_List.append uu____3533 uu____3540)))
in FStar_Util.JsonList (uu____3530))
in (("ranges"), (uu____3529)))
in (uu____3524)::[])
in ((("message"), (FStar_Util.JsonStr (issue.FStar_Errors.issue_message))))::uu____3517)
in ((("level"), ((json_of_issue_level issue.FStar_Errors.issue_level))))::uu____3510)
in FStar_Util.JsonAssoc (uu____3503)))

type symbol_lookup_result =
{slr_name : Prims.string; slr_def_range : FStar_Range.range FStar_Pervasives_Native.option; slr_typ : Prims.string FStar_Pervasives_Native.option; slr_doc : Prims.string FStar_Pervasives_Native.option; slr_def : Prims.string FStar_Pervasives_Native.option}


let __proj__Mksymbol_lookup_result__item__slr_name : symbol_lookup_result  ->  Prims.string = (fun projectee -> (match (projectee) with
| {slr_name = __fname__slr_name; slr_def_range = __fname__slr_def_range; slr_typ = __fname__slr_typ; slr_doc = __fname__slr_doc; slr_def = __fname__slr_def} -> begin
__fname__slr_name
end))


let __proj__Mksymbol_lookup_result__item__slr_def_range : symbol_lookup_result  ->  FStar_Range.range FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {slr_name = __fname__slr_name; slr_def_range = __fname__slr_def_range; slr_typ = __fname__slr_typ; slr_doc = __fname__slr_doc; slr_def = __fname__slr_def} -> begin
__fname__slr_def_range
end))


let __proj__Mksymbol_lookup_result__item__slr_typ : symbol_lookup_result  ->  Prims.string FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {slr_name = __fname__slr_name; slr_def_range = __fname__slr_def_range; slr_typ = __fname__slr_typ; slr_doc = __fname__slr_doc; slr_def = __fname__slr_def} -> begin
__fname__slr_typ
end))


let __proj__Mksymbol_lookup_result__item__slr_doc : symbol_lookup_result  ->  Prims.string FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {slr_name = __fname__slr_name; slr_def_range = __fname__slr_def_range; slr_typ = __fname__slr_typ; slr_doc = __fname__slr_doc; slr_def = __fname__slr_def} -> begin
__fname__slr_doc
end))


let __proj__Mksymbol_lookup_result__item__slr_def : symbol_lookup_result  ->  Prims.string FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {slr_name = __fname__slr_name; slr_def_range = __fname__slr_def_range; slr_typ = __fname__slr_typ; slr_doc = __fname__slr_doc; slr_def = __fname__slr_def} -> begin
__fname__slr_def
end))


let alist_of_symbol_lookup_result : symbol_lookup_result  ->  (Prims.string * FStar_Util.json) Prims.list = (fun lr -> (

let uu____3707 = (

let uu____3714 = (

let uu____3719 = (json_of_opt json_of_def_range lr.slr_def_range)
in (("defined-at"), (uu____3719)))
in (

let uu____3720 = (

let uu____3727 = (

let uu____3732 = (json_of_opt (fun _0_67 -> FStar_Util.JsonStr (_0_67)) lr.slr_typ)
in (("type"), (uu____3732)))
in (

let uu____3733 = (

let uu____3740 = (

let uu____3745 = (json_of_opt (fun _0_68 -> FStar_Util.JsonStr (_0_68)) lr.slr_doc)
in (("documentation"), (uu____3745)))
in (

let uu____3746 = (

let uu____3753 = (

let uu____3758 = (json_of_opt (fun _0_69 -> FStar_Util.JsonStr (_0_69)) lr.slr_def)
in (("definition"), (uu____3758)))
in (uu____3753)::[])
in (uu____3740)::uu____3746))
in (uu____3727)::uu____3733))
in (uu____3714)::uu____3720))
in ((("name"), (FStar_Util.JsonStr (lr.slr_name))))::uu____3707))


let alist_of_protocol_info : (Prims.string * FStar_Util.json) Prims.list = (

let js_version = FStar_Util.JsonInt (interactive_protocol_vernum)
in (

let js_features = (

let uu____3791 = (FStar_List.map (fun _0_70 -> FStar_Util.JsonStr (_0_70)) interactive_protocol_features)
in (FStar_All.pipe_left (fun _0_71 -> FStar_Util.JsonList (_0_71)) uu____3791))
in ((("version"), (js_version)))::((("features"), (js_features)))::[]))

type fstar_option_permission_level =
| OptSet
| OptReset
| OptReadOnly


let uu___is_OptSet : fstar_option_permission_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| OptSet -> begin
true
end
| uu____3812 -> begin
false
end))


let uu___is_OptReset : fstar_option_permission_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| OptReset -> begin
true
end
| uu____3817 -> begin
false
end))


let uu___is_OptReadOnly : fstar_option_permission_level  ->  Prims.bool = (fun projectee -> (match (projectee) with
| OptReadOnly -> begin
true
end
| uu____3822 -> begin
false
end))


let string_of_option_permission_level : fstar_option_permission_level  ->  Prims.string = (fun uu___251_3826 -> (match (uu___251_3826) with
| OptSet -> begin
""
end
| OptReset -> begin
"requires #reset-options"
end
| OptReadOnly -> begin
"read-only"
end))

type fstar_option =
{opt_name : Prims.string; opt_sig : Prims.string; opt_value : FStar_Options.option_val; opt_default : FStar_Options.option_val; opt_type : FStar_Options.opt_type; opt_snippets : Prims.string Prims.list; opt_documentation : Prims.string FStar_Pervasives_Native.option; opt_permission_level : fstar_option_permission_level}


let __proj__Mkfstar_option__item__opt_name : fstar_option  ->  Prims.string = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_name
end))


let __proj__Mkfstar_option__item__opt_sig : fstar_option  ->  Prims.string = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_sig
end))


let __proj__Mkfstar_option__item__opt_value : fstar_option  ->  FStar_Options.option_val = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_value
end))


let __proj__Mkfstar_option__item__opt_default : fstar_option  ->  FStar_Options.option_val = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_default
end))


let __proj__Mkfstar_option__item__opt_type : fstar_option  ->  FStar_Options.opt_type = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_type
end))


let __proj__Mkfstar_option__item__opt_snippets : fstar_option  ->  Prims.string Prims.list = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_snippets
end))


let __proj__Mkfstar_option__item__opt_documentation : fstar_option  ->  Prims.string FStar_Pervasives_Native.option = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_documentation
end))


let __proj__Mkfstar_option__item__opt_permission_level : fstar_option  ->  fstar_option_permission_level = (fun projectee -> (match (projectee) with
| {opt_name = __fname__opt_name; opt_sig = __fname__opt_sig; opt_value = __fname__opt_value; opt_default = __fname__opt_default; opt_type = __fname__opt_type; opt_snippets = __fname__opt_snippets; opt_documentation = __fname__opt_documentation; opt_permission_level = __fname__opt_permission_level} -> begin
__fname__opt_permission_level
end))


let rec kind_of_fstar_option_type : FStar_Options.opt_type  ->  Prims.string = (fun uu___252_4002 -> (match (uu___252_4002) with
| FStar_Options.Const (uu____4003) -> begin
"flag"
end
| FStar_Options.IntStr (uu____4004) -> begin
"int"
end
| FStar_Options.BoolStr -> begin
"bool"
end
| FStar_Options.PathStr (uu____4005) -> begin
"path"
end
| FStar_Options.SimpleStr (uu____4006) -> begin
"string"
end
| FStar_Options.EnumStr (uu____4007) -> begin
"enum"
end
| FStar_Options.OpenEnumStr (uu____4010) -> begin
"open enum"
end
| FStar_Options.PostProcessed (uu____4017, typ) -> begin
(kind_of_fstar_option_type typ)
end
| FStar_Options.Accumulated (typ) -> begin
(kind_of_fstar_option_type typ)
end
| FStar_Options.ReverseAccumulated (typ) -> begin
(kind_of_fstar_option_type typ)
end
| FStar_Options.WithSideEffect (uu____4025, typ) -> begin
(kind_of_fstar_option_type typ)
end))


let rec snippets_of_fstar_option : Prims.string  ->  FStar_Options.opt_type  ->  Prims.string Prims.list = (fun name typ -> (

let mk_field = (fun field_name -> (Prims.strcat "${" (Prims.strcat field_name "}")))
in (

let mk_snippet = (fun name1 argstring -> (Prims.strcat "--" (Prims.strcat name1 (match ((Prims.op_disEquality argstring "")) with
| true -> begin
(Prims.strcat " " argstring)
end
| uu____4052 -> begin
""
end))))
in (

let rec arg_snippets_of_type = (fun typ1 -> (match (typ1) with
| FStar_Options.Const (uu____4061) -> begin
("")::[]
end
| FStar_Options.BoolStr -> begin
("true")::("false")::[]
end
| FStar_Options.IntStr (desc) -> begin
((mk_field desc))::[]
end
| FStar_Options.PathStr (desc) -> begin
((mk_field desc))::[]
end
| FStar_Options.SimpleStr (desc) -> begin
((mk_field desc))::[]
end
| FStar_Options.EnumStr (strs) -> begin
strs
end
| FStar_Options.OpenEnumStr (strs, desc) -> begin
(FStar_List.append strs (((mk_field desc))::[]))
end
| FStar_Options.PostProcessed (uu____4074, elem_spec) -> begin
(arg_snippets_of_type elem_spec)
end
| FStar_Options.Accumulated (elem_spec) -> begin
(arg_snippets_of_type elem_spec)
end
| FStar_Options.ReverseAccumulated (elem_spec) -> begin
(arg_snippets_of_type elem_spec)
end
| FStar_Options.WithSideEffect (uu____4082, elem_spec) -> begin
(arg_snippets_of_type elem_spec)
end))
in (

let uu____4088 = (arg_snippets_of_type typ)
in (FStar_List.map (mk_snippet name) uu____4088))))))


let rec json_of_fstar_option_value : FStar_Options.option_val  ->  FStar_Util.json = (fun uu___253_4094 -> (match (uu___253_4094) with
| FStar_Options.Bool (b) -> begin
FStar_Util.JsonBool (b)
end
| FStar_Options.String (s) -> begin
FStar_Util.JsonStr (s)
end
| FStar_Options.Path (s) -> begin
FStar_Util.JsonStr (s)
end
| FStar_Options.Int (n1) -> begin
FStar_Util.JsonInt (n1)
end
| FStar_Options.List (vs) -> begin
(

let uu____4102 = (FStar_List.map json_of_fstar_option_value vs)
in FStar_Util.JsonList (uu____4102))
end
| FStar_Options.Unset -> begin
FStar_Util.JsonNull
end))


let alist_of_fstar_option : fstar_option  ->  (Prims.string * FStar_Util.json) Prims.list = (fun opt -> (

let uu____4115 = (

let uu____4122 = (

let uu____4129 = (

let uu____4134 = (json_of_fstar_option_value opt.opt_value)
in (("value"), (uu____4134)))
in (

let uu____4135 = (

let uu____4142 = (

let uu____4147 = (json_of_fstar_option_value opt.opt_default)
in (("default"), (uu____4147)))
in (

let uu____4148 = (

let uu____4155 = (

let uu____4160 = (json_of_opt (fun _0_72 -> FStar_Util.JsonStr (_0_72)) opt.opt_documentation)
in (("documentation"), (uu____4160)))
in (

let uu____4161 = (

let uu____4168 = (

let uu____4173 = (

let uu____4174 = (kind_of_fstar_option_type opt.opt_type)
in FStar_Util.JsonStr (uu____4174))
in (("type"), (uu____4173)))
in (uu____4168)::((("permission-level"), (FStar_Util.JsonStr ((string_of_option_permission_level opt.opt_permission_level)))))::[])
in (uu____4155)::uu____4161))
in (uu____4142)::uu____4148))
in (uu____4129)::uu____4135))
in ((("signature"), (FStar_Util.JsonStr (opt.opt_sig))))::uu____4122)
in ((("name"), (FStar_Util.JsonStr (opt.opt_name))))::uu____4115))


let json_of_fstar_option : fstar_option  ->  FStar_Util.json = (fun opt -> (

let uu____4211 = (alist_of_fstar_option opt)
in FStar_Util.JsonAssoc (uu____4211)))


let write_json : FStar_Util.json  ->  Prims.unit = (fun json -> ((

let uu____4223 = (FStar_Util.string_of_json json)
in (FStar_Util.print_raw uu____4223));
(FStar_Util.print_raw "\n");
))


let write_response : Prims.string  ->  query_status  ->  FStar_Util.json  ->  Prims.unit = (fun qid status response -> (

let qid1 = FStar_Util.JsonStr (qid)
in (

let status1 = (match (status) with
| QueryOK -> begin
FStar_Util.JsonStr ("success")
end
| QueryNOK -> begin
FStar_Util.JsonStr ("failure")
end
| QueryViolatesProtocol -> begin
FStar_Util.JsonStr ("protocol-violation")
end)
in (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("response"))))::((("query-id"), (qid1)))::((("status"), (status1)))::((("response"), (response)))::[]))))))


let write_message : Prims.string  ->  FStar_Util.json  ->  Prims.unit = (fun level contents -> (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("message"))))::((("level"), (FStar_Util.JsonStr (level))))::((("contents"), (contents)))::[]))))


let write_hello : Prims.unit  ->  Prims.unit = (fun uu____4285 -> (

let js_version = FStar_Util.JsonInt (interactive_protocol_vernum)
in (

let js_features = (

let uu____4288 = (FStar_List.map (fun _0_73 -> FStar_Util.JsonStr (_0_73)) interactive_protocol_features)
in FStar_Util.JsonList (uu____4288))
in (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("protocol-info"))))::alist_of_protocol_info))))))


let sig_of_fstar_option : Prims.string  ->  FStar_Options.opt_type  ->  Prims.string = (fun name typ -> (

let flag = (Prims.strcat "--" name)
in (

let uu____4304 = (FStar_Options.desc_of_opt_type typ)
in (match (uu____4304) with
| FStar_Pervasives_Native.None -> begin
flag
end
| FStar_Pervasives_Native.Some (arg_sig) -> begin
(Prims.strcat flag (Prims.strcat " " arg_sig))
end))))


let fstar_options_list_cache : fstar_option Prims.list = (

let defaults1 = (FStar_Util.smap_of_list FStar_Options.defaults)
in (

let uu____4313 = (FStar_All.pipe_right FStar_Options.all_specs_with_types (FStar_List.filter_map (fun uu____4342 -> (match (uu____4342) with
| (_shortname, name, typ, doc1) -> begin
(

let uu____4357 = (FStar_Util.smap_try_find defaults1 name)
in (FStar_All.pipe_right uu____4357 (FStar_Util.map_option (fun default_value -> (

let uu____4369 = (sig_of_fstar_option name typ)
in (

let uu____4370 = (snippets_of_fstar_option name typ)
in (

let uu____4373 = (

let uu____4374 = (FStar_Options.settable name)
in (match (uu____4374) with
| true -> begin
OptSet
end
| uu____4375 -> begin
(

let uu____4376 = (FStar_Options.resettable name)
in (match (uu____4376) with
| true -> begin
OptReset
end
| uu____4377 -> begin
OptReadOnly
end))
end))
in {opt_name = name; opt_sig = uu____4369; opt_value = FStar_Options.Unset; opt_default = default_value; opt_type = typ; opt_snippets = uu____4370; opt_documentation = (match ((Prims.op_Equality doc1 "")) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____4380 -> begin
FStar_Pervasives_Native.Some (doc1)
end); opt_permission_level = uu____4373})))))))
end))))
in (FStar_All.pipe_right uu____4313 (FStar_List.sortWith (fun o1 o2 -> (FStar_String.compare (FStar_String.lowercase o1.opt_name) (FStar_String.lowercase o2.opt_name)))))))


let fstar_options_map_cache : fstar_option FStar_Util.smap = (

let cache = (FStar_Util.smap_create (Prims.parse_int "50"))
in ((FStar_List.iter (fun opt -> (FStar_Util.smap_add cache opt.opt_name opt)) fstar_options_list_cache);
cache;
))


let update_option : fstar_option  ->  fstar_option = (fun opt -> (

let uu___267_4401 = opt
in (

let uu____4402 = (FStar_Options.get_option opt.opt_name)
in {opt_name = uu___267_4401.opt_name; opt_sig = uu___267_4401.opt_sig; opt_value = uu____4402; opt_default = uu___267_4401.opt_default; opt_type = uu___267_4401.opt_type; opt_snippets = uu___267_4401.opt_snippets; opt_documentation = uu___267_4401.opt_documentation; opt_permission_level = uu___267_4401.opt_permission_level})))


let current_fstar_options : (fstar_option  ->  Prims.bool)  ->  fstar_option Prims.list = (fun filter1 -> (

let uu____4414 = (FStar_List.filter filter1 fstar_options_list_cache)
in (FStar_List.map update_option uu____4414)))


let trim_option_name : Prims.string  ->  (Prims.string * Prims.string) = (fun opt_name -> (

let opt_prefix = "--"
in (match ((FStar_Util.starts_with opt_name opt_prefix)) with
| true -> begin
(

let uu____4430 = (FStar_Util.substring_from opt_name (FStar_String.length opt_prefix))
in ((opt_prefix), (uu____4430)))
end
| uu____4431 -> begin
((""), (opt_name))
end)))


let json_of_repl_state : repl_state  ->  FStar_Util.json = (fun st -> (

let filenames = (fun uu____4445 -> (match (uu____4445) with
| (task, uu____4453) -> begin
(match (task) with
| LDInterleaved (intf, impl) -> begin
(intf.tf_fname)::(impl.tf_fname)::[]
end
| LDSingle (intf_or_impl) -> begin
(intf_or_impl.tf_fname)::[]
end
| LDInterfaceOfCurrentFile (intf) -> begin
(intf.tf_fname)::[]
end
| PushFragment (uu____4460) -> begin
[]
end)
end))
in (

let uu____4461 = (

let uu____4468 = (

let uu____4473 = (

let uu____4474 = (

let uu____4477 = (FStar_List.concatMap filenames st.repl_deps_stack)
in (FStar_List.map (fun _0_74 -> FStar_Util.JsonStr (_0_74)) uu____4477))
in FStar_Util.JsonList (uu____4474))
in (("loaded-dependencies"), (uu____4473)))
in (

let uu____4484 = (

let uu____4491 = (

let uu____4496 = (

let uu____4497 = (

let uu____4500 = (current_fstar_options (fun uu____4505 -> true))
in (FStar_List.map json_of_fstar_option uu____4500))
in FStar_Util.JsonList (uu____4497))
in (("options"), (uu____4496)))
in (uu____4491)::[])
in (uu____4468)::uu____4484))
in FStar_Util.JsonAssoc (uu____4461))))


let with_printed_effect_args : 'Auu____4522 . (Prims.unit  ->  'Auu____4522)  ->  'Auu____4522 = (fun k -> (FStar_Options.with_saved_options (fun uu____4534 -> ((FStar_Options.set_option "print_effect_args" (FStar_Options.Bool (true)));
(k ());
))))


let term_to_string : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  Prims.string = (fun tcenv t -> (with_printed_effect_args (fun uu____4545 -> (FStar_TypeChecker_Normalize.term_to_string tcenv t))))


let sigelt_to_string : FStar_Syntax_Syntax.sigelt  ->  Prims.string = (fun se -> (with_printed_effect_args (fun uu____4551 -> (FStar_Syntax_Print.sigelt_to_string se))))


let run_exit : 'Auu____4558 'Auu____4559 . 'Auu____4559  ->  ((query_status * FStar_Util.json) * ('Auu____4558, Prims.int) FStar_Util.either) = (fun st -> ((((QueryOK), (FStar_Util.JsonNull))), (FStar_Util.Inr ((Prims.parse_int "0")))))


let run_describe_protocol : 'Auu____4590 'Auu____4591 . 'Auu____4591  ->  ((query_status * FStar_Util.json) * ('Auu____4591, 'Auu____4590) FStar_Util.either) = (fun st -> ((((QueryOK), (FStar_Util.JsonAssoc (alist_of_protocol_info)))), (FStar_Util.Inl (st))))


let run_describe_repl : 'Auu____4620 . repl_state  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____4620) FStar_Util.either) = (fun st -> (

let uu____4637 = (

let uu____4642 = (json_of_repl_state st)
in ((QueryOK), (uu____4642)))
in ((uu____4637), (FStar_Util.Inl (st)))))


let run_protocol_violation : 'Auu____4659 'Auu____4660 . 'Auu____4660  ->  Prims.string  ->  ((query_status * FStar_Util.json) * ('Auu____4660, 'Auu____4659) FStar_Util.either) = (fun st message -> ((((QueryViolatesProtocol), (FStar_Util.JsonStr (message)))), (FStar_Util.Inl (st))))


let run_generic_error : 'Auu____4697 'Auu____4698 . 'Auu____4698  ->  Prims.string  ->  ((query_status * FStar_Util.json) * ('Auu____4698, 'Auu____4697) FStar_Util.either) = (fun st message -> ((((QueryNOK), (FStar_Util.JsonStr (message)))), (FStar_Util.Inl (st))))


let collect_errors : Prims.unit  ->  FStar_Errors.issue Prims.list = (fun uu____4732 -> (

let errors = (FStar_Errors.report_all ())
in ((FStar_Errors.clear ());
errors;
)))


let run_segment : 'Auu____4743 . repl_state  ->  Prims.string  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____4743) FStar_Util.either) = (fun st code -> (

let frag = {FStar_Parser_ParseIt.frag_text = code; FStar_Parser_ParseIt.frag_line = (Prims.parse_int "1"); FStar_Parser_ParseIt.frag_col = (Prims.parse_int "0")}
in (

let collect_decls = (fun uu____4770 -> (

let uu____4771 = (FStar_Parser_Driver.parse_fragment frag)
in (match (uu____4771) with
| FStar_Parser_Driver.Empty -> begin
[]
end
| FStar_Parser_Driver.Decls (decls) -> begin
decls
end
| FStar_Parser_Driver.Modul (FStar_Parser_AST.Module (uu____4777, decls)) -> begin
decls
end
| FStar_Parser_Driver.Modul (FStar_Parser_AST.Interface (uu____4783, decls, uu____4785)) -> begin
decls
end)))
in (

let uu____4790 = (with_captured_errors st.repl_env (fun uu____4799 -> (

let uu____4800 = (collect_decls ())
in (FStar_All.pipe_left (fun _0_75 -> FStar_Pervasives_Native.Some (_0_75)) uu____4800))))
in (match (uu____4790) with
| FStar_Pervasives_Native.None -> begin
(

let errors = (

let uu____4828 = (collect_errors ())
in (FStar_All.pipe_right uu____4828 (FStar_List.map json_of_issue)))
in ((((QueryNOK), (FStar_Util.JsonList (errors)))), (FStar_Util.Inl (st))))
end
| FStar_Pervasives_Native.Some (decls) -> begin
(

let json_of_decl = (fun decl -> (

let uu____4852 = (

let uu____4859 = (

let uu____4864 = (json_of_def_range (FStar_Parser_AST.decl_drange decl))
in (("def_range"), (uu____4864)))
in (uu____4859)::[])
in FStar_Util.JsonAssoc (uu____4852)))
in (

let js_decls = (

let uu____4874 = (FStar_List.map json_of_decl decls)
in (FStar_All.pipe_left (fun _0_76 -> FStar_Util.JsonList (_0_76)) uu____4874))
in ((((QueryOK), (FStar_Util.JsonAssoc (((("decls"), (js_decls)))::[])))), (FStar_Util.Inl (st)))))
end)))))


let run_vfs_add : 'Auu____4903 . repl_state  ->  Prims.string FStar_Pervasives_Native.option  ->  Prims.string  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____4903) FStar_Util.either) = (fun st opt_fname contents -> (

let fname = (FStar_Util.dflt st.repl_fname opt_fname)
in ((FStar_Parser_ParseIt.add_vfs_entry fname contents);
((((QueryOK), (FStar_Util.JsonNull))), (FStar_Util.Inl (st)));
)))


let run_pop : 'Auu____4946 . repl_state  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____4946) FStar_Util.either) = (fun st -> (

let uu____4963 = (nothing_left_to_pop st)
in (match (uu____4963) with
| true -> begin
((((QueryNOK), (FStar_Util.JsonStr ("Too many pops")))), (FStar_Util.Inl (st)))
end
| uu____4984 -> begin
(

let st' = (pop_repl st)
in ((((QueryOK), (FStar_Util.JsonNull))), (FStar_Util.Inl (st'))))
end)))


let load_deps : repl_state  ->  ((repl_state * Prims.string Prims.list), repl_state) FStar_Util.either = (fun st -> (

let uu____5008 = (with_captured_errors st.repl_env (fun _env -> (

let uu____5030 = (deps_and_repl_ld_tasks_of_our_file st.repl_fname)
in (FStar_All.pipe_left (fun _0_77 -> FStar_Pervasives_Native.Some (_0_77)) uu____5030))))
in (match (uu____5008) with
| FStar_Pervasives_Native.None -> begin
FStar_Util.Inr (st)
end
| FStar_Pervasives_Native.Some (deps, tasks) -> begin
(

let uu____5107 = (run_repl_ld_transactions st tasks)
in (match (uu____5107) with
| FStar_Util.Inr (st1) -> begin
FStar_Util.Inr (st1)
end
| FStar_Util.Inl (st1) -> begin
FStar_Util.Inl (((st1), (deps)))
end))
end)))


let rephrase_dependency_error : FStar_Errors.issue  ->  FStar_Errors.issue = (fun issue -> (

let uu___268_5142 = issue
in (

let uu____5143 = (FStar_Util.format1 "Error while computing or loading dependencies:\n%s" issue.FStar_Errors.issue_message)
in {FStar_Errors.issue_message = uu____5143; FStar_Errors.issue_level = uu___268_5142.FStar_Errors.issue_level; FStar_Errors.issue_range = uu___268_5142.FStar_Errors.issue_range})))


let run_push_without_deps : 'Auu____5150 . repl_state  ->  push_query  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____5150) FStar_Util.either) = (fun st query -> (

let set_nosynth_flag = (fun st1 flag -> (

let uu___269_5178 = st1
in {repl_line = uu___269_5178.repl_line; repl_column = uu___269_5178.repl_column; repl_fname = uu___269_5178.repl_fname; repl_deps_stack = uu___269_5178.repl_deps_stack; repl_curmod = uu___269_5178.repl_curmod; repl_env = (

let uu___270_5180 = st1.repl_env
in {FStar_TypeChecker_Env.solver = uu___270_5180.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___270_5180.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___270_5180.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___270_5180.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___270_5180.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___270_5180.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___270_5180.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___270_5180.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___270_5180.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___270_5180.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___270_5180.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___270_5180.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___270_5180.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___270_5180.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___270_5180.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___270_5180.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___270_5180.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___270_5180.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___270_5180.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___270_5180.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.failhard = uu___270_5180.FStar_TypeChecker_Env.failhard; FStar_TypeChecker_Env.nosynth = flag; FStar_TypeChecker_Env.tc_term = uu___270_5180.FStar_TypeChecker_Env.tc_term; FStar_TypeChecker_Env.type_of = uu___270_5180.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___270_5180.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___270_5180.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___270_5180.FStar_TypeChecker_Env.qname_and_index; FStar_TypeChecker_Env.proof_ns = uu___270_5180.FStar_TypeChecker_Env.proof_ns; FStar_TypeChecker_Env.synth = uu___270_5180.FStar_TypeChecker_Env.synth; FStar_TypeChecker_Env.is_native_tactic = uu___270_5180.FStar_TypeChecker_Env.is_native_tactic; FStar_TypeChecker_Env.identifier_info = uu___270_5180.FStar_TypeChecker_Env.identifier_info; FStar_TypeChecker_Env.tc_hooks = uu___270_5180.FStar_TypeChecker_Env.tc_hooks; FStar_TypeChecker_Env.dsenv = uu___270_5180.FStar_TypeChecker_Env.dsenv}); repl_stdin = uu___269_5178.repl_stdin; repl_names = uu___269_5178.repl_names}))
in (

let uu____5181 = query
in (match (uu____5181) with
| {push_kind = push_kind; push_code = text1; push_line = line; push_column = column; push_peek_only = peek_only} -> begin
(

let frag = {FStar_Parser_ParseIt.frag_text = text1; FStar_Parser_ParseIt.frag_line = line; FStar_Parser_ParseIt.frag_col = column}
in ((FStar_TypeChecker_Env.toggle_id_info st.repl_env true);
(

let st1 = (set_nosynth_flag st peek_only)
in (

let uu____5202 = (run_repl_transaction st1 push_kind peek_only (PushFragment (frag)))
in (match (uu____5202) with
| (success, st2) -> begin
(

let st3 = (set_nosynth_flag st2 false)
in (

let status = (match ((success || peek_only)) with
| true -> begin
QueryOK
end
| uu____5223 -> begin
QueryNOK
end)
in (

let json_errors = (

let uu____5225 = (

let uu____5228 = (collect_errors ())
in (FStar_All.pipe_right uu____5228 (FStar_List.map json_of_issue)))
in FStar_Util.JsonList (uu____5225))
in (

let st4 = (match (success) with
| true -> begin
(

let uu___271_5236 = st3
in {repl_line = line; repl_column = column; repl_fname = uu___271_5236.repl_fname; repl_deps_stack = uu___271_5236.repl_deps_stack; repl_curmod = uu___271_5236.repl_curmod; repl_env = uu___271_5236.repl_env; repl_stdin = uu___271_5236.repl_stdin; repl_names = uu___271_5236.repl_names})
end
| uu____5237 -> begin
st3
end)
in ((((status), (json_errors))), (FStar_Util.Inl (st4)))))))
end)));
))
end))))


let capitalize : Prims.string  ->  Prims.string = (fun str -> (match ((Prims.op_Equality str "")) with
| true -> begin
str
end
| uu____5250 -> begin
(

let first = (FStar_String.substring str (Prims.parse_int "0") (Prims.parse_int "1"))
in (

let uu____5252 = (FStar_String.substring str (Prims.parse_int "1") ((FStar_String.length str) - (Prims.parse_int "1")))
in (Prims.strcat (FStar_String.uppercase first) uu____5252)))
end))


let add_module_completions : Prims.string  ->  Prims.string Prims.list  ->  FStar_Interactive_CompletionTable.table  ->  FStar_Interactive_CompletionTable.table = (fun this_fname deps table -> (

let mods = (FStar_Parser_Dep.build_inclusion_candidates_list ())
in (

let loaded_mods_set = (

let uu____5279 = (FStar_Util.psmap_empty ())
in (

let uu____5282 = (

let uu____5285 = (FStar_Options.prims ())
in (uu____5285)::deps)
in (FStar_List.fold_left (fun acc dep1 -> (

let uu____5295 = (FStar_Parser_Dep.lowercase_module_name dep1)
in (FStar_Util.psmap_add acc uu____5295 true))) uu____5279 uu____5282)))
in (

let loaded = (fun modname -> (FStar_Util.psmap_find_default loaded_mods_set modname false))
in (

let this_mod_key = (FStar_Parser_Dep.lowercase_module_name this_fname)
in (FStar_List.fold_left (fun table1 uu____5311 -> (match (uu____5311) with
| (modname, mod_path) -> begin
(

let mod_key = (FStar_String.lowercase modname)
in (match ((Prims.op_Equality this_mod_key mod_key)) with
| true -> begin
table1
end
| uu____5319 -> begin
(

let ns_query = (

let uu____5323 = (capitalize modname)
in (FStar_Util.split uu____5323 "."))
in (

let uu____5324 = (loaded mod_key)
in (FStar_Interactive_CompletionTable.register_module_path table1 uu____5324 mod_path ns_query)))
end))
end)) table (FStar_List.rev mods)))))))


let run_push_with_deps : 'Auu____5335 . repl_state  ->  push_query  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____5335) FStar_Util.either) = (fun st query -> ((

let uu____5357 = (FStar_Options.debug_any ())
in (match (uu____5357) with
| true -> begin
(FStar_Util.print_string "Reloading dependencies")
end
| uu____5358 -> begin
()
end));
(FStar_TypeChecker_Env.toggle_id_info st.repl_env false);
(

let uu____5360 = (load_deps st)
in (match (uu____5360) with
| FStar_Util.Inr (st1) -> begin
(

let errors = (

let uu____5393 = (collect_errors ())
in (FStar_List.map rephrase_dependency_error uu____5393))
in (

let js_errors = (FStar_All.pipe_right errors (FStar_List.map json_of_issue))
in ((((QueryNOK), (FStar_Util.JsonList (js_errors)))), (FStar_Util.Inl (st1)))))
end
| FStar_Util.Inl (st1, deps) -> begin
((

let uu____5424 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right uu____5424 FStar_Pervasives.ignore));
(

let names1 = (add_module_completions st1.repl_fname deps st1.repl_names)
in (run_push_without_deps (

let uu___272_5427 = st1
in {repl_line = uu___272_5427.repl_line; repl_column = uu___272_5427.repl_column; repl_fname = uu___272_5427.repl_fname; repl_deps_stack = uu___272_5427.repl_deps_stack; repl_curmod = uu___272_5427.repl_curmod; repl_env = uu___272_5427.repl_env; repl_stdin = uu___272_5427.repl_stdin; repl_names = names1}) query));
)
end));
))


let run_push : 'Auu____5434 . repl_state  ->  push_query  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____5434) FStar_Util.either) = (fun st query -> (

let uu____5455 = (nothing_left_to_pop st)
in (match (uu____5455) with
| true -> begin
(run_push_with_deps st query)
end
| uu____5468 -> begin
(run_push_without_deps st query)
end)))


let run_symbol_lookup : repl_state  ->  Prims.string  ->  (Prims.string * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  Prims.string Prims.list  ->  (Prims.string, (Prims.string * (Prims.string * FStar_Util.json) Prims.list)) FStar_Util.either = (fun st symbol pos_opt requested_info -> (

let tcenv = st.repl_env
in (

let info_of_lid_str = (fun lid_str -> (

let lid = (

let uu____5537 = (FStar_List.map FStar_Ident.id_of_text (FStar_Util.split lid_str "."))
in (FStar_Ident.lid_of_ids uu____5537))
in (

let lid1 = (

let uu____5541 = (FStar_ToSyntax_Env.resolve_to_fully_qualified_name tcenv.FStar_TypeChecker_Env.dsenv lid)
in (FStar_All.pipe_left (FStar_Util.dflt lid) uu____5541))
in (

let uu____5546 = (FStar_TypeChecker_Env.try_lookup_lid tcenv lid1)
in (FStar_All.pipe_right uu____5546 (FStar_Util.map_option (fun uu____5601 -> (match (uu____5601) with
| ((uu____5620, typ), r) -> begin
((FStar_Util.Inr (lid1)), (typ), (r))
end))))))))
in (

let docs_of_lid = (fun lid -> (

let uu____5637 = (FStar_ToSyntax_Env.try_lookup_doc tcenv.FStar_TypeChecker_Env.dsenv lid)
in (FStar_All.pipe_right uu____5637 (FStar_Util.map_option FStar_Pervasives_Native.fst))))
in (

let def_of_lid = (fun lid -> (

let uu____5666 = (FStar_TypeChecker_Env.lookup_qname tcenv lid)
in (FStar_Util.bind_opt uu____5666 (fun uu___254_5710 -> (match (uu___254_5710) with
| (FStar_Util.Inr (se, uu____5732), uu____5733) -> begin
(

let uu____5762 = (sigelt_to_string se)
in FStar_Pervasives_Native.Some (uu____5762))
end
| uu____5763 -> begin
FStar_Pervasives_Native.None
end)))))
in (

let info_at_pos_opt = (FStar_Util.bind_opt pos_opt (fun uu____5815 -> (match (uu____5815) with
| (file, row, col) -> begin
(FStar_TypeChecker_Err.info_at_pos tcenv file row col)
end)))
in (

let info_opt = (match (info_at_pos_opt) with
| FStar_Pervasives_Native.Some (uu____5862) -> begin
info_at_pos_opt
end
| FStar_Pervasives_Native.None -> begin
(match ((Prims.op_Equality symbol "")) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____5915 -> begin
(info_of_lid_str symbol)
end)
end)
in (

let response = (match (info_opt) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (name_or_lid, typ, rng) -> begin
(

let name = (match (name_or_lid) with
| FStar_Util.Inl (name) -> begin
name
end
| FStar_Util.Inr (lid) -> begin
(FStar_Ident.string_of_lid lid)
end)
in (

let typ_str = (match ((FStar_List.mem "type" requested_info)) with
| true -> begin
(

let uu____5990 = (term_to_string tcenv typ)
in FStar_Pervasives_Native.Some (uu____5990))
end
| uu____5991 -> begin
FStar_Pervasives_Native.None
end)
in (

let doc_str = (match (name_or_lid) with
| FStar_Util.Inr (lid) when (FStar_List.mem "documentation" requested_info) -> begin
(docs_of_lid lid)
end
| uu____5998 -> begin
FStar_Pervasives_Native.None
end)
in (

let def_str = (match (name_or_lid) with
| FStar_Util.Inr (lid) when (FStar_List.mem "definition" requested_info) -> begin
(def_of_lid lid)
end
| uu____6009 -> begin
FStar_Pervasives_Native.None
end)
in (

let def_range1 = (match ((FStar_List.mem "defined-at" requested_info)) with
| true -> begin
FStar_Pervasives_Native.Some (rng)
end
| uu____6019 -> begin
FStar_Pervasives_Native.None
end)
in (

let result = {slr_name = name; slr_def_range = def_range1; slr_typ = typ_str; slr_doc = doc_str; slr_def = def_str}
in (

let uu____6021 = (

let uu____6032 = (alist_of_symbol_lookup_result result)
in (("symbol"), (uu____6032)))
in FStar_Pervasives_Native.Some (uu____6021))))))))
end)
in (match (response) with
| FStar_Pervasives_Native.None -> begin
FStar_Util.Inl ("Symbol not found")
end
| FStar_Pervasives_Native.Some (info) -> begin
FStar_Util.Inr (info)
end)))))))))


let run_option_lookup : Prims.string  ->  (Prims.string, (Prims.string * (Prims.string * FStar_Util.json) Prims.list)) FStar_Util.either = (fun opt_name -> (

let uu____6138 = (trim_option_name opt_name)
in (match (uu____6138) with
| (uu____6157, trimmed_name) -> begin
(

let uu____6159 = (FStar_Util.smap_try_find fstar_options_map_cache trimmed_name)
in (match (uu____6159) with
| FStar_Pervasives_Native.None -> begin
FStar_Util.Inl ((Prims.strcat "Unknown option:" opt_name))
end
| FStar_Pervasives_Native.Some (opt) -> begin
(

let uu____6187 = (

let uu____6198 = (

let uu____6205 = (update_option opt)
in (alist_of_fstar_option uu____6205))
in (("option"), (uu____6198)))
in FStar_Util.Inr (uu____6187))
end))
end)))


let run_module_lookup : repl_state  ->  Prims.string  ->  (Prims.string, (Prims.string * (Prims.string * FStar_Util.json) Prims.list)) FStar_Util.either = (fun st symbol -> (

let query = (FStar_Util.split symbol ".")
in (

let uu____6247 = (FStar_Interactive_CompletionTable.find_module_or_ns st.repl_names query)
in (match (uu____6247) with
| FStar_Pervasives_Native.None -> begin
FStar_Util.Inl ("No such module or namespace")
end
| FStar_Pervasives_Native.Some (FStar_Interactive_CompletionTable.Module (mod_info)) -> begin
(

let uu____6275 = (

let uu____6286 = (FStar_Interactive_CompletionTable.alist_of_mod_info mod_info)
in (("module"), (uu____6286)))
in FStar_Util.Inr (uu____6275))
end
| FStar_Pervasives_Native.Some (FStar_Interactive_CompletionTable.Namespace (ns_info)) -> begin
(

let uu____6310 = (

let uu____6321 = (FStar_Interactive_CompletionTable.alist_of_ns_info ns_info)
in (("namespace"), (uu____6321)))
in FStar_Util.Inr (uu____6310))
end))))


let run_code_lookup : repl_state  ->  Prims.string  ->  (Prims.string * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  Prims.string Prims.list  ->  (Prims.string, (Prims.string * (Prims.string * FStar_Util.json) Prims.list)) FStar_Util.either = (fun st symbol pos_opt requested_info -> (

let uu____6394 = (run_symbol_lookup st symbol pos_opt requested_info)
in (match (uu____6394) with
| FStar_Util.Inr (alist) -> begin
FStar_Util.Inr (alist)
end
| FStar_Util.Inl (uu____6454) -> begin
(

let uu____6465 = (run_module_lookup st symbol)
in (match (uu____6465) with
| FStar_Util.Inr (alist) -> begin
FStar_Util.Inr (alist)
end
| FStar_Util.Inl (err_msg) -> begin
FStar_Util.Inl ("No such symbol, module, or namespace.")
end))
end)))


let run_lookup' : repl_state  ->  Prims.string  ->  lookup_context  ->  (Prims.string * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  Prims.string Prims.list  ->  (Prims.string, (Prims.string * (Prims.string * FStar_Util.json) Prims.list)) FStar_Util.either = (fun st symbol context pos_opt requested_info -> (match (context) with
| LKSymbolOnly -> begin
(run_symbol_lookup st symbol pos_opt requested_info)
end
| LKModule -> begin
(run_module_lookup st symbol)
end
| LKOption -> begin
(run_option_lookup symbol)
end
| LKCode -> begin
(run_code_lookup st symbol pos_opt requested_info)
end))


let run_lookup : 'Auu____6626 . repl_state  ->  Prims.string  ->  lookup_context  ->  (Prims.string * Prims.int * Prims.int) FStar_Pervasives_Native.option  ->  Prims.string Prims.list  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____6626) FStar_Util.either) = (fun st symbol context pos_opt requested_info -> (

let uu____6679 = (run_lookup' st symbol context pos_opt requested_info)
in (match (uu____6679) with
| FStar_Util.Inl (err_msg) -> begin
((((QueryNOK), (FStar_Util.JsonStr (err_msg)))), (FStar_Util.Inl (st)))
end
| FStar_Util.Inr (kind, info) -> begin
((((QueryOK), (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr (kind))))::info)))), (FStar_Util.Inl (st)))
end)))


let code_autocomplete_mod_filter : 'Auu____6765 . ('Auu____6765 * FStar_Interactive_CompletionTable.mod_symbol)  ->  ('Auu____6765 * FStar_Interactive_CompletionTable.mod_symbol) FStar_Pervasives_Native.option = (fun uu___255_6779 -> (match (uu___255_6779) with
| (uu____6784, FStar_Interactive_CompletionTable.Namespace (uu____6785)) -> begin
FStar_Pervasives_Native.None
end
| (uu____6790, FStar_Interactive_CompletionTable.Module ({FStar_Interactive_CompletionTable.mod_name = uu____6791; FStar_Interactive_CompletionTable.mod_path = uu____6792; FStar_Interactive_CompletionTable.mod_loaded = true})) -> begin
FStar_Pervasives_Native.None
end
| (pth, FStar_Interactive_CompletionTable.Module (md)) -> begin
(

let uu____6799 = (

let uu____6804 = (

let uu____6805 = (

let uu___273_6806 = md
in (

let uu____6807 = (

let uu____6808 = (FStar_Interactive_CompletionTable.mod_name md)
in (Prims.strcat uu____6808 "."))
in {FStar_Interactive_CompletionTable.mod_name = uu____6807; FStar_Interactive_CompletionTable.mod_path = uu___273_6806.FStar_Interactive_CompletionTable.mod_path; FStar_Interactive_CompletionTable.mod_loaded = uu___273_6806.FStar_Interactive_CompletionTable.mod_loaded}))
in FStar_Interactive_CompletionTable.Module (uu____6805))
in ((pth), (uu____6804)))
in FStar_Pervasives_Native.Some (uu____6799))
end))


let run_code_autocomplete : 'Auu____6819 . repl_state  ->  Prims.string  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____6819) FStar_Util.either) = (fun st search_term -> (

let needle = (FStar_Util.split search_term ".")
in (

let mods_and_nss = (FStar_Interactive_CompletionTable.autocomplete_mod_or_ns st.repl_names needle code_autocomplete_mod_filter)
in (

let lids = (FStar_Interactive_CompletionTable.autocomplete_lid st.repl_names needle)
in (

let json = (FStar_List.map FStar_Interactive_CompletionTable.json_of_completion_result (FStar_List.append lids mods_and_nss))
in ((((QueryOK), (FStar_Util.JsonList (json)))), (FStar_Util.Inl (st))))))))


let run_module_autocomplete : 'Auu____6874 'Auu____6875 'Auu____6876 . repl_state  ->  Prims.string  ->  'Auu____6876  ->  'Auu____6875  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____6874) FStar_Util.either) = (fun st search_term modules1 namespaces -> (

let needle = (FStar_Util.split search_term ".")
in (

let mods_and_nss = (FStar_Interactive_CompletionTable.autocomplete_mod_or_ns st.repl_names needle (fun _0_78 -> FStar_Pervasives_Native.Some (_0_78)))
in (

let json = (FStar_List.map FStar_Interactive_CompletionTable.json_of_completion_result mods_and_nss)
in ((((QueryOK), (FStar_Util.JsonList (json)))), (FStar_Util.Inl (st)))))))


let candidates_of_fstar_option : Prims.int  ->  Prims.bool  ->  fstar_option  ->  FStar_Interactive_CompletionTable.completion_result Prims.list = (fun match_len is_reset opt -> (

let uu____6940 = (match (opt.opt_permission_level) with
| OptSet -> begin
((true), (""))
end
| OptReset -> begin
((is_reset), ("#reset-only"))
end
| OptReadOnly -> begin
((false), ("read-only"))
end)
in (match (uu____6940) with
| (may_set, explanation) -> begin
(

let opt_type = (kind_of_fstar_option_type opt.opt_type)
in (

let annot = (match (may_set) with
| true -> begin
opt_type
end
| uu____6955 -> begin
(Prims.strcat "(" (Prims.strcat explanation (Prims.strcat " " (Prims.strcat opt_type ")"))))
end)
in (FStar_All.pipe_right opt.opt_snippets (FStar_List.map (fun snippet -> {FStar_Interactive_CompletionTable.completion_match_length = match_len; FStar_Interactive_CompletionTable.completion_candidate = snippet; FStar_Interactive_CompletionTable.completion_annotation = annot})))))
end)))


let run_option_autocomplete : 'Auu____6972 'Auu____6973 . 'Auu____6973  ->  Prims.string  ->  Prims.bool  ->  ((query_status * FStar_Util.json) * ('Auu____6973, 'Auu____6972) FStar_Util.either) = (fun st search_term is_reset -> (

let uu____6998 = (trim_option_name search_term)
in (match (uu____6998) with
| ("--", trimmed_name) -> begin
(

let matcher = (fun opt -> (FStar_Util.starts_with opt.opt_name trimmed_name))
in (

let options = (current_fstar_options matcher)
in (

let match_len = (FStar_String.length search_term)
in (

let collect_candidates = (candidates_of_fstar_option match_len is_reset)
in (

let results = (FStar_List.concatMap collect_candidates options)
in (

let json = (FStar_List.map FStar_Interactive_CompletionTable.json_of_completion_result results)
in ((((QueryOK), (FStar_Util.JsonList (json)))), (FStar_Util.Inl (st)))))))))
end
| (uu____7049, uu____7050) -> begin
((((QueryNOK), (FStar_Util.JsonStr ("Options should start with \'--\'")))), (FStar_Util.Inl (st)))
end)))


let run_autocomplete : 'Auu____7067 . repl_state  ->  Prims.string  ->  completion_context  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____7067) FStar_Util.either) = (fun st search_term context -> (match (context) with
| CKCode -> begin
(run_code_autocomplete st search_term)
end
| CKOption (is_reset) -> begin
(run_option_autocomplete st search_term is_reset)
end
| CKModuleOrNamespace (modules1, namespaces) -> begin
(run_module_autocomplete st search_term modules1 namespaces)
end))


let run_and_rewind : 'Auu____7103 'Auu____7104 . repl_state  ->  (repl_state  ->  'Auu____7104)  ->  ('Auu____7104 * (repl_state, 'Auu____7103) FStar_Util.either) = (fun st task -> (

let env' = (push st.repl_env "#compute")
in (

let results = (FStar_All.try_with (fun uu___275_7138 -> (match (()) with
| () -> begin
(

let uu____7143 = (task st)
in (FStar_All.pipe_left (fun _0_79 -> FStar_Util.Inl (_0_79)) uu____7143))
end)) (fun uu___274_7150 -> (match (uu___274_7150) with
| e -> begin
FStar_Util.Inr (e)
end)))
in ((pop env' "#compute");
(match (results) with
| FStar_Util.Inl (results1) -> begin
((results1), (FStar_Util.Inl (st)))
end
| FStar_Util.Inr (e) -> begin
(FStar_Exn.raise e)
end);
))))


let run_with_parsed_and_tc_term : 'Auu____7195 'Auu____7196 'Auu____7197 . repl_state  ->  Prims.string  ->  'Auu____7197  ->  'Auu____7196  ->  (FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (query_status * FStar_Util.json))  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____7195) FStar_Util.either) = (fun st term line column continuation -> (

let dummy_let_fragment = (fun term1 -> (

let dummy_decl = (FStar_Util.format1 "let __compute_dummy__ = (%s)" term1)
in {FStar_Parser_ParseIt.frag_text = dummy_decl; FStar_Parser_ParseIt.frag_line = (Prims.parse_int "0"); FStar_Parser_ParseIt.frag_col = (Prims.parse_int "0")}))
in (

let find_let_body = (fun ses -> (match (ses) with
| ({FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let ((uu____7281, ({FStar_Syntax_Syntax.lbname = uu____7282; FStar_Syntax_Syntax.lbunivs = univs1; FStar_Syntax_Syntax.lbtyp = uu____7284; FStar_Syntax_Syntax.lbeff = uu____7285; FStar_Syntax_Syntax.lbdef = def})::[]), uu____7287); FStar_Syntax_Syntax.sigrng = uu____7288; FStar_Syntax_Syntax.sigquals = uu____7289; FStar_Syntax_Syntax.sigmeta = uu____7290; FStar_Syntax_Syntax.sigattrs = uu____7291})::[] -> begin
FStar_Pervasives_Native.Some (((univs1), (def)))
end
| uu____7330 -> begin
FStar_Pervasives_Native.None
end))
in (

let parse1 = (fun frag -> (

let uu____7349 = (FStar_Parser_ParseIt.parse (FStar_Util.Inr (frag)))
in (match (uu____7349) with
| FStar_Util.Inl (FStar_Util.Inr (decls), uu____7373) -> begin
FStar_Pervasives_Native.Some (decls)
end
| uu____7418 -> begin
FStar_Pervasives_Native.None
end)))
in (

let desugar = (fun env decls -> (

let uu____7450 = (

let uu____7455 = (FStar_ToSyntax_ToSyntax.decls_to_sigelts decls)
in (uu____7455 env.FStar_TypeChecker_Env.dsenv))
in (FStar_Pervasives_Native.fst uu____7450)))
in (

let typecheck = (fun tcenv decls -> (

let uu____7473 = (FStar_TypeChecker_Tc.tc_decls tcenv decls)
in (match (uu____7473) with
| (ses, uu____7487, uu____7488) -> begin
ses
end)))
in (run_and_rewind st (fun st1 -> (

let tcenv = st1.repl_env
in (

let frag = (dummy_let_fragment term)
in (match (st1.repl_curmod) with
| FStar_Pervasives_Native.None -> begin
((QueryNOK), (FStar_Util.JsonStr ("Current module unset")))
end
| uu____7511 -> begin
(

let uu____7512 = (parse1 frag)
in (match (uu____7512) with
| FStar_Pervasives_Native.None -> begin
((QueryNOK), (FStar_Util.JsonStr ("Could not parse this term")))
end
| FStar_Pervasives_Native.Some (decls) -> begin
(

let aux = (fun uu____7535 -> (

let decls1 = (desugar tcenv decls)
in (

let ses = (typecheck tcenv decls1)
in (match ((find_let_body ses)) with
| FStar_Pervasives_Native.None -> begin
((QueryNOK), (FStar_Util.JsonStr ("Typechecking yielded an unexpected term")))
end
| FStar_Pervasives_Native.Some (univs1, def) -> begin
(

let uu____7570 = (FStar_Syntax_Subst.open_univ_vars univs1 def)
in (match (uu____7570) with
| (univs2, def1) -> begin
(

let tcenv1 = (FStar_TypeChecker_Env.push_univ_vars tcenv univs2)
in (continuation tcenv1 def1))
end))
end))))
in (

let uu____7582 = (FStar_Options.trace_error ())
in (match (uu____7582) with
| true -> begin
(aux ())
end
| uu____7587 -> begin
(FStar_All.try_with (fun uu___277_7593 -> (match (()) with
| () -> begin
(aux ())
end)) (fun uu___276_7601 -> (match (uu___276_7601) with
| e -> begin
(

let uu____7607 = (

let uu____7608 = (FStar_Errors.issue_of_exn e)
in (match (uu____7608) with
| FStar_Pervasives_Native.Some (issue) -> begin
(

let uu____7612 = (FStar_Errors.format_issue issue)
in FStar_Util.JsonStr (uu____7612))
end
| FStar_Pervasives_Native.None -> begin
(FStar_Exn.raise e)
end))
in ((QueryNOK), (uu____7607)))
end)))
end)))
end))
end)))))))))))


let run_compute : 'Auu____7621 . repl_state  ->  Prims.string  ->  FStar_TypeChecker_Normalize.step Prims.list FStar_Pervasives_Native.option  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____7621) FStar_Util.either) = (fun st term rules -> (

let rules1 = (FStar_List.append (match (rules) with
| FStar_Pervasives_Native.Some (rules1) -> begin
rules1
end
| FStar_Pervasives_Native.None -> begin
(FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Iota)::(FStar_TypeChecker_Normalize.Zeta)::(FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]
end) ((FStar_TypeChecker_Normalize.Inlining)::(FStar_TypeChecker_Normalize.Eager_unfolding)::(FStar_TypeChecker_Normalize.Primops)::[]))
in (

let normalize_term1 = (fun tcenv rules2 t -> (FStar_TypeChecker_Normalize.normalize rules2 tcenv t))
in (run_with_parsed_and_tc_term st term (Prims.parse_int "0") (Prims.parse_int "0") (fun tcenv def -> (

let normalized = (normalize_term1 tcenv rules1 def)
in (

let uu____7684 = (

let uu____7685 = (term_to_string tcenv normalized)
in FStar_Util.JsonStr (uu____7685))
in ((QueryOK), (uu____7684)))))))))

type search_term' =
| NameContainsStr of Prims.string
| TypeContainsLid of FStar_Ident.lid 
 and search_term =
{st_negate : Prims.bool; st_term : search_term'}


let uu___is_NameContainsStr : search_term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NameContainsStr (_0) -> begin
true
end
| uu____7707 -> begin
false
end))


let __proj__NameContainsStr__item___0 : search_term'  ->  Prims.string = (fun projectee -> (match (projectee) with
| NameContainsStr (_0) -> begin
_0
end))


let uu___is_TypeContainsLid : search_term'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| TypeContainsLid (_0) -> begin
true
end
| uu____7721 -> begin
false
end))


let __proj__TypeContainsLid__item___0 : search_term'  ->  FStar_Ident.lid = (fun projectee -> (match (projectee) with
| TypeContainsLid (_0) -> begin
_0
end))


let __proj__Mksearch_term__item__st_negate : search_term  ->  Prims.bool = (fun projectee -> (match (projectee) with
| {st_negate = __fname__st_negate; st_term = __fname__st_term} -> begin
__fname__st_negate
end))


let __proj__Mksearch_term__item__st_term : search_term  ->  search_term' = (fun projectee -> (match (projectee) with
| {st_negate = __fname__st_negate; st_term = __fname__st_term} -> begin
__fname__st_term
end))


let st_cost : search_term'  ->  Prims.int = (fun uu___256_7745 -> (match (uu___256_7745) with
| NameContainsStr (str) -> begin
(~- ((FStar_String.length str)))
end
| TypeContainsLid (lid) -> begin
(Prims.parse_int "1")
end))

type search_candidate =
{sc_lid : FStar_Ident.lid; sc_typ : FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option FStar_ST.ref; sc_fvars : FStar_Ident.lid FStar_Util.set FStar_Pervasives_Native.option FStar_ST.ref}


let __proj__Mksearch_candidate__item__sc_lid : search_candidate  ->  FStar_Ident.lid = (fun projectee -> (match (projectee) with
| {sc_lid = __fname__sc_lid; sc_typ = __fname__sc_typ; sc_fvars = __fname__sc_fvars} -> begin
__fname__sc_lid
end))


let __proj__Mksearch_candidate__item__sc_typ : search_candidate  ->  FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option FStar_ST.ref = (fun projectee -> (match (projectee) with
| {sc_lid = __fname__sc_lid; sc_typ = __fname__sc_typ; sc_fvars = __fname__sc_fvars} -> begin
__fname__sc_typ
end))


let __proj__Mksearch_candidate__item__sc_fvars : search_candidate  ->  FStar_Ident.lid FStar_Util.set FStar_Pervasives_Native.option FStar_ST.ref = (fun projectee -> (match (projectee) with
| {sc_lid = __fname__sc_lid; sc_typ = __fname__sc_typ; sc_fvars = __fname__sc_fvars} -> begin
__fname__sc_fvars
end))


let sc_of_lid : FStar_Ident.lid  ->  search_candidate = (fun lid -> (

let uu____7913 = (FStar_Util.mk_ref FStar_Pervasives_Native.None)
in (

let uu____7920 = (FStar_Util.mk_ref FStar_Pervasives_Native.None)
in {sc_lid = lid; sc_typ = uu____7913; sc_fvars = uu____7920})))


let sc_typ : FStar_TypeChecker_Env.env  ->  search_candidate  ->  FStar_Syntax_Syntax.typ = (fun tcenv sc -> (

let uu____7969 = (FStar_ST.op_Bang sc.sc_typ)
in (match (uu____7969) with
| FStar_Pervasives_Native.Some (t) -> begin
t
end
| FStar_Pervasives_Native.None -> begin
(

let typ = (

let uu____8026 = (FStar_TypeChecker_Env.try_lookup_lid tcenv sc.sc_lid)
in (match (uu____8026) with
| FStar_Pervasives_Native.None -> begin
(FStar_Syntax_Syntax.mk FStar_Syntax_Syntax.Tm_unknown FStar_Pervasives_Native.None FStar_Range.dummyRange)
end
| FStar_Pervasives_Native.Some ((uu____8047, typ), uu____8049) -> begin
typ
end))
in ((FStar_ST.op_Colon_Equals sc.sc_typ (FStar_Pervasives_Native.Some (typ)));
typ;
))
end)))


let sc_fvars : FStar_TypeChecker_Env.env  ->  search_candidate  ->  FStar_Ident.lid FStar_Util.set = (fun tcenv sc -> (

let uu____8125 = (FStar_ST.op_Bang sc.sc_fvars)
in (match (uu____8125) with
| FStar_Pervasives_Native.Some (fv) -> begin
fv
end
| FStar_Pervasives_Native.None -> begin
(

let fv = (

let uu____8196 = (sc_typ tcenv sc)
in (FStar_Syntax_Free.fvars uu____8196))
in ((FStar_ST.op_Colon_Equals sc.sc_fvars (FStar_Pervasives_Native.Some (fv)));
fv;
))
end)))


let json_of_search_result : FStar_TypeChecker_Env.env  ->  search_candidate  ->  FStar_Util.json = (fun tcenv sc -> (

let typ_str = (

let uu____8263 = (sc_typ tcenv sc)
in (term_to_string tcenv uu____8263))
in (

let uu____8264 = (

let uu____8271 = (

let uu____8276 = (

let uu____8277 = (

let uu____8278 = (FStar_ToSyntax_Env.shorten_lid tcenv.FStar_TypeChecker_Env.dsenv sc.sc_lid)
in uu____8278.FStar_Ident.str)
in FStar_Util.JsonStr (uu____8277))
in (("lid"), (uu____8276)))
in (uu____8271)::((("type"), (FStar_Util.JsonStr (typ_str))))::[])
in FStar_Util.JsonAssoc (uu____8264))))

exception InvalidSearch of (Prims.string)


let uu___is_InvalidSearch : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| InvalidSearch (uu____8298) -> begin
true
end
| uu____8299 -> begin
false
end))


let __proj__InvalidSearch__item__uu___ : Prims.exn  ->  Prims.string = (fun projectee -> (match (projectee) with
| InvalidSearch (uu____8307) -> begin
uu____8307
end))


let run_search : 'Auu____8314 . repl_state  ->  Prims.string  ->  ((query_status * FStar_Util.json) * (repl_state, 'Auu____8314) FStar_Util.either) = (fun st search_str -> (

let tcenv = st.repl_env
in (

let empty_fv_set = (FStar_Syntax_Syntax.new_fv_set ())
in (

let st_matches = (fun candidate term -> (

let found = (match (term.st_term) with
| NameContainsStr (str) -> begin
(FStar_Util.contains candidate.sc_lid.FStar_Ident.str str)
end
| TypeContainsLid (lid) -> begin
(

let uu____8349 = (sc_fvars tcenv candidate)
in (FStar_Util.set_mem lid uu____8349))
end)
in (Prims.op_disEquality found term.st_negate)))
in (

let parse1 = (fun search_str1 -> (

let parse_one = (fun term -> (

let negate = (FStar_Util.starts_with term "-")
in (

let term1 = (match (negate) with
| true -> begin
(FStar_Util.substring_from term (Prims.parse_int "1"))
end
| uu____8364 -> begin
term
end)
in (

let beg_quote = (FStar_Util.starts_with term1 "\"")
in (

let end_quote = (FStar_Util.ends_with term1 "\"")
in (

let strip_quotes = (fun str -> (match (((FStar_String.length str) < (Prims.parse_int "2"))) with
| true -> begin
(FStar_Exn.raise (InvalidSearch ("Empty search term")))
end
| uu____8371 -> begin
(FStar_Util.substring str (Prims.parse_int "1") ((FStar_String.length term1) - (Prims.parse_int "2")))
end))
in (

let parsed = (match ((Prims.op_disEquality beg_quote end_quote)) with
| true -> begin
(

let uu____8373 = (

let uu____8374 = (FStar_Util.format1 "Improperly quoted search term: %s" term1)
in InvalidSearch (uu____8374))
in (FStar_Exn.raise uu____8373))
end
| uu____8375 -> begin
(match (beg_quote) with
| true -> begin
(

let uu____8376 = (strip_quotes term1)
in NameContainsStr (uu____8376))
end
| uu____8377 -> begin
(

let lid = (FStar_Ident.lid_of_str term1)
in (

let uu____8379 = (FStar_ToSyntax_Env.resolve_to_fully_qualified_name tcenv.FStar_TypeChecker_Env.dsenv lid)
in (match (uu____8379) with
| FStar_Pervasives_Native.None -> begin
(

let uu____8382 = (

let uu____8383 = (FStar_Util.format1 "Unknown identifier: %s" term1)
in InvalidSearch (uu____8383))
in (FStar_Exn.raise uu____8382))
end
| FStar_Pervasives_Native.Some (lid1) -> begin
TypeContainsLid (lid1)
end)))
end)
end)
in {st_negate = negate; st_term = parsed})))))))
in (

let terms = (FStar_List.map parse_one (FStar_Util.split search_str1 " "))
in (

let cmp = (fun x y -> ((st_cost x.st_term) - (st_cost y.st_term)))
in (FStar_Util.sort_with cmp terms)))))
in (

let pprint_one = (fun term -> (

let uu____8399 = (match (term.st_term) with
| NameContainsStr (s) -> begin
(FStar_Util.format1 "\"%s\"" s)
end
| TypeContainsLid (l) -> begin
(FStar_Util.format1 "%s" l.FStar_Ident.str)
end)
in (Prims.strcat (match (term.st_negate) with
| true -> begin
"-"
end
| uu____8402 -> begin
""
end) uu____8399)))
in (

let results = (FStar_All.try_with (fun uu___279_8423 -> (match (()) with
| () -> begin
(

let terms = (parse1 search_str)
in (

let all_lidents = (FStar_TypeChecker_Env.lidents tcenv)
in (

let all_candidates = (FStar_List.map sc_of_lid all_lidents)
in (

let matches_all = (fun candidate -> (FStar_List.for_all (st_matches candidate) terms))
in (

let cmp = (fun r1 r2 -> (FStar_Util.compare r1.sc_lid.FStar_Ident.str r2.sc_lid.FStar_Ident.str))
in (

let results = (FStar_List.filter matches_all all_candidates)
in (

let sorted1 = (FStar_Util.sort_with cmp results)
in (

let js = (FStar_List.map (json_of_search_result tcenv) sorted1)
in (match (results) with
| [] -> begin
(

let kwds = (

let uu____8462 = (FStar_List.map pprint_one terms)
in (FStar_Util.concat_l " " uu____8462))
in (

let uu____8465 = (

let uu____8466 = (FStar_Util.format1 "No results found for query [%s]" kwds)
in InvalidSearch (uu____8466))
in (FStar_Exn.raise uu____8465)))
end
| uu____8471 -> begin
((QueryOK), (FStar_Util.JsonList (js)))
end)))))))))
end)) (fun uu___278_8476 -> (match (uu___278_8476) with
| InvalidSearch (s) -> begin
((QueryNOK), (FStar_Util.JsonStr (s)))
end)))
in ((results), (FStar_Util.Inl (st))))))))))


let run_query : repl_state  ->  query'  ->  ((query_status * FStar_Util.json) * (repl_state, Prims.int) FStar_Util.either) = (fun st q -> (match (q) with
| Exit -> begin
(run_exit st)
end
| DescribeProtocol -> begin
(run_describe_protocol st)
end
| DescribeRepl -> begin
(run_describe_repl st)
end
| GenericError (message) -> begin
(run_generic_error st message)
end
| ProtocolViolation (query) -> begin
(run_protocol_violation st query)
end
| Segment (c) -> begin
(run_segment st c)
end
| VfsAdd (fname, contents) -> begin
(run_vfs_add st fname contents)
end
| Push (pquery) -> begin
(run_push st pquery)
end
| Pop -> begin
(run_pop st)
end
| AutoComplete (search_term, context) -> begin
(run_autocomplete st search_term context)
end
| Lookup (symbol, context, pos_opt, rq_info) -> begin
(run_lookup st symbol context pos_opt rq_info)
end
| Compute (term, rules) -> begin
(run_compute st term rules)
end
| Search (term) -> begin
(run_search st term)
end))


let validate_query : repl_state  ->  query  ->  query = (fun st q -> (match (q.qq) with
| Push ({push_kind = SyntaxCheck; push_code = uu____8565; push_line = uu____8566; push_column = uu____8567; push_peek_only = false}) -> begin
{qq = ProtocolViolation ("Cannot use \'kind\': \'syntax\' with \'query\': \'push\'"); qid = q.qid}
end
| uu____8568 -> begin
(match (st.repl_curmod) with
| FStar_Pervasives_Native.None when (query_needs_current_module q.qq) -> begin
{qq = GenericError ("Current module unset"); qid = q.qid}
end
| uu____8569 -> begin
q
end)
end))


let rec go : repl_state  ->  Prims.int = (fun st -> (

let rec loop = (fun st1 -> (

let query = (

let uu____8579 = (read_interactive_query st1.repl_stdin)
in (validate_query st1 uu____8579))
in (

let uu____8580 = (run_query st1 query.qq)
in (match (uu____8580) with
| ((status, response), state_opt) -> begin
((write_response query.qid status response);
(match (state_opt) with
| FStar_Util.Inl (st') -> begin
(loop st')
end
| FStar_Util.Inr (exitcode) -> begin
(FStar_Exn.raise (ExitREPL (exitcode)))
end);
)
end))))
in (

let uu____8611 = (FStar_Options.trace_error ())
in (match (uu____8611) with
| true -> begin
(loop st)
end
| uu____8612 -> begin
(FStar_All.try_with (fun uu___281_8614 -> (match (()) with
| () -> begin
(loop st)
end)) (fun uu___280_8617 -> (match (uu___280_8617) with
| ExitREPL (n1) -> begin
n1
end)))
end))))


let interactive_error_handler : FStar_Errors.error_handler = (

let issues = (FStar_Util.mk_ref [])
in (

let add_one1 = (fun e -> (

let uu____8630 = (

let uu____8633 = (FStar_ST.op_Bang issues)
in (e)::uu____8633)
in (FStar_ST.op_Colon_Equals issues uu____8630)))
in (

let count_errors = (fun uu____8767 -> (

let uu____8768 = (

let uu____8771 = (FStar_ST.op_Bang issues)
in (FStar_List.filter (fun e -> (Prims.op_Equality e.FStar_Errors.issue_level FStar_Errors.EError)) uu____8771))
in (FStar_List.length uu____8768)))
in (

let report1 = (fun uu____8845 -> (

let uu____8846 = (FStar_ST.op_Bang issues)
in (FStar_List.sortWith FStar_Errors.compare_issues uu____8846)))
in (

let clear1 = (fun uu____8916 -> (FStar_ST.op_Colon_Equals issues []))
in {FStar_Errors.eh_add_one = add_one1; FStar_Errors.eh_count_errors = count_errors; FStar_Errors.eh_report = report1; FStar_Errors.eh_clear = clear1})))))


let interactive_printer : FStar_Util.printer = {FStar_Util.printer_prinfo = (fun s -> (write_message "info" (FStar_Util.JsonStr (s)))); FStar_Util.printer_prwarning = (fun s -> (write_message "warning" (FStar_Util.JsonStr (s)))); FStar_Util.printer_prerror = (fun s -> (write_message "error" (FStar_Util.JsonStr (s)))); FStar_Util.printer_prgeneric = (fun label1 get_string get_json -> (

let uu____9003 = (get_json ())
in (write_message label1 uu____9003)))}


let initial_range : FStar_Range.range = (

let uu____9004 = (FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0"))
in (

let uu____9005 = (FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0"))
in (FStar_Range.mk_range "<input>" uu____9004 uu____9005)))


let interactive_mode' : Prims.string  ->  Prims.unit = (fun filename -> ((write_hello ());
(

let env = (FStar_Universal.init_env ())
in (

let env1 = (FStar_TypeChecker_Env.set_range env initial_range)
in (

let init_st = (

let uu____9014 = (FStar_Util.open_stdin ())
in {repl_line = (Prims.parse_int "1"); repl_column = (Prims.parse_int "0"); repl_fname = filename; repl_deps_stack = []; repl_curmod = FStar_Pervasives_Native.None; repl_env = env1; repl_stdin = uu____9014; repl_names = FStar_Interactive_CompletionTable.empty})
in (

let exit_code = (

let uu____9020 = ((FStar_Options.record_hints ()) || (FStar_Options.use_hints ()))
in (match (uu____9020) with
| true -> begin
(

let uu____9021 = (

let uu____9022 = (FStar_Options.file_list ())
in (FStar_List.hd uu____9022))
in (FStar_SMTEncoding_Solver.with_hints_db uu____9021 (fun uu____9026 -> (go init_st))))
end
| uu____9027 -> begin
(go init_st)
end))
in (FStar_All.exit exit_code)))));
))


let interactive_mode : Prims.string  ->  Prims.unit = (fun filename -> ((FStar_Util.set_printer interactive_printer);
(

let uu____9034 = (

let uu____9035 = (FStar_Options.verify_module ())
in (Prims.op_disEquality uu____9035 []))
in (match (uu____9034) with
| true -> begin
(FStar_Util.print_warning "--ide: ignoring --verify_module")
end
| uu____9040 -> begin
()
end));
(

let uu____9042 = (

let uu____9043 = (FStar_Options.codegen ())
in (FStar_Option.isSome uu____9043))
in (match (uu____9042) with
| true -> begin
(FStar_Util.print_warning "--ide: ignoring --codegen")
end
| uu____9046 -> begin
()
end));
(

let uu____9047 = (FStar_Options.trace_error ())
in (match (uu____9047) with
| true -> begin
(interactive_mode' filename)
end
| uu____9048 -> begin
(FStar_All.try_with (fun uu___283_9051 -> (match (()) with
| () -> begin
((FStar_Errors.set_handler interactive_error_handler);
(interactive_mode' filename);
)
end)) (fun uu___282_9056 -> (match (uu___282_9056) with
| e -> begin
((FStar_Errors.set_handler FStar_Errors.default_handler);
(FStar_Exn.raise e);
)
end)))
end));
))




