#!/bin/bash

# It appears that the line above needs to be the first entry within this script.

# Note: I found that the rest of the script would not run correctly
# unless I included this first line.

# For a discussion of this line,
# see: https://stackoverflow.com/questions/8967902/why-do-you-need-to-put-bin-bash-at-the-beginning-of-a-script-file

# This script calls Papermill in order to run recent_weather_data.ipynb,
# then save a copy of the executed notebook to a Google Drive file
# (thus making it accessible to others).
# I designed it for Linux, but it shouldn't be too hard to design
# an equivalent Windows version (which I may do at a later date).


# Activating my custom Python for Nonprofits environment:
# (You'll need to revise this code in order to activate your own custom environment. However,
# You should to delete the following three if you're planning
# to execute the notebook within your base environment.)
# These lines are based on Lamma's post at:
# https://stackoverflow.com/a/60523131/13097194

echo "Activating Python environment:"
source ~/miniforge3/etc/profile.d/conda.sh
conda activate pfnv2

# Navigating to script's directory:
cd /home/kjb3/kjb3docs/programming/py/kjb3_programs_2/Automated_Notebooks/

# Calling papermill:
echo "Running script via papermill:"
papermill recent_weather_data.ipynb automated_output.ipynb


# Copying this automated file to a locally-mounted Google Drive folder:
echo "Copying notebook and output folder to Drive:"
cp automated_output.ipynb /home/kjb3/kjb3server_drive/pfn2_weather_analysis_output/automated_weather_data_output.ipynb
cp recent_weather_output/ -r /home/kjb3/kjb3server_drive/pfn2_weather_analysis_output/
