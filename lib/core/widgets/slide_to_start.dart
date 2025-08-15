import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SlideToStart extends StatefulWidget {
  final VoidCallback onComplete;
  final String label;
  const SlideToStart({
    super.key,
    required this.onComplete,
    this.label = 'Slide to start',
  });

  @override
  State<SlideToStart> createState() => _SlideToStartState();
}

class _SlideToStartState extends State<SlideToStart>
    with SingleTickerProviderStateMixin {
  double _dragX = 0;
  bool _completed = false;

  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  void _checkComplete(double maxX) {
    if (maxX <= 0) return;
    final progress = (_dragX / maxX).clamp(0.0, 1.0);
    if (!_completed && progress >= 0.95) {
      setState(() {
        _completed = true;
        _dragX = maxX;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => widget.onComplete());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final trackW = c.maxWidth;
        const thumbSize = 52.0;
        const pad = 4.0;
        final maxX = (trackW - thumbSize - pad).clamp(0.0, double.infinity);

        void _setByLocalDx(double dx) {
          setState(() {
            _dragX = (dx - thumbSize / 2).clamp(0.0, maxX);
          });
          _checkComplete(maxX);
        }

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragUpdate: (d) {
              setState(() {
                _dragX = (_dragX + d.delta.dx).clamp(0.0, maxX);
              });
              _checkComplete(maxX);
            },
            onHorizontalDragEnd: (_) {
              if (!_completed) {
                setState(() => _dragX = 0);
              }
            },
            onTapDown: (d) {
              _setByLocalDx(d.localPosition.dx);
            },
            child: Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xFF0F1114),
                border: Border.all(color: const Color(0xFF1C2026)),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  IgnorePointer(
                    child: Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            width:
                                (_completed ? trackW : (thumbSize + _dragX + 8))
                                    .clamp(thumbSize + 8, trackW),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.limeAccent.withOpacity(.10),
                                  AppColors.limeAccent.withOpacity(.04),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // shimmer cue
                  IgnorePointer(
                    child: Positioned.fill(
                      child: AnimatedOpacity(
                        opacity: _completed ? 0 : 1,
                        duration: const Duration(milliseconds: 250),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: const Duration(milliseconds: 1600),
                          builder: (context, t, _) {
                            final left = t * (trackW * .6);
                            return Stack(
                              children: [
                                Positioned(
                                  left: left,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.transparent,
                                          AppColors.limeAccent.withOpacity(.12),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  IgnorePointer(
                    child: Center(
                      child: Text(
                        _completed ? 'Starting…' : widget.label,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: pad + (_completed ? maxX : _dragX),
                    child: Container(
                      width: thumbSize,
                      height: thumbSize,
                      decoration: BoxDecoration(
                        color: AppColors.limeAccent,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x552AFF00),
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ScaleTransition(
                        scale: Tween(begin: 1.0, end: 1.06).animate(
                          CurvedAnimation(
                              parent: _pulse, curve: Curves.easeInOut),
                        ),
                        child: const Icon(Icons.arrow_forward,
                            color: Colors.black, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
