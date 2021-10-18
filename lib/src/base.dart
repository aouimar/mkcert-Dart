import 'package:ffi/ffi.dart';
import 'package:mkcert/external/generated_bindings.dart';
import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX

final DynamicLibrary nativelib = Platform.isWindows
    ? DynamicLibrary.open("lib/external/libraries/mkcert.dll")
    : DynamicLibrary.process();

final _nativeLib = NativeLibrary(nativelib);

class mkcert{
  static void MkcertCmdLine(String args){
    _nativeLib.MkcertCommand(args.toNativeUtf8().cast<Int8>());
  }

}

void testffi() {
  mkcert.MkcertCmdLine("-cert-file ./cert/cert.pem -key-file ./cert/key.pem 127.0.0.1");
}

main(){
  testffi();
}
