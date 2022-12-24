
## Features
A CommandLine Interface widget that takes in a class CLIInterpreter Object.

## Getting started
// CLIInterpreter > CLIBehaviorSubject > CommandLineInterface
Make ^ a CLIInterpreter object and pass it to the CLIBehaviorSubject constructor.
Then pass the CLIBehaviorSubject object to the CommandLineInterface constructor.



## Usage
CLIInterpreter > CLIController > CLIInterface
```
class ExampleInterpreter extends CLIInterpreter {
  ExampleInterpreter();
  @override
  //this function is called on textField Submission
  void execute(String command) {
    //adding widget to the screen
    sink(
      Container(child: Text('\$input: $command', style: TextStyle(color: Colors.greenAccent),))
    );
    sink(
      Container(child: Text('output >>  $command'))
    );
  }
}
final CLIInterpreter exampleInterpreter = ExampleInterpreter();
final CLIController cliBehaviorSubject = CLIController(
  init_interpreter: exampleInterpreter,
);
final CLIInterface commandLineInterface = CLIInterface(cliBehaviorSubject);
```

## Additional information

## License
    MIT