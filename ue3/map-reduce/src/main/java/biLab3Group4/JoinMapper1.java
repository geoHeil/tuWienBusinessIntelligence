// cc JoinMapper1 Mapper for a reduce-side join

package biLab3Group4;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/***
 * Map task 1: Take a triple from file01, check whether the attribute name is
 * “species” and the attribute value contains the string “P_KK”. If this is true,
 * retrieve the prefix of the current dewey_pid and send it as the key to the reduce
 * task.
 * <p>
 * dealing with list of products / reference
 */
//vv JoinMapper1
public class JoinMapper1
        extends Mapper<LongWritable, Text, biLab3Group4.TextPair, Text> {

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
        textSecond.set("mapper1");
        keysOut.set(textFirst, textSecond);

        String attr = realValue.substring(0, realValue.indexOf(' '));
        String attrVal = realValue.substring(realValue.indexOf(' ') + 1) + " 1111111";
        /**
         * check whether the attribute name is “species” and the attribute value contains the string “P_KK”.
         * If this is true, retrieve the prefix of the current dewey_pid and send it as the key to the reduce task.
         * Also pass the ID of the mapper as this will be important for the Join.
         */
        if (("species".equals(attr)) && attrVal.contains("P_KK")) {

            valueOut.set(attrVal);

            logger.debug("KEY " + keysOut);
            logger.debug("VALUE " + valueOut);

            context.write(keysOut, valueOut);
        }
    }
}
