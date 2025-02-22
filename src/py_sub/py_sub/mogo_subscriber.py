import rclpy
from rclpy.node import Node
from std_msgs.msg import String


class MogoSubscriber(Node):

    def __init__(self):
        super().__init__('mogo_subscriber')
        self.subscription = self.create_subscription(String,
                                                     'mogo_world_topic',
                                                     self.listen, 10)
        self.subscription

    def listen(self, msg):
        self.get_logger().info('%s' % msg.data)


def main(args=None):
    rclpy.init(args=args)
    mogo_subscriber = MogoSubscriber()
    rclpy.spin(mogo_subscriber)
    mogo_subscriber.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
