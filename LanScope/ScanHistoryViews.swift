import SwiftUI

struct ScanHistoryView: View {
    @ObservedObject var model: ScanViewModel

    // `earlier` groups show the date as well as the time.
    private var groups: [(title: String, earlier: Bool, records: [ScanRecord])] {
        let calendar = Calendar.current
        return [
            (tr("今天"), false, model.history.filter { calendar.isDateInToday($0.startedAt) }),
            (tr("昨天"), false, model.history.filter { calendar.isDateInYesterday($0.startedAt) }),
            (tr("更早"), true, model.history.filter {
                !calendar.isDateInToday($0.startedAt) && !calendar.isDateInYesterday($0.startedAt)
            })
        ]
    }

    var body: some View {
        List {
            if let error = model.historyError {
                Text(tr(error))
                    .font(.footnote)
                    .foregroundStyle(Theme.amber)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            if model.history.isEmpty {
                ContentUnavailableView("暂无扫描历史", systemImage: "clock",
                                       description: Text("扫描结束后自动保存，有进度的未完成扫描也会保留。"))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            ForEach(groups, id: \.title) { group in
                if !group.records.isEmpty {
                    Section {
                        ForEach(group.records) { record in
                            // The link sits invisibly on top of the card so the system
                            // disclosure chevron is not drawn and the whole card stays tappable.
                            ZStack {
                                HistoryRow(record: record, showsDate: group.earlier)
                                NavigationLink {
                                    ScanRecordView(record: record)
                                } label: {
                                    EmptyView()
                                }
                                .opacity(0)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        }
                        .onDelete { offsets in
                            model.deleteHistory(ids: Set(offsets.map { group.records[$0].id }))
                        }
                    } header: {
                        Text(group.title)
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(Theme.secondary)
                            .textCase(nil)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            Section {
                Text("仅保存在本机，保留最近 30 次扫描。向左滑动可删除记录。")
                    .font(.footnote)
                    .foregroundStyle(Theme.tertiary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .appBackground()
        .navigationTitle("扫描历史")
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

private struct HistoryRow: View {
    let record: ScanRecord
    let showsDate: Bool

    private var wifiName: String? {
        record.wifiName.flatMap { $0.isEmpty ? nil : $0 }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "wifi")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(wifiName == nil ? Theme.tertiary : Theme.mint)
                    Text(wifiName ?? tr("未记录 Wi-Fi"))
                        .font(.headline)
                        .foregroundStyle(wifiName == nil ? Theme.secondary : Theme.text)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
                Spacer(minLength: 0)
                Text(record.startedAt.appFormatted(date: showsDate ? .numeric : .omitted, time: .shortened))
                    .font(.caption)
                    .foregroundStyle(Theme.secondary)
                    .fixedSize()
            }
            Text(record.cidr)
                .font(Font.mono(.footnote))
                .foregroundStyle(Theme.text.opacity(0.8))
            HStack(spacing: 10) {
                Text("发现 \(record.hosts.count) 台")
                    .font(.subheadline.weight(.semibold))
                Chip(text: record.outcome.title,
                     tone: record.outcome == .completed ? .mint : .amber,
                     mono: false)
            }
            if record.outcome != .completed {
                SlimProgress(value: Double(record.completed) / Double(max(record.total, 1)))
                Text("已扫描 \(record.completed)/\(record.total) 个地址")
                    .font(.caption)
                    .foregroundStyle(Theme.secondary)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .card()
    }
}

struct ScanRecordView: View {
    let record: ScanRecord

    private var wifiName: String {
        record.wifiName.flatMap { $0.isEmpty ? nil : $0 } ?? tr("未记录 Wi-Fi")
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 0) {
                    InfoRow(label: tr("网段"), value: record.cidr, mono: true)
                    if let settings = record.settings {
                        InfoRow(label: tr("仅扫描 ping 成功的设备"),
                                value: settings.pingOnly ? tr("是") : tr("否"))
                        InfoRow(label: tr("扫描端口"), value: settings.portsText, mono: true)
                    }
                    InfoRow(label: tr("扫描时 Wi-Fi"), value: wifiName)
                    InfoRow(label: tr("开始时间"),
                            value: record.startedAt.appFormatted(date: .abbreviated, time: .standard))
                    InfoRow(label: tr("结束时间"),
                            value: record.endedAt.appFormatted(date: .abbreviated, time: .standard))
                    InfoRow(label: tr("状态"), value: record.outcome.title)
                    InfoRow(label: tr("已扫描地址"), value: "\(record.completed)/\(record.total)", last: true)
                }
                .padding(.horizontal, 16)
                .card(radius: 22)

                if let diagnostic = record.diagnostic {
                    Label(diagnostic, systemImage: "exclamationmark.triangle")
                        .font(.footnote)
                        .foregroundStyle(Theme.amber)
                }

                DiscoveredAssetsView(hosts: record.hosts, historical: true)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
            .padding(.bottom, 24)
            .frame(maxWidth: 640)
            .frame(maxWidth: .infinity)
        }
        .appBackground()
        .navigationTitle("扫描结果")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

private struct InfoRow: View {
    let label: String
    let value: String
    var mono = false
    var last = false

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(Theme.secondary)
            Spacer(minLength: 8)
            Text(value)
                .font(mono ? Font.mono(.footnote) : Font.subheadline)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 12)
        .overlay(alignment: .bottom) {
            if !last {
                Rectangle().fill(Theme.hairline).frame(height: 1)
            }
        }
        .accessibilityElement(children: .combine)
    }
}
