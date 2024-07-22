package Domain;

import java.util.ArrayList;
import java.util.List;

abstract public class DomesticAnimal extends Animal{

    public DomesticAnimal(String name, String birthDate, List<String> commands) {
        super(name, birthDate, commands);
    }
}
