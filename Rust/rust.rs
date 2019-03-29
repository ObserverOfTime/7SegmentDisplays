use std::collections::HashSet;
use std::fs;

fn main() {
    // Open the file
    let text = fs::read_to_string("words.txt").unwrap();

    // Define the necessary variables
    let bad: HashSet<char> = String::from("gkmqvwxzio").chars().collect();
    let mut longest: Vec<&str> = vec![""];

    // Let the games begin
    for word in text.lines() {
        if word.len() < longest[0].len() || word.chars().any(|c| bad.contains(&c)) {
            continue;
        } else {
            if word.len() > longest[0].len() {
                longest = vec![];
            }
            longest.push(word);
        }
    }

    for result in longest.iter() {
        println!("{}", result);
    }
}
