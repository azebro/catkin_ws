// Auto-generated. Do not edit!

// (in-package assignment1.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TurtleSpawnRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtleCount = null;
    }
    else {
      if (initObj.hasOwnProperty('turtleCount')) {
        this.turtleCount = initObj.turtleCount
      }
      else {
        this.turtleCount = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurtleSpawnRequest
    // Serialize message field [turtleCount]
    bufferOffset = _serializer.int32(obj.turtleCount, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurtleSpawnRequest
    let len;
    let data = new TurtleSpawnRequest(null);
    // Deserialize message field [turtleCount]
    data.turtleCount = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1/TurtleSpawnRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71d37b1d2fe27ce9d264372080e332e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 turtleCount
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurtleSpawnRequest(null);
    if (msg.turtleCount !== undefined) {
      resolved.turtleCount = msg.turtleCount;
    }
    else {
      resolved.turtleCount = 0
    }

    return resolved;
    }
};

class TurtleSpawnResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtles = null;
    }
    else {
      if (initObj.hasOwnProperty('turtles')) {
        this.turtles = initObj.turtles
      }
      else {
        this.turtles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurtleSpawnResponse
    // Serialize message field [turtles]
    bufferOffset = _arraySerializer.int32(obj.turtles, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurtleSpawnResponse
    let len;
    let data = new TurtleSpawnResponse(null);
    // Deserialize message field [turtles]
    data.turtles = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.turtles.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1/TurtleSpawnResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b5cfa4f7983516bb1fa09ba771f01902';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] turtles
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurtleSpawnResponse(null);
    if (msg.turtles !== undefined) {
      resolved.turtles = msg.turtles;
    }
    else {
      resolved.turtles = []
    }

    return resolved;
    }
};

module.exports = {
  Request: TurtleSpawnRequest,
  Response: TurtleSpawnResponse,
  md5sum() { return 'fe402387a08743623c9801322d19262d'; },
  datatype() { return 'assignment1/TurtleSpawn'; }
};
