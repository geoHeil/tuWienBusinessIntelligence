// cc JoinMapper2 Mapper for a reduce-side join
package biLab3Group4;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

// vv JoinMapper2

/**
 * dealing with reactants / reference
 */
public class JoinMapper2
        extends Mapper<LongWritable, Text, TextPair, Text> {

    /* here define the variables */
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private Text valueOut = new Text();
    private Text textFirst = new Text();
    private Text textSecond = new Text();
    private TextPair keysOut = new TextPair();

    @Override
    protected void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {

/* here the code for retrieving the triples from file01 and send the prefix of the dewey_pid as key */

        String str = value.toString();
        /**
         Given a dewey_pid (id) from file01 or file02, we can easily obtain the dewey_pid
         of reaction by removing the last two digits from id.
         For instance, if the dewey_pid from file01 is 1.1 .3 .4
         then the dewey_pid of reaction would be 1.1 --> (-) 5 as 4 for digits + point
         */
        String realKey = str.substring(0, str.indexOf(' '));
        String realValue = str.substring(str.indexOf(' ') + 1);

        textFirst.set(realKey.substring(0, realKey.length() - 4));
        textSecond.set("mapper2");
        keysOut.set(textFirst, textSecond);

        String attr = realValue.substring(0, realValue.indexOf(' '));
        String attrVal = realValue.substring(realValue.indexOf(' ') + 1) + " 22222";

        valueOut.set(attrVal);

        if (("species".equals(attr))) {
            logger.debug("KEY " + keysOut);
            logger.debug("VALUE " + valueOut);
            context.write(keysOut, valueOut);
        }
    }
}
