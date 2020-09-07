data PersonalInfo = PI String String Integer

instance Eq PersonalInfo 
  where (PI name1 surname1 birthyear1) == (PI name2 surname2 birthyear2) = name1 == name2


instance Show PersonalInfo
  where show (PI name surname birthyear) = "Name: " ++ show (name) ++ "\nSurname: " ++ show (surname) ++ "\nBirthyear: " ++ show (birthyear)
