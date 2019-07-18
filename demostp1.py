import pandas as pd
import re

with open("got8_6.txt") as srp:
    data = srp.read()

# delete words before and after the script
data = data.split('THE IRON THRONE LYRICS')[1]
data = data.split('Embed')[0]

# remove null string
regex = r"^$\n"
subst = ""
data = re.sub(regex, subst, data, 0, re.MULTILINE)

# split script into lines and number each line
lines = data.split('\n')
myrows = []
n = 1
for line in lines:
    myrows.append([n, line])
    n = n+1
    
# transfer array to dataframe and rename the name of df
df = pd.DataFrame(myrows)
df.columns = ['line', 'text']
# df.head()

# save the data into got8_6.csv file
df.to_csv('got8_6.csv', index=False)