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

class TspRequest {
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
    // Serializes a message object of type TspRequest
    // Serialize message field [turtles]
    bufferOffset = _serializer.string(obj.turtles, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TspRequest
    let len;
    let data = new TspRequest(null);
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
    return 'assignment1/TspRequest';
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
    const resolved = new TspRequest(null);
    if (msg.turtles !== undefined) {
      resolved.turtles = msg.turtles;
    }
    else {
      resolved.turtles = ''
    }

    return resolved;
    }
};

class TspResponse {
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
        this.sequence = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TspResponse
    // Serialize message field [sequence]
    bufferOffset = _serializer.string(obj.sequence, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TspResponse
    let len;
    let data = new TspResponse(null);
    // Deserialize message field [sequence]
    data.sequence = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.sequence.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1/TspResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2810e4b1ee8df76ac8a9a36d5becb93c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sequence
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TspResponse(null);
    if (msg.sequence !== undefined) {
      resolved.sequence = msg.sequence;
    }
    else {
      resolved.sequence = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: TspRequest,
  Response: TspResponse,
  md5sum() { return 'cc44a8559cc239a440bb56303c3636a1'; },
  datatype() { return 'assignment1/Tsp'; }
};
