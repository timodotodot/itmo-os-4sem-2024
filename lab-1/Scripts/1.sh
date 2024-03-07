result = 0

first = 0
second = 0
third = 0

read first
read second
read third

if [[ "$first" -gt "$second" ]]
then result=$first
else result=$second
fi

if [[ "$third" -gt "$result"]]
then result=$third
fi

echo result - $result