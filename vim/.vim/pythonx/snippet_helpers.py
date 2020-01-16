# Converts string "foo_bar" to "FooBar"
def get_pascal( name ):
    try:
        return "".join([token[0].upper() + token[1:] for token in name.lower().split("_")])
    except:
        return "ERR"
    
