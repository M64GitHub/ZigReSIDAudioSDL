const std = @import("std");

const SID = @cImport({
    @cInclude("resid.c");
});

const RDP = @cImport({
    @cInclude("resid.h");
    @cInclude("resid-dmpplayer.c");
});

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    const sid: *SID.ReSID = SID.ReSID_new();
    const dump_player: *RDP.ReSIDDmpPlayer = RDP.ReSIDDmpPlayer_new();

    SID.ReSID_init(sid);
    RDP.ReSIDDmpPlayer_play(dump_player);

    try stdout.print("lalala\n", .{});

    try bw.flush();
}
