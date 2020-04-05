public class NumBackwards {

                public static void main(String[] args) {

                                for (int i = 100; i > 0; i--) {                                              
                                                if (i%5==0) {
                                                                if (i%3==0) {
                                                                                System.out.println("Testing");
                                                                } else {
                                                                                System.out.println("Agile");
                                                                }
                                                } else if (i%3==0) {
                                                                if (i%5==0) {
                                                                                System.out.println("Testing");
                                                                } else {
                                                                                System.out.println("Software");
                                                                }
                                                } else {
                                                                System.out.println(i);
                                                }
                                }
                }
}
