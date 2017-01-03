package biLab3Group4;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.mortbay.log.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;

public class SentimentReducer extends Reducer<Text, SentimentWritable, Text, SentimentWritable> {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private LongWritable positiveOut = new LongWritable();
	private LongWritable negativeOut = new LongWritable();
	private DoubleWritable sentimentOut = new DoubleWritable();
	private SentimentWritable resultOutput = new SentimentWritable();
	private Text resultKey = new Text();
	
	public static AtomicInteger count = new AtomicInteger(0);

	@Override
	protected void reduce(Text key, Iterable<SentimentWritable> values, Context context)
			throws IOException, InterruptedException {
		
		count.incrementAndGet();

		long posSum = 0, negSum = 0;
		Iterator<SentimentWritable> it = values.iterator();
		while (it.hasNext()) {
			SentimentWritable s = it.next();
			posSum += s.getPositive().get();
			negSum += s.getNegative().get();
		}

		resultKey.set(key);
		positiveOut.set(posSum);
		negativeOut.set(negSum);
		sentimentOut.set(posSum + negSum > 0 ? ((double) posSum - (double) negSum) / ((double) posSum + (double) negSum)
				: Double.NaN);

		resultOutput.setNegative(negativeOut);
		resultOutput.setPositive(positiveOut);
		resultOutput.setSentiment(sentimentOut);

		context.write(resultKey, resultOutput);
	}
}
