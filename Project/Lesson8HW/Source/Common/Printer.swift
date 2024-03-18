//
//  Logger.swift
//  Lesson8HW
//

//

import Foundation

protocol PrinterProtocol: AnyObject {
    
    func textPrint (_ seconds: Int)
}

class Printer {
    
    
    private var timer: Timer?
    private var seconds: Int = 0
    weak var delegate: PrinterProtocol?
    
    func startPrinting() {
        
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerAction() {
                
        self.delegate?.textPrint(seconds)
        
        seconds += 1
    }
}
