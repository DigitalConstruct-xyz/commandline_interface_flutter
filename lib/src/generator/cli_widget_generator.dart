import '../../commandline_interface.dart';
import '../cli_textfield_controller.dart';

CLIWidget cliWidgetGenerator(CLIManagerBase manager) {
  //set manager functions
  CLIDisplayController cliDisplayController = CLIDisplayController(initManager: manager);
  CLITextFieldController cliTextFieldController = CLITextFieldController(initManager: manager);

  CLIWidget cliWidget = CLIWidget(cliDisplayController, cliTextFieldController, cliDisplayController.scrollController);
  //set manager of textfield controller
  return cliWidget;
}
