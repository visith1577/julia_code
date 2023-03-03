using DataStructures

mutable struct BSTNode{T <: Real}
    value::T
    left::Union{BSTNode{T}, Nothing}
    right::Union{BSTNode{T}, Nothing}
end 

mutable struct BinarySearchTree{T <: Real}
    root::Union{BSTNode{T}, Nothing}
end 

function insert!(node::Union{BSTNode{T}, Nothing}, value::T) where T <: Real 
    if node === nothing 
        return BSTNode(value, nothing, nothing)
    elseif value < node.value 
        node.left = insert!(node.left, value)
    else 
        node.right = insert!(node.right, value)
    end 
    return node 
end

function search(node::Union{BSTNode{T}, Nothing}, value::T) where T <: Real 
    if node === nothing 
        return false 
    elseif node.value === value 
        return true
    elseif value < node.value 
        return search(node.left, value)
    else 
        return search(node.right, value)
    end
end


function delete!(node::Union{BSTNode{T}, Nothing}, value::T) where T <: Real 
    if node === nothing 
        return 
    elseif value < node.value 
        node.left = delete!(node.left, value)
    elseif  value > node.value 
        node.right = delete!(node.right, value)
    else 
        if node.left === nothing && node.right === nothing 
            return nothing 
        elseif node.left === nothing 
            return node.right 
        elseif node.right === nothing 
            return node.left 
        else 
            min_node = find_min(node.right)
            node_value = min_node.value 
            node_right = delete!(node.right, node_value)
        end
    end 
    return node
end


function find_min(node::BSTNode{T}) where T <: Real
    if node.left === nothing
        return node
    else
        return find_min(node.left)
    end
end


function level_order_traversal(node::BSTNode{T}) where T <: Real 
    queue = Queue{BSTNode{T}}()
    enqueue!(queue, root)
    while !isempty(queue)
        node = dequeue!(queue)
        println(node.value)
        if node.left !== nothing
            enqueue!(queue, node.left)
        end
        if node.right !== nothing
            enqueue!(queue, node.right)
        end
    end
end


bst = BinarySearchTree{Float64}(nothing)

insert!(bst.root, 4.5)
insert!(bst.root, 2.1)
insert!(bst.root, 7.3)
insert!(bst.root, 5.6)

println(search(bst.root, 4.5))  # true
println(search(bst.root, 6.2))  # false