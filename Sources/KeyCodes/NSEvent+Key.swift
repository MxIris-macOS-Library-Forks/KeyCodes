#if os(macOS)
import Carbon.HIToolbox
import AppKit

extension NSEvent {
    var keyModifierFlags: KeyModifierFlags? {
        guard type == .keyDown || type == .keyUp else {
            return nil
        }

        var flags = KeyModifierFlags(rawValue: 0)

        let deviceIndependentFlags = modifierFlags.intersection([.deviceIndependentFlagsMask])

        if deviceIndependentFlags.contains(.control) {
            flags.insert(.control)
        }

        if deviceIndependentFlags.contains(.shift) {
            flags.insert(.shift)
        }

        if deviceIndependentFlags.contains(.command) {
            flags.insert(.command)
        }

        if deviceIndependentFlags.contains(.option) {
            flags.insert(.alternate)
        }

        if deviceIndependentFlags.contains(.capsLock) {
            flags.insert(.alphaShift)
        }

        return flags
    }

    var keyboardHIDUsage: KeyboardHIDUsage? {
        guard type == .keyDown || type == .keyUp else {
            return nil
        }

        switch Int(keyCode) {
        case kVK_ANSI_A:
            return .keyboardA
        case kVK_ANSI_B:
            return .keyboardB
        case kVK_ANSI_C:
            return .keyboardC
        case kVK_ANSI_D:
            return .keyboardD
        case kVK_ANSI_E:
            return .keyboardE
        case kVK_ANSI_F:
            return .keyboardF
        case kVK_ANSI_G:
            return .keyboardG
        case kVK_ANSI_H:
            return .keyboardH
        case kVK_ANSI_I:
            return .keyboardI
        case kVK_ANSI_J:
            return .keyboardJ
        case kVK_ANSI_K:
            return .keyboardK
        case kVK_ANSI_L:
            return .keyboardL
        case kVK_ANSI_M:
            return .keyboardM
        case kVK_ANSI_N:
            return .keyboardN
        case kVK_ANSI_O:
            return .keyboardO
        case kVK_ANSI_P:
            return .keyboardP
        case kVK_ANSI_Q:
            return .keyboardQ
        case kVK_ANSI_R:
            return .keyboardR
        case kVK_ANSI_S:
            return .keyboardS
        case kVK_ANSI_T:
            return .keyboardT
        case kVK_ANSI_U:
            return .keyboardU
        case kVK_ANSI_V:
            return .keyboardV
        case kVK_ANSI_W:
            return .keyboardW
        case kVK_ANSI_X:
            return .keyboardX
        case kVK_ANSI_Y:
            return .keyboardY
        case kVK_ANSI_Z:
            return .keyboardZ

        case kVK_ANSI_0:
            return .keyboard0
        case kVK_ANSI_1:
            return .keyboard1
        case kVK_ANSI_2:
            return .keyboard2
        case kVK_ANSI_3:
            return .keyboard3
        case kVK_ANSI_4:
            return .keyboard4
        case kVK_ANSI_5:
            return .keyboard5
        case kVK_ANSI_6:
            return .keyboard6
        case kVK_ANSI_7:
            return .keyboard7
        case kVK_ANSI_8:
            return .keyboard8
        case kVK_ANSI_9:
            return .keyboard9

        case kVK_LeftArrow:
            return .keyboardLeftArrow
        case kVK_RightArrow:
            return .keyboardRightArrow
        case kVK_UpArrow:
            return .keyboardUpArrow
        case kVK_DownArrow:
            return .keyboardDownArrow

        case kVK_ANSI_Equal:
            return .keyboardEqualSign
        case kVK_ANSI_Minus:
            return .keypadHyphen
        case kVK_ANSI_RightBracket:
            return .keyboardOpenBracket
        case kVK_ANSI_LeftBracket:
            return .keyboardCloseBracket
        case kVK_ANSI_Quote:
            return .keyboardQuote
        case kVK_ANSI_Semicolon:
            return .keyboardSemicolon
        case kVK_ANSI_Backslash:
            return .keyboardBackslash
        case kVK_ANSI_Comma:
            return .keyboardComma
        case kVK_ANSI_Slash:
            return .keyboardSlash
        case kVK_ANSI_Period:
            return .keyboardPeriod

        case kVK_Return:
            return .keyboardReturn
        case kVK_Tab:
            return .keyboardTab
        case kVK_Space:
            return .keyboardSpacebar
        case kVK_Delete:
            return .keyboardDeleteOrBackspace
        case kVK_Escape:
            return .keyboardEscape

        default:
            return nil
        }
    }

    public var key: Key? {
        let chars = characters ?? ""
        let charsIgnoringModifiers = charactersIgnoringModifiers ?? ""

        switch (keyboardHIDUsage, keyModifierFlags) {
        case (let key?, let mods?):
            return Key(keyCode: key,
                       characters: chars,
                       charactersIgnoringModifiers: charsIgnoringModifiers,
                       modifierFlags: mods)
        default:
            return nil
        }
    }
}
#endif
