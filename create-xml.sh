#/bin/bash
set -e

folder=images

echo '<?xml version="1.0" encoding="UTF-8"?>' > pardus-wallpaper-yuzyil.xml
echo '<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">' >> pardus-wallpaper-yuzyil.xml
echo '<wallpapers>' >> pardus-wallpaper-yuzyil.xml
for file in $folder/* ; do \
    filename=`basename "$file"` ;\
    echo '  <wallpaper deleted="false">' >> pardus-wallpaper-yuzyil.xml ;\
    echo '    <name>'$filename'</name>' >> pardus-wallpaper-yuzyil.xml ;\
    echo '    <filename>/usr/share/backgrounds/'$filename'</filename>' >> pardus-wallpaper-yuzyil.xml ;\
    if [[ "$filename" == *"-light"* ]]; then
        filenamedark="${filename/-light/-dark}"
        if [[ -f "$folder/$filenamedark" ]]; then
            echo '    <filename-dark>/usr/share/backgrounds/'$filenamedark'</filename-dark>' >> pardus-wallpaper-yuzyil.xml ;\
        else
            echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-wallpaper-yuzyil.xml ;\
        fi
    else
        echo '    <filename-dark>/usr/share/backgrounds/'$filename'</filename-dark>' >> pardus-wallpaper-yuzyil.xml ;\
    fi
    echo '    <options>zoom</options>' >> pardus-wallpaper-yuzyil.xml ;\
    echo '    <shade_type>solid</shade_type>' >> pardus-wallpaper-yuzyil.xml ;\
    echo '    <pcolor>#21aed8</pcolor>' >> pardus-wallpaper-yuzyil.xml ;\
    echo '    <scolor>#000000</scolor>' >> pardus-wallpaper-yuzyil.xml ;\
    echo '  </wallpaper>' >> pardus-wallpaper-yuzyil.xml ;\
done
echo '</wallpapers>' >> pardus-wallpaper-yuzyil.xml
