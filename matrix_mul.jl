function split(matrix)
    n = size(matrix)[1]
    return matrix[begin:n//2, begin:n//2], \
        matrix[n//2:end, n//2:end], matrix[begin:n//2, n//2:end], matrix[n//2:end, begin:n//2]
end 

