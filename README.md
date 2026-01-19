# CV and Resume Management System

This repository contains a system for maintaining a complete CV and creating tailored resumes for specific job applications using [Typst](https://typst.app/).

## System Overview

The system follows a simple but powerful principle: maintain a single source of truth for all your professional information in the complete CV, and then selectively include only relevant content when creating targeted resumes for specific job applications.

### Directory Structure

```
Resume/
├── cv.typ                # Complete CV with ALL sections
├── content.typ           # Source data for all CV entries
├── sections.typ          # Section rendering functions
├── utils.typ             # Utility functions and component definitions
├── links.typ             # Social media link styling
├── applications/         # Company-specific job applications
│   ├── CompanyName-JobTitle/  # Organized by company and position
│   │   └── resume.typ    # Tailored resume for the specific company/role
│   ├── OpenAI-AIEngineer/
│   │   └── resume.typ    
│   ├── Google-BackendDeveloper/
│   │   └── resume.typ    
│   └── Microsoft-FullstackDeveloper/
│       └── resume.typ    
└── README.md             # This documentation
```

## How It Works

1. All content is defined in `content.typ` as structured data
2. The `cv.typ` file includes all sections and renders the complete CV
3. Application-specific resumes in the `applications/` directory selectively include content from the main CV

## Creating a New Application Resume

To create a resume tailored for a specific job application:

1. Create a new directory in `applications/` with the format `CompanyName-JobTitle/`
2. Create a `resume.typ` file in that directory
3. Define which sections to include and any custom filtering of skills or experience

Example:

```bash
# Create a new directory for the application
mkdir -p applications/Amazon-DataEngineer

# Create a resume file for this specific application
touch applications/Amazon-DataEngineer/resume.typ
```

Then, in your resume file:

```typst
// Resume for Amazon - Data Engineer position
#import "../../utils.typ": *
#import "../../sections.typ": *
#import "../../content.typ": *

// Define which sections to include in this resume
#let include_sections = (
  "skills",
  "work_experience",
  "education",
  "projects",
  "certificates"
)

// Select skills most relevant to the position
#let selected_skills = (
  "Data": skills_data.at("Data"),
  "Backend": skills_data.at("Backend"),
  "Cloud/DevOps": skills_data.at("Cloud/DevOps"),
  "Languages": skills_data.at("Languages")
)

#show: resume.with(
  author: personal.name,
  location: personal.location,
  position: "Data Engineer",  // Customize job title
  email: personal.email,
  github: personal.github,
  linkedin: personal.linkedin,
  phone: personal.phone,
  accent-color: "#FF9900",  // Amazon orange
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

// Only include sections that are in the include_sections list
// Skills Section with filtered categories
#if should-include("skills", include_sections) [
  #skills-section(selected_skills)
]

// Work Experience Section
#if should-include("work_experience", include_sections) [
  #work-section(work_experience)
]

// Education Section
#if should-include("education", include_sections) [
  #education-section(education)
]

// Other sections you want to include...
```

## Using the Makefile

The system includes a Makefile that simplifies common operations. You can view all available commands by running:

```bash
# Show all available commands with descriptions
make help
```

Here's how to use the various commands:

### Building the CV

```bash
# Build the complete CV
make cv

# Watch the CV for changes (auto-rebuild on save)
make watch-cv
```

### Working with Application Resumes

```bash
# List all available application resumes
make list

# Create a new application resume
make app applications/Amazon-DataEngineer

# Compile an existing application resume
make app applications/OpenAI-AIEngineer

# Watch an application resume for changes
make watch-app applications/Google-BackendDeveloper

# Build all application resumes at once
make build-all
```

Note: When compiling resumes, the output file will always be named `TudorAndrei-Dumitrascu-Resume.pdf` and saved in the same directory as the application's resume.typ file. For example:

```
applications/OpenAI-AIEngineer/TudorAndrei-Dumitrascu-Resume.pdf
```

### Cleaning Up

```bash
# Remove all generated PDF files
make clean
```

### Backing up to Git

```bash
# Add, commit, and push all changes to git
make git
```

## Adding New Content

To add new entries to your CV:

1. Edit the appropriate section in `content.typ`
2. Your new content will automatically be included in the full CV
3. It will also appear in any application resume that includes that section

## Tips for Effective Resume Targeting

- Include only the most relevant sections for each position
- Customize your skills to highlight those most relevant to the role
- Adjust your job title to match the position you're applying for
- Consider the company's culture and brand when selecting accent colors

## Dependencies

This project uses the following Typst packages:

- **fontawesome (0.6.0)**: Used for social media and contact icons in the CV/Resume. The package is imported automatically without needing to install font files.
- **scienceicons (0.1.0)**: Used for additional specialized icons.

These packages are imported via the Typst package manager and don't require any additional installation.