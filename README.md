# SRCSET  

[Blog]()  

NAME  

  srcset - generate sized copies of an image for use with srcset attribute for img elements.

SYNOPSIS

  srcset [-l, -p] [--input path]

DESCRIPTION

  srcset takes an image file or directory of image files and generates multiple resized copies of the image[s] to be used to 
  create responsive images on webpages. By default the command only processes jpg files but the -p flag can be used to
  work with png files instead. The -l flag generates a full range of sizes for use with large images.

  -l large	generate full range of sizes for use with large images.
  -p png    generate png files instead of jpg.
  --input	  path to image file[s]

AUTHOR

  neighborhoodnerd21
