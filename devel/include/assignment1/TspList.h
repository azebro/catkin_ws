// Generated by gencpp from file assignment1/TspList.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT1_MESSAGE_TSPLIST_H
#define ASSIGNMENT1_MESSAGE_TSPLIST_H

#include <ros/service_traits.h>


#include <assignment1/TspListRequest.h>
#include <assignment1/TspListResponse.h>


namespace assignment1
{

struct TspList
{

typedef TspListRequest Request;
typedef TspListResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct TspList
} // namespace assignment1


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::assignment1::TspList > {
  static const char* value()
  {
    return "479c0bc11d8910d2e80e7da4072f2c4a";
  }

  static const char* value(const ::assignment1::TspList&) { return value(); }
};

template<>
struct DataType< ::assignment1::TspList > {
  static const char* value()
  {
    return "assignment1/TspList";
  }

  static const char* value(const ::assignment1::TspList&) { return value(); }
};


// service_traits::MD5Sum< ::assignment1::TspListRequest> should match 
// service_traits::MD5Sum< ::assignment1::TspList > 
template<>
struct MD5Sum< ::assignment1::TspListRequest>
{
  static const char* value()
  {
    return MD5Sum< ::assignment1::TspList >::value();
  }
  static const char* value(const ::assignment1::TspListRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment1::TspListRequest> should match 
// service_traits::DataType< ::assignment1::TspList > 
template<>
struct DataType< ::assignment1::TspListRequest>
{
  static const char* value()
  {
    return DataType< ::assignment1::TspList >::value();
  }
  static const char* value(const ::assignment1::TspListRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::assignment1::TspListResponse> should match 
// service_traits::MD5Sum< ::assignment1::TspList > 
template<>
struct MD5Sum< ::assignment1::TspListResponse>
{
  static const char* value()
  {
    return MD5Sum< ::assignment1::TspList >::value();
  }
  static const char* value(const ::assignment1::TspListResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignment1::TspListResponse> should match 
// service_traits::DataType< ::assignment1::TspList > 
template<>
struct DataType< ::assignment1::TspListResponse>
{
  static const char* value()
  {
    return DataType< ::assignment1::TspList >::value();
  }
  static const char* value(const ::assignment1::TspListResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ASSIGNMENT1_MESSAGE_TSPLIST_H