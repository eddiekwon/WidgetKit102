//
//  TextOnlyWidget.swift
//  TextOnlyWidget
//
//  Created by muzna on 2021/03/21.
//

import WidgetKit
import SwiftUI

let globalEntry = WidgetContentEntry(name: "global name")

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetContentEntry {
        globalEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgetContentEntry) -> ()) {
        let entry = globalEntry
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries = [globalEntry]

//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = WidgetContentEntry(date: entryDate)
//            entries.append(entry)
//        }
//
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
struct TextOnlyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct TextOnlyWidget: Widget {
    let kind: String = "TextOnlyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            // 다른 view말고 아래만 일단 표시해보자.
            EntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium]) //medium size만 나오게 함
    }
}

//struct TextOnlyWidget_Previews: PreviewProvider {
//    static var previews: some View {
//        TextOnlyWidgetEntryView(entry: WidgetContentEntry(date: Date()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
