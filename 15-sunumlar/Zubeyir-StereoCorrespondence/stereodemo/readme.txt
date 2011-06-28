FAST MATLAB STEREO MATCHING ALGORITHM (SAD)
This function performs the computationally expensive step of matching 
two rectified and undistorted stereo images. The output is a dense disparity map. 
If camera parameters are known, this allows for three dimensional reconstruction.
Two graphical user interfaces demonstrate the algorithm.
Please note this function requires the Image Processing Toolbox!
[spdmap, dcost, pcost, wcost] = stereomatch(imgleft, imgright, windowsize, disparity, spacc)
The standard images included are from 
[1] D. Scharstein and R. Szeliski. A taxonomy and evaluation of dense two-frame stereo 
correspondence algorithms. International Journal of Computer Vision, 47(1/2/3):7-42, April-June 2002. 
[2] D. Scharstein and R. Szeliski. High-accuracy stereo depth maps using structured light. 
In IEEE Computer Society Conference on Computer Vision and Pattern Recognition (CVPR 2003), 
volume 1, pages 195-202, Madison, WI, June 2003. 
Please do provide feedback.
