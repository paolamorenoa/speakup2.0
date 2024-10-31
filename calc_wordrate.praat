form Calculate Word Rate Automatically
    sentence Sound_file "sound.wav"
    real Silence_threshold -25
    real Minimum_silence_duration 0.3
    real Minimum_speech_duration 0.1
endform

# Read sound file
Read from file... 'Sound_file$'
sound = selected("Sound")

total_duration = Get total duration

# Detect words based on noise thresholds

selectObject: sound
To Intensity... 100 0  # time step of 100ms
intensity = selected("Intensity")

selectObject: intensity
To TextGrid (silences)... 'Silence_threshold' 'Minimum_silence_duration' 'Minimum_speech_duration' label_silence label_speech

textgrid = selected("TextGrid")
word_tier = 1  
number_of_intervals = Get number of intervals: word_tier

# initialize counter and count no of words
word_count = 0

for interval from 1 to number_of_intervals
    label$ = Get label of interval: word_tier, interval
    if label$ = "speech"
        word_count = word_count + 1
    endif
endfor

# words / second
word_rate = word_count / total_duration

# write results
writeInfoLine: "Total number of word-like units: ", word_count
writeInfoLine: "Total duration (seconds): ", total_duration
writeInfoLine: "Word rate (words per second): ", word_rate
