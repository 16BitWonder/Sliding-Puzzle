
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * Simple program that takes a provided 240x240 png file and creates nine
 * smaller 80x80 png files from it.
 */
public final class Setup3x3 {

    /**
     * Main method.
     *
     * @param args
     *            the command line arguments; unused here
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {

        //Load original image and declare other important variables
        BufferedImage originalImg = ImageIO.read(new File("3x3.png"));
        final int width = 80;
        final int height = 80;
        final int rowsAndCols = 3;

        int counter = 1;

        for (int i = 0; i < rowsAndCols; i++) {

            for (int j = 0; j < rowsAndCols; j++) {

                BufferedImage temp = originalImg.getSubimage((j * 80), (i * 80),
                        width, height);
                File out = new File(Integer.toString(counter) + ".png");
                ImageIO.write(temp, "png", out);
                counter++;

            }
        }
    }
}
