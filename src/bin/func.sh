function join_array () { 
  local array_name=$1[@]
  local -a list=("${!array_name}") 
  list=$(printf ",%s" "${list[@]}")
  echo ${list:1}
}

function combine_array () {
  # combine bash array, based on var name
  # AR1 = ( 1 2 4 ); AR2 = ( 1 3 5 )
  # COMBINED=$(combine_array 'AR1', 'AR2')
  # result = ( 1 2 3 4 5 )
  local array1_name=$1[@]
  local array2_name=$2[@]
  local -a array1=("${!array1_name}")
  local -a array2=("${!array2_name}")
  local -a combined=( ${array1[@]} ${array2[@]} )  
  printf '%s\n' "${combined[@]}" | sort -u | uniq
}
