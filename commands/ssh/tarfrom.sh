mkdir -p .tarfrom
rm -rf .tarfrom/$2
invoke ssh command $1 tar -cz $2 | tar -xz -C .tarfrom