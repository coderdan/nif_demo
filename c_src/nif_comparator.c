#include "erl_nif.h"
#include "comparator.h"

static ERL_NIF_TERM
nif_compare(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]) {
  int a, b, result;

  if (argc != 2 ||
      !enif_get_int(env, argv[0], &a) ||
      !enif_get_int(env, argv[1], &b)) {
    return enif_make_badarg(env);
  }

  result = compare(a, b);

  return enif_make_int(env, result);
}

static ErlNifFunc nif_funcs[] = {
  {"compare", 2, nif_compare}
};

ERL_NIF_INIT(Elixir.ExCompare, nif_funcs, NULL, NULL, NULL, NULL)
