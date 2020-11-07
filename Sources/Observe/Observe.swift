final public class Observe<T> {
    private var notify: ((T?) -> Void)
    
    public var newValue: T? {
        didSet {
            notify(newValue)
        }
    }
    
    public init(_ notify: @escaping (T?) -> Void) {
        self.notify = notify
    }
    
}
