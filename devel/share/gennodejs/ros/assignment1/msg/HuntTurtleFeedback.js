// Auto-generated. Do not edit!

// (in-package assignment1.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class HuntTurtleFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.progressBar = null;
      this.progress = null;
      this.timeRemaining = null;
    }
    else {
      if (initObj.hasOwnProperty('progressBar')) {
        this.progressBar = initObj.progressBar
      }
      else {
        this.progressBar = '';
      }
      if (initObj.hasOwnProperty('progress')) {
        this.progress = initObj.progress
      }
      else {
        this.progress = 0.0;
      }
      if (initObj.hasOwnProperty('timeRemaining')) {
        this.timeRemaining = initObj.timeRemaining
      }
      else {
        this.timeRemaining = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HuntTurtleFeedback
    // Serialize message field [progressBar]
    bufferOffset = _serializer.string(obj.progressBar, buffer, bufferOffset);
    // Serialize message field [progress]
    bufferOffset = _serializer.float32(obj.progress, buffer, bufferOffset);
    // Serialize message field [timeRemaining]
    bufferOffset = _serializer.string(obj.timeRemaining, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HuntTurtleFeedback
    let len;
    let data = new HuntTurtleFeedback(null);
    // Deserialize message field [progressBar]
    data.progressBar = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [progress]
    data.progress = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [timeRemaining]
    data.timeRemaining = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.progressBar.length;
    length += object.timeRemaining.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment1/HuntTurtleFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ebd791a2e9bf1e98d90417c0e82beb3e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #feedback
    string progressBar
    float32 progress
    string timeRemaining
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HuntTurtleFeedback(null);
    if (msg.progressBar !== undefined) {
      resolved.progressBar = msg.progressBar;
    }
    else {
      resolved.progressBar = ''
    }

    if (msg.progress !== undefined) {
      resolved.progress = msg.progress;
    }
    else {
      resolved.progress = 0.0
    }

    if (msg.timeRemaining !== undefined) {
      resolved.timeRemaining = msg.timeRemaining;
    }
    else {
      resolved.timeRemaining = ''
    }

    return resolved;
    }
};

module.exports = HuntTurtleFeedback;
