# piano-visualizer
Minimal piano keyboard visualizer for your videos and livestreams!

How to use:
1. Install [Processing 4](https://processing.org/).

   Also available on Homebrew for macOS:
   ```bash
   brew install processing
   ```
1. Open Processing 4, select Sketch → Import Library… → Manage Libraries…

   Install both “JavaFX” and “The MidiBus”.
1. Open `PianoVisualizer.pde`.
1. Press the ▶️ button once. The program will fail to work as expected, but you will see a list of MIDI input/output ports in the Console panel.
1. Go to Line 38, change the number “999” to your actual MIDI input port number.
1. Press the ▶️ button again and enjoy!
