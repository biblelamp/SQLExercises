/**
 * Java. SQLite console GUI
 *  Note:
 *  - download latest ver of sqlite-jdbc-(VER).jar from
 *    https://bitbucket.org/xerial/sqlite-jdbc/downloads
 *  - put this jar into \jre\lib\ext
 *  - see also http://www.tutorialspoint.com/sqlite/sqlite_java.htm
 *
 * @author Sergey Iryupin
 * @version 0.3 dated Apr 15, 2016
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import java.sql.*;
import java.io.*;

class SQLiteConsoleGUI extends JFrame implements ActionListener, KeyListener {

    final String TITLE_OF_PROGRAM = "SQLite console";
    final String MENU_NAME = "File";
    final String MENU_OPEN = "Open...";
    final String MENU_EXIT = "Exit";
    final String TITLE_BTN_ENTER = "Enter";
    final String OPEN_OR_MAKE_BTN = "Open or make sqlile db";
    final String OPEN_CMD = "open ";
    final int START_LOCATION = 200;
    final int WINDOW_WIDTH = 350;
    final int WINDOW_HEIGHT = 450;

    final int KEY_UP = 38;  // key codes
    final int KEY_DOWN = 40;

    JTextArea dialogue; // area for dialog
    JTextField command; // field for entering commands
    ArrayList<String> buffercmd; // buffer for saving the list of commands
    int pointer; // pointer for the command in the list

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
        // menu: open and exit
        JMenuBar menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu(MENU_NAME);
        JMenuItem openItem = new JMenuItem(MENU_OPEN);
        openItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JFileChooser open = new JFileChooser(".");
                open.setFileSelectionMode(JFileChooser.FILES_ONLY);
                int result = open.showDialog(null, OPEN_OR_MAKE_BTN);
                if (result == JFileChooser.APPROVE_OPTION) {
                    File file = open.getSelectedFile();
                    dialogue.append(SQLiteConsole.processCommand(
                        OPEN_CMD + file.getName()) + "\n");
                }
            }
        });
        JMenuItem exitItem = new JMenuItem(MENU_EXIT);
        exitItem.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        fileMenu.add(openItem);
        fileMenu.addSeparator();
        fileMenu.add(exitItem);
        menuBar.add(fileMenu);
        setJMenuBar(menuBar); // set menu
        // area for dialog
        dialogue = new JTextArea();
        dialogue.setLineWrap(true);
        dialogue.setEditable(false);
        JScrollPane scrollBar = new JScrollPane(dialogue);
        // panel for connamd field and button
        JPanel bp = new JPanel();
        bp.setLayout(new BoxLayout(bp, BoxLayout.X_AXIS));
        command = new JTextField();
        command.addActionListener(this);
        command.addKeyListener(this);
        JButton enter = new JButton(TITLE_BTN_ENTER);
        enter.addActionListener(this);
        // adding all elements to the window
        bp.add(command);
        bp.add(enter);
        add(BorderLayout.CENTER, scrollBar);
        add(BorderLayout.SOUTH, bp);
        setVisible(true);
        // create cmd buffer
        buffercmd = new ArrayList<>();
    }

    /**
     * Listener of events from command field and enter button
     */
    @Override
    public void actionPerformed(ActionEvent event) {
        if (command.getText().trim().length() > 0) {
            dialogue.append("# " + command.getText() + "\n");
            dialogue.append(
                SQLiteConsole.processCommand(command.getText()) + "\n");
            if (!buffercmd.contains(command.getText())) {
                buffercmd.add(command.getText());
                pointer = buffercmd.size();
            }
        }
        command.setText("");
        command.requestFocusInWindow();
    }

    /**
     * Listeners of keyboard
     */
    @Override
    public void keyPressed(KeyEvent e) {
        if (e.getKeyCode() == KEY_UP || e.getKeyCode() == KEY_DOWN) {
            if (e.getKeyCode() == KEY_UP && pointer > 0)
                pointer--;
            if (e.getKeyCode() == KEY_DOWN && pointer < buffercmd.size())
                pointer++;
            command.setText((pointer < buffercmd.size())?
                buffercmd.get(pointer) : "");
        }
    }
    @Override
    public void keyReleased(KeyEvent e) { }
    @Override
    public void keyTyped(KeyEvent e) { }
}