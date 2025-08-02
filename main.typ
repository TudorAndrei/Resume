#import "utils.typ": *

#let name = "Tudor Andrei Dumitrascu"
#let position = "AI Engineer"
#let location = "Bucharest, Romania"
#let email = "tudorandrei.dumitrascu@gmail.com"
#let github = "https://github.com/tudorandrei"
#let linkedin = "https://www.linkedin.com/in/tudor-pythia/"
#let phone = "(+40)-761-471-916"

#show: resume.with(
  author: name,
  location: location,
  position: position,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  accent-color: "#26428b",
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

== Skills
#skills(
  categories: (
    "AI/ML": ("DSPy", "PyTorch", "Scikit-Learn", "NVIDIA Triton", "NLP", "CV", "DL"),
    "Backend": ("Python", "FastAPI", "NestJS", "Litestar", "RESTful APIs"),
    "Data": ("Pandas", "MongoDB", "PostgreSQL", "Redis", "RabbitMQ", "SurrealDB"),
    "Frontend": ("Typescript", "Next.js", "React", "Remix", "TailwindCSS"),
    "Cloud/DevOps": ("Docker", "AWS", "Azure", "CI/CD", "Prometheus", "Grafana", "Nix"),
  )
)

== Work Experience

#work(
  title: "Lead AI Engineer",
  location: "Bucharest, Romania",
  company: "Paradigm Research",
  dates: dates-helper(start-date: "Jan 2023", end-date: "Present"),
)
- Designed custom algorithms generating plausible trading scenarios from real-world market data
- Developed bias detection algorithms on synthetic population models for financial risk assessment
- Delivered efficient Named Entity Recognition and Sentiment Analysis solutions for financial text processing

#work(
  title: "Co-Founder & CTO",
  location: "Bucharest, Romania",
  company: "Pythia Sociodynamical Technologies",
  dates: dates-helper(start-date: "Jun 2022", end-date: "Present"),
)
- Architected NVIDIA Triton-based ML inference pipeline that processes 1,000+ news articles per second with \<100ms latency, reducing infrastructure costs by 35%
- Engineered LLM & DSPy powered data extraction with pipeline with intelligent content hashing, increasing data extraction accuracy by \>40% while reducing inference costs
- Built distributed news scraper with Scrapy and RabbitMQ that integrated 41+ sources in one week, processing 500K+ articles daily with 99.5% uptime
- Developed multi-tenant SaaS platform leveraging Next.js and SurrealDB for automated KYC/AML compliance workflows, serving multiple banks and crediting companies
- Designed RESTful API architecture with FastAPI, enabling seamless microservices integration and cross-platform data exchange
- Implemented Graph Database solution using SurrealDB, optimizing complex relationship queries and improving data retrieval performance by 60%
- Deployed comprehensive observability stack with Prometheus and Grafana, maintaining 99.9% system uptime across production environments

== Education

#edu(
  institution: "University of Bucharest",
  location: "Bucharest, Romania",
  dates: dates-helper(start-date: "2020", end-date: "2022"),
  degree: "M.Sc. Artificial Intelligence",
)

#edu(
  institution: "Julius Maximilian University of Würzburg",
  location: "Würzburg, Germany",
  dates: dates-helper(start-date: "2021", end-date: "2021"),
  degree: "Erasmus+, Artificial Intelligence",
)

#edu(
  institution: "Polytechnics University of Bucharest",
  location: "Bucharest, Romania",
  dates: dates-helper(start-date: "2016", end-date: "2020"),
  degree: "B.Eng. Applied Electronics",
)

#edu(
  institution: "Åbo Akademi University",
  location: "Turku, Finland",
  dates: dates-helper(start-date: "2019", end-date: "2020"),
  degree: "Erasmus+, Computer Science",
)

== Research

#project(
  name: "Patronizing and Condescending Language Detection, SemEval2022 Shared Task (ACL)",
  dates: dates-helper(start-date: "Nov 2022", end-date: "Feb 2023"),
  url: "https://aclanthology.org/2022.semeval-1.70.pdf"
)
- Developed advanced BERT-based models for binary classification and multi-label multi-class text classification
- Implemented machine learning algorithms using bag-of-words models for patronizing language detection
- Published research addressing linguistic bias detection in natural language processing

#project(
  name: "Detecting Early Signs of Pathological Gambling using ML and DL models with dataset chunking, CLEF eRisk 2022",
  dates: dates-helper(start-date: "Nov 2021", end-date: "May 2022"),
  url: "https://ceur-ws.org/Vol-3180/paper-70.pdf"
)
- Applied machine learning and deep learning models with dataset chunking techniques
- Developed early warning systems for pathological gambling behavior detection

// == Projects
//
// #project(
//   name: "Opticale.AI, Detection and Tracking system using AI",
//   dates: dates-helper(start-date: "Sep 2019", end-date: "Mar 2020"),
// )
// - Developed real-time boat detection and tracking system using computer vision and AI
// - Successfully commercialized project through acquisition by maritime autonomous solutions company
