//
//  CountryWidget.swift
//  CountryWidget
//
//  Created by muzna on 2021/03/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CountryWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct CountryWidget: Widget {
    let kind: String = "Hello2CountryWidget"

    var body: some WidgetConfiguration {
        
        StaticConfiguration(kind: kind, provider: Provider(), content: { entry in
            CountryWidgetEntryView(entry: entry)
        })
        .configurationDisplayName("Hello3 Widget")
        .description("This is an example widget.")
        .onBackgroundURLSessionEvents { (<#String#>, <#@escaping () -> Void#>) in
            <#code#>
        }
        /*
         kind: 고유한 identifier값
         provider: A timeline provider object라고함. WidgetKit이 위젯을 표시할 때, timestamped entries를 공급해주는 역할
         content 클로져: timeline entry를 표시해주기 위한 swiftUI를 반환함
         
         아래에 붙는 옵션들은 modifier라고 함:
         .configurationDisplayName
         .description
         */
    }
}

struct CountryWidget_Previews: PreviewProvider {
    static var previews: some View {
        CountryWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
