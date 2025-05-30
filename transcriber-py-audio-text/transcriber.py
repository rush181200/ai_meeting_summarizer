import whisper
import os

# Load the model once globally
model = whisper.load_model("base")  # Options: "tiny", "base", "small", "medium", "large"

def transcribe_audio(path: str) -> str:
    if not os.path.exists(path):
        raise FileNotFoundError(f"❌ Audio file not found at path: {path}")

    try:
        print(f"[🔊] Transcribing audio from: {path}")
        result = model.transcribe(path)

        transcript = result.get("text", "").strip()

        if not transcript:
            print("⚠️ No transcript returned.")
            return "[No speech detected or empty transcript]"

        print(f"[📜] Transcript (first 100 chars): {transcript[:100]}")
        return transcript

    except Exception as e:
        print(f"[❌] Error during transcription: {e}")
        return "[Error during transcription]"
