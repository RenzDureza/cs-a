import java.io.*;
import java.util.*;

// --- Base Class: Reservation ---
class Reservation {
    protected String passengerName;

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public static boolean confirmAction(String message) {
        Scanner scanner = new Scanner(System.in);
        System.out.print(message + " (yes/no): ");
        String response = scanner.nextLine();
        return response.equalsIgnoreCase("yes");
    }
}

// --- Child Class: Flights ---
class Flights extends Reservation {
    private String flightCode;
    private String departureTime;
    private String arrivalTime;
    private String destination;
    private double ticketPrice;
    private char[][] seatMap;

    public Flights(String flightCode, String departureTime, String arrivalTime, String destination, double ticketPrice, int rows, int cols) {
        this.flightCode = flightCode;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.destination = destination;
        this.ticketPrice = ticketPrice;
        this.seatMap = new char[rows][cols];

        // Initialize seats to 'O' for available
        for (char[] row : seatMap) {
            Arrays.fill(row, 'O');
        }
    }

    public void displayFlightDetails() {
        System.out.println("Flight Code: " + flightCode);
        System.out.println("Departure: " + departureTime);
        System.out.println("Arrival: " + arrivalTime);
        System.out.println("Destination: " + destination);
        System.out.println("Ticket Price: $" + ticketPrice);
    }

    public void displaySeatMap() {
        System.out.println("Seat Map:");
        for (int i = 0; i < seatMap.length; i++) {
            for (int j = 0; j < seatMap[i].length; j++) {
                System.out.print(seatMap[i][j] + " ");
            }
            System.out.println();
        }
    }

    public boolean reserveSeat(int row, int col) {
        if (row >= 0 && row < seatMap.length && col >= 0 && col < seatMap[0].length) {
            if (seatMap[row][col] == 'O') {
                seatMap[row][col] = 'X';
                return true;
            } else {
                System.out.println("Seat already booked.");
            }
        } else {
            System.out.println("Invalid seat selection.");
        }
        return false;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public String getFlightCode() {
        return flightCode;
    }

    public String getDestination() {
        return destination;
    }
}

// --- Child Class: Tickets ---
class Tickets extends Reservation {
    private String flightCode;
    private int row;
    private int col;
    private double price;

    public Tickets(String passengerName, String flightCode, int row, int col, double price) {
        this.passengerName = passengerName;
        this.flightCode = flightCode;
        this.row = row;
        this.col = col;
        this.price = price;
    }

    public void generateTicket() {
        String fileName = "Ticket_" + passengerName + "_" + flightCode + ".txt";
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            writer.write("----- Airline Ticket -----\n");
            writer.write("Passenger Name: " + passengerName + "\n");
            writer.write("Flight Code: " + flightCode + "\n");
            writer.write("Seat: Row " + row + ", Column " + col + "\n");
            writer.write("Price: $" + price + "\n");
            writer.write("--------------------------\n");
            System.out.println("Ticket has been generated: " + fileName);
        } catch (IOException e) {
            System.out.println("Error generating ticket: " + e.getMessage());
        }
    }
}

// --- Main Class ---
public class Main {
    public static void main(String[] args) {
        List<Flights> flightList = new ArrayList<>();
        flightList.add(new Flights("FL123", "08:00", "12:00", "Tokyo", 500, 5, 4));
        flightList.add(new Flights("FL456", "09:30", "13:30", "Seoul", 400, 6, 4));
        flightList.add(new Flights("FL789", "10:15", "14:15", "Singapore", 350, 5, 4));

        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        while (running) {
            System.out.println("\n--- Airline Reservation System ---");
            System.out.println("1. View All Flights");
            System.out.println("2. Search Flights by Destination");
            System.out.println("3. Make a Reservation");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline

            switch (choice) {
                case 1:
                    for (Flights flight : flightList) {
                        flight.displayFlightDetails();
                        System.out.println();
                    }
                    break;

                case 2:
                    System.out.print("Enter destination: ");
                    String destination = scanner.nextLine();
                    boolean found = false;
                    for (Flights flight : flightList) {
                        if (flight.getDestination().equalsIgnoreCase(destination)) {
                            flight.displayFlightDetails();
                            System.out.println();
                            found = true;
                        }
                    }
                    if (!found) {
                        System.out.println("No flights found for destination: " + destination);
                    }
                    break;

                case 3:
                    System.out.print("Enter flight code: ");
                    String flightCode = scanner.nextLine();
                    Flights selectedFlight = null;
                    for (Flights flight : flightList) {
                        if (flight.getFlightCode().equalsIgnoreCase(flightCode)) {
                            selectedFlight = flight;
                            break;
                        }
                    }
                    if (selectedFlight != null) {
                        selectedFlight.displaySeatMap();
                        System.out.print("Enter row: ");
                        int row = scanner.nextInt();
                        System.out.print("Enter column: ");
                        int col = scanner.nextInt();
                        scanner.nextLine(); // Consume newline

                        if (selectedFlight.reserveSeat(row, col)) {
                            System.out.print("Enter passenger name: ");
                            String passengerName = scanner.nextLine();

                            double price = selectedFlight.getTicketPrice();
                            if (Reservation.confirmAction("Are you eligible for a discount?")) {
                                price *= 0.9; // Apply a 10% discount
                            }

                            Tickets ticket = new Tickets(passengerName, flightCode, row, col, price);
                            ticket.generateTicket();
                        }
                    } else {
                        System.out.println("Flight not found.");
                    }
                    break;

                case 4:
                    if (Reservation.confirmAction("Are you sure you want to exit?")) {
                        System.out.println("Exiting the system. Thank you!");
                        running = false;
                    }
                    break;

                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }

        scanner.close();
    }
}
