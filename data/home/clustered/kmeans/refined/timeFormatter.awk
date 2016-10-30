BEGIN{
FS = ","
OFS = ","
}

NR<2{
print $0
}

NR>1{
#Find the hour
time = $5
if( time < 10000 ){
    hour = 0
    minutes = substr(time,0,3) 
 
}else if( time < 100000){
    hour = substr(time,0,1)
    minutes = substr(time,2,3)
  
}else{
    hour = substr(time,0,2)
    minutes = substr(time,3,3)
}
#Modify the hour to have 7am == 0

hour = hour + 17 
hour = hour % 24

time = (hour*1000)+minutes 
$5 = time
print $0
}