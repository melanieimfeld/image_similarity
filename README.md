# image_similarity

A code written in Processing exploring different methods to measure image similarity in Processing. For this purpose, a set of test images is compared to a target image. The test image displaying the most similarity with the targetimage is selected.

# Comparison methods
### a) Histogram comparison with Chi-squared distance
The color histogram quantifies the number of pixels for each intensity from 0 to 255 for red, green and blue values in an image. A common way to compare histograms is the Chi-Squared distance. For that purpose, the images are downscaled by a factor of 40 by using resize(). In order to make the intensity of the target image and the test images comparable, the intensity counts are normalized by using the map() function. A score of zero is considered a perfect match.

### b) Pixel to pixel comparison with Euclidean distance
Prior to comparing the images pixel by pixel, all images are downsized by a factor of 40. The RGB-colors are extracted from each pixel from each image and stored in an array. The function euclideanArray() then measures the Euclidean distance 𝑑 between the vector of the target image 𝑝 with the vector 𝑝 of each test image at position 𝑗. In order to compare the images, the sum of all vector distances is taken. An image with a sum of zero for the distances between the target vectors 𝑝 and a test vectors 𝑝 is a perfect match:
𝑑 = 0
In addition, a variance comparison is used to test the distribution similarity. Ranking images by variance prioritizes images where the spread of the compared distances between target and test image is similar, regardless of the actual color distance. This could be useful if images have the same or similar content but a filter masks one of them.

### c) Cosine distance
The Cosine distance method is tested together with the customresize() function that scales the images by a factor of 40. Again, the RGB values from the target and test images are extracted and stored in arrays. The function cosineArray() measures the Cosine distance between the vector of the target image 𝑝 with the vector 𝑝 of each test image at position 𝑗. The highest similarity score is established by:
cos 0𝜋 = 1
A distance of 1 for two compared vectors indicates that they match perfectly, i.e. the angle between them is zero. Hence, the same principle can be applied to the sums of all cosine distances. If the images match perfectly, the sum of all distances will be equal to the number of pixels of the target-image.
