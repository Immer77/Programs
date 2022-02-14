import javax.swing.*;

public class E1_16_DialogViewer {
    public static void main(String[] args) {
        String name = JOptionPane.showInputDialog("My name is Hal! What would you like me to do?");
        JOptionPane.showMessageDialog(null, "I'm Sorry, Peter, I can't do that");
    }
}
