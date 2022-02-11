class FileModel{
  List<String> files;
  String folder;

  FileModel({required this.files, required this.folder});

  FileModel.fromJson(Map<String, dynamic> json):this (
    files : List<String>.from(json['files']),
    folder : json['folderName'] as String
  );
}
