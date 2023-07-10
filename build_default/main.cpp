#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // 이미지 파일 경로
    std::string imagePath = "path_to_your_image";

    // 이미지 파일 로드
    cv::Mat image = cv::imread(imagePath, cv::IMREAD_COLOR);

    // 이미지가 성공적으로 로드되었는지 확인
    if (image.empty()) {
        std::cout << "이미지를 로드할 수 없습니다." << std::endl;
        return -1;
    }

    // 이미지를 윈도우에 표시
    cv::imshow("Image", image);

    // 키 입력 대기
    cv::waitKey(0);

    // 윈도우 닫기
    cv::destroyAllWindows();

    return 0;
}
