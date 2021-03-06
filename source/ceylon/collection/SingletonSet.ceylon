"A [[Set]] with exactly one [[element]]."
see (`class SingletonMap`,
     `class Singleton`)
shared class SingletonSet<Element>(shared Element element)
        satisfies Set<Element>
        given Element satisfies Object {
    
    clone() => this;
    
    contains(Object element) => this.element == element;
    
    shared actual Set<Element> complement<Other>(Set<Other> set)
            given Other satisfies Object 
            => element in set then emptySet else this;
    
    shared actual Set<Element&Other> intersection<Other>(Set<Other> set)
            given Other satisfies Object {
        if (is Other element, element in set) {
            return SingletonSet(element);
        }
        else {
            return emptySet;
        }
    }
    
    shared actual Set<Element|Other> union<Other>(Set<Other> set)
            given Other satisfies Object {
        value result = HashSet<Element|Other>();
        result.addAll(set);
        result.add(element);
        return UnmodifiableSet(result);
    }
    
    shared actual Set<Element|Other> exclusiveUnion<Other>(Set<Other> set)
            given Other satisfies Object {
        value result = HashSet<Element|Other>();
        result.addAll(set);
        if (element in set) {
            result.remove(element);
        }
        else {
            result.add(element);
        }
        return UnmodifiableSet(result);
    }
    
    iterator() => Singleton(element).iterator();
    
    equals(Object that)
            => (super of Set<Element>).equals(that);
    
    hash => (super of Set<Element>).hash;
    
}