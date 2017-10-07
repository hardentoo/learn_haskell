module Graph where

type Node = Char
type Arc  = (Node, Node)

update :: [Node] -> [Node] -> [Arc] -> Node -> Bool
nodeList :: [Node] -> [Node] -> [Arc] -> [Node]

nodeList [] _ _ = []
nodeList list used arcs = tail list ++ [ y | y <- l, not (elem y used)] where
    v = head list
    l =  [ snd r | r <- arcs, fst r == v, snd r /= v ]

solveGraph :: Node -> Node -> [Arc] -> Bool
solveGraph s e arcs = update [s] [s] arcs e

update [] used arcs e = elem e used

update q used arcs e = update qn usedn arcs e where
    qn = nodeList q used arcs
    usedn = used ++ qn
