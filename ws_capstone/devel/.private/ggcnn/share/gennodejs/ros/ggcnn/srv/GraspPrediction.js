// Auto-generated. Do not edit!

// (in-package ggcnn.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let Grasp = require('../msg/Grasp.js');

//-----------------------------------------------------------

class GraspPredictionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspPredictionRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspPredictionRequest
    let len;
    let data = new GraspPredictionRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ggcnn/GraspPredictionRequest';
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
    const resolved = new GraspPredictionRequest(null);
    return resolved;
    }
};

class GraspPredictionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.best_grasp = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('best_grasp')) {
        this.best_grasp = initObj.best_grasp
      }
      else {
        this.best_grasp = new Grasp();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraspPredictionResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [best_grasp]
    bufferOffset = Grasp.serialize(obj.best_grasp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraspPredictionResponse
    let len;
    let data = new GraspPredictionResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [best_grasp]
    data.best_grasp = Grasp.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 65;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ggcnn/GraspPredictionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86d7d0d5a00535c6699247df54f62820';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    ggcnn/Grasp best_grasp
    
    
    ================================================================================
    MSG: ggcnn/Grasp
    geometry_msgs/Pose pose
    float32 width
    float32 quality
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
    const resolved = new GraspPredictionResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.best_grasp !== undefined) {
      resolved.best_grasp = Grasp.Resolve(msg.best_grasp)
    }
    else {
      resolved.best_grasp = new Grasp()
    }

    return resolved;
    }
};

module.exports = {
  Request: GraspPredictionRequest,
  Response: GraspPredictionResponse,
  md5sum() { return '86d7d0d5a00535c6699247df54f62820'; },
  datatype() { return 'ggcnn/GraspPrediction'; }
};
