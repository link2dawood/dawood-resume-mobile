import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/resume_data.dart';
import '../theme.dart';
import '../widgets/section.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $url')),
      );
    }
  }

  IconData _iconFor(String label) {
    switch (label) {
      case 'Email':
        return Icons.email_outlined;
      case 'Phone':
        return Icons.phone_outlined;
      case 'GitHub':
        return Icons.code;
      case 'LinkedIn':
        return Icons.work_outline;
      default:
        return Icons.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.navy, Color(0xFF3A34A8)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 36, 20, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white.withValues(alpha: 0.18),
                              child: const Text(
                                'DZ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ResumeData.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    ResumeData.role,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ResumeData.tagline,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 12.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.white.withValues(alpha: 0.75),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              ResumeData.location,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.75),
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _contactRow(context),
                Section(
                  title: 'Professional Summary',
                  child: SectionCard(
                    child: Text(
                      ResumeData.summary,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                ),
                _experienceSection(),
                _skillsSection(),
                _projectsSection(context, 'Selected Projects', ResumeData.projects,
                    Icons.web_outlined),
                _projectsSection(context, 'Chrome Extensions',
                    ResumeData.extensions, Icons.extension_outlined),
                _projectsSection(context, 'Android Apps', ResumeData.androidApps,
                    Icons.smartphone_outlined),
                _portfolioSection(context),
                _educationSection(),
                _languagesSection(),
                _referencesSection(context),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 28),
                  child: Center(
                    child: Text(
                      'October 2026 · Dawood Zafar',
                      style: TextStyle(color: AppTheme.muted, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: ResumeData.contacts.map((c) {
          return ActionChip(
            avatar: Icon(_iconFor(c.label), size: 16, color: AppTheme.navy),
            label: Text(c.label),
            onPressed: () => _open(context, c.url),
          );
        }).toList(),
      ),
    );
  }

  Widget _experienceSection() {
    return Section(
      title: 'Professional Experience',
      child: Column(
        children: ResumeData.experiences.map((e) {
          return SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        e.organization,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9E9F2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        e.period,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.navy,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${e.role} · ${e.type}',
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: AppTheme.navy,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  e.location,
                  style: const TextStyle(
                      fontSize: 12.5, color: AppTheme.muted),
                ),
                const SizedBox(height: 8),
                ...e.bullets.map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('•  ',
                            style: TextStyle(fontSize: 14, height: 1.4)),
                        Expanded(
                          child: Text(b,
                              style: const TextStyle(
                                  fontSize: 13.5, height: 1.45)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _skillsSection() {
    return Section(
      title: 'Technical Skills',
      child: SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ResumeData.skillGroups.map((g) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    g.title,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.navy,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: g.skills
                        .map((s) => Chip(
                              label: Text(s),
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                            ))
                        .toList(),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _projectsSection(BuildContext context, String title,
      List<Project> projects, IconData icon) {
    return Section(
      title: title,
      child: Column(
        children: projects.map((p) {
          return SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 18, color: AppTheme.navy),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        p.name,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(p.description,
                    style: const TextStyle(fontSize: 13.5, height: 1.45)),
                if (p.tags.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: p.tags
                        .map((t) => Chip(
                              label: Text(t,
                                  style: const TextStyle(fontSize: 11)),
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                            ))
                        .toList(),
                  ),
                ],
                if (p.url != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _open(context, p.url!),
                      icon: const Icon(Icons.open_in_new, size: 15),
                      label: Text(p.urlLabel ?? 'Open'),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _portfolioSection(BuildContext context) {
    return Section(
      title: 'Portfolio',
      child: SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.public_outlined,
                    size: 18, color: AppTheme.navy),
                const SizedBox(width: 8),
                Text(
                  ResumeData.portfolioLabel,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              ResumeData.portfolioDescription,
              style: const TextStyle(fontSize: 13.5, height: 1.45),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _open(context, ResumeData.portfolioUrl),
                icon: const Icon(Icons.open_in_new, size: 15),
                label: const Text('Visit site'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _educationSection() {
    return Section(
      title: 'Education',
      child: Column(
        children: ResumeData.education.map((e) {
          return SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        e.school,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      e.period,
                      style: const TextStyle(
                          fontSize: 12.5, color: AppTheme.muted),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  e.degree,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: AppTheme.navy,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(e.detail,
                    style:
                        const TextStyle(fontSize: 13, height: 1.45)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _languagesSection() {
    return Section(
      title: 'Languages & Certificates',
      child: SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...ResumeData.languages.map(
              (l) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l[0], style: const TextStyle(fontSize: 14)),
                    Text(l[1],
                        style: const TextStyle(
                            fontSize: 13, color: AppTheme.muted)),
                  ],
                ),
              ),
            ),
            const Divider(height: 20),
            Text(
              ResumeData.certificates,
              style: const TextStyle(fontSize: 13, height: 1.45),
            ),
          ],
        ),
      ),
    );
  }

  Widget _referencesSection(BuildContext context) {
    return Section(
      title: 'References',
      child: Column(
        children: ResumeData.references.map((r) {
          return SectionCard(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFE9E9F2),
                  child: Icon(Icons.person_outline,
                      color: AppTheme.navy),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        r.name,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(r.title,
                          style: const TextStyle(
                              fontSize: 13, color: AppTheme.muted)),
                      GestureDetector(
                        onTap: () => _open(context, 'mailto:${r.email}'),
                        child: Text(
                          r.email,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppTheme.navy,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
