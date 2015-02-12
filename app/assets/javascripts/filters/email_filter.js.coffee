app.filter "checkRead", ->
  (input) ->
    (if input then "✓" else "✘")
