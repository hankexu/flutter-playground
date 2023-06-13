import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPageView extends HookConsumerWidget {
  const VideoPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // mediaUrls.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: ExtendedImageGesturePageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (ctx, index) {
          return Container(
            color: Colors.black,
            child: mediaUrls[index].endsWith('webm')
                ? VideoPlayer(mediaUrls[index])
                : ExtendedImage.network(mediaUrls[index],
                    fit: BoxFit.contain, mode: ExtendedImageMode.gesture,
                    initGestureConfigHandler: (state) {
                    return GestureConfig(
                      cacheGesture: false,
                      minScale: 0.9,
                      animationMinScale: 0.7,
                      maxScale: 3.0,
                      animationMaxScale: 3.5,
                      speed: 1.0,
                      inertialSpeed: 100.0,
                      initialScale: 1.0,
                      inPageView: true,
                      initialAlignment: InitialAlignment.center,
                    );
                  }),
          );
        },
        itemCount: null,
      ),
    );
  }
}

class VideoPlayer extends HookConsumerWidget {
  const VideoPlayer(
    this.url, {
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MeeduPlayerController(
      controlsStyle: ControlsStyle.secondary,
      initialFit: BoxFit.contain,
      controlsEnabled: false,
      enabledOverlays: const EnabledOverlays(volume: false, brightness: false),
      enabledControls: const EnabledControls(
          volumeSwipes: false,
          brightnessSwipes: false,
          seekArrows: false,
          doubleTapToSeek: false),
      enabledButtons: const EnabledButtons(
        playPauseAndRepeat: false,
        rewindAndfastForward: false,
        muteAndSound: false,
        fullscreen: false,
        videoFit: false,
        pip: false,
        playBackSpeed: false,
        lockControls: false,
      ),
    )..setDataSource(DataSource(type: DataSourceType.network, source: url),
        autoplay: false, looping: true);
    return SafeArea(
      child: VisibilityDetector(
        key: Key(url),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction == 0) {
            controller.pause();
          } else {
            controller.play();
          }
        },
        child: Stack(
          children: [
            MeeduVideoPlayer(
              controller: controller,
            ),
            MeeduPlayerProvider(
              child: Positioned(
                child: PlayerSlider(),
                bottom: 20,
                left: 0,
                right: 0,
              ),
              controller: controller,
            ),
            MeeduPlayerProvider(
                child: Positioned(
                  child: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () {
                      controller.play();
                    },
                  ),
                ),
                controller: controller)
          ],
        ),
      ),
    );
  }
}

class MyPlayerSlider extends StatelessWidget {
  const MyPlayerSlider({Key? key, this.controller}) : super(key: key);
  final MeeduPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final _ = controller ?? MeeduPlayerController.of(context);
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        LayoutBuilder(builder: (ctx, constraints) {
          return RxBuilder(
            //observables: [_.buffered, _.duration],
            (__) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.white30,
                width: constraints.maxWidth * _.bufferedPercent.value,
                height: 3,
              );
            },
          );
        }),
        RxBuilder(
          //observables: [_.sliderPosition, _.duration],
          (__) {
            final int value = _.sliderPosition.value.inSeconds;
            final double max = _.duration.value.inSeconds.toDouble();
            if (value > max || max <= 0) {
              return Container();
            }
            return Container(
              constraints: const BoxConstraints(
                maxHeight: 30,
              ),
              padding: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.center,
              child: SliderTheme(
                data: SliderThemeData(
                  trackShape: MSliderTrackShape(),
                  thumbColor: _.colorTheme,
                  activeTrackColor: _.colorTheme,
                  trackHeight: 10,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 4.0),
                ),
                child: Slider(
                  min: 0,
                  divisions: _.duration.value.inSeconds,
                  value: value.toDouble(),
                  onChangeStart: (v) {
                    _.onChangedSliderStart();
                  },
                  onChangeEnd: (v) {
                    _.onChangedSliderEnd();
                    _.seekTo(
                      Duration(seconds: v.floor()),
                    );
                  },
                  label: printDuration(_.sliderPosition.value),
                  max: max,
                  onChanged: _.onChangedSlider,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
