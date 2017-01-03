package biLab3Group4;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Iterator;

public class SentimentReducer extends Reducer<Text, SentimentWritable, Text, SentimentWritable> {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private LongWritable positiveOut = new LongWritable();
	private LongWritable negativeOut = new LongWritable();
	private DoubleWritable sentimentOut = new DoubleWritable();
    private SentimentWritable resultOutput = new SentimentWritable();
    private Text resultKey = new Text();

    @Override
    protected void reduce(Text key, Iterable<SentimentWritable> values, Context context)
            throws IOException, InterruptedException {

    	long posSum = 0, negSum = 0;
    	Iterator<SentimentWritable> it = values.iterator();
    	while(it.hasNext()) {
    		SentimentWritable s = it.next();
    		logger.info("sentiment s " + s);
    		posSum += s.getPositive().get();
    		negSum += s.getNegative().get();
    	}

    	resultKey.set(key);
		positiveOut.set(posSum);
		negativeOut.set(negSum);
		sentimentOut.set(posSum + negSum > 0 ? (posSum - negSum) / (posSum + negSum) : Double.NaN);

    	resultOutput.setNegative(negativeOut);
    	resultOutput.setPositive(positiveOut);
    	resultOutput.setSentiment(sentimentOut);

    	context.write(resultKey, resultOutput);
    }
}
