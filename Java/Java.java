import java.io.*;
import java.util.ArrayList;

class Java7SegmentDisplays {
    public static void main(String[] args) {
        ArrayList<String> longest = new ArrayList<>();
        String invalid = "(?i).*[gkmqvwxzio].*";
        int maxlen = 0;

        try (BufferedReader br = new BufferedReader(
                    new FileReader("words.txt"))) {
            while(br.ready()) {
                String word = br.readLine();
                if(word.length() == maxlen && !word.matches(invalid)) {
                    longest.add(word);
                } else if(word.length() > maxlen && !word.matches(invalid)) {
                    longest.clear();
                    longest.add(word);
                    maxlen = word.length();
                }
            }
        } catch(IOException e) { e.printStackTrace(); }

        longest.forEach(System.out::println);
    }
}
