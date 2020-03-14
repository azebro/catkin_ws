// Generated by gencpp from file assignment1/HuntTurtleGoal.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_HUNTTURTLEGOAL_H
#define ASSIGNMENT1_MESSAGE_HUNTTURTLEGOAL_H


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
struct HuntTurtleGoal_
{
  typedef HuntTurtleGoal_<ContainerAllocator> Type;

  HuntTurtleGoal_()
    : hunterX(0.0)
    , hunterY(0.0)
    , hunterTheta(0.0)
    , hunterName()
    , targetX(0.0)
    , targetY(0.0)
    , targetTheta(0.0)
    , targetName()
    , targetId(0)  {
    }
  HuntTurtleGoal_(const ContainerAllocator& _alloc)
    : hunterX(0.0)
    , hunterY(0.0)
    , hunterTheta(0.0)
    , hunterName(_alloc)
    , targetX(0.0)
    , targetY(0.0)
    , targetTheta(0.0)
    , targetName(_alloc)
    , targetId(0)  {
  (void)_alloc;
    }



   typedef float _hunterX_type;
  _hunterX_type hunterX;

   typedef float _hunterY_type;
  _hunterY_type hunterY;

   typedef float _hunterTheta_type;
  _hunterTheta_type hunterTheta;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _hunterName_type;
  _hunterName_type hunterName;

   typedef float _targetX_type;
  _targetX_type targetX;

   typedef float _targetY_type;
  _targetY_type targetY;

   typedef float _targetTheta_type;
  _targetTheta_type targetTheta;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _targetName_type;
  _targetName_type targetName;

   typedef int32_t _targetId_type;
  _targetId_type targetId;





  typedef boost::shared_ptr< ::assignment1::HuntTurtleGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment1::HuntTurtleGoal_<ContainerAllocator> const> ConstPtr;

}; // struct HuntTurtleGoal_

typedef ::assignment1::HuntTurtleGoal_<std::allocator<void> > HuntTurtleGoal;

typedef boost::shared_ptr< ::assignment1::HuntTurtleGoal > HuntTurtleGoalPtr;
typedef boost::shared_ptr< ::assignment1::HuntTurtleGoal const> HuntTurtleGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment1::HuntTurtleGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::HuntTurtleGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::HuntTurtleGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::HuntTurtleGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0cb907047e6d468ef1ec1e0d0f7d469d";
  }

  static const char* value(const ::assignment1::HuntTurtleGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0cb907047e6d468eULL;
  static const uint64_t static_value2 = 0xf1ec1e0d0f7d469dULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment1/HuntTurtleGoal";
  }

  static const char* value(const ::assignment1::HuntTurtleGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#goal definition\n"
"float32 hunterX\n"
"float32 hunterY\n"
"float32 hunterTheta\n"
"string hunterName\n"
"float32 targetX\n"
"float32 targetY\n"
"float32 targetTheta\n"
"string targetName\n"
"int32 targetId\n"
;
  }

  static const char* value(const ::assignment1::HuntTurtleGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.hunterX);
      stream.next(m.hunterY);
      stream.next(m.hunterTheta);
      stream.next(m.hunterName);
      stream.next(m.targetX);
      stream.next(m.targetY);
      stream.next(m.targetTheta);
      stream.next(m.targetName);
      stream.next(m.targetId);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HuntTurtleGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment1::HuntTurtleGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment1::HuntTurtleGoal_<ContainerAllocator>& v)
  {
    s << indent << "hunterX: ";
    Printer<float>::stream(s, indent + "  ", v.hunterX);
    s << indent << "hunterY: ";
    Printer<float>::stream(s, indent + "  ", v.hunterY);
    s << indent << "hunterTheta: ";
    Printer<float>::stream(s, indent + "  ", v.hunterTheta);
    s << indent << "hunterName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.hunterName);
    s << indent << "targetX: ";
    Printer<float>::stream(s, indent + "  ", v.targetX);
    s << indent << "targetY: ";
    Printer<float>::stream(s, indent + "  ", v.targetY);
    s << indent << "targetTheta: ";
    Printer<float>::stream(s, indent + "  ", v.targetTheta);
    s << indent << "targetName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.targetName);
    s << indent << "targetId: ";
    Printer<int32_t>::stream(s, indent + "  ", v.targetId);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_HUNTTURTLEGOAL_H