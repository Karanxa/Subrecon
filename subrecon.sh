bbht(){
mkdir /Users/karanarora/bbht/programs/$1/
mkdir /Users/karanarora/bbht/programs/$1/domains/
mkdir /Users/karanarora/bbht/programs/$1/nuclei-results/
mkdir /Users/karanarora/bbht/programs/$1/subdomains/
mkdir /Users/karanarora/bbht/programs/$1/wayback/
mkdir /Users/karanarora/bbht/programs/$1/screenshots/
mkdir /Users/karanarora/bbht/programs/$1/github/
mkdir /Users/karanarora/bbht/programs/$1/wordlists/
mkdir /Users/karanarora/bbht/programs/$1/endpoints/
mkdir /Users/karanarora/bbht/programs/$1/poc/
mkdir /Users/karanarora/bbht/programs/$1/notes/
mkdir /Users/karanarora/bbht/programs/$1/imp/
cd  /Users/karanarora/bbht/programs/$1/domains/
echo "$1.com" | tee -a roots.txt
}


sub(){

amass enum --passive -df /Users/karanarora/bbht/programs/$1/domains/roots.txt  -o /Users/karanarora/bbht/programs/$1/subdomains/domains_$1
cat /Users/karanarora/bbht/programs/$1/domains/roots.txt | assetfinder --subs-only | tee -a /Users/karanarora/bbht/programs/$1/subdomains/domains_$1

subfinder -dL /Users/karanarora/bbht/programs/$1/domains/roots.txt  -o /Users/karanarora/bbht/programs/$1/subdomains/domains_subfinder_$1
cat domains_subfinder_$1 | tee -a /Users/karanarora/bbht/programs/$1/subdomains/domains_$1

sort -u /Users/karanarora/bbht/programs/$1/subdomains/domains_$1 -o /Users/karanarora/bbht/programs/$1/subdomains/domains_$1
cat /Users/karanarora/bbht/programs/$1/subdomains/domains_$1 | filter-resolved | tee -a /Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt

}

endpoints(){

cat /Users/karanarora/bbht/programs/$1/domains/roots.txt | waybackurls | tee -a /Users/karanarora/bbht/programs/$1/endpoints/all_endpoints.txt
cat /Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt | waybackurls | tee -a /Users/karanarora/bbht/programs/$1/endpoints/all_endpoints.txt

sort -u /Users/karanarora/bbht/programs/$1/endpoints/all_endpoints.txt -o /Users/karanarora/bbht/programs/$1/endpoints/all_endpoints.txt
cat /Users/karanarora/bbht/programs/$1/endpoints/all_endpoints.txt | filter-resolved | tee -a /Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt

}


security-misconfiguration_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/security-misconfiguration/ 
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/security-misconfiguration/ 
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/security-misconfiguration/
}

misc_all_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/misc/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/misc/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/misc/
}

default-credentials_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/default-credentials/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/default-credentials/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/default-credentials/
}

technologies_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/technologies/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/technologies/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/technologies/
}

fuzzing_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/fuzzing/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/fuzzing/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/fuzzing/
}

generic-detections_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/generic-detections/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/generic-detections/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/generic-detections/
}

panels_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/panels/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/panels/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/panels/
}

workflows_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/workflows/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/workflows/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/workflows/
}

files_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/files/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/files/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/files/
}
subdomain-takeover_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/subdomain-takeover/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/subdomain-takeover/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/subdomain-takeover/
}
dns_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/dns/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/dns/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/dns/
}
tokens_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/tokens/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/tokens/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/tokens/
}
vulnerabilities_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/vulnerabilities/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/vulnerabilities/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt" -t /Users/karanarora/bbht/tools/nuclei-templates/vulnerabilities/
}
cves_file(){
nuclei -l "/Users/karanarora/bbht/programs/$1/domains/roots.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/cves/
nuclei -l "/Users/karanarora/bbht/programs/$1/subdomains/allsubs.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/cves/
nuclei -l "/Users/karanarora/bbht/programs/$1/endpoints/allendpoints.txt"-t /Users/karanarora/bbht/tools/nuclei-templates/cves/
}


nuclei-all(){
security-misconfiguration_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_security-misconfiguration.txt"
misc_all_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_misc.txt"
default-credentials_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_default-credentials.txt"
technologies_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_technologies.txt"
fuzzing_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_fuzzing.txt"
generic-detections_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_generic-detections.txt"
panels_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_panels.txt"
workflows_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_workflows.txt"
files_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_files.txt"
subdomain-takeover_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_subdomain-takeovertxt"
dns_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_dns.txt"
tokens_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_tokens.txt"
vulnerabilities_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_vulnerabilities.txt"
cves_file $1 | tee -a "/Users/karanarora/bbht/programs/$1/nuclei-results/all_cves.txt"
}


subrecon(){
bbht $1
sub $1
endpoints $1
nuclei-all $1
}