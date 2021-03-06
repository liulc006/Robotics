// Generated by gencpp from file state_estimator/SensorData.msg
// DO NOT EDIT!


#ifndef STATE_ESTIMATOR_MESSAGE_SENSORDATA_H
#define STATE_ESTIMATOR_MESSAGE_SENSORDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <state_estimator/LandmarkReading.h>

namespace state_estimator
{
template <class ContainerAllocator>
struct SensorData_
{
  typedef SensorData_<ContainerAllocator> Type;

  SensorData_()
    : header()
    , vel_trans(0.0)
    , vel_ang(0.0)
    , readings()  {
    }
  SensorData_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , vel_trans(0.0)
    , vel_ang(0.0)
    , readings(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _vel_trans_type;
  _vel_trans_type vel_trans;

   typedef double _vel_ang_type;
  _vel_ang_type vel_ang;

   typedef std::vector< ::state_estimator::LandmarkReading_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::state_estimator::LandmarkReading_<ContainerAllocator> >::other >  _readings_type;
  _readings_type readings;





  typedef boost::shared_ptr< ::state_estimator::SensorData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::state_estimator::SensorData_<ContainerAllocator> const> ConstPtr;

}; // struct SensorData_

typedef ::state_estimator::SensorData_<std::allocator<void> > SensorData;

typedef boost::shared_ptr< ::state_estimator::SensorData > SensorDataPtr;
typedef boost::shared_ptr< ::state_estimator::SensorData const> SensorDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::state_estimator::SensorData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::state_estimator::SensorData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::state_estimator::SensorData_<ContainerAllocator1> & lhs, const ::state_estimator::SensorData_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.vel_trans == rhs.vel_trans &&
    lhs.vel_ang == rhs.vel_ang &&
    lhs.readings == rhs.readings;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::state_estimator::SensorData_<ContainerAllocator1> & lhs, const ::state_estimator::SensorData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace state_estimator

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::state_estimator::SensorData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::state_estimator::SensorData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::state_estimator::SensorData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::state_estimator::SensorData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::state_estimator::SensorData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::state_estimator::SensorData_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::state_estimator::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "216a9c8ffac46cf3c39b26f16980385c";
  }

  static const char* value(const ::state_estimator::SensorData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x216a9c8ffac46cf3ULL;
  static const uint64_t static_value2 = 0xc39b26f16980385cULL;
};

template<class ContainerAllocator>
struct DataType< ::state_estimator::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "state_estimator/SensorData";
  }

  static const char* value(const ::state_estimator::SensorData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::state_estimator::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message header\n"
"std_msgs/Header header\n"
"\n"
"# The forward translational velocity commanded to the robot\n"
"float64 vel_trans\n"
"\n"
"# The rotational velocity commanded to the robot\n"
"float64 vel_ang\n"
"\n"
"# The readings of landmarks with the range of the robot's sensors\n"
"# Can be empty, if no landmarks are nearby\n"
"state_estimator/LandmarkReading[] readings\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: state_estimator/LandmarkReading\n"
"# The landmark for which this reading was created\n"
"state_estimator/Landmark landmark\n"
"\n"
"# The range from the robot's location to the landmark above\n"
"float64 range\n"
"\n"
"# The bearing of this landmark relative to the robot's orientation\n"
"float64 bearing\n"
"\n"
"================================================================================\n"
"MSG: state_estimator/Landmark\n"
"# The x coordinate of this landmark\n"
"float64 x\n"
"\n"
"# The y coordinate of this landmark\n"
"float64 y\n"
"\n"
;
  }

  static const char* value(const ::state_estimator::SensorData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::state_estimator::SensorData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.vel_trans);
      stream.next(m.vel_ang);
      stream.next(m.readings);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::state_estimator::SensorData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::state_estimator::SensorData_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "vel_trans: ";
    Printer<double>::stream(s, indent + "  ", v.vel_trans);
    s << indent << "vel_ang: ";
    Printer<double>::stream(s, indent + "  ", v.vel_ang);
    s << indent << "readings[]" << std::endl;
    for (size_t i = 0; i < v.readings.size(); ++i)
    {
      s << indent << "  readings[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::state_estimator::LandmarkReading_<ContainerAllocator> >::stream(s, indent + "    ", v.readings[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // STATE_ESTIMATOR_MESSAGE_SENSORDATA_H
