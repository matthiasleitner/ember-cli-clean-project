delDirs=("dist" "tmp" "node_modules" "bower_components")
backupDirs=("node_modules" "bower_components")
backupSuffix="-backup"

echo "start cleaning project reseting and generated files"

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


for dir in "${delDirs[@]}"
do
  :
   echo "deleting $dir"
   rm -rf $dir
done

