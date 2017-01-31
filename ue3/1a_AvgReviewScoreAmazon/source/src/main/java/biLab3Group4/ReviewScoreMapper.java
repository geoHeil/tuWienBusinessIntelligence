package biLab3Group4;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

public class ReviewScoreMapper extends Mapper<LongWritable, Text, Text, DoubleWritable> {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private DoubleWritable valueOut = new DoubleWritable();
	private Text keysOut = new Text();

	@Override
	protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String line = value.toString();
		String[] cols = line.split(",");
		
		keysOut.set(cols[1]);
		valueOut.set(Double.parseDouble(cols[2]));

		context.write(keysOut, valueOut);
	}
}
