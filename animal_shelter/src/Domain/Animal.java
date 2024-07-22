package Domain;

import java.util.ArrayList;
import java.util.List;

abstract public class Animal {
    private String name;
    private String birthDate;
    private List<String> commands;

    public Animal(String name, String birthDate, List<String> commands) {
        this.name = name;
        this.birthDate = birthDate;
        this.commands = new ArrayList<>(commands);;
    }

    public List<String> getCommands() {
        return commands;
    }

    public String getName() {
        return name;
    }
    public void addCommand(String command) {
        commands.add(command);
    }

}
