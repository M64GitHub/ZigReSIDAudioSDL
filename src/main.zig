const std = @import("std");

// fn add(x: i32, y: i32) i32 {
//     // TODO: Instead of reimplementing this in Zig, call the C version.
//     return x + y;
// }

const arithmetic = @cImport({
    @cInclude("arithmetic.c");
});

const RDP = @cImport({
    @cInclude("resid-dmpplayer.c");
});

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    const x: i32 = 5;
    const y: i32 = 16;
    const z: i32 = arithmetic.add(x, y);

    const rp: *RDP.ReSIDDmpPlayer = RDP.ReSIDDmpPlayer_new();

    RDP.ReSIDDmpPlayer_play(rp);

    try stdout.print("lalala {d}\n", .{z});

    try bw.flush();
}
