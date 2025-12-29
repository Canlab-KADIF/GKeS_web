import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:abnormal_autonomous_web/viewmodel/_viewmodel.dart' as vm;
import 'package:abnormal_autonomous_web/view/detail/sessions/download/components.dart' as components;
import 'package:abnormal_autonomous_web/view/common/widgets.dart' as common_widgets;
import 'package:abnormal_autonomous_web/view/detail/sessions/download/styles/session_styles.dart' as styles;

void DownloadDialogSession(BuildContext context, String? id) {
	// listen: false로 ViewModel 접근 후 함수 실행
	final viewModel = Provider.of<vm.DownloadViewModel>(context, listen: false);
	viewModel.getDownloadList(id ?? '');

	showDialog(
		context: context,
		builder: (context) => AlertDialog(
            backgroundColor: styles.DownloadSessionStyle.backgroundColor,
            titleTextStyle: styles.DownloadSessionStyle.textStyle,
            
			title: const Text('다운로드'),

			content: Consumer<vm.DownloadViewModel>(
				builder: (context, view_model, child) {

					if (view_model.isLoading) {
						return components.LoadingComponent.build(context);
					}

					if (view_model.error != null) {
						return components.ErrorComponent.build(context, view_model.error!);
					}

					return SizedBox(
                        height: 400,
                        width: 400,
                        child: SingleChildScrollView(
                            child: Column(
                                children: [
                                    for (var path in view_model.downloadPaths)
                                        Row(
                                            children: [
                                                Text(path['name'] ?? '', style: styles.ContentStyle.textStyle),
                                                Spacer(),
                                                TextButton(
                                                    style: styles.ContentStyle.textButtonTextStyle,

                                                    onPressed: () {
                                                        final url = path['path'];
                                                        if (url != null) {
                                                            final anchor = html.AnchorElement(href: url);
                                                            anchor.target = '_black';
                                                            anchor.download = path['name'] ?? '';
                                                            anchor.click();
                                                        } else {
                                                            print('url is null');
                                                        }
                                                    },
                                                    child: Text('다운로드', style: styles.ContentStyle.buttonTextStyle),
                                                ),
                                            ],
                                        ),
                                    SizedBox(height: 20),
                                    TextButton(
                                        style: styles.ContentStyle.textButtonTextStyle,

                                        child: Text('전체 다운로드', style: styles.ContentStyle.buttonTextStyle),
                                        onPressed: () async {
                                            for (var path in view_model.downloadPaths) {
                                                final url = path['path'];
                                                final name = path['name'];
                                                if (url != null && name != null) {
                                                final anchor = html.AnchorElement(href: url)
                                                    ..target = '_blank'
                                                    ..download = name;

                                                // DOM에 추가하고 클릭한 뒤 제거 (브라우저 안정성 ↑)
                                                html.document.body!.append(anchor);
                                                anchor.click();
                                                anchor.remove();

                                                print('download $name');

                                                // 👉 각 클릭 사이에 짧은 지연 (브라우저가 다중 다운로드 허용하게 하기 위함)
                                                await Future.delayed(const Duration(milliseconds: 300));
                                                } else {
                                                    print('url is null');
                                                }
                                            }
                                        },
                                    ),
                                    TextButton(
                                        style: styles.ContentStyle.textButtonTextStyle,

                                        child: Text('패키지 다운로드', style: styles.ContentStyle.buttonTextStyle),
                                        onPressed: () {
                                            viewModel.packageDownload(id ?? '');
                                        },
                                    ),
                                ],
                            )
                        )
                    );
				},
			),
			actions: [
				TextButton(
                    style: styles.ContentStyle.textButtonTextStyle,
                    
					onPressed: () => Navigator.of(context).pop(),
					child: Text('닫기', style: styles.ContentStyle.textStyle),
				),
			],
		),
	);
}
