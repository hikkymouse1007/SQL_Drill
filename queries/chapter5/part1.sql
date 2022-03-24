SELECT
  'INSERT INTO Pref_Back VALUES ('
  || PrefecturalID
|| ','''
  || PrefecturalName
|| ''');' AS 都道府県のINSERT文
FROM
  Prefecturals
;
