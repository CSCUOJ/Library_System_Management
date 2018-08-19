package com.sgc.data;

import com.sgc.model.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {

    Connection connection = DatabaseConnect.getConnection();
    PreparedStatement statement;
    
    public void insertBookData(Book book) throws SQLException {
        
        String bookId = book.getId();
        String bookTitle = book.getTitle();
        String bookAuthor = book.getAuthor();
        String bookMain = book.getMain();
        String bookSub = book.getSub();
        String bookPublishedYear = book.getPublishedYear();
        String bookPrintedYear = book.getPrintedYear();
        String bookIsbn = book.getIsbn();
        String bookPages = book.getPages();
        
        String insertBook = "INSERT INTO books (BookID,Title,Author,MCID,SCID,YearOfPublishing,LastPrintedYear,ISBNno,NoOfPages) VALUES (?,?,?,?,?,?,?,?,?)";
        
        statement = connection.prepareStatement(insertBook);
        statement.setString(1, bookId);
        statement.setString(2, bookTitle);
        statement.setString(3, bookAuthor);
        statement.setString(4, bookMain);
        statement.setString(5, bookSub);
        statement.setString(6, bookPublishedYear);
        statement.setString(7, bookPrintedYear);
        statement.setString(8, bookIsbn);
        statement.setString(9, bookPages);
        statement.executeUpdate();

        DatabaseConnect.disconnect();
    }

    public List<Book> searchBook(String txtSearchBook) throws SQLException {
        
        List<Book> result = new ArrayList<>();
        
        String showSQL = "SELECT * FROM books b INNER JOIN main m ON b.MCID=m.MCID "
                + "INNER JOIN sub s ON s.SCID=b.SCID "
                + "WHERE BookID LIKE ? OR Title LIKE ? OR Author LIKE ?";

        statement = connection.prepareStatement(showSQL);
        statement.setString(1, txtSearchBook + "%");
        statement.setString(2, txtSearchBook + "%");
        statement.setString(3, txtSearchBook + "%");
        ResultSet rsShow = statement.executeQuery();

        while (rsShow.next()) {
            Book book = new Book();
            book.setId(rsShow.getString("BookID"));
            book.setTitle(rsShow.getString("Title"));
            book.setAuthor(rsShow.getString("Author"));
            book.setMain(rsShow.getString("MCName"));
            book.setSub(rsShow.getString("SCName"));
            book.setPublishedYear(rsShow.getString("YearOfPublishing"));
            book.setPrintedYear(rsShow.getString("LastPrintedYear"));
            book.setIsbn(rsShow.getString("ISBNno"));
            book.setPages(rsShow.getString("NoOfPages"));
            result.add(book);
        }
        DatabaseConnect.disconnect();
        return result;
    }

    public Book populateBook(String bookId) throws SQLException {
        
        Book book = new Book();

        String showSQL = "SELECT * FROM books WHERE BookID = ?";

        statement = connection.prepareStatement(showSQL);
        statement.setString(1, bookId);
        ResultSet rsBook = statement.executeQuery();

        while (rsBook.next()) {
            book.setId(rsBook.getString("BookID"));
            book.setTitle(rsBook.getString("Title"));
            book.setAuthor(rsBook.getString("Author"));
            book.setMain(rsBook.getString("MCID"));
            book.setSub(rsBook.getString("SCID"));
            book.setPublishedYear(rsBook.getString("YearOfPublishing"));
            book.setPrintedYear(rsBook.getString("LastPrintedYear"));
            book.setIsbn(rsBook.getString("ISBNno"));
            book.setPages(rsBook.getString("NoOfPages"));
        }
        DatabaseConnect.disconnect();
        return book;
    }

    public void deleteBook(String bookId) throws SQLException {
        
        String deleteBook = "DELETE FROM books WHERE BookID = ?";

        statement = connection.prepareStatement(deleteBook);
        statement.setString(1, bookId);
        statement.executeUpdate();
        DatabaseConnect.disconnect();
    }

    public void updateBookData(Book book) throws SQLException {
        String bookId = book.getId();
        String bookTitle = book.getTitle();
        String bookAuthor = book.getAuthor();
        String bookMain = book.getMain();
        String bookSub = book.getSub();
        String bookPublishedYear = book.getPublishedYear();
        String bookPrintedYear = book.getPrintedYear();
        String bookIsbn = book.getIsbn();
        String bookPages = book.getPages();
        
        String insertBook = "UPDATE books SET Title=?,"
                + "Author=?,"
                + "MCID=?,"
                + "SCID=?,"
                + "YearOfPublishing=?,"
                + "LastPrintedYear=?,"
                + "ISBNno=?,"
                + "NoOfPages=? "
                + "WHERE BookID = ?";
        
        statement = connection.prepareStatement(insertBook);

        statement.setString(1, bookTitle);
        statement.setString(2, bookAuthor);
        statement.setString(3, bookMain);
        statement.setString(4, bookSub);
        statement.setString(5, bookPublishedYear);
        statement.setString(6, bookPrintedYear);
        statement.setString(7, bookIsbn);
        statement.setString(8, bookPages);
        statement.setString(9, bookId);
        statement.executeUpdate();

        DatabaseConnect.disconnect();
    }

    public String getBookId() throws SQLException {
        
        String bookId = null;
        String sql = "SELECT BookID FROM books ORDER BY BookID";
        statement = connection.prepareStatement(sql);
        ResultSet rsBook = statement.executeQuery();

        while (rsBook.next()) {
            bookId = rsBook.getString("BookID");
        }
        DatabaseConnect.disconnect();
        return bookId;
    }

    public int countSub(String scid) throws SQLException {
        
        String sql = "SELECT * FROM books WHERE SCID = ?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, scid);
        ResultSet rsBook = statement.executeQuery();
        int count = 0;
        while (rsBook.next()) {
            count++;
        }
        DatabaseConnect.disconnect();
        return count;
    }
}
