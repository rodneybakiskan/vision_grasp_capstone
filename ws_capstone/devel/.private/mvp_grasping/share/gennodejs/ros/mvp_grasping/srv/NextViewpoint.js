// Auto-generated. Do not edit!

// (in-package mvp_grasping.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let Grasp = require('../msg/Grasp.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class NextViewpointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NextViewpointRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NextViewpointRequest
    let len;
    let data = new NextViewpointRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mvp_grasping/NextViewpointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NextViewpointRequest(null);
    return resolved;
    }
};

class NextViewpointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.velocity_cmd = null;
      this.best_grasp = null;
      this.no_viewpoints = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('velocity_cmd')) {
        this.velocity_cmd = initObj.velocity_cmd
      }
      else {
        this.velocity_cmd = new geometry_msgs.msg.Twist();
      }
      if (initObj.hasOwnProperty('best_grasp')) {
        this.best_grasp = initObj.best_grasp
      }
      else {
        this.best_grasp = new Grasp();
      }
      if (initObj.hasOwnProperty('no_viewpoints')) {
        this.no_viewpoints = initObj.no_viewpoints
      }
      else {
        this.no_viewpoints = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NextViewpointResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [velocity_cmd]
    bufferOffset = geometry_msgs.msg.Twist.serialize(obj.velocity_cmd, buffer, bufferOffset);
    // Serialize message field [best_grasp]
    bufferOffset = Grasp.serialize(obj.best_grasp, buffer, bufferOffset);
    // Serialize message field [no_viewpoints]
    bufferOffset = _serializer.uint32(obj.no_viewpoints, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NextViewpointResponse
    let len;
    let data = new NextViewpointResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [velocity_cmd]
    data.velocity_cmd = geometry_msgs.msg.Twist.deserialize(buffer, bufferOffset);
    // Deserialize message field [best_grasp]
    data.best_grasp = Grasp.deserialize(buffer, bufferOffset);
    // Deserialize message field [no_viewpoints]
    data.no_viewpoints = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 121;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mvp_grasping/NextViewpointResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b48658ae3de44f598cf8af1346003291';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    geometry_msgs/Twist velocity_cmd
    mvp_grasping/Grasp best_grasp
    uint32 no_viewpoints
    
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    MSG: mvp_grasping/Grasp
    geometry_msgs/Pose pose
    float32 quality
    float32 entropy
    float32 width
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    const resolved = new NextViewpointResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.velocity_cmd !== undefined) {
      resolved.velocity_cmd = geometry_msgs.msg.Twist.Resolve(msg.velocity_cmd)
    }
    else {
      resolved.velocity_cmd = new geometry_msgs.msg.Twist()
    }

    if (msg.best_grasp !== undefined) {
      resolved.best_grasp = Grasp.Resolve(msg.best_grasp)
    }
    else {
      resolved.best_grasp = new Grasp()
    }

    if (msg.no_viewpoints !== undefined) {
      resolved.no_viewpoints = msg.no_viewpoints;
    }
    else {
      resolved.no_viewpoints = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: NextViewpointRequest,
  Response: NextViewpointResponse,
  md5sum() { return 'b48658ae3de44f598cf8af1346003291'; },
  datatype() { return 'mvp_grasping/NextViewpoint'; }
};
