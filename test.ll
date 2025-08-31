@message = private constant [20 x i8] c"echo 'Hello, world!'"

declare i32 @system(i8*)

define i32 @main() {
  %message = getelementptr inbounds [14 x i8], [14 x i8]* @message, i32 0, i32 0
  call i32 @system(i8* %message)
  ret i32 0
}