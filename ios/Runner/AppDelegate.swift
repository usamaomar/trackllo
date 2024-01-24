import UIKit

import Flutter
import GoogleMaps
import AppTrackingTransparency
import AdSupport


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyC0--eVlxce_NFu4BK97iIAsqps5j4VGRg")
    GeneratedPluginRegistrant.register(with: self)
     if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
     }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func applicationDidBecomeActive(_ application: UIApplication) {
          if #available(iOS 14.4, *) {
              ATTrackingManager.requestTrackingAuthorization { status in
              }
          }
      }
}