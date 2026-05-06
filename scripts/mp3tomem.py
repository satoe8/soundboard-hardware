import numpy as np
from scipy.io import wavfile

# 1. Load the WAV file
# Note: Ensure you exported your MP3 to a WAV first using a tool like Audacity
fs, data = wavfile.read('your_sound.wav')

# 2. Handle Stereo to Mono conversion
if len(data.shape) > 1:
    print("Stereo detected. Converting to Mono...")
    data = data.mean(axis=1)

# 3. Normalize to 8-bit (0-255) using floats to prevent overflow
data_float = data.astype(float)
data_min = np.min(data_float)
data_max = np.max(data_float)

# Avoid division by zero if the file is silent
if data_max != data_min:
    normalized = ((data_float - data_min) / (data_max - data_min) * 255).astype(np.uint8)
else:
    normalized = np.zeros_like(data).astype(np.uint8)

# 4. Save as Hex for SystemVerilog $readmemh
with open('sounds.mem', 'w') as f:
    for sample in normalized:
        # Convert to standard Python int to satisfy the hex formatter
        f.write(f"{int(sample):02x}\n")

print(f"Success! sounds.mem generated with {len(normalized)} samples.")