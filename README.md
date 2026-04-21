# SRCSET  

[Blog]()  

NAME  

  srcset - generate sized copies of an image for use with srcset attribute for img elements.

SYNOPSIS

  srcset [-l, -p] [file or directory]

DESCRIPTION

  srcset takes an image file or directory of image files and generates multiple resized copies of the image[s] to be used to 
  create responsive images on webpages. By default the command only processes jpg files but the -p flag can be used to
  work with png files instead. The -l flag generates a full range of sizes for use with large images. srscet accepts input
  from stdin as well, so it can be used in a pipeline with other commands. to work with multiple files, either pipe a list
  to srset or place them in a common directory and pass the directory as an argument.

  -l large	generate full range of sizes for use with large images.
  -p png    generate png files instead of jpg.

AUTHOR

  neighborhoodnerd21
