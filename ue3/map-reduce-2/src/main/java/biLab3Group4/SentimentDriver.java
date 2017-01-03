package biLab3Group4;

import org.apache.commons.io.FileUtils;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.MultipleInputs;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.*;

import java.io.File;

public class SentimentDriver extends Configured implements Tool {

	@Override
	public int run(String[] args) throws Exception {

		Job job = Job.getInstance(getConf(), "");
		job.setJarByClass(getClass());
		
		Path inputPath = new Path(args[0]);
		String s = "result/output/" + inputPath.getName();
		Path outputPath = new Path(s);
		FileUtils.deleteDirectory(new File(s));

		MultipleInputs.addInputPath(job, inputPath, TextInputFormat.class, SentimentMapper.class);
		FileOutputFormat.setOutputPath(job, outputPath);

		// job.setPartitionerClass(KeyPartitioner.class);
		// job.setGroupingComparatorClass(TextPair.ItemComparator.class);

		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(SentimentWritable.class);
		
		job.setReducerClass(SentimentReducer.class);		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(SentimentWritable.class);
		

		int result = job.waitForCompletion(true) ? 0 : 1;
		
		System.out.println("Map invocations: " + SentimentMapper.count.get());
		System.out.println("Reduce invocations: " + SentimentReducer.count.get());
		
		return result;
	}

	public static void main(String[] args) throws Exception {

		int exitCode = ToolRunner.run(new SentimentDriver(), args);
		System.exit(exitCode);
	}
}
