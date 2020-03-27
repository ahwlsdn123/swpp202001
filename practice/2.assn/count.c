unsigned count_even(unsigned* arr, unsigned N) {
	unsigned t = 0;
	for (int i = 0; i < N; i++) {
		if (arr[i] % 2 == 0) {
			t++;
		}
	}
	return t;
}
