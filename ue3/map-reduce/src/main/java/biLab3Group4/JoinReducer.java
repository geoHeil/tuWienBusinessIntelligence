// cc JoinReducer Reducer for join

package biLab3Group4;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * Similar to http://www.codeproject.com/Articles/869383/Implementing-Join-in-Hadoop-Map-Reduce
 * <p>
 * //reaction[listOfProducts/speciesReference[contains(@species, "P_KK")]]/listOfReactants/speciesReference/@species
 * <p>
 * Only elements from SECOND which are present in FIRST are outputted as a result. However if FIRST contains
 * attributes both attributes from SECOND and FIRST are merged.
 */
public class JoinReducer extends Reducer<TextPair, Text, Text, Text> {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private Text resultOutput = new Text();
    private Text resultKey = new Text();

    @Override
    protected void reduce(TextPair key, Iterable<Text> values, Context context)
            throws IOException, InterruptedException {

      /* here comes the reducer code */
        logger.debug("KEY " + key);
        resultKey.set(key.getFirst());
        if ("mapper1".equals(key.getSecond().toString())) {
            values.forEach(v -> join(v, context));
        }
    }

    private void join(Text v, Context context) {

        String[] mapperOrigin = v.toString().split("\\s+");
        if (!mapperOrigin[1].equals("1111111")) {
            logger.debug("VALUE " + v);
            resultOutput.set(mapperOrigin[0]);
            try {
                context.write(resultKey, resultOutput);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
