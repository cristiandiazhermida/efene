-module(fn_to_erl_SUITE).
-compile(export_all).
%-export([eval_to_erl/0]).

-include_lib("stdlib/include/assert.hrl").
-include_lib("proper/include/proper.hrl").

all() -> [eval_to_erl_with_integer_list, eval_to_erl_with_char_list,
          eval_to_erl_with_large_list, eval_to_erl_with_tuple_list,
          eval_to_erl_with_atom_list, eval_to_erl_with_binary_list].

%%%% Test %%%%%

%%%% Testing that function to_erl only works with an empty list
eval_to_erl_with_integer_list(Config) -> 
    try ?FORALL({_, List}, {integer(), list(integer())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.

eval_to_erl_with_large_list(Config) -> 
    try ?FORALL({_, List}, {largeint(), list(largeint())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.

eval_to_erl_with_char_list(Config) -> 
    try ?FORALL({_, List}, {char(), list(char())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.    

eval_to_erl_with_tuple_list(Config) -> 
    try ?FORALL({_, List}, {tuple(), list(tuple())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.    

eval_to_erl_with_atom_list(Config) -> 
    try ?FORALL({_, List}, {atom(), list(atom())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.    

eval_to_erl_with_binary_list(Config) -> 
    try ?FORALL({_, List}, {binary(), list(binary())},
        fn_to_erl:to_erl(List, Config, "."))
    catch 
        Throw -> ?assertError(_, Throw)
    end.    