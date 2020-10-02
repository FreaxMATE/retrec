# Retrec
is a simple script to convert all your music files to mp3 to save space on your phone's memory

### Usage
```bash
./retrec.sh -s, --sourcedir <source directory> -d, --destdir <destination directory>
```
The toplevel directory "sourcedir" containing your music collection will be copied to "destdir" and then all files will be recursively converted to compressed mp3 files.

### Dependencies

 - fd
 - ffmpeg
 - flac
