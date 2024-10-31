import os
import whisper

# change to large for greatest accuracy
model = whisper.load_model("small")

# change directory to project drive audio folder: (denoised), dutch transcriptions, eng translations
wav_folder_path = "/Users/paolamorenoancalmo/Desktop/radboud/yr_2/internship/wav_files/"
dut_folder_path = output_folder = os.path.join(wav_folder_path, "txt_files/dutch_transcriptions/")
eng_folder_path = output_folder = os.path.join(wav_folder_path, "txt_files/english_translations/")

files = [f for f in os.listdir(wav_folder_path) if f.endswith('.wav')]

for file in files:
    audio_path = os.path.join(wav_folder_path, file)
    result_dutch = model.transcribe(audio_path, language="nl")  
    dutch_text = result_dutch["text"]
    dutch_file_name = f"{file}_dutch_transcription.txt"
    
    with open(os.path.join(dut_folder_path, dutch_file_name), "w") as f:
        f.write(dutch_text)
    
    result_english = model.transcribe(audio_path, task="translate")
    
    english_text = result_english["text"]
    english_file_name = f"{file}_english_translation.txt"
    with open(os.path.join(eng_folder_path, english_file_name), "w") as f:
        f.write(english_text)

    print(f"Processed {file}: Dutch transcription and English translation saved.")
