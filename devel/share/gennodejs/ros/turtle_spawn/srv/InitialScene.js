// Auto-generated. Do not edit!

// (in-package turtle_spawn.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class InitialSceneRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.numberOfTSPTurtles = null;
    }
    else {
      if (initObj.hasOwnProperty('numberOfTSPTurtles')) {
        this.numberOfTSPTurtles = initObj.numberOfTSPTurtles
      }
      else {
        this.numberOfTSPTurtles = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitialSceneRequest
    // Serialize message field [numberOfTSPTurtles]
    bufferOffset = _serializer.int32(obj.numberOfTSPTurtles, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitialSceneRequest
    let len;
    let data = new InitialSceneRequest(null);
    // Deserialize message field [numberOfTSPTurtles]
    data.numberOfTSPTurtles = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_spawn/InitialSceneRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f54c22ea8d163b5734adfe96724e1fec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 numberOfTSPTurtles
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitialSceneRequest(null);
    if (msg.numberOfTSPTurtles !== undefined) {
      resolved.numberOfTSPTurtles = msg.numberOfTSPTurtles;
    }
    else {
      resolved.numberOfTSPTurtles = 0
    }

    return resolved;
    }
};

class InitialSceneResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tsp_turtles = null;
      this.conveyor_turtle = null;
      this.catch_turtle = null;
    }
    else {
      if (initObj.hasOwnProperty('tsp_turtles')) {
        this.tsp_turtles = initObj.tsp_turtles
      }
      else {
        this.tsp_turtles = '';
      }
      if (initObj.hasOwnProperty('conveyor_turtle')) {
        this.conveyor_turtle = initObj.conveyor_turtle
      }
      else {
        this.conveyor_turtle = '';
      }
      if (initObj.hasOwnProperty('catch_turtle')) {
        this.catch_turtle = initObj.catch_turtle
      }
      else {
        this.catch_turtle = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitialSceneResponse
    // Serialize message field [tsp_turtles]
    bufferOffset = _serializer.string(obj.tsp_turtles, buffer, bufferOffset);
    // Serialize message field [conveyor_turtle]
    bufferOffset = _serializer.string(obj.conveyor_turtle, buffer, bufferOffset);
    // Serialize message field [catch_turtle]
    bufferOffset = _serializer.string(obj.catch_turtle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitialSceneResponse
    let len;
    let data = new InitialSceneResponse(null);
    // Deserialize message field [tsp_turtles]
    data.tsp_turtles = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [conveyor_turtle]
    data.conveyor_turtle = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [catch_turtle]
    data.catch_turtle = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.tsp_turtles.length;
    length += object.conveyor_turtle.length;
    length += object.catch_turtle.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_spawn/InitialSceneResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '402e653149fd07543d076d54895e4f5e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string tsp_turtles
    string conveyor_turtle
    string catch_turtle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitialSceneResponse(null);
    if (msg.tsp_turtles !== undefined) {
      resolved.tsp_turtles = msg.tsp_turtles;
    }
    else {
      resolved.tsp_turtles = ''
    }

    if (msg.conveyor_turtle !== undefined) {
      resolved.conveyor_turtle = msg.conveyor_turtle;
    }
    else {
      resolved.conveyor_turtle = ''
    }

    if (msg.catch_turtle !== undefined) {
      resolved.catch_turtle = msg.catch_turtle;
    }
    else {
      resolved.catch_turtle = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: InitialSceneRequest,
  Response: InitialSceneResponse,
  md5sum() { return '5d4fe416861dd7bf8618226c4384cb42'; },
  datatype() { return 'turtle_spawn/InitialScene'; }
};
