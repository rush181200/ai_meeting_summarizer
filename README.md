# Real-Time Meeting Transcription & Summarization App

In today’s fast-paced business world, effective communication and meeting documentation are critical. This project delivers a real-time transcription and summarization application for business meetings, combining cutting-edge AI with robust backend and frontend technologies. It enables seamless audio processing, instant text conversion, and insightful summaries to boost productivity and collaboration.

---

## Table of Contents

* Overview
* Objectives
* Technologies Used
* Project Structure
* Features
* Implementation Details
* Future Enhancements
* References

---

## Overview

This application leverages a multi-tiered architecture using **Flutter** for a responsive cross-platform mobile app, and **Spring Boot** with **Spring AI** on the backend. The audio processing employs Python’s **LLaMA** models for real-time transcription. Communication between frontend and backend is optimized with **gRPC** to minimize latency.

The backend is deployed serverlessly on **AWS Lambda** with **AWS RDS (MySQL)** for reliable persistent storage. For offline and instant UI updates, **SQLite** is integrated on the client side using **Provider** for state management. This design ensures scalable, low-latency, and secure transcription and summarization services.

---

## Objectives

* Build a scalable and responsive real-time transcription system for meetings.
* Integrate AI-driven summarization for quick insights.
* Enable low-latency communication using gRPC streams.
* Provide cross-platform mobile access through Flutter.
* Ensure serverless deployment for cost-effective scaling using AWS Lambda.
* Maintain persistent meeting data storage in AWS RDS and offline caching in SQLite.
* Implement secure authentication and seamless UI updates with Provider.

---

## Technologies Used

**Backend:** Spring Boot, Spring AI, Spring Security, Spring Data JPA, gRPC
**AI & Audio Processing:** Python, LLaMA
**Frontend:** Flutter, Provider, SQLite
**Cloud & Infrastructure:** AWS Lambda, AWS RDS (MySQL), Amazon S3
**Communication:** gRPC (low-latency streaming), REST APIs
**CI/CD:** Jenkins, GitHub Actions

---

## Features

* **Real-Time Transcription:** Converts speech to text instantly using LLaMA models.
* **AI Summarization:** Generates concise meeting summaries automatically.
* **Low-Latency Communication:** gRPC streams for fast audio and data transfer.
* **Cross-Platform Mobile:** Flutter app providing seamless user experience.
* **Offline Support:** SQLite caching for quick UI updates without network lag.
* **Serverless Deployment:** AWS Lambda hosting for scalable backend execution.
* **Persistent Storage:** AWS RDS for durable meeting data management.
* **Secure Authentication:** JWT-based security for API protection.
* **Automated Pipelines:** Jenkins-enabled CI/CD for streamlined build and deployment.

---

## Implementation Details

### Backend

* Built on Spring Boot with modular microservices for transcription and summarization.
* Uses Spring AI to integrate Python LLaMA models for audio-to-text processing.
* gRPC bidirectional streaming handles audio streams and real-time responses.
* Data persistence with Spring Data JPA connected to AWS RDS (MySQL).
* Authentication and authorization implemented via Spring Security with JWT.
* Deployed serverlessly on AWS Lambda triggered by API Gateway.

### AI Engine

* Python-based LLaMA models process audio streams asynchronously.
* Exposes gRPC endpoints consumed by Spring backend for integration.

### Frontend

* Flutter app uses Provider for reactive state management and SQLite for local caching.
* Audio captured and streamed via gRPC to backend.
* Real-time updates of transcripts and summaries on UI.

### CI/CD & Deployment

* Jenkins pipelines automate testing, building, and deployment to AWS Lambda.
* Docker used for local testing and containerized workflows.

---

## Future Enhancements

* Add multi-language transcription and summarization support.
* Integrate advanced NLP features like sentiment analysis.
* Support for video meeting transcription and speaker diarization.
* Enhance offline-first capabilities with full synchronization.
* Introduce push notifications for meeting highlights and reminders.
* Expand deployment to Kubernetes for hybrid cloud scalability.

---

## References

* [Flutter Documentation](https://flutter.dev/docs)
* [Spring Boot Reference Guide](https://spring.io/projects/spring-boot)
* [gRPC Official Site](https://grpc.io/)
* [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [Python LLaMA Repository](https://github.com/facebookresearch/llama)
