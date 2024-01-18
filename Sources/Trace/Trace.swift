import Foundation

public struct Trace : Swift.Error {
  
  
  public let tag      : String
  public let source   : String
  public let line     : Int
  public let file     : String
  public let function : String
  public let custom   : Any?
  
  /*
    Here we use the swift built in macros to grab source info from wherever we throw the error
    NB that these will be on the line you call .trace, so line numbers may be near but wrong
    the most helpful info will be in the other fields.
  */
  
  init(file: String = #file, line: Int = #line, function: String = #function, _ source: Any, tag: String = "", custom: Any? = nil) {
    self.tag      = tag
    self.source   = String(describing: source)
    self.line     = line
    self.file     = file
    self.function = function
    self.custom   = custom
  }
  
  
  public static func trace(file: String = #file, line: Int = #line, function: String = #function, _ source: Any, tag: String = "", custom: Any? = nil) -> Trace {
    return Trace(file: file, line: line, function: function, source, tag: tag, custom: custom)
  }
}






