#import "utils.typ": *

// CV Content - Single source of truth for both CV and Resume variants

// Personal Information
#let personal = (
  name: "Tudor Andrei Dumitrascu",
  position: "AI Engineer",
  location: "Bucharest, Romania",
  email: "tudorandrei.dumitrascu@gmail.com",
  github: "https://github.com/TudorAndrei",
  linkedin: "https://www.linkedin.com/in/tudor-pythia/",
  phone: "(+40)-761-471-916"
)

// Skills
#let skills_data = (
  "AI/ML": ("DSPy", "PyTorch", "Scikit-Learn", "NVIDIA Triton", "NLP", "CV", "DL"),
  "Backend": ("Python", "FastAPI", "NestJS", "Litestar", "RESTful APIs"),
  "Data": ("Pandas", "MongoDB", "PostgreSQL", "Redis", "RabbitMQ", "SurrealDB"),
  "Frontend": ("Typescript", "Next.js", "React", "Remix", "TailwindCSS"),
  "Cloud/DevOps": ("Docker", "AWS", "Azure", "CI/CD", "Prometheus", "Grafana", "Nix"),
  "Languages": ("Romanian", "English", "German")
)

// Work Experience
#let work_experience = (
  (
    title: "AI Engineer",
    company: "CogniSync",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "Sep 2025", end-date: "Present"),
    bullets: (
      "Developed core platform feature that ingested complex legal playbooks and templates to create structured rule systems",
      "Engineered AI system capable of processing and understanding large legal documents, reducing manual review time",
      "Created document parsing engine that identifies and extracts placeholder items from templates",
      "Prototyped document-aware Q&A system using Retrieval-Augmented Generation (RAG) for legal queries",
      "Implemented and compared two RAG approaches: Google Vertex AI integration and custom system using Qdrant",
      "Applied modern LLM techniques including RAG and prompt engineering for legal domain applications",
    )
  ),
  (
    title: "Co-Founder & CTO",
    company: "Pythia Sociodynamical Technologies",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "Jun 2022", end-date: "Sep 2025"),
    bullets: (
      "Architected NVIDIA Triton-based ML inference pipeline that processes 1,000+ news articles per second with <100ms latency, reducing infrastructure costs by 35%",
      "Engineered LLM & DSPy powered data extraction with pipeline with intelligent content hashing, increasing data extraction accuracy by >40% while reducing inference costs",
      "Built distributed news scraper with Scrapy and RabbitMQ that integrated 41+ sources in one week, processing 500K+ articles daily with 99.5% uptime",
      "Developed multi-tenant SaaS platform leveraging Next.js and SurrealDB for automated KYC/AML compliance workflows, serving multiple banks and crediting companies",
      "Designed RESTful API architecture with FastAPI, enabling seamless microservices integration and cross-platform data exchange",
      "Designed custom algorithms generating plausible trading scenarios from real-world Time-Series financial data",
      "Developed bias detection algorithms on Time-Series events for financial risk assessment",
      "Delivered efficient Named Entity Recognition and Sentiment Analysis solutions for financial text processing",
      "Implemented Graph Database solution using SurrealDB, optimizing complex relationship queries and improving data retrieval performance by 60%",
      "Deployed comprehensive observability stack with Prometheus and Grafana, maintaining 99.9% system uptime across production environments"
    )
  ),
  (
    title: "IT Administrator",
    company: "Cert Sud SRL",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "Sep 2020", end-date: "Sep 2022"),
    bullets: (
      "Managing IT infrastructure",
      "Website Designer"
    )
  ),
  (
    title: "Research & Development Intern",
    company: "Continental Powertrain Engineering",
    location: "Timisoara, Romania",
    dates: dates-helper(start-date: "Jun 2019", end-date: "Aug 2019"),
    bullets: (
      "CAN Bus programming with Arduino Uno",
    )
  )
)

// Education
#let education = (
  (
    institution: "University of Bucharest",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "2020", end-date: "2022"),
    degree: "M.Sc. Artificial Intelligence"
  ),
  (
    institution: "Julius Maximilian University of Würzburg",
    location: "Würzburg, Germany",
    dates: dates-helper(start-date: "2021", end-date: "2021"),
    degree: "Erasmus+, Artificial Intelligence"
  ),
  (
    institution: "Polytechnics University of Bucharest",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "2016", end-date: "2020"),
    degree: "B.Eng. Applied Electronics"
  ),
  (
    institution: "Åbo Akademi University",
    location: "Turku, Finland",
    dates: dates-helper(start-date: "2019", end-date: "2020"),
    degree: "Erasmus+, Computer Science"
  ),
  (
    institution: "Academy+Plus",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "Sep 2018", end-date: "Jan 2019"),
    degree: "Coding Bootcamp"
  ),
  (
    institution: "Colegiul Național Bilingv \"George Coșbuc\"",
    location: "Bucharest, Romania",
    dates: dates-helper(start-date: "Sep 2012", end-date: "Jul 2016"),
    degree: "Bacalaurate Diploma"
  )
)

// Research
#let research = (
  (
    name: "Patronizing and Condescending Language Detection, SemEval2022 Shared Task (ACL)",
    dates: dates-helper(start-date: "Nov 2022", end-date: "Feb 2023"),
    url: "aclanthology.org/2022.semeval-1.70.pdf",
    bullets: (
      "Developed advanced BERT-based models for binary classification and multi-label multi-class text classification",
      "Implemented machine learning algorithms using bag-of-words models for patronizing language detection",
      "Published research addressing linguistic bias detection in natural language processing"
    )
  ),
  (
    name: "Detecting Early Signs of Pathological Gambling using ML and DL models with dataset chunking, CLEF eRisk 2022",
    dates: dates-helper(start-date: "Nov 2021", end-date: "May 2022"),
    url: "ceur-ws.org/Vol-3180/paper-70.pdf",
    bullets: (
      "Applied machine learning and deep learning models with dataset chunking techniques",
      "Developed early warning systems for pathological gambling behavior detection"
    )
  )
)

// Projects
#let projects = (
  (
    name: "Opticale.AI, Detection and Tracking system using AI",
    dates: dates-helper(start-date: "Sep 2019", end-date: "Mar 2020"),
    bullets: (
      "Developed real-time boat detection and tracking system using computer vision and AI",
      "Successfully commercialized project through acquisition by maritime autonomous solutions company"
    )
  ),
)

// Interests
#let interests = ("Science-Fiction", "Language Learning", "Sports", "Cardistry", "Philosophy")

// Organizations
#let organizations = (
  (
    name: "Liga Studentilor Electronisti",
    role: "Volunteer",
    dates: dates-helper(start-date: "2016", end-date: "2019"),
    location: "Bucharest, Romania"
  ),
)

// Certificates
#let certificates = (
  (
    name: "Deep Learning Specialization",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/specialization/certificate/2KRAYH46NZRZ",
    date: "2021"
  ),
  (
    name: "Sequence Models",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/verify/GP755RCLJ8W3",
    date: "2021"
  ),
  (
    name: "Convolutional Neural Networks",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/verify/HPFWCPQSCVXV",
    date: "2020"
  ),
  (
    name: "Improving Deep Neural Networks",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/verify/AMM3QYUJS228",
    date: "2020"
  ),
  (
    name: "Structuring Machine Learning Projects",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/verify/QH7GSP3L7E2S",
    date: "2020"
  ),
  (
    name: "Neural Networks and Deep Learning",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/verify/3KZ44L2DZ6GL",
    date: "2020"
  ),
  (
    name: "Introduction to TensorFlow for AI",
    issuer: "DeepLearning.AI",
    url: "www.coursera.org/account/accomplishments/certificate/GZW9WPTXNTGU",
    date: "2019"
  )
)

// Awards
#let awards = (
  (
    title: "Bronze Medal",
    organization: "MobilPRO",
    date: "17/03/2019",
    url: "https://www.facebook.com/events/258918224772780/?post_id=301945790470023&view=permalink"
  ),
  (
    title: "Fifth Place",
    organization: "2NHack",
    date: "02/11/2019"
  )
)