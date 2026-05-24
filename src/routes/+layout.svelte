<script lang="ts">
	let { children } = $props();
</script>

<svelte:head>
	<title>playlist-thing</title>
</svelte:head>

<div class="page">
	<main class="content">
		{@render children()}
	</main>
</div>

<style>
	.page {
		display: flex;
		justify-content: center;
	}

	.content {
		max-width: 1000px;

		padding-left: 5px;
		padding-right: 5px;
	}
</style>
