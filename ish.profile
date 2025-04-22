# Prompt
cat <<EOF
To sign in as [31mroot[0m, press [1;33mCtrl-C[0m
Otherwise,          press [1;32many key[0m

EOF

# Wait for input
read -rsn1

# Clear screen and change user
clear
exec su simnalamburt -l
