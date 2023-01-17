#

### Input History
In ManagerBase
- Add input to _inputHistory
- Record input
- instance methods: _inputHistory, _recordInput

```dart
String getInputHistoryByID(int id){
  return "input history of id";
}
int getLastInputHistoryID(){
  return 0;//return^
}
```


[//]: # (```)

### Text Field Sink

```dart
void sinkTextFieldCompletion(String tex) {
  //sink text to text field
}
```

- refactor sinkTextField to addToTextField

manager&display controller
functions get&set content
manager 
new functions: 
    onChanged,
    set content, get content,
refactor:
    add to screen, add to text field

onchange stream


# new input text field
- gray trailing sugestions
- generator 3 streams
  - 1. text field content
  1. onchanged
  2. submit
  --
  3. autofill <- inward, create, listen, pass to external to get
     add to the last part of text with gray color
    prevent cursor misplacement


### keyboard type: text input type stream

### suggester textfield
### suggestion stream

input text field stream keyboard type - test
focusnode
set scroll position stream: scrollPositionedController
gesture detector stream
