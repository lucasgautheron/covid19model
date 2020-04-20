import pandas as pd

df = pd.read_csv('https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv')
df['date'] = pd.to_datetime(df['date'], format = '%Y-%m-%d')
df['date_str'] = df['date'].dt.strftime('%d/%m/%Y')
df = df[df['maille_code'] == 'FRA']
df = df[df['source_type'] == 'ministere-sante']
df = df[df['date'] >= '2020-03-30']
df.dropna(subset=['deces'], inplace = True)
df = df.sort_values('date', ascending = True)
df['deces'] = df['deces'].diff().shift(1)
print(df[['deces', 'source_type']])

reference = pd.read_csv('data/COVID-19-up-to-date.csv')
reference = reference.merge(df[['deces', 'date_str', 'maille_code']], how = 'left', left_on = ['dateRep', 'countryterritoryCode'], right_on = ['date_str', 'maille_code'])
#reference[reference['countryterritoryCode'] == 'FRA'][['dateRep', 'deaths', 'deces']].to_csv('test.csv')
reference.loc[~reference['deces'].isnull(),'deaths'] = reference[~reference['deces'].isnull()]['deces']
reference.drop(['deces', 'date_str', 'maille_code'], axis=1, inplace = True)
reference['deaths'] = reference['deaths'].astype(int)
reference['popData2018'] = reference['popData2018'].fillna(0).astype(int)
print(reference.to_csv('test.csv', index = False))
