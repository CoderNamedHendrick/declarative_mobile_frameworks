//
//  SwiftUIView.swift
//  Runner
//
//  Created by Sebastine Odeh on 18/09/2023.
//


import SwiftUI

struct SwiftUIView: View {
    @State private var input1: String = "";
    @State private var input2: String = "";
    weak var navigationController: UINavigationController?
    weak var delegate: DelegateProtocol?
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Enter two numbers whose sum we're going to send to flutter")
                .frame(alignment: .center)
            
            Spacer().frame(height: 12)
            
            TextField("Input 1", text: $input1)
                .padding(.horizontal, 12)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Spacer().frame(height: 12)
            
            TextField("Input 2", text: $input2)
                .padding(.horizontal, 12)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            Spacer().frame(height: 20)
            
            Text("Sum of inputs: \(calculateInputs())")
            
            Button(action: {
                let message: String = "\(calculateInputs())";
                delegate?.popViewController(string: message)
                navigationController?.popViewController(animated: true)
            }) {
                Text("Send sum to flutter")
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }.padding(12)
            .onTapGesture {
                self.hideKeyboard()
            }
    }
    
    func calculateInputs() -> Int {
        return (Int(input1) ?? 0) + (Int(input2) ?? 0)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
