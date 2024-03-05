//
//  ContentView.swift
//  CodeScan
//
//  Created by Павел Тоцкий on 05.03.2024.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        VStack (spacing: 10){
            Text(scannedCode)
            
            Button("Scan QR code") {
                self.isPresentingScanner = true
            }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

#Preview {
    ContentView()
}
