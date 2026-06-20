# m4a2mp3

Convert M4A audio files to MP3. Two ways to use it: a command-line tool and a
drag-and-drop browser app. Both run entirely on your own machine — your files
never get uploaded anywhere.

## Browser app (no terminal needed)

1. Double-click **`start.command`**. A small window opens and your browser
   launches the converter automatically.
2. Drop your `.m4a` files onto the page, pick a bitrate, click **Convert**.
3. Click the download link to save each MP3.

The converter runs ffmpeg compiled to WebAssembly (the files in `vendor/`), so it
works fully offline once loaded.

> If double-clicking shows a macOS security warning, right-click `start.command`
> → **Open** → **Open** (only needed once).

## Command-line tool

Requires [ffmpeg](https://ffmpeg.org) (`brew install ffmpeg`).

```bash
./m4a2mp3 song.m4a            # -> song.mp3
./m4a2mp3 ~/Music/podcasts    # convert every .m4a in a folder
./m4a2mp3 -r ~/Music          # ...and subfolders
./m4a2mp3 -b 320k song.m4a    # higher bitrate (default 192k)
./m4a2mp3 -o ./out *.m4a      # write the mp3s into ./out
./m4a2mp3 -h                  # all options
```

Keeps title/artist/album tags, skips files already converted (use `-f` to
overwrite), and reports a summary at the end.

## What's in `vendor/`

The browser app's engine: ffmpeg.wasm and its core (`ffmpeg-core.wasm` is ~32 MB).
These are committed so the tool works immediately after cloning, with no setup step.
