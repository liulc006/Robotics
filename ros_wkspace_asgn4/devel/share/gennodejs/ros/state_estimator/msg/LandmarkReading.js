// Auto-generated. Do not edit!

// (in-package state_estimator.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Landmark = require('./Landmark.js');

//-----------------------------------------------------------

class LandmarkReading {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.landmark = null;
      this.range = null;
      this.bearing = null;
    }
    else {
      if (initObj.hasOwnProperty('landmark')) {
        this.landmark = initObj.landmark
      }
      else {
        this.landmark = new Landmark();
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0.0;
      }
      if (initObj.hasOwnProperty('bearing')) {
        this.bearing = initObj.bearing
      }
      else {
        this.bearing = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LandmarkReading
    // Serialize message field [landmark]
    bufferOffset = Landmark.serialize(obj.landmark, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float64(obj.range, buffer, bufferOffset);
    // Serialize message field [bearing]
    bufferOffset = _serializer.float64(obj.bearing, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LandmarkReading
    let len;
    let data = new LandmarkReading(null);
    // Deserialize message field [landmark]
    data.landmark = Landmark.deserialize(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bearing]
    data.bearing = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'state_estimator/LandmarkReading';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b6297115c9296944dda00cf56fb301f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new LandmarkReading(null);
    if (msg.landmark !== undefined) {
      resolved.landmark = Landmark.Resolve(msg.landmark)
    }
    else {
      resolved.landmark = new Landmark()
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0.0
    }

    if (msg.bearing !== undefined) {
      resolved.bearing = msg.bearing;
    }
    else {
      resolved.bearing = 0.0
    }

    return resolved;
    }
};

module.exports = LandmarkReading;
