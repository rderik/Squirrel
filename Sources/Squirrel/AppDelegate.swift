import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

  var statusBarItem: NSStatusItem!
  var counter: Int = 0

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    let statusBar = NSStatusBar.system
    statusBarItem = statusBar.statusItem(
      withLength: NSStatusItem.variableLength)
    statusBarItem.button?.title = "🌰 \(counter)"

    let statusBarMenu = NSMenu(title: "Counter Bar Menu")
    statusBarItem.menu = statusBarMenu

    statusBarMenu.addItem(
      withTitle: "Increase",
      action: #selector(AppDelegate.increaseCount),
      keyEquivalent: "")

    statusBarMenu.addItem(
      withTitle: "Decrease",
      action: #selector(AppDelegate.decreaseCount),
      keyEquivalent: "")
    statusBarMenu.addItem(
      withTitle: "Quit",
      action: #selector(AppDelegate.quit),
      keyEquivalent: "")
  }

  @objc func increaseCount() {
    counter += 1
    statusBarItem.button?.title = "🌰 \(counter)"
  }


  @objc func decreaseCount() {
    counter -= 1
    statusBarItem.button?.title = "🌰 \(counter)"
  }

  @objc func quit() {
    NSApplication.shared.terminate(self)
  }
}
