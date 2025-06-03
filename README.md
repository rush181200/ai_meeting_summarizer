# AI Meeting Summarizer

Hi there! 👋  
This is a project I’ve been working on to make meeting follow-ups easier. It’s an AI-powered tool that records, transcribes, and summarizes meetings so you never miss the key points.

---

## What I Built (First Version)

I started with a simple mobile app that works offline and gets the job done.

### Tech Stack:
- **Flutter** — Mobile app to record meetings
- **SQLite** — Local storage for offline access
- **Spring Boot** — Backend to handle logic and API calls
- **Flask** — Converts audio to text (speech-to-text)
- **Ollama AI (via Spring AI)** — Creates clean summaries from the transcripts

### How it Works:
1. Record a meeting in the Flutter app  
2. Audio is sent to the Spring Boot backend  
3. Backend calls the Flask service to transcribe the audio  
4. Transcript is sent to Ollama AI for summarization  
5. Summary is returned and saved locally

It’s simple, fast, and perfect for personal use.

---

## What I’m Building Next (Cloud-Ready Version)

As I plan to scale this up, I’m redesigning the system for the cloud — to handle more users and grow easily.

### ☁️ Planned Architecture:
- **Flutter** app (same as before)
- Audio files uploaded to **AWS S3**
- Use **AWS SQS** to queue processing jobs
- **Spring Boot** backend to orchestrate everything
- **AWS Lambda** runs the Flask service to transcribe audio
- Summarization done by **Ollama** as a separate microservice
- All data stored in **AWS DynamoDB**

### How the Flow Changes:
1. Audio gets uploaded to the cloud
2. A message is sent to SQS to start processing
3. Lambda + Flask convert the audio to text
4. Text goes to the summarizer
5. Summary and transcript saved in DynamoDB
6. App fetches the results

---

## Why I’m Doing This

The first version works well, but I want it to:
- Handle more users
- Be reliable and fault-tolerant
- Scale without much manual work

Cloud services like AWS S3, SQS, and Lambda help make that possible.

---

## Who Am I?

I'm a full-stack developer who loves building real-world tools like this.  
Currently looking for Software Engineer roles where I can work on:
- Mobile + Backend systems
- AI-driven features
- Cloud-native applications

📧 Email: **rushabhm75@gmail.com**

---

## 💬 Have You Scaled a Project?

If you’ve ever taken a simple app and scaled it to production — I’d love to hear how you did it and what you learned.

---

### Tags

`#Flutter` `#SpringBoot` `#AI` `#AWS` `#Microservices` `#MeetingSummarizer` `#OpenToWork`
