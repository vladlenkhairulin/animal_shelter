package Service;

import Control.Counter;
import Domain.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AnimalJournal {
    private List<Animal> animals;
    private Scanner scanner;
    private Counter counter;

    public AnimalJournal() {
        animals = new ArrayList<>();
        scanner = new Scanner(System.in);
        this.counter = new Counter();
    }

    /**
     * метод для добавления нового животного в реестр,используется в блоке try-with-resources
     */
    public void addAnimal() {
        System.out.println("Введите тип животного (Cat, Dog, Hamster, Camel, Donkey, Horse): ");
        String type = scanner.nextLine();
        System.out.println("Введите имя животного: ");
        String name = scanner.nextLine();
        System.out.println("Введите дату рождения животного(YYYY-MM-DD): ");
        String birthDate = scanner.nextLine();
        List<String> commands = new ArrayList<>();
        System.out.println("Введите команды, которые умеет выполнять животное (после записи последней команды введите 'стоп'): ");
        while (true) {
            String command = scanner.nextLine();
            if (command.equalsIgnoreCase("стоп")) {
                break;
            }
            commands.add(command);
        }

        if (!type.isEmpty() && !name.isEmpty() && !birthDate.isEmpty() && !commands.isEmpty()) {
            Animal animal = null;
            switch (type.toLowerCase()) {
                case "dog":
                    animal = new Dog(name, birthDate, commands);
                    break;
                case "cat":
                    animal = new Cat(name, birthDate, commands);
                    break;
                case "hamster":
                    animal = new Hamster(name, birthDate, commands);
                    break;
                case "horse":
                    animal = new Horse(name, birthDate, commands);
                    break;
                case "donkey":
                    animal = new Donkey(name, birthDate, commands);
                    break;
                case "camel":
                    animal = new Camel(name, birthDate, commands);
                    break;
                default:
                    System.out.println("Таких животных нет в нашем реестре.");
                    return;
            }

            animals.add(animal);
            // Увеличиваем счетчик при добавлении животного
            try (Counter resource = counter) {
                resource.add();
                System.out.println("Животное добавлено в реестр. Счетчик: " + resource.getCount());
            } catch (Exception e) {
                System.out.println("Ошибка: " + e.getMessage());
            }
        } else {
            System.out.println("Заполните все данные о животном.");
        }
    }


    /**
     * @param name имя животного
     *             Метод для просмотра списка всех команд животного
     */
    public void viewAnimalCommands(String name) {
        for (Animal animal : animals) {
            if (animal.getName().equalsIgnoreCase(name)) {
                System.out.println("Команды для " + name + ": " + animal.getCommands());
                return;
            }
        }
        System.out.println("Животное с именем " + name + " не найдено.");
    }

    /**
     * @param name имя животного
     * @param command новая команда для изучения
     *                Метод для обучения новым командам
     */
    public void trainAnimal(String name, String command) {
        for (Animal animal : animals) {
            if (animal.getName().equalsIgnoreCase(name)) {
                animal.addCommand(command);
                System.out.println("Команда \"" + command + "\" добавлена для " + name + ".");
                return;
            }
        }
        System.out.println("Животное с именем " + name + " не найдено.");
    }

    public void menu() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Выберите действие: ");
            System.out.println("1. Завести новое животное");
            System.out.println("2. Посмотреть список команд животного");
            System.out.println("3. Обучить животное новой команде");
            System.out.println("4. Выход");


            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    addAnimal();
                    break;

                case 2:
                    System.out.print("Введите имя животного: ");
                    String name = scanner.nextLine();
                    viewAnimalCommands(name);
                    break;

                case 3:
                    System.out.print("Введите имя животного: ");
                    name = scanner.nextLine();
                    System.out.print("Введите команду для изучения: ");
                    String command = scanner.nextLine();
                    trainAnimal(name, command);
                    break;

                case 4:
                    System.out.println("До свидания.");
                    return;

                default:
                    System.out.println("Неизвестная команда");
            }
        }
    }
}

