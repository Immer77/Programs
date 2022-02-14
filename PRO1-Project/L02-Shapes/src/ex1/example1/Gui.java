package ex1.example1;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.scene.shape.*;
import javafx.stage.Stage;
import javafx.scene.text.Text;



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
        int pos = 150;
        //Opgave 2 ændrer farven på alle figurene
        Color color = Color.YELLOW;

        Polygon tag = new Polygon(10, 60, 30, 33, 90, 33);
        pane.getChildren().add(tag);
        tag.setFill(Color.GREEN);
        tag.setStroke(Color.BLACK);


        Line line = new Line(0,200, 1, 1);
        pane.getChildren().add(line);
        line.setFill(color);

        /*
        Circle circle = new Circle(pos, 70, 30);
        pane.getChildren().add(circle);
        circle.setFill(color);
        circle.setStroke(Color.BLACK);

        Rectangle hus = new Rectangle(20,60,60, 60);
        pane.getChildren().add(hus);
        hus.setFill(Color.BLUE);
        hus.setStroke(Color.BLACK);

        //Opgave 2
        Text text = new Text("Peter");
        pane.getChildren().add(text);
        text.setX(30);
        text.setY(90);
        */
        //Opgave 3
        /*
        Circle eye1 = new Circle(160, 60, 5);
        pane.getChildren().add(eye1);

        Circle eye2 = new Circle(140, 60, 5);
        pane.getChildren().add(eye2);
        */
        //Opgave 4
        /*
        Circle eye4 = new Circle(160, 60, 40);
        pane.getChildren().add(eye4);
        eye4.setFill(Color.WHITE);
        eye4.setStroke(Color.BLACK);

        Circle eye1 = new Circle(160, 60, 30);
        pane.getChildren().add(eye1);
        eye1.setFill(Color.BLACK);
        eye1.setStroke(Color.BLACK);

        Circle eye3 = new Circle(160, 60, 20);
        pane.getChildren().add(eye3);
        eye3.setFill(Color.WHITE);
        eye3.setStroke(Color.BLACK);

        Circle eye2 = new Circle(160, 60, 10);
        pane.getChildren().add(eye2);
        eye2.setFill(Color.BLACK);
        eye2.setStroke(Color.BLACK);
        */
        //Opgave 5

        Circle circle1 = new Circle(40, 160, 20);
        pane.getChildren().add(circle1);
        circle1.setStroke(Color.BLUE);
        circle1.setFill(Color.TRANSPARENT);

        Circle circle2 = new Circle(80, 160, 20);
        pane.getChildren().add(circle2);
        circle2.setStroke(Color.BLACK);
        circle2.setFill(Color.TRANSPARENT);

        Circle circle3 = new Circle(120, 160, 20);
        pane.getChildren().add(circle3);
        circle3.setStroke(Color.RED);
        circle3.setFill(Color.TRANSPARENT);

        Circle circle4 = new Circle(60, 180, 20);
        pane.getChildren().add(circle4);
        circle4.setStroke(Color.YELLOW);
        circle4.setFill(Color.TRANSPARENT);

        Circle circle5 = new Circle(100, 180, 20);
        pane.getChildren().add(circle5);
        circle5.setStroke(Color.GREEN);
        circle5.setFill(Color.TRANSPARENT);

        //Opgave 6 Manden fra notre dame

        Circle circle = new Circle(pos, 70, 30);
        pane.getChildren().add(circle);
        circle.setFill(color);
        circle.setStroke(Color.BLACK);

        Circle eye1 = new Circle(160, 60, 5);
        pane.getChildren().add(eye1);

        Circle eye2 = new Circle(140, 60, 5);
        pane.getChildren().add(eye2);

        Line line0 = new Line(150, 100, 150, 200);
        pane.getChildren().add(line0);
        line0.setFill(Color.BLACK);

        Line line1 = new Line(150, 200, 100, 300);
        pane.getChildren().add(line1);
        line1.setFill(Color.BLACK);

        Line line2 = new Line(150, 200, 200, 300);
        pane.getChildren().add(line2);
        line2.setFill(Color.BLACK);

        Line line3 = new Line(150, 150, 200, 100);
        pane.getChildren().add(line3);
        line3.setFill(Color.BLACK);

        Line line4 = new Line(150, 150, 100, 100);
        pane.getChildren().add(line4);
        line4.setFill(Color.BLACK);


    }
}
