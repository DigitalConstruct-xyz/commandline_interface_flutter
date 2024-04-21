import '../../commandline_interface.dart';
import '../cli_textfield_controller.dart';

CLIWidget cliWidgetGenerator(CLIManagerBase manager) {
  CLIDisplayController cliDisplayController =
      CLIDisplayController(initManager: manager);
  CLITextFieldController cliTextFieldController =
      CLITextFieldController(initManager: manager);
  CLIWidget cliWidget = CLIWidget(cliDisplayController, cliTextFieldController);
  //set manager of textfield controller
  return cliWidget;
}
