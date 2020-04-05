////
////  QNSDKManager.swift
////  Pods
////
////  Created by Jeffrey Drakos on 4/3/20.
////
//
//import Foundation
//import CoreBluetooth
////
////@objc
////protocol SomeProtocol: QNBleApi {
////    // protocol definition goes here
//////        func onDeviceDiscover(device: QNBleDevice) -> QNBleDevice {
//////                print("JEFF: onDeviceDiscover extension")
//////              return device
//////          }
////
////}
//
////
////extension SomeProtocol {
////    func onDeviceDiscover(device: QNBleDevice) {
////        print("ONNNDEV", device)
////
////    }
////}
//
////@objc public class QNSDKManager: NSObject, QNBleDeviceDiscoveryListener  {
////    let bleApi = QNBleApi()
//////    let discoveryListener = QNBleDeviceDiscoveryListener()
//////    QNBleDeviceDiscoveryListener
////
////    override init() {
////        super.init()
////        print("Jeff: INIT spe")
////        self.initSdk()
//////        self.bleApi.discoveryListener = QNBleDeviceDiscoveryListener()
////    }
//
//@objc public class QNSDKManager: NSObject {
//    func onDeviceDiscover(device: QNBleDevice) {
//        print("DFDFD", device)
////        return device
//    }
//
////    func onDeviceDiscover(device: QNBleDevice) {
////        print("ONNNDEV a", device)
////        return device
////    }
//
//    let bleApi = QNBleApi()
////    weak var delegate:QNBleDeviceDiscoveryListener?
////    let discoveryListener:QNBleDeviceDiscoveryListener?
////    QNBleDeviceDiscoveryListener
//
//    override init() {
//        super.init()
////  discoveryListener
//        print("Jeff: INIT sp3e")
//        self.initSdk()
//        self.bleApi.discoveryListener = self as! QNBleDeviceDiscoveryListener
//
////        self.bleApi.discoveryListener = QNBleDeviceDiscoveryListener()
//    }
//
//    func initSdk() {
//        print("jeff: initSdk")
//        let config = bleApi.getConfig()
//        config?.showPowerAlertKey = false
//
//        QNBleApi.debug = false
//        let file = Bundle.main.path(forResource: "123456789", ofType: "qn")
//
//        print("FILE", file)
//        self.bleApi.initSdk("123456789", firstDataFile: file, callback: { error in
//            print("Jeff:init sdk error", error)
//        })
//
//
//        //
//
//        //        bleApi?.discoveryListener.onDeviceDiscover(<#T##device: QNBleDevice?##QNBleDevice?#>) -> device {
//        //            print("Jeff: Device", device)
//        //        }
//        //
//        //        self.onDeviceDiscover(QNBleDevice *<#QNBleDevice?#>)device {
//        //            // This method will call back after discovering the device
//        //            print("DEVIce", device)
//        //        }
//        //
//    }
//
//    func onStartDiscovery() {
//        print("JEFF: ON START 26")
//
////        self.bleApi?.discoveryListener = self as? QNBleDeviceDiscoveryListener
////        bleApi?.startBleDeviceDiscovery({ error in
////            print("Jeff 1: ERR", error)
////        })
//
////        self.bleApi.startBleDeviceDiscovery({ (result) -> () in
////            // do stuff with the result
////            print(result)
////        })
////
//
//        self.bleApi.startBleDeviceDiscovery({ error in
//              // This callback indicates whether the startup scan method is successful
//              if((error) != nil) {
//                  do {
//                      if let error = error {
//                          print("Jeff: failed to start the scan method, reason: \(error)")
//                      }
//                  }
//              } else {
//                  print("Jeff: startBleDeviceDiscovery success")
//              }
//          })
//    }
//
//
//
//
//    func onDeviceDiscover(_ device: QNBleDevice?) {
//        print("jeff: onDeviceDiscover")
//        //该方法会在发现设备后回调
//        if let mac = device?.mac {
//            print("jeff: device", device)
//
//        }
//    }
//
//    func onBroadcastDeviceDiscover(_ device: QNBleBroadcastDevice?) {
//        print("jeff: onBroadcastDeviceDiscover")
//        //该方法会在发现设备后回调
//
//    }
//    //
//    func onStopScan() {
//        print("jeff: onStopScan")
//        //该方法会在发现设备后回调
//
//    }
//
//    func onStartScan() {
//        print("jeff: onStartScan")
//        //该方法会在发现设备后回调
//
//    }
//
//
////
//
//
////    static func - (_: void);var onDeviceDiscover:(QNBleDevice, *);device() {
////
////        // This method will call back after discovering the device
////    }
//
//
//
//}
//
////@objc extension QNSDKManager: QNBleDeviceDiscoveryListener {
////
////    func onDeviceDiscover(device: QNBleDevice) -> QNBleDevice {
////            print("JEFF: onDeviceDiscover extension")
////          return device
////      }
////
////    //func onDeviceDiscover: QNBleDeviceDiscoveryListener? { return nil }
//////    func onDeviceDiscover:QNBleDeviceDiscoveryListener(tableView: UITableView) -> Int {
//////      return 1
//////  }
////}
import Foundation
import CoreBluetooth

@objc
public class QNSDKManager: NSObject {

    var bleApi: QNBleApi!

    override init() {
        super.init()
  
        bleApi = QNBleApi.shared()
        self.initSdk()
//        bleApi.discoveryListener = self as? QNBleDeviceDiscoveryListener
    }
    
        func initSdk() {
            print("jeff: initSdk")
            let config = bleApi.getConfig()
            config?.showPowerAlertKey = false
            let file = Bundle.main.path(forResource: "123456789", ofType: "qn")

            bleApi.initSdk("123456789", firstDataFile: file, callback: { error in
                print("Jeff:init sdk error", error)
            })
}

    func onStartDiscovery() {
        print("JEFF: ON START 26")

        bleApi.startBleDeviceDiscovery({ error in
              // This callback indicates whether the startup scan method is successful
              if((error) != nil) {
                  do {
                      if let error = error {
                          print("Jeff: failed to start the scan method, reason: \(error)")
                      }
                  }
              } else {
                  print("Jeff: startBleDeviceDiscovery success")
              }
          })
    }
    
//    func onDeviceDiscovery(device: QNBleDevice){
//        print("Jeff: onDeviceDiscovery")
//    }

}
//MARK: - Discover Listener Methods
extension QNSDKManager: QNBleDeviceDiscoveryListener {
//extension QNSDKManager: QNBleDeviceDiscoveryListener{
    //Your implementation functions
//    func onStartScan(){
//    }

    func onDeviceDiscover(_ device: QNBleDevice){
    }

//    func onBroadcastDeviceDiscover(device: QNBleBroadcastDevice){
//    }
//
//    func onKitchenDeviceDiscover(device: QNBleKitchenDevice){
//    }
//
//    func onStopScan(){
//    }
}
