import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/video_entity.dart';
import '../../../domain/usecases/get_video.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this._getVideo) : super(VideoInitial());

  final GetVideo _getVideo;

  void getVideo(int id) async {
    final eitherVideoOrError = await _getVideo(VideoParams(id));
    emit(eitherVideoOrError.fold(
        (l) => NoVideo(), (videos) => VideoLoaded(videos: videos)));
  }
}
