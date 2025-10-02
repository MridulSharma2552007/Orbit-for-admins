import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDevTerminal extends StatefulWidget {
  const AboutDevTerminal({super.key});

  @override
  State<AboutDevTerminal> createState() => _AboutDevTerminalState();
}

class _AboutDevTerminalState extends State<AboutDevTerminal> {
  // Lines that will be typed out
  final List<_TerminalLine> _lines = [
    _TerminalLine(text: 'login: guest@orbit', isCommand: true),
    _TerminalLine(
      text: 'password: ********',
      isCommand: true,
      delayAfterMs: 300,
    ),
    _TerminalLine(text: ''),
    _TerminalLine(text: 'Loading developer info...', isCommand: false),
    _TerminalLine(text: ''),
    _TerminalLine(text: 'Name: Mridul Sharma', isCommand: false),
    _TerminalLine(text: 'Role: Lead Developer', isCommand: false),
    _TerminalLine(
      text: 'GitHub: https://github.com/MridulSharma2552007/Orbit',
      isLink: true,
      link: 'https://github.com/MridulSharma2552007/Orbit',
    ),
    _TerminalLine(
      text: 'LinkedIn: https://www.linkedin.com/in/mridul-sharma-a48604319/',
      isLink: true,
      link: 'https://www.linkedin.com/in/mridul-sharma-a48604319/',
    ),
    _TerminalLine(text: ''),
    _TerminalLine(text: 'Contributor: Shaurya', isCommand: false),
    _TerminalLine(
      text: 'Shaurya GitHub: https://github.com/Shaurya0987',
      isLink: true,
      link: 'https://github.com/Shaurya0987',
    ),
    _TerminalLine(text: ''),
    _TerminalLine(
      text: 'Press anywhere to speed up...',
      isCommand: true,
      delayAfterMs: 500,
    ),
  ];

  final ScrollController _scrollController = ScrollController();

  // typed content per line
  List<String> _typed = [];
  int _currentLineIndex = 0;
  int _currentCharIndex = 0;

  // timing
  final Duration _charDelay = const Duration(milliseconds: 35);
  Timer? _typingTimer;
  bool _isTyping = true;
  bool _cursorVisible = true;
  Timer? _cursorTimer;

  @override
  void initState() {
    super.initState();
    _typed = List.filled(_lines.length, ''); // empty typed strings initially
    _startCursor();
    _startTyping();
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _cursorTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startCursor() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (t) {
      setState(() => _cursorVisible = !_cursorVisible);
    });
  }

  void _startTyping() {
    // guard
    if (_currentLineIndex >= _lines.length) {
      _isTyping = false;
      return;
    }

    final currentLine = _lines[_currentLineIndex];
    final text = currentLine.text;

    _typingTimer = Timer.periodic(_charDelay, (timer) {
      if (_currentCharIndex < text.length) {
        setState(() {
          _typed[_currentLineIndex] += text[_currentCharIndex];
          _currentCharIndex++;
        });
        _autoScroll();
      } else {
        // finished current line
        timer.cancel();

        // delay after finishing this line (or immediate)
        final delay = Duration(milliseconds: currentLine.delayAfterMs ?? 120);
        Future.delayed(delay, () {
          // move to next line
          _currentLineIndex++;
          _currentCharIndex = 0;
          if (_currentLineIndex < _lines.length) {
            _startTyping();
          } else {
            setState(() {
              _isTyping = false;
            });
          }
        });
      }
    });
  }

  void _fastForward() {
    // Immediately fill current and remaining lines
    _typingTimer?.cancel();
    for (int i = 0; i < _lines.length; i++) {
      _typed[i] = _lines[i].text;
    }
    setState(() {
      _isTyping = false;
    });
    _autoScroll();
  }

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ignore or show snackbar
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cannot open link')));
    }
  }

  void _autoScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 40,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // terminal colors — using green-ish monochrome terminal
    const Color bg = Color(0xFF0F0F10);
    const Color textColor = Color(0xFF9FFFB3); // soft green

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // fast-forward typing on tap
        if (_isTyping) {
          _fastForward();
        }
      },
      child: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Column(
            children: [
              // top header like terminal bar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF111111),
                  border: Border(bottom: BorderSide(color: Color(0xFF1B1B1B))),
                ),
                child: Row(
                  children: [
                    // little terminal dots
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      'orbit@dev ~',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'monospace',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _isTyping ? 'typing...' : 'completed',
                      style: const TextStyle(
                        color: Colors.white38,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: textColor,
                        fontFamily: 'monospace',
                        fontSize: 15,
                        height: 1.45,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(_lines.length, (index) {
                          final line = _lines[index];
                          final typedText = _typed[index];
                          if (line.isLink) {
                            final url = line.link!;

                            final fullyTyped = typedText == line.text;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // prompt
                                  Text(
                                    line.isCommand ? '\$ ' : '  ',
                                    style: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: fullyTyped
                                          ? () => _openLink(url)
                                          : null,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(text: typedText),
                                            if (index == _currentLineIndex &&
                                                _isTyping)
                                              WidgetSpan(
                                                child: Opacity(
                                                  opacity: _cursorVisible
                                                      ? 1
                                                      : 0,
                                                  child: Container(
                                                    width: 8,
                                                    height: 18,
                                                    color: textColor,
                                                  ),
                                                ),
                                              ),
                                            if (fullyTyped)
                                              TextSpan(
                                                text: '  [open]',
                                                style: TextStyle(
                                                  color:
                                                      Colors.blueGrey.shade100,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // normal line
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    line.isCommand ? '\$ ' : '  ',
                                    style: const TextStyle(
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: typedText),
                                          if (index == _currentLineIndex &&
                                              _isTyping)
                                            WidgetSpan(
                                              child: Opacity(
                                                opacity: _cursorVisible ? 1 : 0,
                                                child: Container(
                                                  width: 8,
                                                  height: 18,
                                                  color: textColor,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                ),
              ),

              // footer with small controls
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF0B0B0C),
                  border: Border(top: BorderSide(color: Color(0xFF151515))),
                ),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // restart typing animation
                        _typingTimer?.cancel();
                        _cursorTimer?.cancel();
                        setState(() {
                          _typed = List.filled(_lines.length, '');
                          _currentCharIndex = 0;
                          _currentLineIndex = 0;
                          _isTyping = true;
                        });
                        _startCursor();
                        _startTyping();
                      },
                      icon: const Icon(Icons.replay, color: Colors.white70),
                      label: const Text(
                        'Replay',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _isTyping
                          ? 'Tap anywhere to reveal'
                          : 'Tap links to open',
                      style: const TextStyle(color: Colors.white38),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// small helper model
class _TerminalLine {
  final String text;
  final bool isCommand; // show prompt
  final bool isLink;
  final String? link;
  final int? delayAfterMs;

  _TerminalLine({
    required this.text,
    this.isCommand = false,
    this.isLink = false,
    this.link,
    this.delayAfterMs,
  });
}
