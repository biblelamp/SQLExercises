/**
 * Java. SQLite console
 *
 * @author Sergey Iryupin
 * @version 0.1 dated Apr 9, 2016
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.sql.*;

class SQLiteConsoleGUI extends JFrame implements ActionListener {

    final String TITLE_OF_PROGRAM = "SQLite console";
    final String TITLE_BTN_ENTER = "Enter";
    final int START_LOCATION = 200;
    final int WINDOW_WIDTH = 350;
    final int WINDOW_HEIGHT = 450;

    JTextArea dialogue; // area for dialog
    JTextField command; // field for entering commands

    final String DRIVER_NAME = "org.sqlite.JDBC"; // driver for SQLite
    String nameDB; // name of SQLile database
    String nameTableDB; // name of table in SQLite database
    Connection connect = null;

    public static void main(String[] args) {
        new SQLiteConsoleGUI();
    }

    /**
     * Constructor:
     * Creating a window and all the necessary elements on it
     */
    SQLiteConsoleGUI() {
        setTitle(TITLE_OF_PROGRAM);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setBounds(START_LOCATION, START_LOCATION, WINDOW_WIDTH, WINDOW_HEIGHT);
        // area for dialog
        dialogue = new JTextArea();
        dialogue.setEditable(false);
        JScrollPane scrollBar = new JScrollPane(dialogue);
        // panel for connamd field and button
        JPanel bp = new JPanel();
        bp.setLayout(new BoxLayout(bp, BoxLayout.X_AXIS));
        command = new JTextField();
        command.addActionListener(this);
        JButton enter = new JButton(TITLE_BTN_ENTER);
        enter.addActionListener(this);
        // adding all elements to the window
        bp.add(command);
        bp.add(enter);
        add(BorderLayout.CENTER, scrollBar);
        add(BorderLayout.SOUTH, bp);
        setVisible(true);
    }

    /**
     * Listener of events from command field and enter button
     */
    @Override
    public void actionPerformed(ActionEvent event) {
        if (command.getText().trim().length() > 0) {
            dialogue.append(command.getText() + "\n");
            dialogue.append(SQLiteConsole.processCommand(command.getText(), connect) + "\n");
        }
        command.setText("");
        command.requestFocusInWindow();
    }
}