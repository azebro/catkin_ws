// Generated by gencpp from file assignment1/ConveyorFeedback.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_CONVEYORFEEDBACK_H
#define ASSIGNMENT1_MESSAGE_CONVEYORFEEDBACK_H


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
struct ConveyorFeedback_
{
  typedef ConveyorFeedback_<ContainerAllocator> Type;

  ConveyorFeedback_()
    : message()  {
    }
  ConveyorFeedback_(const ContainerAllocator& _alloc)
    : message(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::assignment1::ConveyorFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment1::ConveyorFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ConveyorFeedback_

typedef ::assignment1::ConveyorFeedback_<std::allocator<void> > ConveyorFeedback;

typedef boost::shared_ptr< ::assignment1::ConveyorFeedback > ConveyorFeedbackPtr;
typedef boost::shared_ptr< ::assignment1::ConveyorFeedback const> ConveyorFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment1::ConveyorFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment1::ConveyorFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment1::ConveyorFeedback_<ContainerAllocator1> & lhs, const ::assignment1::ConveyorFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.message == rhs.message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment1::ConveyorFeedback_<ContainerAllocator1> & lhs, const ::assignment1::ConveyorFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::ConveyorFeedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::ConveyorFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::ConveyorFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5f003d6bcc824cbd51361d66d8e4f76c";
  }

  static const char* value(const ::assignment1::ConveyorFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5f003d6bcc824cbdULL;
  static const uint64_t static_value2 = 0x51361d66d8e4f76cULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment1/ConveyorFeedback";
  }

  static const char* value(const ::assignment1::ConveyorFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"string message\n"
;
  }

  static const char* value(const ::assignment1::ConveyorFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ConveyorFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment1::ConveyorFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment1::ConveyorFeedback_<ContainerAllocator>& v)
  {
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_CONVEYORFEEDBACK_H
