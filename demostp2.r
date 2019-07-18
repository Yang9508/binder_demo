library(dplyr)
library(tidytext)
library(tidyr)
library(ggplot2)
got8_6scp = read.csv("got8_6.csv", stringsAsFactors=FALSE)

# splitting a string into a sequence of "words"
tidy_script = got8_6scp %>%
unnest_tokens(word, text)
head(tidy_script)

# using the emotion dictionary bing
tidy_script %>%
  anti_join(stop_words) %>%
  inner_join(get_sentiments("bing")) %>%
  count(line, sentiment) %>%
  mutate(index = line %/% 5) %>% #combine 5 lines as a paragraph
  arrange(line) %>%
  head(10)

# plot the line
tidy_script %>%
  anti_join(stop_words) %>%
  inner_join(get_sentiments("bing")) %>%
  count(line, sentiment) %>%
  mutate(index = line %/% 5)  %>% #combine 5 lines as a paragraph
  ggplot(aes(x = index, y=n, col= sentiment)) %>%
  + geom_col() %>%
  + facet_wrap(~sentiment, ncol = 1) %>%
  + ggsave(file="got8_6sen.png", width=5, height=4)
