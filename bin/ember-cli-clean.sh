delDirs=("dist" "tmp" "node_modules" "bower_components")
backupDirs=("node_modules" "bower_components")
backupSuffix="-backup"

echo "start cleaning project reseting and generated files"




while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "$package - attempt to capture frames"
                        echo " "
                        echo "$package [options] application [arguments]"
                        echo " "
                        echo "options:"
                        echo "-h, --help             show brief help"
                        echo "-nb, --no-backup       don't backup dependencies"
                        exit 0
                        ;;
                -b|--backup)
                        shift
                            for dir in "${backupDirs[@]}"
                            do
                              :
                              if [ -d $dir ]
                              then
                                echo "Directory $dir exists. Backing up..."
                                cp -R -f $dir $dir$backupSuffix
                              else
                                echo "Warning: Directory $dir does not exists."
                               fi
                            done
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done

for dir in "${delDirs[@]}"
do
  :
   echo "deleting $dir"
   rm -rf $dir
done

