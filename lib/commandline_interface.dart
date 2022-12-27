import 'commandline_interface.dart';
export 'src/cli_widget.dart';
export 'src/cli_controller.dart';
export 'src/cli_manager.dart';


CLIWidget cliWidgetGenerator(CLIManagerBase manager){
  CLIController cliController = CLIController(initManager: manager);
  CLIWidget cliWidget = CLIWidget(cliController);
  return cliWidget;
}

