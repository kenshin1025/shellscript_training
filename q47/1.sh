#!/bin/bash

# numsに書いてある数字の間のハイフンを数字に直して表示する

addSTR() {
  if [ "${#STR}" -ge 1 ]; then
    STR="$STR, $1"
  else
    STR=$1
  fi
}

# ファイルの読み込み
nums=$(<./nums)
split_nums=(${nums//, / })
STR=""
for S in "${split_nums[@]}"; do
  if [[ $S =~ ^.*-.*$ ]]; then
    N=(${S//-/ })
    while [ ${N[0]} -le ${N[1]} ]; do
      addSTR ${N[0]}
      # STR=$(addSTR $STR ${N[0]})
      N[0]=$(expr ${N[0]} + 1)
    done
  else
    addSTR $S
  fi
done
echo $STR
