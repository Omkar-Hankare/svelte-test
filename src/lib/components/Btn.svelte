<script lang="ts">
	let count = 0;
	let label = "rendered";

	let data = { foo: { bar: "baz" } };

	function onClick() {
		count = count + 1;
		label = "clicked" + count;
		data.foo.bar = "baaaazzz";
		let updatedData = { ...data, try: { huh: "okay" } };
		data = updatedData;
	}
</script>

<button type="button" title={label} on:click={onClick}>{label}</button>
{JSON.stringify(data)}
