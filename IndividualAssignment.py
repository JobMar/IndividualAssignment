#Step 1: Import json and csv packages
import json
import csv

#Step 2: Load in the conflict JSON data
with open('conflict_data_full_lined.json') as file:
    data = json.load(file)

#Step 3: Open the output CSV file we want to write to
with open('preprocessed.csv', 'w', newline='') as file:
    csvwriter = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    
    csvwriter.writerow(['Country', 'Year', 'Type_of_violence', 'Side_a', 'Side_b', 'Latitude', 'Longitude', 'Date_start', 'Date_end', 'Best_est'])
    for line in data:
        if line['country'] == 'Mexico' and line['type_of_violence'] != 1 and line['side_a'] != 'Government of Mexico' and line['side_b'] != 'Government of Mexico':
            csvwriter.writerow([line['country'], line['year'], line['type_of_violence'], line['side_a'], line['side_b'], line['latitude'], line['longitude'], line['date_start'], line['date_end'], line['best']])
        if line['country'] == 'Colombia' and line['type_of_violence'] != 1 and line['side_a'] != 'Government of Colombia' and line['side_b'] != 'Government of Colombia':
            csvwriter.writerow([line['country'], line['year'], line['type_of_violence'], line['side_a'], line['side_b'], line['latitude'], line['longitude'], line['date_start'], line['date_end'], line['best']])
    
    
#Step 4: Load in the conflict JSON data
with open('populations_lined.json') as file:
    data = json.load(file)

#Step 5: Open the output CSV file we want to write to
with open('populations.csv', 'w', newline='') as file:
    csvwriter = csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    
    csvwriter.writerow(['Country', 'Population'])
    csvwriter.writerow(['Colombia', data['Colombia']['2017']])
    csvwriter.writerow(['Mexico', data['Mexico']['2017']])
