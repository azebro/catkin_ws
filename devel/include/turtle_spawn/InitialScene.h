// Generated by gencpp from file turtle_spawn/InitialScene.msg
// DO NOT EDIT!


#ifndef TURTLE_SPAWN_MESSAGE_INITIALSCENE_H
#define TURTLE_SPAWN_MESSAGE_INITIALSCENE_H

#include <ros/service_traits.h>


#include <turtle_spawn/InitialSceneRequest.h>
#include <turtle_spawn/InitialSceneResponse.h>


namespace turtle_spawn
{

struct InitialScene
{

typedef InitialSceneRequest Request;
typedef InitialSceneResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct InitialScene
} // namespace turtle_spawn


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::turtle_spawn::InitialScene > {
  static const char* value()
  {
    return "5d4fe416861dd7bf8618226c4384cb42";
  }

  static const char* value(const ::turtle_spawn::InitialScene&) { return value(); }
};

template<>
struct DataType< ::turtle_spawn::InitialScene > {
  static const char* value()
  {
    return "turtle_spawn/InitialScene";
  }

  static const char* value(const ::turtle_spawn::InitialScene&) { return value(); }
};


// service_traits::MD5Sum< ::turtle_spawn::InitialSceneRequest> should match
// service_traits::MD5Sum< ::turtle_spawn::InitialScene >
template<>
struct MD5Sum< ::turtle_spawn::InitialSceneRequest>
{
  static const char* value()
  {
    return MD5Sum< ::turtle_spawn::InitialScene >::value();
  }
  static const char* value(const ::turtle_spawn::InitialSceneRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::turtle_spawn::InitialSceneRequest> should match
// service_traits::DataType< ::turtle_spawn::InitialScene >
template<>
struct DataType< ::turtle_spawn::InitialSceneRequest>
{
  static const char* value()
  {
    return DataType< ::turtle_spawn::InitialScene >::value();
  }
  static const char* value(const ::turtle_spawn::InitialSceneRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::turtle_spawn::InitialSceneResponse> should match
// service_traits::MD5Sum< ::turtle_spawn::InitialScene >
template<>
struct MD5Sum< ::turtle_spawn::InitialSceneResponse>
{
  static const char* value()
  {
    return MD5Sum< ::turtle_spawn::InitialScene >::value();
  }
  static const char* value(const ::turtle_spawn::InitialSceneResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::turtle_spawn::InitialSceneResponse> should match
// service_traits::DataType< ::turtle_spawn::InitialScene >
template<>
struct DataType< ::turtle_spawn::InitialSceneResponse>
{
  static const char* value()
  {
    return DataType< ::turtle_spawn::InitialScene >::value();
  }
  static const char* value(const ::turtle_spawn::InitialSceneResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TURTLE_SPAWN_MESSAGE_INITIALSCENE_H
