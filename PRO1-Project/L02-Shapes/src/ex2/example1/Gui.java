package ex2.example1;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;

public class Gui extends Application {

    @Override
    public void start(Stage stage) {
        Pane root = this.initContent();
        Scene scene = new Scene(root);
        stage.setTitle("Shapes");
        stage.setScene(scene);
        stage.show();
    }

    private Pane initContent() {
        Pane pane = new Pane();
        pane.setPrefSize(400, 400);
        this.drawShapes(pane);
        return pane;
    }

    // ------------------------------------------------------------------------

    private void drawShapes(Pane pane) {
        //Opgave med at sætte positionen til 100
        int pos = 100;
        //Opgave 2 ændrer farven på alle figurene
        Color color = Color.YELLOW;

        Circle circle = new Circle(pos, 70, 30);
        pane.getChildren().add(circle);
        circle.setFill(color);
        circle.setStroke(Color.BLACK);

        Rectangle hus = new Rectangle(20,340,60, 60);
        pane.getChildren().add(hus);
        hus.setFill(color);
        hus.setStroke(Color.BLACK);

        Polygon tag = new Polygon();
        pane.getChildren().add(tag);
        tag.setFill(color);
        tag.setStroke(Color.BLACK);

        /*
        Line line = new Line(0,200, 1, 1);
        pane.getChildren().add(line);
        line.setFill(color); */

    }
}
