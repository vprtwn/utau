# split audio into 1 second samples
# file must contain 1 second notes from C3 to C7
wav_file = "a-c3c7.wav"
notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
seconds = 49
prefix = "a"
(0..seconds-1).step {|i|
	note_name = "#{notes[(i%12)]}#{((i/12) + 3).floor}"
	command = "sox #{wav_file} #{"wav/"+prefix+"#{i}_"+note_name}.wav trim #{i} 1"
	print command+"\n"
	system command
}