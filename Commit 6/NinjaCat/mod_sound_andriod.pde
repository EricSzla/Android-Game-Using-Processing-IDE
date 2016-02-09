import android.media.MediaPlayer;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.content.Context;
import android.app.Activity;
//..................................................................................
//    S O U N D
//..................................................................................
// overload for SFX..
MediaPlayer soundLoad(String filename) {
  MediaPlayer mp = null;
  Activity act = this.getActivity();
  Context context = act.getApplicationContext();
  try {
    mp = new MediaPlayer();

    AssetFileDescriptor afd = context.getAssets().openFd(filename);//is in the data folder
    mp.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
    mp.prepare();
  } 
  catch(IOException e) {
  }
  return mp;
}
//..................................................................................
// overload for SFX of MUSIC files..
MediaPlayer soundLoad(String filename, boolean ASYNC_LARGE_FILE) {
  MediaPlayer mp = null;
  Activity act = this.getActivity();
  Context context = act.getApplicationContext();
  try {
    mp = new MediaPlayer();

    AssetFileDescriptor afd = context.getAssets().openFd(filename);//is in the data folder
    mp.setDataSource(afd.getFileDescriptor(), afd.getStartOffset(), afd.getLength());
    if (ASYNC_LARGE_FILE) {
      mp.prepareAsync();
    } else {
      mp.prepare();
    }
  } 
  catch(IOException e) {
  }
  return mp;
}
//..................................................................................
// play sound file..
void soundPlay(MediaPlayer mySound) {
  mySound.seekTo(0);  
  mySound.start();
  mySound.setNextMediaPlayer(null);
}
//..................................................................................
// starts sound file playback on concrete position..
void soundPlay(MediaPlayer mySound, int seek) {
  mySound.seekTo(seek);  
  mySound.start();
  mySound.setNextMediaPlayer(null);
}
//..................................................................................
// stop sound file..
void soundStop(MediaPlayer mySound) {
  mySound.stop();
}
//..................................................................................
// get is playing sound file..
boolean soundIsPlaying(MediaPlayer mySound) {
  return mySound.isPlaying();
}
///..................................................................................
// set looping mode on sound file playback..
void soundSetLoop(MediaPlayer mySound, boolean l) {
  mySound.setLooping(l);
}
//..................................................................................
// pause/resume playback of sound file..
void soundPause(MediaPlayer mySound, boolean p) {
  if (p) {
    mySound.pause();
  } else {
    mySound.start();
  }
}
//..................................................................................
int soundGetPosition(MediaPlayer mySound) {
  return mySound.getCurrentPosition();
}
//..................................................................................
//..................................................................................