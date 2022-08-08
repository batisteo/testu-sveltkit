<script>
    import { session } from "$app/stores";
    import { supabaseClient } from "$lib/db";
    import { SupaAuthHelper } from "@supabase/auth-helpers-svelte";
    import { fns, AppShell, Navbar, Header } from "@svelteuidev/core";
    import { SvelteUIProvider, Seo, TypographyProvider } from "@svelteuidev/core";
    import HeadContent from "$lib/components/app/HeadContent.svelte";
    import NavContent from "$lib/components/app/NavContent.svelte";
    let isDark = false;
    let opened = false;
</script>

<SupaAuthHelper {supabaseClient} {session}>
    <SvelteUIProvider withNormalizeCSS withGlobalStyles ssr>
        <Seo title="Home" titleTemplate="%t% - TestU" />
        <TypographyProvider>
            <AppShell
                override={{
                    main: {
                        bc: isDark
                            ? fns.themeColor("dark", 8)
                            : fns.themeColor("white", 0),
                    },
                }}
            >
                <Navbar
                    slot="navbar"
                    hidden={!opened}
                    width={{ base: 300 }}
                    override={{ p: "$xsPX" }}
                >
                    <NavContent />
                </Navbar>
                <Header slot="header" height={72} override={{ p: "$mdPX" }}>
                    <HeadContent />
                </Header>
                <slot />
            </AppShell>
        </TypographyProvider>
    </SvelteUIProvider>
</SupaAuthHelper>
