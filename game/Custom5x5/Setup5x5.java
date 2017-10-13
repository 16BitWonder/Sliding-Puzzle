
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * Simple program that takes a provided 240x240 png file and creates nine
 * smaller 48x48 png files from it.
 */
public final class Setup5x5 {

    /**
     * Main method.
     *
     * @param args
     *            the command line arguments; unused here
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {

        //Load original image and declare other important variables
        BufferedImage originalImg = ImageIO.read(new File("5x5.png"));
        final int width = 48;
        final int height = 48;
        final int rowsAndCols = 5;

        int counter = 1;

        for (int i = 0; i < rowsAndCols; i++) {

            for (int j = 0; j < rowsAndCols; j++) {

                BufferedImage temp = originalImg.getSubimage((j * 48), (i * 48),
                        width, height);
                File out = new File(Integer.toString(counter) + ".png");
                ImageIO.write(temp, "png", out);
                counter++;

            }
        }
    }
}
