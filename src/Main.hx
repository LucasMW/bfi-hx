package;
class Main {
    public static function main(){

        var args : Array<String> = Sys.args();

        if(args.length < 1) {
            Sys.println("Usage is ./" + Sys.programPath() + " filename");
            Sys.exit(1);
        }
        handleVersion(args);
        var path = args[0];
        var program = sys.io.File.getContent(path);
        var bfi = new Brainfuck(program);
        if(bfi.parse(program)) {
            bfi.run();
        } else {
            Sys.println("file is not a valid brainfuck program");
            Sys.exit(4);
        }
    }
    public static function handleVersion(args : Array<String>){
        if(args[0] == "--version" || args[0] == "-v"){
            Sys.println(Version.getGitTagVersion());
            Sys.println("commit hash: " + Version.getGitCommitHash());
            Sys.exit(0);
        }

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
    