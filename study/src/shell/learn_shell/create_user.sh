#/bin/bash
users="kinggo zr wangye yhb"
for i in $users
do
	useradd --shell /bin/bash $i -m
	echo -e "create user $i\n"
	
	usermod -a $i -G git
	echo -e "add user $i to group git\n"
done
