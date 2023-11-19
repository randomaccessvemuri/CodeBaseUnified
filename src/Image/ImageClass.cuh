//
// Created by acer on 18-11-2023.
//

#ifndef CODEBASEUNIFIED_IMAGECLASS_CUH
#define CODEBASEUNIFIED_IMAGECLASS_CUH
#include <cuda_runtime.h>
#include <opencv4/opencv2/opencv.hpp>

/*!
 * This enum exists to differentiate between the number of channels that the image may have
 *      - RGBA: Red, Green, Blue and Alpha Channels
 *      - RGB: Red, Green and Blue Channels
 *      - MONO: Monochrome, contains only the brightness value for each pixel
 */




namespace CodeBaseUnified{
    namespace Graphics{
        enum imageType{
            RGBA,
            RGB,
            MONO
        };


        class Image{
        public:
            __host__ Image();

            __host__ Image(int height, int width);

            //Setters and Getters
            int getWidth() const;

            void setWidth(int width);

            int getHeight() const;

            void setHeight(int height);

            int *getImage1DArray() const;

            void setImage1DArray(int *image1DArray);

            imageType getImgType() const;

            void setImgType(imageType imgType);


            //Modification

            __device__ __host__ void setPixel(int x, int y, int R, int G, int B);

            __device__ __host__ void setPixel(int x, int y, int brightness);

            __device__ __host__ void setPixel(int x, int y, int R, int G, int B, int A);

            __device__ __host__ void setPixelCartesian(float x, float y, float originX, float originY, float XOffset, float YOffset);

            //Misc.
            __host__ void displayOpenCV();

            __host__ cv::Mat toOpenCVMat();




        private:
            int width;
            int height;
            int* image1DArray;
            imageType imgType;
        };

    }
}


//USER DEFINED ERRORS

#endif //CODEBASEUNIFIED_IMAGECLASS_CUH
