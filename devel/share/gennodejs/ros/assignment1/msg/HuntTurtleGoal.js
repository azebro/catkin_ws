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

class HuntTurtleGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hunterX = null;
      this.hunterY = null;
      this.hunterTheta = null;
      this.hunterName = null;
      this.targetX = null;
      this.targetY = null;
      this.targetTheta = null;
      this.targetName = null;
      this.targetId = null;
    }
    else {
      if (initObj.hasOwnProperty('hunterX')) {
        this.hunterX = initObj.hunterX
      }
      else {
        this.hunterX = 0.0;
      }
      if (initObj.hasOwnProperty('hunterY')) {
        this.hunterY = initObj.hunterY
      }
      else {
        this.hunterY = 0.0;
      }
      if (initObj.hasOwnProperty('hunterTheta')) {
        this.hunterTheta = initObj.hunterTheta
      }
      else {
        this.hunterTheta = 0.0;
      }
      if (initObj.hasOwnProperty('hunterName')) {
        this.hunterName = initObj.hunterName
      }
      else {
        this.hunterName = '';
      }
      if (initObj.hasOwnProperty('targetX')) {
        this.targetX = initObj.targetX
      }
      else {
        this.targetX = 0.0;
      }
      if (initObj.hasOwnProperty('targetY')) {
        this.targetY = initObj.targetY
      }
      else {
        this.targetY = 0.0;
      }
      if (initObj.hasOwnProperty('targetTheta')) {
        this.targetTheta = initObj.targetTheta
      }
      else {
        this.targetTheta = 0.0;
      }
      if (initObj.hasOwnProperty('targetName')) {
        this.targetName = initObj.targetName
      }
      else {
        this.targetName = '';
      }
      if (initObj.hasOwnProperty('targetId')) {
        this.targetId = initObj.targetId
      }
      else {
        this.targetId = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HuntTurtleGoal
    // Serialize message field [hunterX]
    bufferOffset = _serializer.float32(obj.hunterX, buffer, bufferOffset);
    // Serialize message field [hunterY]
    bufferOffset = _serializer.float32(obj.hunterY, buffer, bufferOffset);
    // Serialize message field [hunterTheta]
    bufferOffset = _serializer.float32(obj.hunterTheta, buffer, bufferOffset);
    // Serialize message field [hunterName]
    bufferOffset = _serializer.string(obj.hunterName, buffer, bufferOffset);
    // Serialize message field [targetX]
    bufferOffset = _serializer.float32(obj.targetX, buffer, bufferOffset);
    // Serialize message field [targetY]
    bufferOffset = _serializer.float32(obj.targetY, buffer, bufferOffset);
    // Serialize message field [targetTheta]
    bufferOffset = _serializer.float32(obj.targetTheta, buffer, bufferOffset);
    // Serialize message field [targetName]
    bufferOffset = _serializer.string(obj.targetName, buffer, bufferOffset);
    // Serialize message field [targetId]
    bufferOffset = _serializer.int32(obj.targetId, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HuntTurtleGoal
    let len;
    let data = new HuntTurtleGoal(null);
    // Deserialize message field [hunterX]
    data.hunterX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hunterY]
    data.hunterY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hunterTheta]
    data.hunterTheta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hunterName]
    data.hunterName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [targetX]
    data.targetX = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [targetY]
    data.targetY = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [targetTheta]
    data.targetTheta = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [targetName]
    data.targetName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [targetId]
    data.targetId = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.hunterName.length;
    length += object.targetName.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'assignment1/HuntTurtleGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0cb907047e6d468ef1ec1e0d0f7d469d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #goal definition
    float32 hunterX
    float32 hunterY
    float32 hunterTheta
    string hunterName
    float32 targetX
    float32 targetY
    float32 targetTheta
    string targetName
    int32 targetId
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HuntTurtleGoal(null);
    if (msg.hunterX !== undefined) {
      resolved.hunterX = msg.hunterX;
    }
    else {
      resolved.hunterX = 0.0
    }

    if (msg.hunterY !== undefined) {
      resolved.hunterY = msg.hunterY;
    }
    else {
      resolved.hunterY = 0.0
    }

    if (msg.hunterTheta !== undefined) {
      resolved.hunterTheta = msg.hunterTheta;
    }
    else {
      resolved.hunterTheta = 0.0
    }

    if (msg.hunterName !== undefined) {
      resolved.hunterName = msg.hunterName;
    }
    else {
      resolved.hunterName = ''
    }

    if (msg.targetX !== undefined) {
      resolved.targetX = msg.targetX;
    }
    else {
      resolved.targetX = 0.0
    }

    if (msg.targetY !== undefined) {
      resolved.targetY = msg.targetY;
    }
    else {
      resolved.targetY = 0.0
    }

    if (msg.targetTheta !== undefined) {
      resolved.targetTheta = msg.targetTheta;
    }
    else {
      resolved.targetTheta = 0.0
    }

    if (msg.targetName !== undefined) {
      resolved.targetName = msg.targetName;
    }
    else {
      resolved.targetName = ''
    }

    if (msg.targetId !== undefined) {
      resolved.targetId = msg.targetId;
    }
    else {
      resolved.targetId = 0
    }

    return resolved;
    }
};

module.exports = HuntTurtleGoal;
