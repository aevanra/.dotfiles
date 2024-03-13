while getopts m:f:c flag
do
    case "${flag}" in
        m) monitor=${OPTARG};;
        f) file=${OPTARG};;
        c) contain=${OPTARG};;
    esac
done

if [ -z "$contain" ]; then
    contain=""
else
    file="contain:$file"
fi

hyprctl hyprpaper preload $file
hyprctl hyprpaper wallpaper "$monitor,$file"
