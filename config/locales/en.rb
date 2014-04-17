{
  en: {
    date: {
      formats: {
        year:  "%Y",
        month: "%B, %Y",
        day:   lambda { |date, _| "%B #{date.day.ordinalize}, %Y" }
      }
    }
  }
}
