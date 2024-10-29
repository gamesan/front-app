// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class My extends StatefulWidget {
  final String title;

  const My({Key? key, this.title = '我的'}) : super(key: key);

  @override
  State<My> createState() => _MidState();
}

class _MidState extends State<My> {
  Widget _grapLineWidget({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, top, right, bottom),
      color: Colors.grey[300],
      height: 16,
    );
  }

  Widget _horizontalLine() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 0.5,
      color: Colors.black26,
    );
  }

  Widget _gradItem(String title, String url, {Function? callback}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                '新的好友',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.8,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (callback != null) {
            callback();
          }
        },
      ),
    );
  }

  Widget _lineFollow(String url, String title,
      {String? litTitle, Function? callback}) {
    return InkWell(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    width: 40,
                    height: 40,
                    child: Image.network(
                      url,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  litTitle != null
                      ? Text(
                          litTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardItem(String title, String intro, String url,
      {Function? callback}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black38,
              height: 2,
            ),
          ),
          Text(
            intro,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              height: 2,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
          InkWell(
            onTap: () {
              if (callback != null) {
                callback();
              }
            },
            child: const Center(
              child: Text(
                '立即参与',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlue,
                  height: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Flex(
          direction: Axis.horizontal,
          children: [
            InkWell(
              child: Container(
                width: 80,
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: const Text(
                  '添加好友',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              onTap: () {
                Utils.showToast('点击了添加好友');
              },
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('我的'),
              ),
            ),
            Container(
              width: 80,
              alignment: Alignment
                  .centerRight, // 文字内容的对齐方式 center居中，centerLeft居中左侧 centerRight居中右侧
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                child: const Text(
                  '设置',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Utils.showToast('点击了设置');
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // 流式布局
        child: Wrap(
          children: [
            _grapLineWidget(),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Flex(
                direction: Axis.horizontal,
                // alignment: WrapAlignment.spaceBetween,
                // crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Expanded(
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: ClipOval(
                            child: Image.network(
                              'https://ts1.cn.mm.bing.net/th/id/R-C.d53096024c9a4b5dab27995b5afe0aaf?rik=ZMvr5kAlIhjhLw&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190626%2f2f1f6aa5dade4bfb8482e77d304edc2b.jpeg&ehk=eqY0wIbJ19tpCXgUVHG6IC9ZtuSvuJAMNa%2fn18TNae4%3d&risl=&pid=ImgRaw&r=0',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '张三',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '微博认证：钻石用户',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                        height: 40,
                        width: 40,
                        child: Image.network(
                          'https://ts1.cn.mm.bing.net/th/id/R-C.1d65f94f04ef6eb260ad699bf57c6e93?rik=lEylT3%2fVpV1mQw&riu=http%3a%2f%2fimg95.699pic.com%2felement%2f40129%2f0870.png_860.png&ehk=o47S34y3Mo6eZMGYu7mx7s3tqBf9EHAWE4%2fCVYrzQI8%3d&risl=&pid=ImgRaw&r=0',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        '会员',
                        style: TextStyle(
                          color: Color.fromARGB(255, 240, 217, 9),
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _horizontalLine(),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Text(
                        '1245',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            height: 1.4),
                      ),
                      Text(
                        '微博',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Text(
                        '234',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            height: 1.4),
                      ),
                      Text(
                        '关注',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Text(
                        '666',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            height: 1.4),
                      ),
                      Text(
                        '粉丝',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _grapLineWidget(top: 10, bottom: 10),
            Flex(
              direction: Axis.horizontal,
              children: [
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
                _gradItem(
                  '新的好友',
                  'https://img.zcool.cn/community/01fec958158d43a84a0d304fc3c541.png@1280w_1l_2o_100sh.png',
                  callback: () {
                    Utils.showToast('点击了新的好友');
                  },
                ),
              ],
            ),
            _grapLineWidget(top: 10),
            _lineFollow(
              'https://bpic.588ku.com/element_water_img/19/06/08/4093983d28e9f0c5f3b0c3712c4b6a8e.jpg',
              '微信钱包',
              litTitle: '新手免息',
              callback: () {
                Utils.showToast('点击了我的钱包');
              },
            ),
            _horizontalLine(),
            _lineFollow(
              'https://bpic.588ku.com/element_water_img/19/06/08/4093983d28e9f0c5f3b0c3712c4b6a8e.jpg',
              '免流量',
              callback: () {
                Utils.showToast('点击了免流量');
              },
            ),
            _horizontalLine(),
            _lineFollow(
              'https://bpic.588ku.com/element_water_img/19/06/08/4093983d28e9f0c5f3b0c3712c4b6a8e.jpg',
              '个人信息',
              callback: () {
                Navigator.pushNamed(context, '/my/person-info');
              },
            ),
            _grapLineWidget(bottom: 10),
            _cardItem(
              '大熊猫',
              '大熊猫的栖息地旅游',
              'https://ts1.cn.mm.bing.net/th/id/R-C.a4727cfa36198e73017f87f6ef67bba4?rik=vBCN%2bsmqDUgNTQ&riu=http%3a%2f%2fimage.qianye88.com%2fpic%2febd0f331a61c492dc76a513c15c07f46&ehk=iwBR1%2fY%2biBldpP4uV6DaMGdgaxWDYWxrFloaqyBRTEs%3d&risl=&pid=ImgRaw&r=0',
              callback: () {
                Utils.showToast('点击了大熊猫栖息地旅游');
              },
            ),
            _grapLineWidget(bottom: 10),
            _cardItem(
              '草原',
              '内蒙古大草原观光旅游',
              'https://tse1-mm.cn.bing.net/th/id/OIP-C.XBUyrVLj3ZW2-TTcKYqd2AHaEP?w=321&h=184&c=7&r=0&o=5&dpr=1.3&pid=1.7',
              callback: () {
                Utils.showToast('点击了草原旅游');
              },
            ),
            _grapLineWidget(bottom: 10),
            Container(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
