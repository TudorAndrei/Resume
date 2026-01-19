---
name: tailor-resume
description: Create a tailored resume based on a job description. Use when the user wants to customize their resume for a specific job posting, optimize for ATS filters, or highlight relevant experience.
---

# Create a Tailored Resume for a Job Application

## Your Task

When the user wants to create a tailored resume for a specific job:

1. **Get the job description** - Ask the user to provide the job posting/description
2. **Analyze job requirements** - Identify key skills, technologies, and experience mentioned
3. **Match with profile** - Cross-reference job requirements with candidate's skills in content.typ
4. **Create tailored config.json** - Select only relevant skills and rewrite experience bullets

## Step 1: Get the Job Description

Ask the user: "Please paste the job description or provide a link to the job posting."

## Step 2: Analyze Job Requirements

Read the job description and identify:
- **Required skills/technologies** (e.g., PyTorch, NLP, Kubernetes, etc.)
- **Preferred skills** (nice to have)
- **Experience level** (e.g., "5+ years", "senior", "lead")
- **Key responsibilities** (what they'll be working on)
- **Domain/industry** (fintech, healthcare, ML infrastructure, etc.)

## Step 3: Match with Candidate Profile

From `content.typ`, you have access to:

**Skills available:**
- `AI/ML`: DSPy, PyTorch, Scikit-Learn, NVIDIA Triton, NLP, CV, DL
- `Backend`: Python, FastAPI, NestJS, Litestar, RESTful APIs
- `Data`: Pandas, MongoDB, PostgreSQL, Redis, RabbitMQ, SurrealDB
- `Frontend`: Typescript, Next.js, React, Remix, TailwindCSS
- `Cloud/DevOps`: Docker, AWS, Azure, CI/CD, Prometheus, Grafana, Nix
- `Languages`: Romanian, English, German

**Work experience (from content.typ work_experience):**
- AI Engineer at CogniSync (Sep 2025 - Present)
- Co-Founder & CTO at Pythia (Jun 2022 - Sep 2025)
- IT Administrator at Cert Sud (Sep 2020 - Sep 2022)
- R&D Intern at Continental (Jun 2019 - Aug 2019)

**Education:**
- M.Sc. Artificial Intelligence - University of Bucharest
- B.Eng. Applied Electronics - Polytechnics University of Bucharest
- Various Erasmus programs

## Step 4: Build the config.json

### A. Select Relevant Skills

For each skill category in `skills_data`, include only skills that:
1. Are mentioned in the job description, OR
2. Are highly relevant to the role even if not explicitly mentioned

Example for an ML Engineer role:
```json
"selected_skills": {
  "AI/ML": ["DSPy", "PyTorch", "NLP", "DL"],
  "Backend": ["Python", "FastAPI", "RESTful APIs"],
  "Data": ["Pandas", "MongoDB", "RabbitMQ"],
  "Languages": ["English", "Romanian"]
}
```

### B. Rewrite Work Experience Bullets

For each job, select bullet points that:
1. Directly relate to job requirements
2. Use keywords from the job posting
3. Quantify achievements (percentages, numbers, time saved)

**DO NOT rephrase existing bullets unnecessarily.** Only select the most relevant ones from `content.typ` work_experience. If needed, you can slightly adjust wording to better match job keywords.

Example:
```json
"work_experience": [
  {
    "title": "Co-Founder & CTO",
    "company": "Pythia Sociodynamical Technologies",
    "location": "Bucharest, Romania",
    "dates": {"start": "Jun 2022", "end": "Sep 2025"},
    "bullets": [
      "Architected NVIDIA Triton-based ML inference pipeline processing 1,000+ news articles/sec with <100ms latency, reducing infrastructure costs by 35%",
      "Engineered LLM & DSPy powered data extraction with intelligent content hashing, increasing accuracy by >40%"
    ]
  }
]
```

### C. Write Professional Summary

Write 3 lines that:
- Directly address the job requirements
- Highlight matching skills and experience
- Use keywords from the job description
- Avoid first-person pronouns (I, me, my)
- Focus on how the candidate's background solves the employer's problems

## Step 5: Create Files

```bash
mkdir -p applications/CompanyName-JobTitle
cp templates/application_template.typ applications/CompanyName-JobTitle/resume.typ
```

Create `config.json` with:
- `position`: The job title
- `professional_summary`: 3-line pitch matching the job
- `include_sections`: Sections to include (typically ["professional_summary", "skills", "work_experience", "education"])
- `selected_skills`: Only skills matching the job
- `work_experience`: Only relevant experience with tailored bullets

## Key Guidelines

1. **DO NOT include irrelevant skills** - If the job doesn't mention React, don't include Frontend skills
2. **DO include niche relevant skills** - If the job needs DSPy or NVIDIA Triton, highlight those
3. **Keep bullets concise** - 3-5 bullets per job entry
4. **Use ATS keywords** - Mirror language from the job posting
5. **Quantify achievements** - Keep metrics (35% cost reduction, 99.9% uptime, etc.)
6. **Order by relevance** - Most relevant job entries first

## Example config.json

```json
{
  "position": "Senior Machine Learning Engineer",
  "professional_summary": "Machine Learning Engineer with 3+ years designing production ML systems. Expert in LLM-powered applications, Triton inference optimization, and scalable data pipelines. Reduced ML infrastructure costs by 35% while processing 1M+ daily transactions.",
  "include_sections": ["professional_summary", "skills", "work_experience", "education"],
  "selected_skills": {
    "AI/ML": ["DSPy", "PyTorch", "NVIDIA Triton", "NLP", "LLMs"],
    "Backend": ["Python", "FastAPI", "RESTful APIs"],
    "Data": ["Pandas", "MongoDB", "RabbitMQ"],
    "Cloud/DevOps": ["Docker", "AWS", "Prometheus", "Grafana"],
    "Languages": ["English", "Romanian"]
  },
  "work_experience": [
    {
      "title": "Co-Founder & CTO",
      "company": "Pythia Sociodynamical Technologies",
      "location": "Bucharest, Romania",
      "dates": {"start": "Jun 2022", "end": "Sep 2025"},
      "bullets": [
        "Architected NVIDIA Triton-based ML inference pipeline processing 1,000+ items/sec with <100ms latency, reducing infrastructure costs by 35%",
        "Engineered LLM-powered data extraction using DSPy, improving accuracy by 40% while reducing inference costs",
        "Deployed comprehensive observability stack with Prometheus and Grafana, maintaining 99.9% system uptime"
      ]
    },
    {
      "title": "AI Engineer",
      "company": "CogniSync",
      "location": "Bucharest, Romania",
      "dates": {"start": "Sep 2025", "end": "Present"},
      "bullets": [
        "Engineered AI system for processing and understanding large legal documents using modern LLM techniques"
      ]
    }
  ]
}
```

## Compiling the Resume

```bash
make app applications/CompanyName-JobTitle
make compile-app applications/CompanyName-JobTitle
make watch-app applications/CompanyName-JobTitle
```
