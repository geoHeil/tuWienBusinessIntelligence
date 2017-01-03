package biLab3Group4;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Writable;

public class SentimentWritable implements Writable {

	private LongWritable positive;
	private LongWritable negative;
	private DoubleWritable sentiment;
	
	public SentimentWritable() {
		
	}
	
	public SentimentWritable(LongWritable positive, LongWritable negative, DoubleWritable sentiment) {
		super();
		this.positive = positive;
		this.negative = negative;
		this.sentiment = sentiment;
	}
	
	public LongWritable getPositive() {
		return positive;
	}

	public void setPositive(LongWritable positive) {
		this.positive = positive;
	}

	public LongWritable getNegative() {
		return negative;
	}

	public void setNegative(LongWritable negative) {
		this.negative = negative;
	}

	public DoubleWritable getSentiment() {
		return sentiment;
	}

	public void setSentiment(DoubleWritable sentiment) {
		this.sentiment = sentiment;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((negative == null) ? 0 : negative.hashCode());
		result = prime * result + ((positive == null) ? 0 : positive.hashCode());
		result = prime * result + ((sentiment == null) ? 0 : sentiment.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SentimentWritable other = (SentimentWritable) obj;
		if (negative == null) {
			if (other.negative != null)
				return false;
		} else if (!negative.equals(other.negative))
			return false;
		if (positive == null) {
			if (other.positive != null)
				return false;
		} else if (!positive.equals(other.positive))
			return false;
		if (sentiment == null) {
			if (other.sentiment != null)
				return false;
		} else if (!sentiment.equals(other.sentiment))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SentimentWritable [positive=" + positive + ", negative=" + negative + ", sentiment=" + sentiment + "]";
	}

	@Override
	public void write(DataOutput out) throws IOException {
		positive.write(out);
		negative.write(out);
		sentiment.write(out);
	}
	
	@Override
	public void readFields(DataInput in) throws IOException {
		positive.readFields(in);
		negative.readFields(in);
		sentiment.readFields(in);
	}
}
