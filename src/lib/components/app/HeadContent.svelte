<script lang="ts">
    import { Button, Group, Image } from "@svelteuidev/core";
    import logo from "$lib/assets/logo.png";
    import { session } from "$app/stores";
</script>

<header>
    <Image src={logo} alt="TestU.eu" height={40} fit="contain" />
    <Group>
        {#if $session?.user}
            <Button>Profile</Button>
            <a href="/api/auth/logout">Sign out</a>
        {:else}
            <Button
                href="/login"
                size="md"
                variant="light"
                override={{ textDecoration: "none !important" }}
            >
                Log In
            </Button>

            <Button
                href="/register"
                size="md"
                variant="gradient"
                gradient={{ from: "grape", to: "pink", deg: 35 }}
                override={{
                    color: "white !important",
                    textDecoration: "none !important",
                }}
            >
                Register
            </Button>
        {/if}
    </Group>
</header>

<style>
    header {
        display: flex;
        justify-content: space-between;
    }
</style>
