import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TreeNodeExt extends Equatable {
  TreeNodeExt({
    required this.name,
    String? key,
    dynamic data,
    this.pathRouter,
    this.icon,
    this.parentPathRouter,
    this.parent,
  });
  String? pathRouter;
  String? parentPathRouter;
  Widget? icon;
  String name;
  TreeNode<TreeNodeExt>? parent;
  @override
  List<Object?> get props => [
        pathRouter,
        parentPathRouter,
        icon,
        name,
        parent,
      ];
}
