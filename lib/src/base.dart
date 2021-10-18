import 'package:ffi/ffi.dart';
import 'package:mkcert/external/generated_bindings.dart';
import 'dart:ffi'; // For FFI
import 'dart:io'; // For Platform.isX
import "package:path/path.dart" show dirname;


final DynamicLibrary nativelib = Platform.isWindows
    ? DynamicLibrary.open(getDirectory("mkcert.dll"))
    : DynamicLibrary.process();

final _nativeLib = NativeLibrary(nativelib);

class mkcert{
  static void MkcertCmdLine(String args){
    _nativeLib.MkcertCommand(args.toNativeUtf8().cast<Int8>());
  }
}

String getDirectory(String lib){
    final directory = dirname(Platform.script.toFilePath());
    return directory + "/../external/libraries/" + lib;
}

void testffi() {
  mkcert.MkcertCmdLine("-cert-file ./cert/cert.pem -key-file ./cert/key.pem 127.0.0.1");
}

main(){
  print(getDirectory(""));
  testffi();
}
