#!/bin/bash

# set -o errexit
set -o pipefail

formula_names=()

for file in $(ls *.rb); do
    repos=$(cat $file | ack 'homepage\s+"https://github.com/(.+/.+)"' --output "\$1" -)
    if [ ! -z "$repos" ]; then
        formula_names=("${formula_names[@]}" "$repos")
    fi
done

for formula_name in ${formula_names[@]}; do
    echo $formula_name
    formula_file="${formula_name##*/}.rb"
    latest_ver=$(curl -s -f https://api.github.com/repos/"$formula_name"/releases/latest | grep "tag_name" | cut -d '"' -f 4)
    if [ -z "$latest_ver" ]; then
        echo "latest verison not found"
        exit 1
    fi
    echo "latest verison: ${latest_ver}"
    current_ver=$(grep -wo $formula_file -e "v\d\{0,\}.\d\{0,\}.\d\{0,\}" | head -1)
    if [ -z "$current_ver" ]; then
        echo "current verison not found"
        exit 1
    fi
    echo "current verison: ${current_ver}"
    if [ $current_ver != $latest_ver ]; then
        url=$(cat $formula_file | ack 'url\s+"(http.*)"' --output "\$1" -)
        if [ -z "$url" ]; then
            echo "url not found"
            exit 1
        fi
        latest_url=${url//${current_ver}/${latest_ver}}
        hash=$(curl -L -f --progress-bar "$latest_url" | shasum -a 256)
        if [[ $? -eq 0 && ! -z "$hash" && ${#hash} -gt 64 ]]; then
            hash=${hash%% *}
            sed -i "" "s#${current_ver}#${latest_ver}#g" $formula_file
            sed -i "" -e "s#\(sha256[[:blank:]]*\"\)[[:alnum:]]\{64\}#\1$hash#g" $formula_file
            if [[ ! -z $RUN_ENV && $RUN_ENV == 'github' ]]; then
                git commit $formula_file -m "${formula_name##*/}: update ${latest_ver}"
                git push origin master
            fi
            echo "updated success"
        else
            echo $latest_url
            echo 'get hash fail'
            exit 1
        fi
    fi
done
