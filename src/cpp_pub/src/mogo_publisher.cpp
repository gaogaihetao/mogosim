#include <chrono>
#include <functional>
#include <memory>
#include <string>

#include "std_msgs/msg/string.hpp"

#include "rclcpp/rclcpp.hpp"

using namespace std::chrono_literals;

class MogoPublisher : public rclcpp::Node {
 public:
  MogoPublisher() : Node("mogo_publisher") {
    publisher_ = this->create_publisher<std_msgs::msg::String>("mogo_world_topic", 10);
    timer_ =
        this->create_wall_timer(1s, std::bind(&MogoPublisher::Publish, this));
  }

 private:
  void Publish() {
    std_msgs::msg::String message;
    message.data = "hello mogo";
    RCLCPP_INFO(this->get_logger(), "%s", message.data.c_str());
    publisher_->publish(message);
  }

  rclcpp::Publisher<std_msgs::msg::String>::SharedPtr publisher_;
  rclcpp::TimerBase::SharedPtr timer_;
};

int main(int argc, char* argv[]) {
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MogoPublisher>());
  rclcpp::shutdown();
  return 0;
}
