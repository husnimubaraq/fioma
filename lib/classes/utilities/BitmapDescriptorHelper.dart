import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BitmapDescriptorHelper {
  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgAsset(
      BuildContext context, String svgAssetLink) async {
    final svgImage = await _getSvgImageFromAssets(context, svgAssetLink);
    final sizedSvgImage = await _getSizedSvgImage(svgImage);

    final pngSizedBytes =
        await sizedSvgImage.toByteData(format: ui.ImageByteFormat.png);
    final unit8List = pngSizedBytes.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(unit8List);
  }

  static Future<BitmapDescriptor> getBitmapDescriptorFromSvgString(
      String svgString) async {
    final svgImage = await _getSvgImageFromString(svgString);
    final sizedSvgImage = await _getSizedSvgImage(svgImage);

    final pngSizedBytes =
        await sizedSvgImage.toByteData(format: ui.ImageByteFormat.png);
    final unit8List = pngSizedBytes.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(unit8List);
  }

  static Future<ui.Image> _getSvgImageFromAssets(
      BuildContext context, String svgAssertLink) async {
    String svgString =
        await DefaultAssetBundle.of(context).loadString(svgAssertLink);
    DrawableRoot drawableRoot = await svg.fromSvgString(svgString, null);
    ui.Picture picture = drawableRoot.toPicture();
    ui.Image image = await picture.toImage(drawableRoot.viewport.width.toInt(),
        drawableRoot.viewport.height.toInt());
    return image;
  }

  static Future<ui.Image> _getSvgImageFromString(String svgString) async {
    DrawableRoot drawableRoot = await svg.fromSvgString(svgString, null);
    ui.Picture picture = drawableRoot.toPicture();
    ui.Image image = await picture.toImage(drawableRoot.viewport.width.toInt(),
        drawableRoot.viewport.height.toInt());
    return image;
  }

  static Future<ui.Image> _getSizedSvgImage(ui.Image svgImage) async {
    final size = 50 * ui.window.devicePixelRatio;
    final width = size;
    final height = width;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Rect svgRect = Rect.fromLTRB(
        0.0, 0.0, svgImage.width.toDouble(), svgImage.height.toDouble());
    final Rect sizedRect =
        Rect.fromLTRB(0.0, 0.0, width, height); // owr size here
    canvas.drawImageRect(svgImage, svgRect, sizedRect, Paint());
    return await pictureRecorder
        .endRecording()
        .toImage(width.toInt(), height.toInt());
  }

  static Future<BitmapDescriptor> getClusterMarker(
    int clusterSize,
    Color clusterColor,
    Color textColor,
    int width,
  ) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = clusterColor;
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final double radius = width / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      paint,
    );

    textPainter.text = TextSpan(
      text: clusterSize != 0 ? clusterSize.toString() : "",
      style: TextStyle(
        fontSize: radius - 5,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        radius - textPainter.width / 2,
        radius - textPainter.height / 2,
      ),
    );

    final image = await pictureRecorder.endRecording().toImage(
          radius.toInt() * 2,
          radius.toInt() * 2,
        );

    final data = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  static Future<BitmapDescriptor> getMarkerIcon(
      String imagePath, Size size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = Colors.blue;
    final double tagWidth = 40.0;

    final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
    final double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    final double borderWidth = 3.0;

    final double imageOffset = shadowWidth + borderWidth;

    // Add shadow circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Add tag circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(size.width - tagWidth, 0.0, tagWidth, tagWidth),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        tagPaint);

    // Add tag text
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: '1',
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    );

    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width - tagWidth / 2 - textPainter.width / 2,
            tagWidth / 2 - textPainter.height / 2));

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await getImageFromPath(
        imagePath); // Alternatively use your own method to get the image
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  static Future<ui.Image> getImageFromPath(String imagePath) async {
    File imageFile = File(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  static Future<Uint8List> getBytesFromCanvas(int width, int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    final Radius radius = Radius.circular(20.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: 'Hello world',
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(
        canvas,
        Offset((width * 0.5) - painter.width * 0.5,
            (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
