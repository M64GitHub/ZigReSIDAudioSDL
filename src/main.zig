const std = @import("std");

const RDP = @cImport({
    @cInclude("resid.c");
    @cInclude("resid-dmpplayer.c");
});

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    const dump_player: *RDP.ReSIDDmpPlayer = RDP.ReSIDDmpPlayer_new();

    RDP.ReSIDDmpPlayer_play(dump_player);

    try stdout.print("lalala\n", .{});

    try bw.flush();
}
