package biLab3Group4;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class SentimentMapper extends Mapper<LongWritable, Text, Text, SentimentWritable> {

	private static Set<String> posWords;
	private static Set<String> negWords;

	static {
		try (Stream<String> negLines = Files.lines(Paths.get("src/main/resources/neg-words.txt"));
				Stream<String> posLines = Files.lines(Paths.get("src/main/resources/pos-words.txt"))) {
			posWords = posLines.collect(Collectors.toSet());
			negWords = negLines.collect(Collectors.toSet());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@JsonIgnoreProperties(ignoreUnknown = true)
	static class ReviewItem {
		private String asin;
		private String reviewText;

		public String getAsin() {
			return asin;
		}

		public void setAsin(String asin) {
			this.asin = asin;
		}

		public String getReviewText() {
			return reviewText;
		}

		public void setReviewText(String reviewText) {
			this.reviewText = reviewText;
		}
	}

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	private LongWritable positiveOut = new LongWritable();
	private LongWritable negativeOut = new LongWritable();
	private DoubleWritable sentimentOut = new DoubleWritable();
	private SentimentWritable valueOut = new SentimentWritable();
	private Text keysOut = new Text();
	private ObjectMapper objectMapper = new ObjectMapper();

	@Override
	protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String line = value.toString();
		ReviewItem item = objectMapper.readValue(line, ReviewItem.class);

		long negative = 0, positive = 0;

		for (String word : item.reviewText.split(" |,|;|:|-|\\.|\\?|\\!")) {
			if (negWords.contains(word)) {
				negative++;
			} else if (posWords.contains(word)) {
				positive++;
			}
		}

		keysOut.set(item.getAsin());
		positiveOut.set(positive);
		negativeOut.set(negative);
		sentimentOut.set(positive + negative > 0 ? (positive - negative) / (positive + negative) : Double.NaN);
		logger.info("sentiment out " + positive + negative);

		valueOut.setNegative(negativeOut);
		valueOut.setPositive(positiveOut);
		valueOut.setSentiment(sentimentOut);

		context.write(keysOut, valueOut);
	}
}
