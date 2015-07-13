#import <AudioToolbox/AudioServices.h>

%hook TUCallCenter

-(void)handleCallConnected:(id)arg1 {
	NSLog(@"[CallConnect] call connected");
	if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
		AudioServicesPlaySystemSound(1352); //this key works regardless of the silent switch or the settings on the device - credit to jakob.j 
	}
	%orig;
}

%end

%ctor {
	if ([[NSBundle bundleWithPath:@"/System/Library/SpringBoardPlugins/IncomingCall.servicebundle"] load]) {
		NSLog(@"[CallConnect] bundle loaded succesfully!");
	}
	else {
		NSLog(@"[CallConnect] bundle did not load succesfully.");
	}
}