import java.lang { Runnable, Bool=Boolean }
import javafx.application { Platform }
import java.util.concurrent { CountDownLatch }

shared Value? doInFxThread<Value>(Value toRun(Object* args)) {
	variable Value? result = null;
	CountDownLatch latch = CountDownLatch(1);
	object runnable satisfies Runnable {
		shared actual void run() {
			result = toRun();
			latch.countDown();
		}
	}
	Platform.runLater(runnable);
	latch.await();
	return result;
}

shared Runnable asRunnable(Anything toRun(Object* args)) {
	object runnable satisfies Runnable {
		shared actual void run() { toRun(); }
	}
	return runnable;
}

shared Boolean fromJavaBool(Bool? boolean) {
	if (exists b = boolean) {
		return b.booleanValue();
	}
	return false;
}
