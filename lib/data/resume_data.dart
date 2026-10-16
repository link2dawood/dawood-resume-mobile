// All resume content in one place — edit this file to update the app.

class ContactLink {
  final String label;
  final String url;
  const ContactLink({required this.label, required this.url});
}

class Experience {
  final String period;
  final String organization;
  final String location;
  final String role;
  final String type;
  final List<String> bullets;
  const Experience({
    required this.period,
    required this.organization,
    required this.location,
    required this.role,
    required this.type,
    required this.bullets,
  });
}

class Project {
  final String name;
  final String description;
  final List<String> tags;
  final String? url;
  final String? urlLabel;
  const Project({
    required this.name,
    required this.description,
    this.tags = const [],
    this.url,
    this.urlLabel,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;
  const SkillGroup({required this.title, required this.skills});
}

class Education {
  final String period;
  final String school;
  final String degree;
  final String detail;
  const Education({
    required this.period,
    required this.school,
    required this.degree,
    required this.detail,
  });
}

class Reference {
  final String name;
  final String title;
  final String email;
  const Reference({
    required this.name,
    required this.title,
    required this.email,
  });
}

class ResumeData {
  static const name = 'DAWOOD ZAFAR';
  static const role = 'Full-Stack & Backend Engineer';
  static const tagline =
      'Python / FastAPI · PHP / Laravel · API Integration · Cloud & Automation';
  static const location = 'Sargodha, Pakistan';

  static const contacts = [
    ContactLink(label: 'Email', url: 'mailto:link2dawood123@gmail.com'),
    ContactLink(label: 'Phone', url: 'tel:+923063301114'),
    ContactLink(label: 'GitHub', url: 'https://github.com/link2dawood'),
    ContactLink(
        label: 'LinkedIn', url: 'https://www.linkedin.com/in/link2-dawood/'),
  ];

  static const summary =
      'Full-stack developer with experience since 2021 building backend systems, '
      'APIs, booking engines, e-commerce workflows and automation tools. Works with '
      'Python, FastAPI, Laravel, Next.js and relational databases, with practical '
      'experience in Docker, CI/CD and cloud deployment. BS Computer Science graduate '
      'with a 3.29/4.00 CGPA.';

  static const experiences = [
    Experience(
      period: '2022–2025',
      organization: 'Dixeam',
      location: 'Finland',
      role: 'Full Stack Developer',
      type: 'Full-time · Hybrid',
      bullets: [
        'Built and deployed web applications using Laravel, Python and FastAPI; developed REST APIs and Next.js frontends.',
        'Designed and optimized MySQL, PostgreSQL and NoSQL databases for application performance and data processing.',
        'Automated builds and deployments with GitHub Actions and Docker; worked with AWS services and Git code-review workflows.',
      ],
    ),
    Experience(
      period: '2021–Present',
      organization: 'Freelance',
      location: 'Remote',
      role: 'Full Stack Developer',
      type: 'Independent',
      bullets: [
        'Built LoveUTravel with VETURIS and GoGlobal XML integrations, hotel search, booking cancellations and Airwallex payments.',
        'Developed multi-vendor carts, delivery pricing and item-level order workflows; automated CSV/XML imports and Shopify operations.',
        'Managed deployments, SSL, cronjobs, Docker environments and database performance.',
      ],
    ),
  ];

  static const skillGroups = [
    SkillGroup(
      title: 'Backend',
      skills: ['Python', 'FastAPI', 'Flask', 'PHP', 'Laravel', 'REST APIs', 'JWT/OAuth'],
    ),
    SkillGroup(
      title: 'Frontend',
      skills: ['Next.js', 'JavaScript', 'HTML/CSS', 'jQuery', 'Tailwind', 'Bootstrap'],
    ),
    SkillGroup(
      title: 'Data',
      skills: ['MySQL', 'PostgreSQL', 'NoSQL', 'Elasticsearch', 'Firebase', 'Supabase'],
    ),
    SkillGroup(
      title: 'Cloud & Tools',
      skills: ['Docker', 'GitHub Actions', 'AWS', 'Nginx', 'DigitalOcean', 'Git'],
    ),
    SkillGroup(
      title: 'Mobile & AI',
      skills: ['Flutter', 'Kotlin', 'OpenAI API', 'Claude API', 'LLaMA'],
    ),
  ];

  static const projects = [
    Project(
      name: 'SpendingCrow',
      description:
          'Expense-splitting SaaS — budgets, expense tracking, wallets and financial reporting.',
      tags: ['Flutter', 'Kotlin', 'Supabase', 'Firebase', 'FastAPI'],
      url:
          'https://play.google.com/store/apps/details?id=com.spendingcrow.budgetingapp',
      urlLabel: 'Google Play',
    ),
    Project(
      name: 'ViikkoNro.fi',
      description:
          'Finnish ISO week numbers, calendars, holidays and date tools.',
      tags: ['React', 'Vite', 'SEO'],
      url: 'https://viikkonro.fi',
      urlLabel: 'Visit site',
    ),
    Project(
      name: 'RankLocal',
      description:
          'AI-powered local SEO SaaS — GBP auditing, competitor intel and reputation management.',
      tags: ['Next.js', 'Supabase', 'OpenAI'],
      url: 'https://localrank.cc',
      urlLabel: 'Visit site',
    ),
    Project(
      name: 'LoveUTravel',
      description:
          'Dual-provider hotel booking engine with Airwallex payments.',
      tags: ['Laravel', 'XML APIs'],
    ),
  ];

  static const extensions = [
    Project(
      name: 'SmartChat Assistant',
      description: 'Gemini-powered chat and writing assistance.',
      tags: ['AI', 'Productivity'],
    ),
    Project(
      name: 'Scam Finder for Fiverr',
      description: 'Message checks and scam-risk alerts.',
      tags: ['Safety', 'Productivity'],
    ),
    Project(
      name: 'Hafta',
      description: 'Pakistan week numbers, Hijri dates, prayers and holidays.',
      tags: ['Calendar'],
    ),
    Project(
      name: 'Viikko Nro',
      description: 'ISO week toolbar, Finnish flag days and school holidays.',
      tags: ['Calendar'],
    ),
  ];

  static const androidApps = [
    Project(
      name: 'SpendingCrow',
      description: 'Budgeting, transactions and expense reports.',
      tags: ['Flutter', 'Kotlin'],
      url:
          'https://play.google.com/store/apps/details?id=com.spendingcrow.budgetingapp',
      urlLabel: 'Google Play',
    ),
    Project(
      name: 'Pocket Currency Converter',
      description: 'Live rates, historical charts and offline conversion.',
      tags: ['Kotlin', '150+ currencies'],
      url:
          'https://play.google.com/store/apps/details?id=com.spendingcrow.converter',
      urlLabel: 'Google Play',
    ),
  ];

  static const portfolioUrl = 'https://dawoodzafar.us';
  static const portfolioLabel = 'dawoodzafar.us';
  static const portfolioDescription =
      'Personal portfolio — websites, AI automation and DevOps projects.';

  static const education = [
    Education(
      period: '2022–2026',
      school: 'Government College University Faisalabad',
      degree: 'BS Computer Science · CGPA 3.29/4.00',
      detail:
          'ILM College of Commerce, Sargodha. Focus: software engineering, databases, algorithms, computer networks and machine learning.',
    ),
    Education(
      period: '2021',
      school: 'The Reader College, Sargodha',
      degree: 'Intermediate · General Science',
      detail:
          'BISE Sargodha · Computer Science, Mathematics and Statistics.',
    ),
  ];

  static const languages = [
    ['English', 'B1'],
    ['Urdu', 'Native'],
    ['Punjabi', 'Native'],
    ['Hindi', 'Basic'],
  ];

  static const certificates =
      'English-medium instruction certificate and two academic recommendation letters, ILM College, September 2026.';

  static const references = [
    Reference(
      name: 'Qaiser Shakoor',
      title: 'Founder, Dixeam',
      email: 'link2qaiser@gmail.com',
    ),
    Reference(
      name: 'Tanzeel ur Rehman',
      title: 'Team Lead, Dixeam',
      email: 'tanzeeldevaims@gmail.com',
    ),
  ];
}
