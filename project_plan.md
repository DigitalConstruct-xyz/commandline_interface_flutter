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

### fork and make hydrated
