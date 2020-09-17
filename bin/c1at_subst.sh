#!/bin/bash

# Make sure there's at least 1 argument (the template file)
if [ $# -lt 1 ]; then
   echo "usage: c1at_subst templatefile [envfile1 ...]" >&2
   exit 1
fi
templatefile="$1"
shift

# The remaining arguments are variables to source
variables=
for envfile in "$@"; do
   source $envfile
   variables+="$(cut -d= -f1 $envfile) "
   export $variables
done

# List of restricted variables to substitute
envsubst_list="$(printf '${%s} ' $variables)"

# Do substitution
envsubst "$envsubst_list" < $templatefile