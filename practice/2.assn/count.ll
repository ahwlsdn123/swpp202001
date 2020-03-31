define i32 @count_even(i32* %arr, i32 %N) {
entry:
	%retval = alloca i32, align 4
	%i = alloca i32, align 4
	store i32 0, i32* %retval, align 4
	store i32 0, i32* %i, align 4
	br label %for.cond

for.cond:
	%0 = load i32, i32* %i, align 4
	%cmp = icmp ult i32 %0, %N
	br i1 %cmp, label %for.body, label %for.end

for.body:
	%1 = load i32, i32* %i, align 4
	%2 = sext i32 %1 to i64
	%3 = getelementptr inbounds i32, i32* %arr, i64 %2
	%4 = load i32, i32* %3, align 4
	%5 = urem i32 %4, 2
	%6 = icmp eq i32 %5, 0
	br i1 %6, label %if.if, label %for.inc

if.if:
	%7 = load i32, i32* %retval, align 4
	%8 = add i32 %7, 1
	store i32 %8, i32* %retval, align 4
	br label %for.inc

for.inc:
	%9 = load i32, i32* %i, align 4
	%10 = add nsw i32 %9, 1
	store i32 %10, i32* %i, align 4
	br label %for.cond

for.end:
	%11 = load i32, i32* %retval, align 4
	ret i32 %11
}
