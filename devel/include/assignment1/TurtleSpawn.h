// Generated by gencpp from file assignment1/TurtleSpawn.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_TURTLESPAWN_H
#define ASSIGNMENT1_MESSAGE_TURTLESPAWN_H

#include <ros/service_traits.h>


#include <assignment1/TurtleSpawnRequest.h>
#include <assignment1/TurtleSpawnResponse.h>


namespace assignment1
{

struct TurtleSpawn
{

typedef TurtleSpawnRequest Request;
typedef TurtleSpawnResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TurtleSpawn
} // namespace assignment1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::assignment1::TurtleSpawn > {
  static const char* value()
  {
    return "46c7c113caf86168394082f3d95807e0";
  }

  static const char* value(const ::assignment1::TurtleSpawn&) { return value(); }
};

template<>
struct DataType< ::assignment1::TurtleSpawn > {
  static const char* value()
  {
    return "assignment1/TurtleSpawn";
  }

  static const char* value(const ::assignment1::TurtleSpawn&) { return value(); }
};


// service_traits::MD5Sum< ::assignment1::TurtleSpawnRequest> should match
// service_traits::MD5Sum< ::assignment1::TurtleSpawn >
template<>
struct MD5Sum< ::assignment1::TurtleSpawnRequest>
{
  static const char* value()
  {
    return MD5Sum< ::assignment1::TurtleSpawn >::value();
  }
  static const char* value(const ::assignment1::TurtleSpawnRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment1::TurtleSpawnRequest> should match
// service_traits::DataType< ::assignment1::TurtleSpawn >
template<>
struct DataType< ::assignment1::TurtleSpawnRequest>
{
  static const char* value()
  {
    return DataType< ::assignment1::TurtleSpawn >::value();
  }
  static const char* value(const ::assignment1::TurtleSpawnRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::assignment1::TurtleSpawnResponse> should match
// service_traits::MD5Sum< ::assignment1::TurtleSpawn >
template<>
struct MD5Sum< ::assignment1::TurtleSpawnResponse>
{
  static const char* value()
  {
    return MD5Sum< ::assignment1::TurtleSpawn >::value();
  }
  static const char* value(const ::assignment1::TurtleSpawnResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment1::TurtleSpawnResponse> should match
// service_traits::DataType< ::assignment1::TurtleSpawn >
template<>
struct DataType< ::assignment1::TurtleSpawnResponse>
{
  static const char* value()
  {
    return DataType< ::assignment1::TurtleSpawn >::value();
  }
  static const char* value(const ::assignment1::TurtleSpawnResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_TURTLESPAWN_H
