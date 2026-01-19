Pythia product:

The first project was a media monitoring tool, this required scraping Romanian news websites (we built our custom ingestion pipeline, and article parsing using a proto-AI agent and heuristics based algorithm), implementing the NVIDIA Triton server to deploy on-premise NLP system that performed sentiment analysis and NER.
The storage for that information was SurrealDB which I architected with my cofounder, it was designed for graph traversal for fast queries and analytics.
I also worked on the dashboard (the way to query and see information about the entities in our system).
I have also worked on the DevOps side of this project, we had an on-prem deployment with CI/CD and monitoring with Grafana + Prometheus.

Pythia Clients:

- Scenario Builder: Based on user-defined market movement, we created algorithms to find patterns in market data, along with relevant news items regarding the impacted market and the sentiment associated with the movement. The goal is to generate scenarios for an online trading platform for training banking traders
- Bias-Detection: Based on the client data, where we developed a mathematical framework for easily implementing custom-made algorithms for different biases in the behavior of the traders, this required research for trading behavior, processing client data to extract relevant data points and then custom algorithms and evaluations
- Clear-Data: AML platform, this involved massive scraping of publicly available company data. Worked on the architecture for the web application, security implications, data retrieval and deployment.
- Doc-Scraper: AI pipeline which analyzed and extracted doctors from HTML pages. The client wanted to collect and monitor vet clinics and their associated staff. We built a module to integrate into their platform that periodically scrapes websites and checks for new entries. Our approach was effective because we used LLMs to get the selectors and compare results across scrapes, therefore reducing the cost of passing the pages to the LLMs every time
- Staycy: AI that was able to generate and customize web pages. The client wanted a platform where users could customize landing pages for their properties that they would rent
- Tazama: Implemented and demoed the transaction monitoring system
