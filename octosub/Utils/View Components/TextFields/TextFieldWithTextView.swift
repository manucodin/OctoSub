//
//  TextFieldWithTextView.swift
//  subscription_tracker
//
//  Created by Manuel Rodriguez Sebastian on 11/9/22.
//

import SwiftUI

struct TextFieldWithTextView: View {
    let text: String
    
    @Binding var value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .bold()
                    .foregroundColor(.black)
                TextField(text, text: $value)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.black)
            }
        }
        Divider().foregroundColor(.separator).frame(height: 1)
    }
}

struct TextFieldWithTextView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldWithTextView(text: "name".localized.capitalized, value: .constant("Spotify"))
    }
}
