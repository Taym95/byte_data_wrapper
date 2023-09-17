import 'dart:typed_data';

class ByteDataWrapper {
  int _readOffset = 0;
  int _writeOffset = 0;
  ByteData byteBuffer;

  ByteDataWrapper({required int numBytes}) : this.byteBuffer = ByteData(numBytes);

  static ByteDataWrapper view(ByteBuffer buffer, [int offsetInBytes = 0, int length = 0]) {
    final byteDataWrapper = ByteDataWrapper(numBytes: 0)..byteBuffer = ByteData.view(buffer, offsetInBytes, length);
    return byteDataWrapper;
  }

  int get length => byteBuffer.lengthInBytes;
  int get readOffset => _readOffset;
  int get writeOffset => _writeOffset;

  void setUint8(int value) {
    byteBuffer.setUint8(_writeOffset, value);
    _writeOffset++;
  }

  void setUint16(int value) {
    byteBuffer.setUint16(_writeOffset, value, Endian.little);
    _writeOffset += 2;
  }

  void setUint32(int value) {
    byteBuffer.setUint32(_writeOffset, value, Endian.little);
    _writeOffset += 4;
  }

  void setUint64(int value) {
    byteBuffer.setUint64(_writeOffset, value, Endian.little);
    _writeOffset += 8;
  }

  void setUnit8List(Uint8List list) {
    list.forEach(setUint8);
  }

  void setUnit16List(Uint16List list) {
    list.forEach(setUint16);
  }

  int getUint8() {
    final data = byteBuffer.getUint8(_readOffset);
    _readOffset++;
    return data;
  }

  int getUint8withOffset(int getUint8withOffset) {
    final data = byteBuffer.getUint8(getUint8withOffset);
    return data;
  }

  int getUint16() {
    final data = byteBuffer.getUint16(_readOffset, Endian.little);
    _readOffset += 2;
    return data;
  }

  int getUint32() {
    final data = byteBuffer.getUint32(_readOffset, Endian.little);
    _readOffset += 4;
    return data;
  }

  int getUint64() {
    final data = byteBuffer.getUint64(_readOffset, Endian.little);
    _readOffset += 8;
    return data;
  }

  Uint8List asUint8List() => byteBuffer.buffer.asUint8List();
}
