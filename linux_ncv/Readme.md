# Deploy docker with nomad,consul,vault on Linux(Ubuntu18.0.4) VM in win10.
<br>
Similar with mac_ncv, but different in 
<br>
1) use docker tar file to download to docker image(test for blocked docker site), with mini webserver outside download provided, see ncv.hcl
<br>
2) use lo(127.0.0.1) as network interface 
<br>
3) since v1.2 use consul-template, nomad use host network model stick to docker container
<br>
4) query value by conslu key, get vault value from its token value.



