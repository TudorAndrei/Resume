---
name: tailor-resume
description: Create a tailored resume based on a job description. Use when the user wants to customize their resume for a specific job posting, optimize for ATS filters, or highlight relevant experience.
---

# Tailor Resume for Job Description

## User Information

All personal information, work experience, education, skills, projects, certificates, and other CV content is defined in `cv.typ`. Import and use this data when creating tailored resumes.

## Creating a New Application Resume

1. Create a new directory in `applications/` with the format `CompanyName-JobTitle/`
2. Copy the template: `cp templates/application_resume_template.typ applications/CompanyName-JobTitle/resume.typ`
3. Use `make app applications/CompanyName-JobTitle` to create from template and compile

After creating, tailor the resume content:

### 1. Customize Configuration

```typst
#let include_sections = (
  "skills",
  "work_experience",
  "education",
  // Add/remove sections based on relevance to job
)

#let selected_skills = (
  // Include only skill categories matching the job
  "AI/ML": skills_data.at("AI/ML"),
  "Backend": skills_data.at("Backend"),
  "Data": skills_data.at("Data"),
  "Languages": skills_data.at("Languages")
)
```

### 2. Recreate Experience Bullet Points

For each work experience entry in `content.typ`, rewrite bullet points to:
- Use action verbs matching the job description style
- Highlight achievements relevant to the target role
- Quantify results with percentages, time saved, or metrics
- Match keywords from the job posting

Example restructuring:
```typst
- Architected NVIDIA Triton-based ML inference pipeline processing 1,000+ items/sec with <100ms latency
→ For ML Engineer role: Emphasize ML infrastructure, latency optimization, scalability
→ For Backend role: Focus on API design, distributed systems, performance optimization
```

### 3. Tailor Professional Summary

Write a 3-line summary that:
- Highlights years of experience and key achievements
- Uses keywords from the job description
- Focuses on how your background solves the employer's problems
- Avoids first-person pronouns

### 4. Filter Skills

Only include skill categories from `skills_data` that are relevant to the job description.

## Tailoring Guidelines

### PROFESSIONAL SUMMARY

Write a three-line elevator pitch that:
- Summarizes years of experience and top achievements
- Focuses on how the candidate's background solves problems mentioned in the job post
- Avoids first-person pronouns (I, me, my)
- Uses keywords from the job description

### PROFESSIONAL EXPERIENCE

For each role:
- List in reverse-chronological order (most recent first)
- Include company name, official job title, and employment dates
- Start every bullet point with a powerful action verb (Generated, Managed, Led, Architected, etc.)
- Focus on accomplishments and results, not daily tasks
- Quantify achievements with percentages, dollar amounts, or time saved
- Limit to 4-5 high-impact bullet points per job

### CORE COMPETENCIES / SKILLS

Group skills into categories from `skills_data`:
- Technical Skills
- Software/Tools
- Languages

Include:
- Exact keywords from the job description to pass ATS filters
- Only skills the candidate can demonstrate in an interview

### EDUCATION

Use `education` data from content.typ:
- Most advanced degree first, then university name
- Omit graduation year if over 15 years ago (prevents age bias)
- Omit CGPA unless > 3.5 and recent graduate
- Remove high school once university degree is completed

## OUTPUT

Provide a complete `resume.typ` file that:
1. Imports utils, sections, and content from parent directory
2. Defines which sections to include via `include_sections`
3. Filters skills to match the job via `selected_skills`
4. Rewrites bullet points in work_experience to match the job description
5. Calls `resume.with()` with user info from `personal`
6. Conditionally includes sections using `should-include()`
7. Outputs as `TudorAndrei-Dumitrascu-Resume.pdf` via typst compile
