import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/log_header/components.dart' as components;
import 'package:abnormal_autonomous_web/view/detail/sessions/informations/sessions/log_header/styles/session_styles.dart' as styles;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;

class LogHeaderSession extends StatelessWidget {
    const LogHeaderSession({super.key});

    @override
    Widget build(BuildContext context) {
        final view_model = Provider.of<vm.ItemDetailLogHeaderViewModel>(context);

        if (view_model.is_loading == true) return common_widgets.LoadingWidget();
        if (view_model.error != null) return Center(child: Text(view_model.error!, style: const TextStyle(color: Colors.red),));
    
        return Container(
            color: styles.LogHeaderSessionStyle.backgroundColor,

            child:Padding(
                padding: styles.LogHeaderSessionStyle.padding,


                child: Column(
                    children: [
                        
                        components.RowComponent(
                            name: 'Record Date:',
                            value: view_model.record_date ?? '',
                        ),
                        
                        components.RowComponent(
                            name: 'Duration:',
                            value: view_model.duration ?? '',
                        ),

                        components.RowComponent(
                            name: 'Topic List',
                            value: '',
                            border: false,
                        ),
                        
                        
                        components.TopicTableComponent(
                            header: components.TopicTableHeaderComponent(),
                            children: [
                                for (var topic in view_model.topic_list ?? [])
                                    components.TopicRowComponent(
                                        topic_name: topic['topic_name'],
                                        topic_type: topic['topic_type'],
                                    ),
                            ],
                        ),

                    ],
                )
            )
        );
    }
}