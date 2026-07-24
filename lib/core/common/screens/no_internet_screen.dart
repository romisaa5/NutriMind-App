import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nutri_mind/core/theme/app_colors/light_app_colors.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;
  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  bool _isConnected = true;
  late StreamSubscription<List<ConnectivityResult>> _sub;

  @override
  void initState() {
    super.initState();
    _checkNow();
    _sub = Connectivity().onConnectivityChanged.listen((results) {
      final connected = results.any((r) => r != ConnectivityResult.none);
      if (connected != _isConnected) {
        setState(() => _isConnected = connected);
      }
    });
  }

  Future<void> _checkNow() async {
    final results = await Connectivity().checkConnectivity();
    final connected = results.any((r) => r != ConnectivityResult.none);
    if (mounted && connected != _isConnected) {
      setState(() => _isConnected = connected);
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.05),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: _isConnected
          ? KeyedSubtree(key: const ValueKey('connected'), child: widget.child)
          : NoInternetScreen(
              key: const ValueKey('no-internet'),
              onRetry: _checkNow,
            ),
    );
  }
}

class NoInternetScreen extends StatefulWidget {
  final VoidCallback onRetry;
  const NoInternetScreen({super.key, required this.onRetry});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen>
    with TickerProviderStateMixin {
  late AnimationController _orbController;
  late AnimationController _rippleController;
  late AnimationController _retryController;
  late Animation<double> _retryScale;

  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();

    _orbController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _retryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _retryScale = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _retryController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _orbController.dispose();
    _rippleController.dispose();
    _retryController.dispose();
    super.dispose();
  }

  Future<void> _handleRetry() async {
    if (_isRetrying) return;
    setState(() => _isRetrying = true);
    await _retryController.forward();
    await _retryController.reverse();
    widget.onRetry();
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isRetrying = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: LightAppColors.primary600,
        body: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.3, -0.6),
                    radius: 1.4,
                    colors: [
                      LightAppColors.primary400,
                      LightAppColors.primary600,
                      LightAppColors.primary800,
                    ],
                  ),
                ),
              ),
            ),

            // ── Floating orbs (mint + apricot, matching the app's accent)
            ..._buildOrbs(size),

            // ── Subtle grid lines
            Positioned.fill(child: _GridOverlay()),

            // ── Main content
            SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  // Signal icon with ripple
                  _buildSignalIcon(),
                  const SizedBox(height: 40),
                  // Text block
                  _buildTextBlock(),
                  const Spacer(flex: 3),
                  // Retry button
                  _buildRetryButton(),
                  const SizedBox(height: 16),
                  // Helper text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'اتأكد إن الـ Wi-Fi أو البيانات شغّالة\nوالتطبيق هيتحدّث تلقائيًا',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 13,
                        height: 1.7,
                        color: LightAppColors.primary100.withValues(
                          alpha: 0.65,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOrbs(Size size) {
    final orbs = [
      _OrbConfig(
        size: 220,
        color: LightAppColors.secondary400.withValues(alpha: 0.14),
        beginAlign: const Alignment(-0.9, -0.8),
        endAlign: const Alignment(-0.6, -0.5),
        speed: 1.0,
      ),
      _OrbConfig(
        size: 160,
        color: const Color(0xFFFFA94D).withValues(alpha: 0.10),
        beginAlign: const Alignment(0.8, -0.3),
        endAlign: const Alignment(0.5, 0.1),
        speed: 0.7,
      ),
      _OrbConfig(
        size: 100,
        color: LightAppColors.secondary300.withValues(alpha: 0.10),
        beginAlign: const Alignment(0.2, 0.8),
        endAlign: const Alignment(-0.1, 0.6),
        speed: 1.3,
      ),
    ];

    return orbs.map((orb) {
      return AnimatedBuilder(
        animation: _orbController,
        builder: (_, a) {
          final t = (_orbController.value * orb.speed) % 1.0;
          final smooth = Curves.easeInOut.transform(
            t < 0.5 ? t * 2 : (1.0 - t) * 2,
          );
          final align = Alignment.lerp(orb.beginAlign, orb.endAlign, smooth)!;
          return Align(
            alignment: align,
            child: Container(
              width: orb.size,
              height: orb.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: orb.color,
              ),
            ),
          );
        },
      );
    }).toList();
  }

  Widget _buildSignalIcon() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(3, (i) {
            return AnimatedBuilder(
              animation: _rippleController,
              builder: (_, a) {
                final delay = i / 3;
                final t = ((_rippleController.value + delay) % 1.0);
                final scale = 0.4 + t * 0.6;
                final opacity = (1 - t) * 0.35;
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        // was secondary400 gold ripple — now brand mint
                        color: const Color(
                          0xFF4ABE83,
                        ).withValues(alpha: opacity),
                        width: 1.5,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // was slate grey (0xFF4A596A → 0xFF232F3E) — now deep basil
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2F9E63), Color(0xFF14261F)],
              ),
              boxShadow: [
                BoxShadow(
                  color: LightAppColors.primary900.withValues(alpha: 0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.wifi_off_rounded,
              size: 36,
              // was khaki (0xFFCDC2A5) — now soft mint tint
              color: Color(0xFFEAF5EE),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextBlock() {
    return Column(
      children: [
        ShaderMask(
          // was cream/khaki gradient — now white → mint, consistent with
          // the splash screen's brand voice
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFEAF5EE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            'لا يوجد اتصال',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'Almarai',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'بالإنترنت',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Almarai',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: LightAppColors.primary100.withValues(alpha: 0.75),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildRetryButton() {
    // Solid white pill instead of an orange gradient: on a green background
    // a high-contrast light button reads clearer than a competing accent
    // color, and it mirrors the primary CTA style used on Home/Scanner.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ScaleTransition(
        scale: _retryScale,
        child: GestureDetector(
          onTap: _handleRetry,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _isRetrying
                  ? Colors.white.withValues(alpha: 0.65)
                  : Colors.white,
              boxShadow: _isRetrying
                  ? []
                  : [
                      BoxShadow(
                        color: LightAppColors.primary900.withValues(
                          alpha: 0.25,
                        ),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
            ),
            child: Center(
              child: _isRetrying
                  ? SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation(
                          LightAppColors.primary600,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          color: LightAppColors.primary600,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'حاول مرة أخرى',
                          style: TextStyle(
                            fontFamily: 'Almarai',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: LightAppColors.primary600,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GridOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _GridPainter());
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = LightAppColors.primary400.withValues(alpha: 0.07)
      ..strokeWidth = 0.5;

    const step = 40.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter _) => false;
}

class _OrbConfig {
  final double size;
  final Color color;
  final Alignment beginAlign;
  final Alignment endAlign;
  final double speed;

  const _OrbConfig({
    required this.size,
    required this.color,
    required this.beginAlign,
    required this.endAlign,
    required this.speed,
  });
}
