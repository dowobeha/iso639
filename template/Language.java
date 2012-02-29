package iso639;

/**
 * Language representation as specified by ISO 639-3.
 * <p>
 * The ISO 639-3 code table may be found at <a href="http://www.sil.org/iso639-3">http://www.sil.org/iso639-3</a>.
 */
public abstract class Language {
    
    /**
     * Gets the ISO 639 identifier for this language.
     *
     * @param ISO639_Part Specifies the ISO 639 part (631-1, 631-2 Bibliographic, 631-2 Terminology, 631-3)
     */
    public abstract String identifier(ISO639_Part part);
	
    /**
     * Gets the ISO 639-3 scope of this language.
     */
    public abstract Scope scope();
	
    /**
     * Gets the ISO 639-3 type of this language.
     */
    public abstract Type type();
	
    /**
     * Gets the ISO 639-3 reference name of this language.
     */
    public abstract String referenceName();
	
    /**
     * Gets the ISO 639-3 comment regarding this language.
     */
    public abstract String comment();
	
    /**
     * Gets the ISO 639-3 reference name of this language.
     */ 
    @Override
    public abstract String toString();

    /**
     * Represents parts of the ISO 639 standard.
     */
    public enum ISO639_Part {
	Part1,
	Part2_Bibliographic,
	Part2_Terminology,
	Part3
    }

    /**
     * Represents possible scopes of a language.
     */
    public enum Scope {
	Individual,
	Macrolanguage,
	Special
    }

    /**
     * Represents possible types of a language.
     */	
    public enum Type {
	Ancient,
	Constructed,
	Extinct,
	Historical,
	Living,
	Special
    }
		
}
