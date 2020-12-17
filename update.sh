#!/bin/bash

# set -o errexit
set -o pipefail

formula_names=(
    "mkanako/brew-up"
    "IrineSistiana/mosdns"
    "ameshkov/dnslookup"
)

for formula_name in ${formula_names[@]}; do
    echo $formula_name
    formula_file="${formula_name##*/}.rb"
    if [ ! -e $formula_file ]; then
        continue
    fi
    tag=$(curl -s -f https://api.github.com/repos/"$formula_name"/releases/latest | grep "tag_name" | cut -d '"' -f 4)
    if [ -z "$tag" ]; then
        echo "'tag_name' not found"
        exit
    fi
    echo "latest verison: ${tag}"
    verison=$(grep -wo $formula_file -e "${tag//[0-9]/\\d\?}" | head -1)
    if [ -z "$verison" ]; then
        echo "current verison not found"
        exit
    fi
    echo "current verison: ${verison}"
    if [ $verison != $tag ]; then
        url=$(ack 'url\s+"(http.*)"' $formula_file --output "\$1")
        if [ -z "$url" ]; then
            echo "url not found"
            exit
        fi
        new_url=${url//${verison}/${tag}}
        hash=$(curl -L -f --progress-bar "$new_url" | shasum -a 256)
        if [[ $? -eq 0 && ! -z "$hash" && ${#hash} -gt 64 ]]; then
            hash=${hash%% *}
            sed -i "" "s#${verison}#${tag}#g" $formula_file
            sed -i "" -e "s#\(sha256[[:blank:]]*\"\)[[:alnum:]]\{64\}#\1$hash#g" $formula_file
            echo "updated success"
        else
            echo $new_url
            echo 'get hash fail'
            exit
        fi
    fi
done
