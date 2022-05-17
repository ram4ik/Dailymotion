//
//  NetworkMonitor.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import SwiftUI
import Network

class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    @Published var isActive = false
    @Published var isExpensive = false
    @Published var isConstrained = false
    @Published var connectionType = NWInterface.InterfaceType.other
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isActive = path.status == .satisfied
                self.isExpensive = path.isExpensive
                self.isConstrained = path.isConstrained
                
                let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]
                self.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other
            }
        }
        monitor.start(queue: queue)
    }
}
