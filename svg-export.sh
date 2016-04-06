if [ ! -d "$1" ]; then
    mkdir $1
fi
mkdir $1/mipmap-mdpi $1/mipmap-hdpi $1/mipmap-xhdpi $1/mipmap-xxhdpi \
    $1/mipmap-xxxhdpi

sizes=( 48 72 96 144 192 )
folders=( mdpi hdpi xhdpi xxhdpi xxxhdpi )

for i in {0..4}
do
    inkscape --file $2 --export-png $1/mipmap-${folders[i]}/$3 --export-width \
        ${sizes[i]}
done
