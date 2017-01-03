package biLab3Group4;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Iterator;

public class AvgReducer extends Reducer<Text, DoubleWritable, Text, DoubleWritable> {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private DoubleWritable resultOutput = new DoubleWritable();
    private Text resultKey = new Text();

    @Override
    protected void reduce(Text key, Iterable<DoubleWritable> values, Context context)
            throws IOException, InterruptedException {

    	int count = 0;
    	double sum = 0.0;
    	Iterator<DoubleWritable> it = values.iterator();    	
    	while(it.hasNext()) {
    		sum += it.next().get();
    		count++;
    	}
    	
    	resultKey.set(key);
    	resultOutput.set(sum / count);
    	
    	context.write(resultKey, resultOutput);
    }
}
