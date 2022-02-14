import java.net.URL;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
public class E1_18_DialogViewer
{
    public static void main(String[] args) throws Exception
    {
        URL imageLocation = new URL(
                "http://horstmann.com/java4everyone/duke.gif");
        JOptionPane.showMessageDialog(null, "Guten tag heute leute", "Greeting",
                JOptionPane.PLAIN_MESSAGE, new ImageIcon(imageLocation));
    }
}