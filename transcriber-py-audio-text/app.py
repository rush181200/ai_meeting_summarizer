from fastapi import FastAPI
from pydantic import BaseModel
from transcriber import transcribe_audio
import uvicorn

app = FastAPI()

class PathRequest(BaseModel):
    filePath: str

@app.post("/transcribe/path")
def transcribe_path(request: PathRequest):
    try:
        transcript = transcribe_audio(request.filePath)
        return { "transcript": transcript }
    except FileNotFoundError as e:
        return { "error": str(e) }
    except Exception as e:
        return { "error": f"Unexpected error: {str(e)}" }

# Optional: explicitly define the server entry point
if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=5001, reload=True)
