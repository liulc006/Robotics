// Auto-generated. Do not edit!

// (in-package state_estimator.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let LandmarkReading = require('./LandmarkReading.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SensorData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vel_trans = null;
      this.vel_ang = null;
      this.readings = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vel_trans')) {
        this.vel_trans = initObj.vel_trans
      }
      else {
        this.vel_trans = 0.0;
      }
      if (initObj.hasOwnProperty('vel_ang')) {
        this.vel_ang = initObj.vel_ang
      }
      else {
        this.vel_ang = 0.0;
      }
      if (initObj.hasOwnProperty('readings')) {
        this.readings = initObj.readings
      }
      else {
        this.readings = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vel_trans]
    bufferOffset = _serializer.float64(obj.vel_trans, buffer, bufferOffset);
    // Serialize message field [vel_ang]
    bufferOffset = _serializer.float64(obj.vel_ang, buffer, bufferOffset);
    // Serialize message field [readings]
    // Serialize the length for message field [readings]
    bufferOffset = _serializer.uint32(obj.readings.length, buffer, bufferOffset);
    obj.readings.forEach((val) => {
      bufferOffset = LandmarkReading.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorData
    let len;
    let data = new SensorData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vel_trans]
    data.vel_trans = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vel_ang]
    data.vel_ang = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [readings]
    // Deserialize array length for message field [readings]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.readings = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.readings[i] = LandmarkReading.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 32 * object.readings.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'state_estimator/SensorData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '216a9c8ffac46cf3c39b26f16980385c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Message header
    std_msgs/Header header
    
    # The forward translational velocity commanded to the robot
    float64 vel_trans
    
    # The rotational velocity commanded to the robot
    float64 vel_ang
    
    # The readings of landmarks with the range of the robot's sensors
    # Can be empty, if no landmarks are nearby
    state_estimator/LandmarkReading[] readings
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: state_estimator/LandmarkReading
    # The landmark for which this reading was created
    state_estimator/Landmark landmark
    
    # The range from the robot's location to the landmark above
    float64 range
    
    # The bearing of this landmark relative to the robot's orientation
    float64 bearing
    
    ================================================================================
    MSG: state_estimator/Landmark
    # The x coordinate of this landmark
    float64 x
    
    # The y coordinate of this landmark
    float64 y
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vel_trans !== undefined) {
      resolved.vel_trans = msg.vel_trans;
    }
    else {
      resolved.vel_trans = 0.0
    }

    if (msg.vel_ang !== undefined) {
      resolved.vel_ang = msg.vel_ang;
    }
    else {
      resolved.vel_ang = 0.0
    }

    if (msg.readings !== undefined) {
      resolved.readings = new Array(msg.readings.length);
      for (let i = 0; i < resolved.readings.length; ++i) {
        resolved.readings[i] = LandmarkReading.Resolve(msg.readings[i]);
      }
    }
    else {
      resolved.readings = []
    }

    return resolved;
    }
};

module.exports = SensorData;
