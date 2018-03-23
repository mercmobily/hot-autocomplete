Autocomplete widget

This widget turns a normal input element into a super-powered widget that uses AJAX to suggest possible values for that field. It behaves the way you would expect any autocomplete widget to behave: it will pre-fill the rest of the field for you with selected text according to the first choice, and will display a liste of items you can then pick from. It's also easy to navigate using a keyboard.

It works by wrapping a normal input element. The wrapped witget _must_ be the first direct child of `hot-autocomplete`.

    <hot-autocomplete url="/suggest?name={{fieldName1}}" method="get">
      <paper-input value="{{fieldName1}}" required id="name" name="name" label="Your name"></paper-input>
    </hot-autocomplete>

Your server needs to cooperate, and only return the elements that start with what you passed. The server is expected to return JSON-formatted data containing an array of objects, where each object has a `name` attribute:

    [
      {
        "name":"Tony",
        "surname":"Mobily",
        "age":"40",
        "comment":"NO comment!"
      }
    ]

You can decide the path of the property by changing `suggestions-path`:

    <hot-autocomplete suggestions-path="surname" url="/suggest?name={{fieldName1}}" method="get">
      <paper-input value="{{fieldName1}}" required id="name" name="name" label="Your name"></paper-input>
    </hot-autocomplete>

Note that `suggestions-path` can be any value accepted by Polymer when doing `this.get()`.

You can set it so that the input _must_ match at least one of the offered options; remember to provide an error message to invalidate the field with, in case something unacceptable is there:

    <hot-autocomplete must-match error-message="Not a valid choice!" url="/suggest?name={{fieldName}}" method="get">
      <paper-input value="{{fieldName}}" required id="name" name="name" label="Your name"></paper-input>
    </hot-autocomplete>

Note that there is a `picked` property that will point to the picked element. So, in a form you can submit it using a hidden field like this:

    <hot-autocomplete picked="{{pickedCountry}}" suggestions-path="name" url="/stores/countries?nameStartsWith={{countryName}}" method="get">
      <paper-input vname="country" value="{{countryName}}" required id="countryName" label="Country"></paper-input>
    </hot-autocomplete>
    <input type="hidden" name="countryId" value="{{pickedCountry.id}}">
    Country code: {{pickedCountry.id}}


