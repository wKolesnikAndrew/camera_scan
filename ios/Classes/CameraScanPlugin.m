#import "CameraScanPlugin.h"
#if __has_include(<camera_scan/camera_scan-Swift.h>)
#import <camera_scan/camera_scan-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "camera_scan-Swift.h"
#endif

@implementation CameraScanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCameraScanPlugin registerWithRegistrar:registrar];
}
@end
