#import "PIUITextFieldDelegate.h"

@implementation PIUITextFieldDelegate {
    FlutterMethodChannel* _channel;
    id _Nullable _args;
}

- (instancetype)initWithChannel:(FlutterMethodChannel*)channel arguments:(id _Nullable)args {
    self = [super init];
    if (self) {
        _channel = channel;
        _args = args;
    }
    return self;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.textColor = textView.text == 0 ? UIColor.lightTextColor : UIColor.blackColor;
    [_channel invokeMethod:@"textFieldDidBeginEditing"
                 arguments:nil];
}

- (void)textViewDidChange:(UITextView *)textView {
    textView.textColor = textView.text == 0 ? UIColor.lightTextColor : UIColor.blackColor;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [_channel invokeMethod:@"textFieldDidEndEditing"
                 arguments:@{ @"text": textView.text }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSUInteger existingLines = [textView.text componentsSeparatedByString:@"\n"].count;
    NSUInteger newLines = [text componentsSeparatedByString:@"\n"].count;
    NSUInteger linesAfterChange = existingLines + newLines - 1;
    return linesAfterChange <= textView.textContainer.maximumNumberOfLines;
}

@end
