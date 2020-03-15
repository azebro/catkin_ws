// Generated by gencpp from file assignment1/TurtleSpawnRequest.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_TURTLESPAWNREQUEST_H
#define ASSIGNMENT1_MESSAGE_TURTLESPAWNREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace assignment1
{
template <class ContainerAllocator>
struct TurtleSpawnRequest_
{
  typedef TurtleSpawnRequest_<ContainerAllocator> Type;

  TurtleSpawnRequest_()
    : name()
    , x(0.0)
    , y(0.0)
    , theta(0.0)
    , random(false)  {
    }
  TurtleSpawnRequest_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , x(0.0)
    , y(0.0)
    , theta(0.0)
    , random(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _theta_type;
  _theta_type theta;

   typedef uint8_t _random_type;
  _random_type random;





  typedef boost::shared_ptr< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TurtleSpawnRequest_

typedef ::assignment1::TurtleSpawnRequest_<std::allocator<void> > TurtleSpawnRequest;

typedef boost::shared_ptr< ::assignment1::TurtleSpawnRequest > TurtleSpawnRequestPtr;
typedef boost::shared_ptr< ::assignment1::TurtleSpawnRequest const> TurtleSpawnRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment1::TurtleSpawnRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace assignment1

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'assignment1': ['/home/adam/catkin_ws/devel/share/assignment1/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "73b1ff5f73e4e90529e192e76d14b0cb";
  }

  static const char* value(const ::assignment1::TurtleSpawnRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x73b1ff5f73e4e905ULL;
  static const uint64_t static_value2 = 0x29e192e76d14b0cbULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment1/TurtleSpawnRequest";
  }

  static const char* value(const ::assignment1::TurtleSpawnRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"float32 x\n"
"float32 y\n"
"float32 theta\n"
"bool random\n"
;
  }

  static const char* value(const ::assignment1::TurtleSpawnRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.theta);
      stream.next(m.random);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TurtleSpawnRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment1::TurtleSpawnRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment1::TurtleSpawnRequest_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "theta: ";
    Printer<float>::stream(s, indent + "  ", v.theta);
    s << indent << "random: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.random);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_TURTLESPAWNREQUEST_H
