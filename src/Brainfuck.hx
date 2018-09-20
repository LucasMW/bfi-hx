package;

//import kha.System;

class Brainfuck {
	var mem : Array<Int>;
	var mem_idx : Int;
	var program : String;
	var p_idx : Int;
	var loopStack : Array<Int>;
	var loop_idx : Int;
	var output : String;
	var input : String;
	var inputFromExclamation : Bool;
	public function new(program : String) {
		mem = new Array<Int>();
		this.program = program;
		mem_idx = 0;
		initMem();
		loopStack = new Array<Int>();
		output = "";
	}
	public function parse(program : String) : Bool {
		var balance = 0;
		for(i in 0...program.length){
			var c = program.charAt(i);
			switch (c) {
				case '[': balance++;
				case ']': balance--;
				default: if(balance < 0) return false; 
						//this should never happen in a valid bf file
			}
		}
		return balance == 0;
	}
	function cleanProgramFromInput(program : String) : String{
		var splited = program.split("!");
		return splited[0];
	}
	function getInputFromExclamation(program : String) : String{
		var idx = program.indexOf("!"); //first exclamation
		if(idx < 0) { return ""; }
		var input = program.substr(idx+1); //idx is exactly '!'
		return input;
	}
	function initMem() : Void {
		while(mem.length != 0){
			mem.pop();
		}
		for (i in 0...30000) {
			mem.push(0);
		}
	}
	function left(){
		mem_idx--;
		if(mem_idx<0){
			Sys.println("Error: Access violation! There is no cell " + mem_idx);
			Sys.exit(2);
		}
	}
	function right() {
		mem_idx++;
		if(mem_idx>=30000){
			Sys.println("Error: Access violation! There is no cell " + mem_idx);
			Sys.exit(3);
		}
	}
	function plus(){
		mem[mem_idx]++;
		if(mem[mem_idx]>255){
			mem[mem_idx]=0;
		}
	}
	function minus() {
		mem[mem_idx]--;
		if(mem[mem_idx]<0){
			mem[mem_idx]=255;
		}
	}
	//Still doesn't work
	function comma() {
		//mem[mem_idx] = Sys.getChar(true);
		if(input.length <= 0){
			var stdin  = Sys.stdin();
    		try{
    			var line : String = stdin.readLine();
    			this.input = line;
    			mem[mem_idx] = this.input.charCodeAt(0);
				this.input = this.input.substr(1);
    		}
    		catch(e: Dynamic){ 
    			trace(e);
    			this.input = ""; 
    			mem[mem_idx] = 0;
    			return;
    		}
    		
		} else {
			mem[mem_idx] = this.input.charCodeAt(0);
			this.input = this.input.substr(1);
		}
		//trace(mem[mem_idx]);
	}
	function dot() {
		//trace(mem[mem_idx]);
		var c = String.fromCharCode(mem[mem_idx]);
		output += c;
		Sys.print(c);
	}
	function open() {
		if(mem[mem_idx] == 0) {
			skipWhile();
		} else {
			loopStack.push(p_idx);
		}
	}
	function close() {
		if(mem[mem_idx] == 0){
			loopStack.pop();
		} else {
			loop_idx = loopStack[loopStack.length-1];
			p_idx = loop_idx;
		}
		
	}
	function skipWhile() {
		p_idx++;
		var internalLoopCount = 0;
		// while not match stop requirements
		while(!(program.charAt(p_idx) == ']' && internalLoopCount == 0)) {
			if(program.charAt(p_idx)== '['){
				internalLoopCount++;
			}
			else if(program.charAt(p_idx) == ']'){
				internalLoopCount--;
			}
			p_idx++;
		}
	}
	public function run(){
		while(p_idx < program.length) {
			var cmd = program.charAt(p_idx);
			switch cmd {
				case '>': right(); //trace("right");
    			case '<': left(); //trace("left");
				case '+': plus(); //trace("plus");
    			case '-': minus(); //trace("minus");
				case ',': comma(); //trace("comma");
    			case '.': dot(); //trace("dot");
				case '[': open(); //trace("open");
    			case ']': close(); //trace("close");
    			default: //trace(cmd);
			}
			//trace(cmd);
			p_idx++;
		}
		//trace(output);
	}
}