if [ $# -eq 0 ]; then
    echo "A tag argument is needed!(ex: ./copy_sha256 1.2.3)"
    exit 1
fi
tag=$1
echo "Tag: '${tag}'"
filename="${tag}.tar.gz"
echo "Filename: '${filename}'"
curl -LOk "https://github.com/ShotaKashihara/atcoder-cli-swift/archive/${filename}"
result=$(shasum -a 256 $filename)
echo "Result: '${result}'"
sha256=$(echo ${result} | cut -d ' ' -f 1)
echo $sha256 | tr -d '\n' | pbcopy
echo "sha256('${sha256}') was copied to your clipboard🎉"
rm $filename
