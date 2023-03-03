# Define a binary tree node
mutable struct TreeNode{T}
    value::T
    left::Union{TreeNode{T}, Nothing}
    right::Union{TreeNode{T}, Nothing}
end

# Define a binary tree data structure
mutable struct BinaryTree{T}
    root::Union{TreeNode{T}, Nothing}
end

# Define functions for adding nodes to the tree
function add_node(tree::BinaryTree{T}, value::T) where T
    if tree.root === nothing
        tree.root = TreeNode(value, nothing, nothing)
    else
        add_node(tree.root, value)
    end
end

function add_node(node::TreeNode{T}, value::T) where T
    if value <= node.value
        if node.left === nothing
            node.left = TreeNode(value, nothing, nothing)
        else
            add_node(node.left, value)
        end
    else
        if node.right === nothing
            node.right = TreeNode(value, nothing, nothing)
        else
            add_node(node.right, value)
        end
    end
end

# Define a function for traversing the tree in order
function traverse_in_order(node::Union{TreeNode{T}, Nothing}) where T
    if node === nothing
        return
    end
    traverse_in_order(node.left)
    println(node.value)
    traverse_in_order(node.right)
end

# Define function for traverse the tree in preorder
function traverse_preorder(node::Union{TreeNode{T}, Nothing}) where T 
    if node === nothing 
        return 
    end 

    println(node.value)
    traverse_preorder(node.left)
    traverse_preorder(node.right)
end 


# Define function for traverse the tree in postorder
function traverse_postorder(node::Union{TreeNode{T}, Nothing}) where T 
    if node === nothing 
        return 
    end 

    traverse_preorder(node.left)
    traverse_preorder(node.right)
    println(node.value)
end 


# Example usage
tree = BinaryTree{Int}(nothing)
add_node(tree, 5)
add_node(tree, 3)
add_node(tree, 8)
add_node(tree, 1)
add_node(tree, 4)
add_node(tree, 7)
add_node(tree, 9)


println("In-Order traversal")
println("\n")
traverse_in_order(tree.root)

println("\n\n")

println("Pre order traversal")
println("\n")
traverse_preorder(tree.root)


println("\n\n")

println("Post order traversal")
println("\n")
traverse_postorder(tree.root)