// Generated by gencpp from file assignment1/StartAssignmentFeedback.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_STARTASSIGNMENTFEEDBACK_H
#define ASSIGNMENT1_MESSAGE_STARTASSIGNMENTFEEDBACK_H


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
struct StartAssignmentFeedback_
{
  typedef StartAssignmentFeedback_<ContainerAllocator> Type;

  StartAssignmentFeedback_()
    : progress()  {
    }
  StartAssignmentFeedback_(const ContainerAllocator& _alloc)
    : progress(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _progress_type;
  _progress_type progress;





  typedef boost::shared_ptr< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct StartAssignmentFeedback_

typedef ::assignment1::StartAssignmentFeedback_<std::allocator<void> > StartAssignmentFeedback;

typedef boost::shared_ptr< ::assignment1::StartAssignmentFeedback > StartAssignmentFeedbackPtr;
typedef boost::shared_ptr< ::assignment1::StartAssignmentFeedback const> StartAssignmentFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment1::StartAssignmentFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment1::StartAssignmentFeedback_<ContainerAllocator1> & lhs, const ::assignment1::StartAssignmentFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.progress == rhs.progress;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment1::StartAssignmentFeedback_<ContainerAllocator1> & lhs, const ::assignment1::StartAssignmentFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4e8180fd8cffb84e555b1c648b3e7287";
  }

  static const char* value(const ::assignment1::StartAssignmentFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4e8180fd8cffb84eULL;
  static const uint64_t static_value2 = 0x555b1c648b3e7287ULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment1/StartAssignmentFeedback";
  }

  static const char* value(const ::assignment1::StartAssignmentFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"#feedback\n"
"string progress\n"
;
  }

  static const char* value(const ::assignment1::StartAssignmentFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.progress);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StartAssignmentFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment1::StartAssignmentFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment1::StartAssignmentFeedback_<ContainerAllocator>& v)
  {
    s << indent << "progress: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.progress);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_STARTASSIGNMENTFEEDBACK_H
