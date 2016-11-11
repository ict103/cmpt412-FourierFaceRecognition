#################################################################
# READ ME
# cmpt412 FourierFaceRecognition
#################################################################
Download the collection of face images from the link below:
http://www.cl.cam.ac.uk/research/dtg/attarchive/facedatabase.html

To run the code, download the matlab file and the collection of 
face images. Then simply run in using Matlab. 

To test one face against the collage of faces, select one face
(out of 40) by typing "test = read(faceDB(30), 4);" without the
quotations (ie., ""). "faceDB(30)" denotes the face number (there
are 40 faces in total) and "4" denotes the image number (there
are 10 images for each face). Test only one image at a time.

This program tests and displays the test image, then it finds the 
matching face from the collage. The result is displayed in a green
box.
