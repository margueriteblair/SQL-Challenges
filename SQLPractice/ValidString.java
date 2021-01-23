import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidString {
    public static void main(String[] args) {
        System.out.println(validityTest("ABC1910R50A"));
        System.out.println(validityTest("DEF20191000B"));
    }

    public static int countValid(List<String> list) {
        int valid = 0;
        for (int i = 0; i < list.size(); i++) {
            if (validityTest(list.get(i)) == true) {
                valid++;
            }
        }
        return valid;
    }

    public static boolean validityTest(String str) {
        if (str.length() < 10 || str.length() > 12) {
            return false;
        }
        String first = str.substring(0, 3);
        if (first.charAt(0) == first.charAt(1) || first.charAt(1) == first.charAt(2) || first.charAt(0) == first.charAt(2)) {
            return false;
        }

        String second = str.substring(3, 7);
        Pattern pattern = Pattern.compile("19[0-9][0-9]|20[0-1][0-9]");
        Matcher matcher = pattern.matcher(second);
        if (matcher.find() == false) {
            return false;
        }

        String third = str.substring(7, str.length()-1);
        try {
            int denomination = Integer.parseInt(third);
            if (denomination % 25 != 0) {
                return false;
            }
        } catch (Exception ex) {
            return false;
        }
        // Pattern pattern2 = Pattern.compile("[^A-Za-z][25|50|100|200|500|1000]"); //would denominations literally just mean divisible by 10?
        // Matcher matcher2 = pattern2.matcher(third);
        // if (matcher2.find() == false) {
        //     return false;
        // }

        String last = str.substring(str.length()-1);
        Pattern pattern3 = Pattern.compile("[A-Z]");
        Matcher matcher3 = pattern3.matcher(last);
        if (matcher3.find() == false) {
            return false;
        }
        return true;
    }
}