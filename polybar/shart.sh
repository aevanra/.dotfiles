if pgrep -x animate > /dev/null
then
	id=$(pgrep -x animate)
        kill $id
else
	animate $1
fi
