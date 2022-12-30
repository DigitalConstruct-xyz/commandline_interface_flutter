
import 'commandline_interface.dart';
export 'src/cli_widget.dart';
export 'src/cli_display_controller.dart';
import 'src/cli_textfield_controller.dart';
export 'src/cli_manager.dart';

CLIWidget cliWidgetGenerator(CLIManagerBase manager){
  CLIDisplayController cliDisplayController = CLIDisplayController(initManager: manager);
  CLITextFieldController cliTextFieldController = CLITextFieldController(initManager: manager);
  CLIWidget cliWidget = CLIWidget(cliDisplayController, cliTextFieldController);
  //set manager of textfield controller
  return cliWidget;
}

