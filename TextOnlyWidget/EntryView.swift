//
//  EntryView.swift
//  TextOnlyWidgetExtension
//
//  Created by muzna on 2021/03/21.
//

import SwiftUI

struct EntryView: View {
    
    let entry: WidgetContentEntry
    var body: some View {
        VStack(alignment: .leading, spacing: 3, content: {
            Text("Hello, World!")
            Text(entry.name)
        })
        
    }
}

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(entry: WidgetContentEntry(name: "kim"))
    }
}
