Instead of writing:

```
it "does a thing" do
  expect(subject).to do_the_thing
end
```

You can write

`it { should do_the_thing}`

or

`it { is_expected_to do_the_thing}`
