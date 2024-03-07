result=""
var=""

while [[ "$var" != "q" ]]; 
do
    result+="$var"
    read var
done

echo "$result"