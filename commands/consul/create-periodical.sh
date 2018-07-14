cat << EOF | invoke ssh command $1 "cat > consul_dir/periodical.sh"
echo ====================
for i in 1 2 3 4 5
do
	echo i=\$i \$(date "+%H:%M:%S")
	sleep 1
done
EOF

cat << EOF | invoke ssh command $1 "cat > consul_dir/periodical-start.sh"
while :
do
	sleep 1
	consul_dir/consul kv get periodical | grep stop && exit
	/home/cluster/consul_dir/consul lock "periodical" "sh consul_dir/periodical.sh"
done
EOF