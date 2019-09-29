fn main() {
    let words = std::fs::read_to_string("words.txt").unwrap();
    let invalid = |w: &str| "gkmqvwxzio".chars()
        .any(|c| w.to_lowercase().contains(c));
    let mut longest: Vec<&str> = vec![];
    let mut maxlen = 0;

    for word in words.lines() {
        if !(word.len() < maxlen || invalid(word)) {
            if word.len() > maxlen {
                longest = vec![];
                maxlen = word.len();
            }
            longest.push(word);
        }
    }

    longest.iter().for_each(|l| println!("{}", l));
}
