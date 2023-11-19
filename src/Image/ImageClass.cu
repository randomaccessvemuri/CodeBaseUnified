
#include "ImageClass.cuh"

int CodeBaseUnified::Graphics::Image::getWidth() const {
    return width;
}

void CodeBaseUnified::Graphics::Image::setWidth(int width) {
    Image::width = width;
}

int CodeBaseUnified::Graphics::Image::getHeight() const {
    return height;
}

void CodeBaseUnified::Graphics::Image::setHeight(int height) {
    Image::height = height;
}

int *CodeBaseUnified::Graphics::Image::getImage1DArray() const {
    return image1DArray;
}

void CodeBaseUnified::Graphics::Image::setImage1DArray(int *image1DArray) {
    Image::image1DArray = image1DArray;
}

CodeBaseUnified::Graphics::imageType CodeBaseUnified::Graphics::Image::getImgType() const {
    return imgType;
}

void CodeBaseUnified::Graphics::Image::setImgType(CodeBaseUnified::Graphics::imageType imgType) {
    Image::imgType = imgType;
}
