## Money Exchange
We created an app which converts the inserted sum of "lei" to "euros" or "dollars" by pressing the corresponding button.

---

#### New widgets

- AppBar
- Image
- Expanded
- TextField, InputDecoration
- ElevatedButton
 
---
 
#### What / how we did

- change a textfield:
  - use the onChanged property
  - use a TextEditingController variable

- change "lei" to multiple currencies
  - create a function which takes the currency as a parameter
  - use a map<currency, factor> to do the same computation for as many existing currencies

- display an error message when the input isn't valid
  - set the errorText variable to null when the user types something
  - display the errorText if the user pressed the button with an empty input
  
---

#### To remember - setState
Whenever you need to change the state of a variable along the lifetime of the app:

1. Declare a variable
2. Use the variable
3. Change the variable in setState

---

#### Contributors

- [Bogdan Piele](https://github.com/bogpie)
- [Diana Simion](https://github.com/dianasimion)
