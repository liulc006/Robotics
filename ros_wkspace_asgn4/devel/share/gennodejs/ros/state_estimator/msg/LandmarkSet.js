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

class LandmarkSet {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.landmarks = null;
    }
    else {
      if (initObj.hasOwnProperty('landmarks')) {
        this.landmarks = initObj.landmarks
      }
      else {
        this.landmarks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LandmarkSet
    // Serialize message field [landmarks]
    // Serialize the length for message field [landmarks]
    bufferOffset = _serializer.uint32(obj.landmarks.length, buffer, bufferOffset);
    obj.landmarks.forEach((val) => {
      bufferOffset = Landmark.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LandmarkSet
    let len;
    let data = new LandmarkSet(null);
    // Deserialize message field [landmarks]
    // Deserialize array length for message field [landmarks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.landmarks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.landmarks[i] = Landmark.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.landmarks.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'state_estimator/LandmarkSet';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2e42ef07fd19a8de8b0770685a8090aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    state_estimator/Landmark[] landmarks
    
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
    const resolved = new LandmarkSet(null);
    if (msg.landmarks !== undefined) {
      resolved.landmarks = new Array(msg.landmarks.length);
      for (let i = 0; i < resolved.landmarks.length; ++i) {
        resolved.landmarks[i] = Landmark.Resolve(msg.landmarks[i]);
      }
    }
    else {
      resolved.landmarks = []
    }

    return resolved;
    }
};

module.exports = LandmarkSet;
