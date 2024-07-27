
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String? title;
  final String? text;
  final Widget icon;
  final Widget? image;
  final Function()? onTap;

  const CategoryItem({
    Key? key,
    this.title,
    this.text,
    required this.icon,
    this.image,
    this.onTap,
  }) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Define Scale Animation
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Define Color Animation
    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.yellow[700],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: _isHovered ? Colors.black87 : Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: _isHovered ? Colors.yellow : Colors.transparent,
                      width: _isHovered ? 2.0 : 0.0,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: const Offset(0, 6),
                            ),
                          ]
                        : [],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Use ClipRRect to ensure the image has rounded corners
                      if (widget.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: widget.image!,
                        ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minVerticalPadding: 24,
                        tileColor: Colors.transparent,
                        iconColor: _colorAnimation.value,
                        textColor: _colorAnimation.value,
                        leading: widget.icon,
                        title: Text(
                          widget.title ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          widget.text ?? '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
