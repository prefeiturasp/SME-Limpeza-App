import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_select/smart_select.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_text_field.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/models/dropdown_item.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/models/form_input_config.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class MyDropdownFieldWidget extends StatelessWidget {
  const MyDropdownFieldWidget({Key key, @required this.config, @required this.list, this.onChanged, this.placeholder = "", this.filter = false, this.keyDropdown}) : super(key: key);

  final FormInputConfig config;
  final List<DropdownItem> list;
  final onChanged;
  final String placeholder;
  final bool filter;
  final GlobalKey keyDropdown;

  @override
  Widget build(BuildContext context) {
    return SmartSelect<DropdownItem>.single(
      modalFilter: true,
      modalFilterAuto: true,
      choiceItems: list.map((e) => toChoice(e)).toList(),
      onChange: (item) => onTap(item.value),
      value: getSelectedItem(),
      title: "${config.label}${config.isObrigatorio() ? ' *' : ''}",
      tileBuilder: (context, S2SingleState<DropdownItem> state) => getFieldWidget(state, getSelectedItem()),
    );  
  }

  getFieldWidget(S2SingleState<DropdownItem> state, DropdownItem item) {
    config.tipoDropdown = true;
    return MyTextFieldWidget(
      config: config,
      text: item != null ? item.label : "",
      placeholder: placeholder,
      onTap: () => state.showModal()
    );
  }    

  S2Choice<DropdownItem> toChoice(DropdownItem item) {
    return S2Choice<DropdownItem>(
      title: item.label,
      value: item
    );
  }

  onTap(DropdownItem item) {
    if (item != null) {
      config.controller.text = item.id.toString();
    }
    if (onChanged != null) {
      onChanged(item != null ? item.id : null);
    }
  }

  onClear() {
    config.controller.text = null;
    onChanged();
  }

  getSelectedItem() {
    if (list.isEmpty || config.getValue().isEmpty) return null;
    
    DropdownItem item = Utils.isEmpty(config.controller.text) ? list[0] : list.firstWhere(
      (element) => element.id == int.parse(config.controller.text), 
      orElse: () => list[0]);
    return item;
  }
}