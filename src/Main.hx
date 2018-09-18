package;
class Main {
    public static function main(){

        var args : Array<String> = Sys.args();
        if(args.length < 1) {
            Sys.println("Usage is ./" + Sys.programPath() + " filename");
            Sys.exit(1);
        }
        var path = args[0];
        var program = sys.io.File.getContent(path);
        var bfi = new Brainfuck(program);
        bfi.run();
    }
    static function readLine(fileName, lineNumber) : String {
    var fin = sys.io.File.read(fileName, false);
    try {
        for (i in 0...lineNumber)
            fin.readLine();
        var line = fin.readLine();
        fin.close();
        return line;
    } catch (e:haxe.io.Eof) { return null; } 
}
}
    