function ffmpeg-convert-43-to-169-fill-blur()
{
  if [ -z "$1" -o -z "$2" ]; then
    echo "Usage: ffmpeg-convert-43-to-169-fill-blur <input-file> <output-file>"
    return 1
  fi
  if [ ! -f "$1" ]; then
    echo "File not found: $1"
    return 1
  fi
  if [ -f "$2" ]; then
    echo "File already exists: $2"
    return 1
  fi
  ffmpeg -i $1 -vf 'split[original][copy];[copy]scale=ih*16/9:-1,crop=h=iw*9/16,gblur=sigma=20[blurred];[blurred][original]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2' $2
}
