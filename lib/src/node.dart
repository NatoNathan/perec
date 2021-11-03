class Node {
  int _id;
  int _yesId;
  int _noId;
  String _question;
  String _description;

  Node? _yesNode;
  Node? _noNode;

  Node(this._id, this._yesId, this._noId, this._description, this._question) {
    _yesNode = null;
    _noNode = null;
  }

  int getId() => _id;
  void setId(int id) => _id = id;
  int getYesId() => _yesId;
  void setYesId(int yesId) => _yesId = yesId;
  int getNoId() => _noId;
  void setNoId(int noId) => _noId = noId;
  String getQuestion() => _question;
  void setQuestion(String question) => _question = question;
  String getDescription() => _description;
  void setDescription(String description) => _description = description;

  void setYesNode(Node node) {
    _yesNode = node;
  }

  void setNoNode(Node node) {
    _noNode = node;
  }

  Node? getYesNode() {
    return _yesNode;
  }

  Node? getNoNode() {
    return _noNode;
  }

  @override
  String toString() {
    return 'Node{id: $_id, yesId: $_yesId, noId: $_noId, question: $_question, description: $_description, yesNode: $_yesNode, noNode: $_noNode}';
  }
}
