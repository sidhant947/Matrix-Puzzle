import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view_models/game_provider.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  String _getLocaleLabel(String? code, AppLocalizations l10n) {
    switch (code) {
      case 'en':
        return 'English';
      case 'pt_BR':
        return 'Português (Brasil)';
      case 'pt':
        return 'Português';
      default:
        return l10n.systemDefault;
    }
  }

  Future<void> _launch(String urlString) async {
    final url = Uri.parse(urlString);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (_) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }
  }

  void _showLanguageDialog(BuildContext context, WidgetRef ref, String? currentCode) {
    final l10n = AppLocalizations.of(context)!;
    final notifier = ref.read(settingsNotifierProvider.notifier);
    final options = [
      (null, l10n.systemDefault),
      ('en', 'English'),
      ('pt_BR', 'Português (Brasil)'),
      ('pt', 'Português'),
    ];

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.language),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            final isSelected = currentCode == option.$1;
            return ListTile(
              title: Text(option.$2),
              trailing: isSelected ? const Icon(Icons.check, color: Color(0xFF4FFBDF)) : null,
              onTap: () {
                Navigator.pop(dialogContext);
                notifier.setLocaleCode(option.$1);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        children: [
          ListTile(
            title: Text(
              l10n.language,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              _getLocaleLabel(settings.localeCode, l10n),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
            trailing: const Icon(Icons.arrow_drop_down),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            onTap: () => _showLanguageDialog(context, ref, settings.localeCode),
          ),
          const Divider(color: Color(0xFF4A4F6B)),
          SwitchListTile(
            value: settings.moveCrossedCluesToBottom,
            onChanged: (value) {
              notifier.setMoveCrossedCluesToBottom(value);
            },
            title: Text(
              l10n.moveCrossedCluesToBottomTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              l10n.moveCrossedCluesToBottomSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
            activeThumbColor: const Color(0xFF4FFBDF),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
          const Divider(color: Color(0xFF4A4F6B)),
          SwitchListTile(
            value: settings.autoCheckSolution,
            onChanged: (value) {
              notifier.setAutoCheckSolution(value);
            },
            title: Text(
              l10n.autoCheckSolutionTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              l10n.autoCheckSolutionSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
            activeThumbColor: const Color(0xFF4FFBDF),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
          const Divider(color: Color(0xFF4A4F6B)),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => _launch('https://x.com/vgbhuop'),
            icon: const Icon(Icons.alternate_email, size: 18),
            label: Text(l10n.followOnTwitter),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _launch('https://mastodon.social/@sidhant947'),
            icon: const Icon(Icons.public, size: 18),
            label: Text(l10n.followOnMastodon),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => _launch('https://ko-fi.com/sidhant947'),
            icon: const Icon(Icons.coffee, size: 18, color: Color(0xFFFFDD00)),
            label: Text(l10n.buyMeACoffee),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFFDD00)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
