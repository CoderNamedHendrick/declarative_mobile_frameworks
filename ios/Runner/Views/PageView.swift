//
//  PageView.swift
//  Runner
//
//  Created by Sebastine Odeh on 10/09/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: [FeatureCardView()]).aspectRatio(3/2, contentMode: .fit)
    }
}
