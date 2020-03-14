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

class TspListRequest {
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
        this.turtles = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TspListRequest
    // Serialize message field [turtles]
    bufferOffset = _serializer.string(obj.turtles, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TspListRequest
    let len;
    let data = new TspListRequest(null);
    // Deserialize message field [turtles]
    data.turtles = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.turtles.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1/TspListRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d0e809b0cc068311f8979aaa5e9b8bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string turtles
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TspListRequest(null);
    if (msg.turtles !== undefined) {
      resolved.turtles = msg.turtles;
    }
    else {
      resolved.turtles = ''
    }

    return resolved;
    }
};

class TspListResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sequence = null;
    }
    else {
      if (initObj.hasOwnProperty('sequence')) {
        this.sequence = initObj.sequence
      }
      else {
        this.sequence = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TspListResponse
    // Serialize message field [sequence]
    bufferOffset = _arraySerializer.int32(obj.sequence, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TspListResponse
    let len;
    let data = new TspListResponse(null);
    // Deserialize message field [sequence]
    data.sequence = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.sequence.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1/TspListResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b81e37d2a31925a0e8ae261a8699cb79';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] sequence
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TspListResponse(null);
    if (msg.sequence !== undefined) {
      resolved.sequence = msg.sequence;
    }
    else {
      resolved.sequence = []
    }

    return resolved;
    }
};

module.exports = {
  Request: TspListRequest,
  Response: TspListResponse,
  md5sum() { return '479c0bc11d8910d2e80e7da4072f2c4a'; },
  datatype() { return 'assignment1/TspList'; }
};
