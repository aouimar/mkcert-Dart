mkcert version Dart
- using it as command line argument for a dart function
- the library is builded up from golang package after some changes on FiloSottile/mkcert to make it exportable
  at aouimar/mkcert

Windows Tested only, work still on progress; To-DO test other platform 

How to use:

    mkcert.MkcertCmdLine(/argument that should be passed to mkcert as string/);
    see: https://github.com/FiloSottile/mkcert for other advanced parameters

Example:

    mkcert -cert-file ./cert/cert.pem -key-file ./cert/key.pem 127.0.0.1

    will be:

    mkcert.MkcertCmdLine("-cert-file ./cert/cert.pem -key-file ./cert/key.pem 127.0.0.1");

The Licence inherite embeded licences