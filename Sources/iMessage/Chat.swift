import Foundation

public struct Chat: Identifiable, Hashable, Codable, Sendable {
    public var id: GUID
    public let displayName: String?
    public let participants: [Account.Handle]
    public let lastMessageDate: Date?
    public let unreadCount: Int
    public let unreadMentionsCount: Int
    public let isMuted: Bool
}

// MARK: - Comparable

extension Chat: Comparable {
    public static func < (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.lastMessageDate ?? .distantPast < rhs.lastMessageDate ?? .distantPast
    }
}
