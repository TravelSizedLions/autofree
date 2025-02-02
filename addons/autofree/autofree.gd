class_name Autofree

static var __refs: Array[Node] = []

static func add(ref: Node):
  __refs.append(ref)

static func free_orphans():
  for ref in __refs.duplicate():
    var index = __refs.find(ref)
    if not is_instance_valid(ref):
      __refs.remove_at(index)
    elif ref.is_inside_tree():
      __refs.remove_at(index)
    else:
      ref.free()
      __refs.remove_at(index)
