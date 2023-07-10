#include <opencv2/opencv.hpp>
#include <iostream>

int main() {
    // �̹��� ���� ���
    std::string imagePath = "path_to_your_image";

    // �̹��� ���� �ε�
    cv::Mat image = cv::imread(imagePath, cv::IMREAD_COLOR);

    // �̹����� ���������� �ε�Ǿ����� Ȯ��
    if (image.empty()) {
        std::cout << "�̹����� �ε��� �� �����ϴ�." << std::endl;
        return -1;
    }

    // �̹����� �����쿡 ǥ��
    cv::imshow("Image", image);

    // Ű �Է� ���
    cv::waitKey(0);

    // ������ �ݱ�
    cv::destroyAllWindows();

    return 0;
}
