Array.prototype.bind = (f) -> this.map(f).reduce (a,b)-> a.concat b

