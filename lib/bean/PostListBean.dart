class PostListBean {
  int code;
  String msg;
  List<Data> data;

  PostListBean({this.code, this.msg, this.data});

  PostListBean.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int uid;
  String name;
  String avatar;
  String createtime;
  String updatetime;
  String title;
  String content;
  int starts;
  int comments;
  int views;
  int image;
  List<String> urlList;

  Data(
      {this.id,
        this.uid,
        this.name,
        this.avatar,
        this.createtime,
        this.updatetime,
        this.title,
        this.content,
        this.starts,
        this.comments,
        this.views,
        this.image,
        this.urlList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    avatar = json['avatar'];
    createtime = json['createtime'];
    updatetime = json['updatetime'];
    title = json['title'];
    content = json['content'];
    starts = json['starts'];
    comments = json['comments'];
    views = json['views'];
    image = json['image'];
    urlList = json['urlList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['createtime'] = this.createtime;
    data['updatetime'] = this.updatetime;
    data['title'] = this.title;
    data['content'] = this.content;
    data['starts'] = this.starts;
    data['comments'] = this.comments;
    data['views'] = this.views;
    data['image'] = this.image;
    data['urlList'] = this.urlList;
    return data;
  }


}