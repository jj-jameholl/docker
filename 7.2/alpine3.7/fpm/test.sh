if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi
echo $@
