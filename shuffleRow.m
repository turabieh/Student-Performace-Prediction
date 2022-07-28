function ret = shuffleRow(mat)

[r c] = size(mat);
shuffledRow = randperm(r);

ret1 = mat(shuffledRow, :);


shuffledRow = randperm(r);

ret2 = ret1(shuffledRow, :);

shuffledRow = randperm(r);

ret = ret2(shuffledRow, :);