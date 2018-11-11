import java.io.*;
import java.util.ArrayList;

class Java7SegmentDisplays {
    public static void main(String[] args) {
        ArrayList<String> words = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(
                    new FileReader("words.txt"))) {
            while(br.ready()) words.add(br.readLine());
        } catch(IOException e) { e.printStackTrace(); }
        ArrayList<String> longest = new ArrayList<>();
        String invalid = ".*[gkmqvwxzio].*";

        for(String word : words) {
            int len = longest.isEmpty() ?
                0 : longest.get(0).length();
            if(word.length() == len) {
                if(!word.matches(invalid)) {
                    longest.add(word);
                }
            } else if(word.length() > len) {
                if(!word.matches(invalid)) {
                    longest.clear();
                    longest.add(word);
                }
            }
        }

        longest.forEach(System.out::println);
    }
}

