# ep4m
Octave functions for analog filters design.

## examples:

### 3-poles bandpass 100-102kHz filter mesh, 1500 Ohm input and outut impedance

Design the ```topology``` and compute element ```values```:

```octave:1> [topology, values] = efiltermesh(3, 100000, 102000, 1500, 1)```

Print the design (with element values rounded to their nearest E6 series values):

```octave:2> eprintladder(l, eround(e, 6))```
```

         C1       |
 |-------||-------+
        100nF     |
         L1       |
 |-----(_(_(_)----+
        22uH      |
             C2   |
                 ===
            1.5nF |
         C3       |
 |-------||-------+
        100nF     |
         L2       |
 |-----(_(_(_)----+
        22uH      |
             C4   |
                 ===
            1.5nF |
         L3       |
 |-----(_(_(_)----+
        22uH      |
         C5       |
 |-------||-------+
        100nF     |
```


