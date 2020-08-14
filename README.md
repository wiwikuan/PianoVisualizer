# PianoVisualizer

Minimal piano keyboard visualizer for your videos and livestreams!

How to use:

1. **Install [Processing 3](https://processing.org/)**

    [Download](https://processing.org/download/) a right OS version for you. Extract it, execute the `process` program.

2. **Install [The MidiBus](http://www.smallbutdigital.com/projects/themidibus/) Library**

    In `Sketch` - `Import Library` - `Add Library`, keyin `midi` in `Filter` field, select `The MidiBus` and click `Install` button.

3. **Open [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde) in Processing 3**

    Download [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde) and save it under a `PianoVisualizer` folder. Open it by `File` - `Open`.
    
    If you see garbled text on Windows, that's Chinese text. You can fix it by `File` - `Preferences`, choose a Chinese font on `Editor and Console font` field.

4. **Edit source code to select MIDI Input device**

    Run it by `Sketch` - `Run` then close the `PianoVisualizer` window. Look for `Available MIDI Devices` - `Input` in the `Console` panel under the editor. Copy the name of your MIDI Input device. Replace `"MIDI Input device name"` into your MIDI Input device name in the editor. Run it again.

5. **Enjoy!**

    You can `File` - `Export Application` to make a standalone app for later to run (under the `PianoVisualizer` folder).

[NiceChord](http://nicechord.com/) has an instruction video [我寫了一個「鋼琴鍵盤顯示app」，免費送給大家 + 使用教學！](https://www.youtube.com/watch?v=37MvNiNqaCM)

### Windows

If you need to use PianoVirtualizer with other MIDI app like DAW together, you can share the MIDI Input device by this way:

1. **Connect MIDI Input device**

    Close MIDI app and PianoVirtualizer. Then connect your MIDI Input device.

2. **Create 2 virtual MIDI ports**

    Install [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html) and run it. Press `+(Add Port)` button twice to create `loopMIDI Port` and `loopMIDI Port 1`.

3. **Route MIDI Input device to 2 virtual ports**

    1. Install [MIDI Patchbay](https://soundigy.com/midipatchbay.php) and run it as Administrator (default at `%ProgramFiles%\Soundigy\MIDI Patchbay\MIDIPatchbay.exe`).

    2. Open `Options` - `Map MIDI Ins/Outs`. Select your MIDI Input device in `IN 1`. Then `OUT 1` as `loopMIDI Port`, and `OUT 2` as `loopMIDI Port 1`, click `OK` to close.
    
    3. Click `INPUT`'s `1` button, then click `OUTPUT`'s `1` and `2` buttons from main UI to route `IN 1` to `OUT 1` and `OUT 2`.

4. **Setup MIDI app to receive input from first virtual port**

    Open your MIDI app. Setup it's MIDI Input device as `loopMIDI Port`. And stop receiving from your MIDI Input device directly.

5. **Setup PianoVirtualizer to receive input from second virtual port**

    Use `"loopMIDI Port 1"` as `"MIDI Input device name"` in `PianoVirtualizer.pde` then run it.

6. **Enjoy!**

    Now start playing! Your MIDI app and PianoVirtualizer should work together. You can `Save` current config in `MIDI Patchbay`. Next time you don't need to run it as Administrator.

---

## 繁體中文

在您的影片及直播中顯示精簡鋼琴鍵盤!

如何使用:

1. **安裝 [Processing 3](https://processing.org/)**

    [下載](https://processing.org/download/)符合你作業系統的版本，解壓縮並執行 `process` 程式。(若想使用簡體中文介面，可在 `File` - `Preferences` - `Language` 中選擇`中文`，並重開程式生效)

2. **安裝 [The MidiBus](http://www.smallbutdigital.com/projects/themidibus/) 函式庫**

    在 `Sketch/速写本` - `Import Library/引用库文件` - `Add Library/添加库文件`中，於 `Filter` 欄位輸入 `midi`，選擇 `The MidiBus` 再按 `Install` 鈕。

3. **在 Processing 3 中開啟 [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde)**

    下載 [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde) 並儲存於 `PianoVisualizer` 資料夾下。由 `File/文件` - `Open/打开` 中開啟該檔。
    
    如果你在 Windows 中看到亂碼，那是中文。你可以在 `File/文件` - `Preferences/偏好设定`中，於 `Editor and Console font/编辑器和控制台字体`中選擇一個中文字體如 `MingLiU` (細明體)。

4. **修改程式碼以選擇 MIDI 輸入埠**

    於 `Sketch/速写本` - `Run/运行` 執行，再關掉 `PianoVisualizer` 視窗。在編輯器下方之 `Console` 面板中，找到 `Available MIDI Devices` - `Input` 項目。複製你的 MIDI 輸入裝置名稱。在編輯器中找到 `"MIDI Input device name"` 並換成你的 MIDI 輸入裝置名稱。再一次執行程式。

5. **開始使用!**

    你可以用 `File/文件` - `Export Application/输出程序`功能，建立獨立應用程式 (於 `PianoVisualizer` 資料夾)，以供以後直接執行使用。

[NiceChord 好和弦](http://nicechord.com/)提供了[我寫了一個「鋼琴鍵盤顯示app」，免費送給大家 + 使用教學！](https://www.youtube.com/watch?v=37MvNiNqaCM)影片。

### Windows

如果你需要讓 PianoVirtualizer 與其他 MIDI 程式如 DAW 一起運作，你可以用下述方法共用 MIDI Input 裝置:

1. **連接 MIDI Input 裝置**

    關閉 MIDI 程式及 PianoVirtualizer，再連接你的 MIDI Input 裝置。

2. **建立兩個虛擬 MIDI 埠**

    安裝 [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html) 並執行。按 `+(Add Port)` 按鈕兩次以建立 `loopMIDI Port` 及 `loopMIDI Port 1`。

3. **將 MIDI Input 裝置重導向至兩個虛擬埠**

    1. 安裝 [MIDI Patchbay](https://soundigy.com/midipatchbay.php) 並以系統管理員權限執行。(預設在 `%ProgramFiles%\Soundigy\MIDI Patchbay\MIDIPatchbay.exe`)

    2. 開啟 `Options` - `Map MIDI Ins/Outs`。在 `IN 1` 選擇你的 MIDI Input 裝置。然後 `OUT 1` 選擇`loopMIDI Port`，以及 `OUT 2` 選擇 `loopMIDI Port 1`，點選 `OK` 關閉。
    
    3. 在主視窗中點 `INPUT` 的 `1` 按鈕，然後點 `OUTPUT` 的 `1` 及 `2` 按鈕，以將 `IN 1` 重導向至 `OUT 1` 及 `OUT 2`。

4. **設定 MIDI 程式接收第一個虛擬埠的輸入**

    開啟你的 MIDI 程式。設定 MIDI Input 裝置為 `loopMIDI Port`。並停止直接接收 MIDI Input 裝置訊號。

5. **設定 PianoVirtualizer 接收第二個虛擬埠的輸入**

    在 `PianoVirtualizer.pde` 中以 `"loopMIDI Port 1"` 為 `"MIDI Input device name"` 的值，並執行它。

6. **開始使用!**

    現在開始彈奏! 你的 MIDI 程式及 PianoVirtualizer 應該可以一起運作了。你可以點 `MIDI Patchbay` 中的 `Save` 按鈕將目前設定儲存起來。下次你不再需要以系統管理員權限執行它。

---

## 简体中文

在您的影片及直播中显示精简钢琴键盘!

如何使用:

1. **安装 [Processing 3](https://processing.org/)**

    [下载](https://processing.org/download/)符合你作业系统的版本，解压缩并执行 `process` 程式。 (若想使用简体中文介面，可在 `File` - `Preferences` - `Language` 中选择`中文`，并重开程式生效)

2. **安装 [The MidiBus](http://www.smallbutdigital.com/projects/themidibus/) 库文件**

    在 `Sketch/速写本` - `Import Library/引用库文件` - `Add Library/添加库文件`中，于 `Filter` 栏位输入 `midi`，选择 `The MidiBus` 再按 `Install` 钮。

3. **在 Processing 3 中开启 [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde)**

    下载 [PianoVisualizer.pde](https://raw.githubusercontent.com/wiwikuan/PianoVisualizer/master/PianoVisualizer.pde) 并储存于 `PianoVisualizer` 资料夹下。由 `File/文件` - `Open/打开` 中打开该文件。
    
    如果你在 Windows 中看到乱码，那是中文。你可以在 `File/文件` - `Preferences/偏好设定`中，于 `Editor and Console font/编辑器和控制台字体`中选择一个中文字体如 `SimSun` (中易宋体)。

4. **修改程式码以选择 MIDI 输入埠**

    于 `Sketch/速写本` - `Run/运行` 执行，再关掉 `PianoVisualizer` 视窗。在编辑器下方之 `Console` 面板中，找到 `Available MIDI Devices` - `Input` 项目。复制你的 MIDI 输入装置名称。在编辑器中找到 `"MIDI Input device name"` 并换成你的 MIDI 输入装置名称。再一次执行程式。

5. **开始使用!**

    你可以用 `File/文件` - `Export Application/输出程序`功能，建立独立应用程式 (于 `PianoVisualizer` 资料夹)，以供以后直接执行使用。

[NiceChord 好和弦](http://nicechord.com/)提供了[我寫了一個「鋼琴鍵盤顯示app」，免費送給大家 + 使用教學！](https://www.youtube.com/watch?v=37MvNiNqaCM)影片。

### Windows

如果你需要让 PianoVirtualizer 与其他 MIDI 程式如 DAW 一起运作，你可以用下述方法共用 MIDI Input 装置:

1. **连接 MIDI Input 装置**

    关闭 MIDI 程式及 PianoVirtualizer，再连接你的 MIDI Input 装置。

2. **建立两个虚拟 MIDI 埠**

    安装 [loopMIDI](https://www.tobias-erichsen.de/software/loopmidi.html) 并执行。按 `+(Add Port)` 按钮两次以建立 `loopMIDI Port` 及 `loopMIDI Port 1`。

3. **将 MIDI Input 装置重导向至两个虚拟埠**

    1. 安装 [MIDI Patchbay](https://soundigy.com/midipatchbay.php) 并以系统管理员权限执行。 (预设在 `%ProgramFiles%\Soundigy\MIDI Patchbay\MIDIPatchbay.exe`)

    2. 开启 `Options` - `Map MIDI Ins/Outs`。在 `IN 1` 选择你的 MIDI Input 装置。然后 `OUT 1` 选择`loopMIDI Port`，以及 `OUT 2` 选择 `loopMIDI Port 1`，点选 `OK` 关闭。
    
    3. 在主视窗中点 `INPUT` 的 `1` 按钮，然后点 `OUTPUT` 的 `1` 及 `2` 按钮，以将 `IN 1` 重导向至 `OUT 1` 及 `OUT 2`。

4. **设定 MIDI 程式接收第一个虚拟埠的输入**

    开启你的 MIDI 程式。设定 MIDI Input 装置为 `loopMIDI Port`。并停止直接接收 MIDI Input 装置讯号。

5. **设定 PianoVirtualizer 接收第二个虚拟埠的输入**

    在 `PianoVirtualizer.pde` 中以 `"loopMIDI Port 1"` 为 `"MIDI Input device name"` 的值，并执行它。

6. **开始使用!**

    现在开始弹奏! 你的 MIDI 程式及 PianoVirtualizer 应该可以一起运作了。你可以点 `MIDI Patchbay` 中的 `Save` 按钮将目前设定储存起来。下次你不再需要以系统管理员权限执行它。