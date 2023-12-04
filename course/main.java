public Array {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Integer> arr = new ArrayList<>();

        int num;
        while ((num = sc.nextInt()) >= 0) {
            arr.add(num);
        }
        int highestNum = -1;
        for (int n : arr) {
            if (num < 100 && num > highestNum) {
                highestNum = num;
            }
        }

        if (highestNum != -1) {
            System.out.println(highestNum);
        }
    }
}