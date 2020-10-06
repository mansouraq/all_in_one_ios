//
/**
 *
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */

import UIKit
import AVFoundation
import AVKit

class ScanQrVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var vwScan: UIView!
    @IBOutlet weak var btnScanQr: UIButton!
    @IBOutlet weak var btnMyQr: UIButton!
    @IBOutlet weak var vwSlide: UIView!
    @IBOutlet weak var vwMyQr: UIView!
    
    //MARK:- Variables
    var captureSession: AVCaptureSession!
    var AVCapturePreviewLayer: AVCaptureVideoPreviewLayer!
    var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scanner()
    }
    
    //MARK:- IBActions
    @IBAction func actionMyQr(_ sender: UIButton) {
        btnScanQr.setTitleColor(Color.fadeGrey, for: .normal)
        btnMyQr.setTitleColor(Color.fadeGrey, for: .normal)
        animateSegments(sender)
        sender.setTitleColor(.black, for: .normal)
        switch sender {
        case btnScanQr:
            vwMyQr.isHidden = true
        case btnMyQr:
            vwMyQr.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    func animateSegments(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7) {
            let originX = sender.frame.origin.x+28
            self.vwSlide.frame.origin = CGPoint(x: originX, y: self.vwSlide.frame.origin.y)
            self.view.layoutIfNeeded()
        }
    }
}

extension ScanQrVC: AVCaptureMetadataOutputObjectsDelegate {
    func scanner() {
        
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get the camera device")
            return
        }
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        AVCapturePreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        AVCapturePreviewLayer.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: vwScan.frame.size.height)
        AVCapturePreviewLayer.videoGravity = .resizeAspectFill
        self.vwScan.layer.addSublayer(AVCapturePreviewLayer)
        captureSession.startRunning()
    }
    func failed() {
        self.showAlert(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.")
        captureSession = nil
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
    }
    
    func found(code: String) {
        if !code.isEmpty {
            
        }
        captureSession!.stopRunning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK:- Decoding QR
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if metadataObjects == nil || metadataObjects.count == 0 {
            vwScan?.frame = CGRect.zero
            return
        }
        let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if objMetadataMachineReadableCodeObject.type == AVMetadataObject.ObjectType.qr {
            let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObject(for: objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            vwScan?.frame = objBarCode.bounds;
            if objMetadataMachineReadableCodeObject.stringValue != nil {
                
            }
        }
    }
    func showAlert(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: TitleMessage.ok, style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        controller.addAction(okAction)
        controller.view.tintColor = Color.dustyOrange
        self.present(controller, animated: true, completion: nil)
    }
}
