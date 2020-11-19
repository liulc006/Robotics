// Auto-generated. Do not edit!

// (in-package cartesian_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class CartesianCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_target = null;
      this.secondary_objective = null;
      this.q0_target = null;
    }
    else {
      if (initObj.hasOwnProperty('x_target')) {
        this.x_target = initObj.x_target
      }
      else {
        this.x_target = new geometry_msgs.msg.Transform();
      }
      if (initObj.hasOwnProperty('secondary_objective')) {
        this.secondary_objective = initObj.secondary_objective
      }
      else {
        this.secondary_objective = false;
      }
      if (initObj.hasOwnProperty('q0_target')) {
        this.q0_target = initObj.q0_target
      }
      else {
        this.q0_target = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianCommand
    // Serialize message field [x_target]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.x_target, buffer, bufferOffset);
    // Serialize message field [secondary_objective]
    bufferOffset = _serializer.bool(obj.secondary_objective, buffer, bufferOffset);
    // Serialize message field [q0_target]
    bufferOffset = _serializer.float32(obj.q0_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianCommand
    let len;
    let data = new CartesianCommand(null);
    // Deserialize message field [x_target]
    data.x_target = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [secondary_objective]
    data.secondary_objective = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [q0_target]
    data.q0_target = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 61;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cartesian_control/CartesianCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5ffe3cb2eac6f1acc27e5635f953be7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Transform x_target
    bool secondary_objective
    float32 q0_target
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianCommand(null);
    if (msg.x_target !== undefined) {
      resolved.x_target = geometry_msgs.msg.Transform.Resolve(msg.x_target)
    }
    else {
      resolved.x_target = new geometry_msgs.msg.Transform()
    }

    if (msg.secondary_objective !== undefined) {
      resolved.secondary_objective = msg.secondary_objective;
    }
    else {
      resolved.secondary_objective = false
    }

    if (msg.q0_target !== undefined) {
      resolved.q0_target = msg.q0_target;
    }
    else {
      resolved.q0_target = 0.0
    }

    return resolved;
    }
};

module.exports = CartesianCommand;
