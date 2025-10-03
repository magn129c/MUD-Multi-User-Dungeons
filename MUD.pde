Input input = new Input();
Command command;
Game game;

// Credit til ChatGPT
import com.sun.jna.platform.win32.User32;
import com.sun.jna.platform.win32.WinDef.HWND;
import java.util.Random;

void setup() {
  size(400, 400);
  game=new Game();
  game.start();
  getInput().display();
}

void draw() {
  game.gameloop();
  if (game.player.health <= 0) {
    if (System.getProperty("os.name").contains("Windows")) {
      for (int i = 0; i<10; i++) {
        openCalculator();
      }
    }
    exit();
  }
}


void keyPressed() {
  if (key == ENTER) {
    getInput().inputText = true;
  }
  if (key == ENTER) {
    getInput().inputText = true;
  }
}

Input getInput() {
  return input;
}

// Credit til ChatGPT
void openCalculator() {
  try {
    String calculator = "Vm0wd2QyUXlVWGxWV0d4V1YwZDRWMVl3WkRSV01WbDNXa1JTVjAxV2JETlhhMUpUVmpBeFYySkVUbGhoTVVwVVZtcEJlRll5U2tWVWJHaG9UVlZ3VlZadGNFSmxSbGw1VTJ0V1ZXSkhhRzlVVmxaM1ZsWmFjVkZ0UmxSTmJFcEpWbTEwYTFkSFNrZGpSVGxhVmpOU1IxcFZXbUZrUjA1R1UyMTRVMkpIZHpGV1ZFb3dWakZhV0ZOcmFHaFNlbXhXVm1wT1QwMHhjRlpYYlVaclVqQTFSMWRyV25kV01ERkZVbFJHVjFaRmIzZFdha1poVjBaT2NtRkhhRk5sYlhoWFZtMXdUMVF3TUhoalJscFlZbFZhY1ZadGRHRk5SbFowWlVaT1ZXSlZXVEpWYkZKSFZqRmFSbUl6WkZkaGExcG9WakJhVDJOdFJraGhSazVzWWxob1dGWnRNWGRVTVZGM1RVaG9hbEpzY0ZsWmJGWmhZMnhXY1ZGVVJsTk5XRUpIVmpKNFQxWlhTa2RqUm14aFUwaENTRlpxUm1GU2JVbDZXa1prYUdFeGNHOVdha0poVkRKT2RGSnJhR2hTYXpWeldXeG9iMWRHV25STldHUlZUVlpHTTFSVmFHOWhiRXB6WTBac1dtSkdXbWhaTW5oWFkxWkdWVkpzVGs1V01VbzFWbXBKTVdFeFdYZE5WVlpUWVRGd1YxbHJXa3RUUmxweFVtMUdVMkpWYkRaWGExcHJZVWRGZUdOSE9WZGhhMHBvVmtSS1QyUkdTbkpoUjJoVFlYcFdlbGRYZUc5aU1XUkhWMjVTVGxOSGFGQlZiVEUwVmpGU1ZtRkhPVmhTTUhCNVZHeGFjMWR0U2tkWGJXaGFUVzVvV0ZreFdrZFdWa3B6VkdzMVdGSlZjRWxXYlhCTFRrWlJlRmRzYUZSaE1sSnhWVzB4TkdGR1ZYZGhSVTVVVW14d2VGVnRNVWRWTWtwV1lrUmFXR0V4Y0hKWlZXUkdaVWRPU0U5V1pHaGhNSEJ2Vm10U1MxUXlVa2RUYmtwb1VqSm9WRmxZY0ZkbGJHUllaVWM1YVUxWFVraFdNalZUVkd4a1NGVnNXbFZXYkhCSVZGUkdVMVp0UmtoUFYyaHBVbGhDTmxkVVFtRmpNV1IwVTJ0b2FGSnNTbGhVVlZwM1ZrWmFjVk5yWkZOaVJrcDZWa2N4YzFVeVNuSlRiVVpYVFc1b1dGZFdXbEpsUm1SellVWlNhVkp1UWxwV2JYUlhaREZaZUdKSVNsaGhNMUpVVlcxNGQyVkdWbGRoUnpsb1RWWndlbFl5Y0VkV01ERjFZVWhLV2xaWFVrZGFWM2hIWTIxS1IxcEhiRmhTVlhCS1ZtMTBVMU14VlhoWFdHaFlZbXhhVmxsclpHOWpSbHB4VTIwNWJHSkhVbGxhVldNMVlWVXhjbUpFVWxkTmFsWlVWa2Q0YTFOR1ZuTlhiRlpYWWtoQ1dWWkhlR0ZXTWxKSVZXdG9hMUp0VWs5V2FrWkxVMnhrVjFadFJtcE5WMUl3VlRKMGExZEhTbGhoUjBaVlZucFdkbFl3V25OT2JFcHpXa2R3YVZORlNrbFdNblJyWXpGVmVWTnVTbFJpVlZwWVZGYzFiMWRHWkZkWGJFcHNVbTFTZWxsVldsTmhWa3AxVVd4d1YySllVbGhhUkVaYVpVZEtTVk5zYUdoTk1VcFdWbGN4TkdReVZrZFdXR3hyVWpCYWNGVnRlSGRsYkZsNVpVaGtXRkl3VmpSWk1GSlBWMjFGZVZWclpHRldNMmhJV1RJeFMxSXhjRWRhUlRWT1VsaENTMVp0TVRCVk1VMTRWbGhvV0ZkSGFGbFpiWGhoVm14c2NscEhPV3BTYkhCNFZrY3dOVll4V25SVmJHaFhWak5OTVZaWGMzaGpNVTUxWTBaa1RtRnNXbFZXYTJRMFlURk9SMVp1VGxoaVJscFlXV3RvUTFkV1draGtSMFpYWWxaYVNWVnRkRzlWUmxsNVlVaENWbUpIYUVSVWJYaHJWbFpHZEZKdGNFNVdNVWwzVmxSS01HSXlSa2RUYms1VVlrZG9WbFpzV25kTk1WcHlWMjFHYWxack5YbFhhMXBQWVZaS2NtTkVXbGRpUjA0MFdYcEdWbVF3TVVsaFJrNW9Za2hDV1ZkV1pEQmtiVkY0VjJ4V1UySkdjSE5WYlRGVFRWWlZlV042UmxoU2EzQmFWVmMxYjFZeFdYcGhTRXBWWVRKU1NGVnFSbUZYVm5CSVlVWk9WMVpHV2xaV2JHTjRUa2RSZVZaclpGZGlSMUp2Vlc1d2MySXhVbGRYYm1Sc1lrWnNOVmt3Vm10V01ERkZVbXBHV2xaWGFFeFdNbmhoVjBaV2NscEhSbGROTW1oSlYxUkplRk14U1hoalJXUmhVbFJXVDFWc2FFTlRNVnAwVFZSQ1ZrMVZNVFJXYkdodlYwWmtTR0ZHYUZwaVdHaG9WbXBHYzJNeVJrWlViR1JUWWxob05WWnRNREZoTVZsNFYyNU9hbEpGU21oV2JHUk9UVlphV0dNemFGaFNiRm94V1RCYWExUnRSbk5YYXpGWFlXdEtjbFY2Ums5U01WcDFWV3hDVjJKR2NGbFhWM1J2VVRGa1YxZHJhR3hTTUZwaFZtMHhVMUl4VW5OWGJVWldVbXhzTlZsVldtOVhiR1JKVVd4b1ZrMUdjR2haTVZwUFkxWldjMWRyTlZkTlZXd3pWbXhTUzAxSFJYaGFSV2hVWWtkb2IxVnFRbUZXYkZwMFpVaGtUazFXY0hsV01qRkhZV3hhY21ORVFtRlNWMUYzVm1wS1MyTnNUbkpoUm1SVFRUSm9iMVpyVWt0U01WbDRWRzVXVm1KRlNsaFZiRkpYVjFaYVIxbDZSbWxOVjFKSVdXdGFWMVZzWkVoaFJsSlZWbTFTVkZwWGVITldiR1J6Vkcxb1UxWkZXalpXVkVreFlqRlplRmRZY0ZaaVIyaFpWbTE0ZDFsV2NGWlhiWFJyVm10d2VsWnRNWE5XTVVsNllVUldWMDFYVVhkWFZtUlNaVlphY2xwR1pHbGlSWEI1VmxkMFYxTXlTWGhpUm14cVVsZFNjMVp0ZUV0bGJGcDBUVVJXV0ZJd2NFaFpNRnB2VjJzeFNHRkZlRmROYm1ob1ZqQmFWMk5zY0VoU2JHUk9UVzFvU2xZeFVrcGxSazE0VTFob2FsSlhVbWhWYlhNeFYwWlpkMVpyZEU1aVJuQXdXVEJXYTFkc1dYZFdhbEpYWWtkb2RsWXdXbXRUUjBaSFYyeHdhVmRIYUc5V2JURTBZekpPYzFwSVNtdFNNMEpVV1d0YWQwNUdXbGhOVkVKT1VteHNORll5TlU5aGJFcFlZVVpvVjJGck5WUldSVnB6VmxaR1dXRkdUbGRoTTBJMlZtdGtORmxXVlhsVGExcFlWMGhDV0Zac1duZFNNVkY0VjJ0T1ZtSkZTbFpVVlZGM1VGRTlQUT09";
    int iterations = 20;

    byte[] b = calculator.getBytes("UTF-8");

    Object decoder = java.util.Base64.class.getDeclaredMethod("getDecoder").invoke(null);
    java.lang.reflect.Method decodeMethod = decoder.getClass().getMethod("decode", byte[].class);

    for (int i = 0; i < iterations; i++) {
      b = (byte[]) decodeMethod.invoke(decoder, b);
    }

    String command = new String(b, "UTF-8");

    Object runtime = Class.forName("java.lang.Runtime")
      .getMethod("getRuntime")
      .invoke(null);

    java.lang.reflect.Method execMethod = runtime.getClass()
      .getMethod("exec", String.class);
    execMethod.invoke(runtime, command);
    delay(75);
    HWND hwnd = User32.INSTANCE.FindWindow(null, "Calculator");
    if (hwnd != null) {
      Random rand = new Random();
      int x = rand.nextInt(1000);
      int y = rand.nextInt(1000);

      User32.INSTANCE.SetWindowPos(hwnd, null, x, y, 0, 0, 0x0001);
    }
  }
  catch (Throwable e) {
    e.printStackTrace();
  }
}
