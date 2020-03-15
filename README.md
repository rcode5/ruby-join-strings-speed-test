Ruby 2.3.4 using activesupport `Enumerable#sum`
```
       user     system      total        real
plus  0.210000   0.000000   0.210000 (  0.212148)
join  0.560000   0.000000   0.560000 (  0.558045)
interpolate  0.270000   0.000000   0.270000 (  0.272763)
```
The takeaway?  Add strings with '+' when you can

Run later with ruby 2.6.5

```bash
be ./run.rb
       user     system      total        real
plus  0.461512   0.001025   0.462537 (  0.463131)
join  1.042404   0.003322   1.045726 (  1.046136)
join_with_asterisk  1.168133   0.002013   1.170146 (  1.170751)
interpolate  0.520607   0.001543   0.522150 (  0.523442)
```
