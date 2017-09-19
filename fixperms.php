<?php
/**
 * When you call this file it will make all files and directories
 * in it's own directory and all directories below writable by
 * everyone
 *
 * You can use this to (re)gain control on files owned by the
 * apache process.
 *
 * Only use it if you really know that this is what you want.
 * Delete the file immediately after using it!
 */

header("Content-Type: text/plain");

echo "starting...\n";
flush();
traverse(dirname(__FILE__));
echo "finished...\n";

function traverse($dir){
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
            //skip hidden files and upper dirs
            if(preg_match('/^[\._]/',$file)) continue;
            if(is_dir($dir.'/'.$file)){
                if(@chmod($dir.'/'.$file,0777)){
                    echo "chmod 0777 $dir/$file OK\n";
                }else{
                    echo "chmod 0777 $dir/$file FAILED\n";
                }
                flush();
                traverse($dir.'/'.$file);
                continue;
            }
            if(@chmod($dir.'/'.$file,0666)){
                echo "chmod 0666 $dir/$file OK\n";
            }else{
                echo "chmod 0666 $dir/$file FAILED\n";
            }
            flush();
       }
       closedir($dh);
   }
}
?>
