@message = private constant [21 x i8] c"echo 'Hello, world!'\00"
@format = private constant [10 x i8] c"%255[^\n]\00"

declare i32 @system(i8*)
declare i32 @scanf(i8*, ...)

define i32 @main() {
  entry:
    %buffer = alloca [256 x i8]
    %format_ptr = getelementptr inbounds [10 x i8], [10 x i8]* @format, i32 0, i32 0
    %buffer_ptr = getelementptr inbounds [256 x i8], [256 x i8]* %buffer, i32 0, i32 0
    %read = call i32 (i8*, ...) @scanf(i8* %format_ptr, i8* %buffer_ptr)
    
    call i32 @system(i8* @message)

    ret i32 0
}