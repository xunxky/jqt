# phase3.jq --arg Destination s -arg Layouts s --arg Metadata s
# 
# Generate phase3.make from pages.json from pages.json

def comment:
    "# vim:syntax=make"
;

def use:
    if .use
    then " "+(.use | join(" "))
    else "" end
;

"__phase_3 := 1",
(.[] | (
    $Destination+"/"+.url+": "+.source+" "+$Layouts+"/"+.layout+".html"+use,
    "\t$(info ==> $@)",
    "\t@$(JQT) -mpage:"+$Metadata+"/pages/"+.id+".json -d $< "+$Layouts+"/"+.layout+".html | $(DETAILS) > $@"
    )
),
comment

# vim:ts=4:sw=4:ai:et:fileencoding=utf8:syntax=jq
