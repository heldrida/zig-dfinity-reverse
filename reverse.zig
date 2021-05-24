const print = @import("std").debug.print;

extern "ic0" fn msg_arg_data_size() i32;
extern "ic0" fn msg_arg_data_copy(dst : [*]u8, offset : i32, size : i32) void;
extern "ic0" fn debug_print(src : [*]u8, size : i32) void;
extern "ic0" fn msg_reply_data_append(src : [*]u8, size : i32) void;
extern "ic0" fn msg_reply() void;

export fn @"canister_query go"() void {
  var buf: []const u8 = "undefined";
  const sz = msg_arg_data_size();
  var c_target: [*]u8 = @ptrCast([*c]u8, &buf);
  msg_arg_data_copy(c_target, 0, sz);

  debug_print(c_target[7..10], sz);
  msg_reply_data_append(c_target, sz);
  msg_reply();
}
