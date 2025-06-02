import 'package:equatable/equatable.dart';
import 'package:bartech_app/data/models/model_groups.dart';

abstract class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroupSelectedEvent extends DetailsEvent {
  final GroupItems group;
  GroupSelectedEvent(this.group);

  @override
  List<Object?> get props => [group];
}
