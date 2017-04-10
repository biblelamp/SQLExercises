/**
 * Java. SQLite console
 *
 * @author Sergey Iryupin
 * @version 0.1 dated Apr 10, 2016
 */
import java.util.*;
import java.sql.*;

class SQLiteConsole {

    static final String HELP_CMD = "help";
    static final String OPEN_CMD = "open";
    static final String OPENED_SUCCESS = " is opened successfully.";
    static final String CREATE_TABLE_CMD = "create table";
    static final String CREATED_SUCCESS = " table is created successfully.";
    static final String DROP_TABLE_CMD = "drop table";
    static final String DELETED_SUCCESS = " table is deleted successfully.";
    static final String LIST_OF_TABLES_CMD = "tables";
    static final String SELECT_CMD = "select";
    static final String INSERT_CMD = "insert into";
    static final String UPDATE_CMD = "update";
    static final String DELETE_CMD = "delete from";
    static final String WORKED_SUCCESS = "The command have worked successfully.";
    static final String UNKNOWN_CMD = "unknown command, use help command";
    static final String HELP_TEXT = 
        "Use the following commands:\n" +
        " open <db_file_name>\n" +
        " create <table_name> (name type, name1 type1, ...)\n" +
        " drop <table_name>\n" +
        " tables\n" +
        " insert into <table_name> (list_of_fields) values (list_of_values)" +
        " select <list_of_fields> from <table_name>";

    static final String DRIVER_NAME = "org.sqlite.JDBC"; // driver for SQLite
    static final String PART_OF_URL = "jdbc:sqlite:"; // part of url to sqlite
    static String nameDatabase; // name of SQLile database
    static String nameTableDatabase; // name of table in SQLite database
    static Connection connect = null; // link to interface connection

    /**
     * Method processCommand: recognition of the entered command
     * @param cmd — string with command
     * @return    — result of command execution
     */
    static String processCommand(String cmd) {
        // get help
        if (cmd.startsWith(HELP_CMD))
            return HELP_TEXT;
        // open db
        if (cmd.startsWith(OPEN_CMD))
            return openDatabase(cmd);
        // create table
        if (cmd.startsWith(CREATE_TABLE_CMD))
            return createTable(cmd);
        // drop table
        if (cmd.startsWith(DROP_TABLE_CMD))
            return dropTable(cmd);
        // list of tables
        if (cmd.startsWith(LIST_OF_TABLES_CMD))
            return showTableNames(cmd);
        // select
        if (cmd.startsWith(SELECT_CMD))
            return selectFromTable(cmd);
        // insert into | update | delete from
        if (cmd.startsWith(INSERT_CMD) ||
            cmd.startsWith(UPDATE_CMD) ||
            cmd.startsWith(DELETE_CMD))
            return executeUpdate(cmd);
        return UNKNOWN_CMD;
    }

    /**
     * Method openDatabase: creating or open sqlite database
     */
    static String openDatabase(String cmd) {
        String[] cmdByWords = cmd.split(" ");
        try {
            nameDatabase = cmdByWords[1];
            Class.forName(DRIVER_NAME);
            connect = DriverManager.getConnection(PART_OF_URL + nameDatabase);
        } catch (Exception ex) {
            return ex.toString();
        }
        return nameDatabase + OPENED_SUCCESS;
    }

    /**
     * Method createTable: creating new table in db
     */
    static String createTable(String cmd) {
        String[] cmdByWords = cmd.split(" ");
        try {
            nameTableDatabase = cmdByWords[2];
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(cmd);
            stmt.close();
        } catch (Exception ex) {
            return ex.toString();
        }
        return nameTableDatabase + CREATED_SUCCESS;
    }

    /**
     * Method dropTable: deleting a table in db
     */
    static String dropTable(String cmd) {
        String[] cmdByWords = cmd.split(" ");
        try {
            nameTableDatabase = cmdByWords[2];
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(cmd);
            stmt.close();
        } catch (Exception ex) {
            return ex.toString();
        }
        return nameTableDatabase + DELETED_SUCCESS;
    }

    /**
     * Method showTableNames: to show table names
     */
    static String showTableNames(String cmd) {
        List<String> tblNames = new ArrayList<>();
        try {
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT * FROM sqlite_master where type='table'" );
            while (rs.next())
                tblNames.add(rs.getString("name"));
            rs.close();
            stmt.close();
        } catch (Exception ex) {
            return ex.toString();
        }
        return tblNames.toString();
    }

    /**
     * Method selectFromTable: select fields from table
     */
    static String selectFromTable(String cmd) {
        String result = "";
        try {
            Statement stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery(cmd);
            ResultSetMetaData rsmd = rs.getMetaData();
            for (int i = 1; i <= rsmd.getColumnCount(); i++)
                result += rsmd.getColumnName(i) + "\t";
            result += "\n";
            while (rs.next()) {
                for (int i = 1; i <= rsmd.getColumnCount(); i++)
                    result += rs.getString(rsmd.getColumnName(i)) + "\t";
                result += "\n";
            }
            rs.close();
            stmt.close();
        } catch (Exception ex) {
            return ex.toString();
        }
        return result;
    }

    /**
     * Method executeUpdate: insert, update, delete record(s) from table
     */
    static String executeUpdate(String cmd) {
        try {
            Statement stmt = connect.createStatement();
            stmt.executeUpdate(cmd);
            stmt.close();
        } catch (Exception ex) {
            return ex.toString();
        }
        return WORKED_SUCCESS;
    }
}