```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

| Object           | Messages                   |
|:-------------    |:-------------------------- |
| Person           |                            |
| Bike             | working?                   |
| Docking Station  | release_bike               |

```
Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike
```
