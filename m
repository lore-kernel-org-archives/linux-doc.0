Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F526A1A7;
	Tue,  3 Feb 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114724; cv=none; b=QOAvNG/XcxKzOaW09Qi5I1zYN32r1BYuI+sBLEOgQ7pXwPFIERYyHBYxR6A10mvJ+/uNr5C2tb4xjV79vTKPiuA0Wn0aXAkzME3jcxLUO6olTbE4Zx30JmDRS+wUKm7OxLi+XoJwDEP2XPLsOlukgLxDY/KxFYH93R2Rj29hXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114724; c=relaxed/simple;
	bh=9YtVQAwzhNWBE9IC9Ys90skiBWBBC4yw9fvjx5yEujk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YvTkGJ/cGiqDTgYupRJnfTUm/OJDhQJLKn0PZ5Z5mys6oAAbHbWxa4w+xggXhQRQnaLdDUJfILI0hkxWglsP7inYloh3qhd6XEFimeItmLFIdZhvv7MfA7NYMBMnsQuTHF768T+f1rCPRcye3ge8F17bhz/HYcoMdy0d2jLsgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyZx7AHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyZx7AHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6255DC116D0;
	Tue,  3 Feb 2026 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770114724;
	bh=9YtVQAwzhNWBE9IC9Ys90skiBWBBC4yw9fvjx5yEujk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LyZx7AHeVdH5GMsh/PKZDqhu61DmPjTf+vN8UCkpe5LDOicwP2/x1aOgO5QSwZj/L
	 m4dXj3Guiro73vaXkWtB/mW8ber2UZ9mAramftj4xP5RrSTsP+bAcmtsrQsrdneEHF
	 Ru0T2QZbHmBBDnH9dh3Kp0SaxmOmUGVdZEcdF6H9uyCdIWscg/h448m67ulhiGzgXA
	 ETio/Ohfk54u8/nlQnWyQQ7tVb6pruJLIf/NUACVNmhXTn6/wZltVBSKctctCfzqDz
	 KgUOvaIPH3Hd6D1SuvZkk+fTmiMnadm07KqwNOazNvFqwrBW1U6eBOyVkL6eC19hAK
	 geYkor6NWZbtg==
From: Thomas Gleixner <tglx@kernel.org>
To: Alexander Graf <graf@amazon.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Clemens
 Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini
 <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 nh-open-source@amazon.com, Nicolas Saenz
 Julienne <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>,
 Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Jan
 =?utf-8?Q?Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
In-Reply-To: <20260202174803.66640-3-graf@amazon.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com>
Date: Tue, 03 Feb 2026 11:32:00 +0100
Message-ID: <87jywu3yov.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
> (Disclaimer: Some of this code was written with the help of Kiro, an AI
> coding assistant)

You could have sent your change log through AI too so it conforms with
the change log rules ...

> +#ifdef CONFIG_HARDLOCKUP_DETECTOR_HPET
> +/*
> + * HPET watchdog uses timer 0 routed to GSI 2 (legacy PIT IRQ line).
> + * When using HPET as watchdog, we repurpose this line for NMI delivery.
> + */
> +#define HPET_WD_TIMER	0
> +#define HPET_WD_GSI	2
> +
> +bool hpet_watchdog_initialized;
> +static bool hpet_watchdog_ioapic_configured;
> +static DEFINE_PER_CPU(u32, hpet_watchdog_next_tick);
> +
> +static int hpet_nmi_handler(unsigned int cmd, struct pt_regs *regs)
> +{
> +	u32 now, next, delta;
> +
> +	if (panic_in_progress())
> +		return NMI_HANDLED;
> +
> +	/* Check if this NMI is from our HPET timer by comparing counter value */
> +	now = hpet_readl(HPET_COUNTER);

And both you and your AI assistant failed to read through the previous
discussions on that topic and the 10+ failed attempts to make it work
correctly.  Otherwise you would have figured out that reading HPET in
the NMI handler is a patently bad idea.

I'm not reiterating any of it as it's well documented in the LKML archive.

> +/*
> + * On suspend, clear the configured flag so that the first CPU to come
> + * online after resume will reconfigure the HPET timer and IO-APIC.
> + *
> + * We don't need to explicitly disable the watchdog here because:
> + * 1. The HPET registers are reset by the hibernation/suspend process anyway
> + * 2. The IO-APIC state is saved/restored by ioapic_syscore_ops, but we
> + *    need to reconfigure it for NMI delivery after resume

If it's saved/restored then what needs to be reconfigured?

> +static int __init hpet_watchdog_init(u32 channels)
> +{
> +	u32 cfg, i, route_cap;
> +
> +	if (channels <= HPET_WD_TIMER)
> +		return 0;
> +
> +	/* Verify GSI 2 is available in the route capability bitmap */

The legacy channels are always routed to GSIs. Why do you need GSI2?

But why do you need to hijack the legacy 0 channel in the first place?
As discussed before this can nicely use one of the extra channels (>2)
which are available on any modern HPET implementation.

> +	route_cap = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER) + 4);
> +	if (!(route_cap & (1 << HPET_WD_GSI))) {
> +		pr_info("HPET timer 0 cannot route to GSI %d\n", HPET_WD_GSI);
> +		return 0;
> +	}
> +
> +	/* Deactivate all timers */
> +	for (i = 0; i < channels; i++) {
> +		cfg = hpet_readl(HPET_Tn_CFG(i));
> +		cfg &= ~(HPET_TN_ENABLE | HPET_TN_LEVEL | HPET_TN_FSB);
> +		hpet_writel(cfg, HPET_Tn_CFG(i));
> +	}
> +
> +	/* Configure HPET timer for periodic mode */
> +	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
> +	cfg &= ~(HPET_TN_ENABLE | HPET_TN_FSB);
> +	cfg |= HPET_TN_PERIODIC | HPET_TN_32BIT | HPET_TN_SETVAL | HPET_TN_LEVEL;

The HPET specification says about HPET_TN_LEVEL:

   "The timer interrupt is level triggered. This means that a level-
    triggered interrupt is generated. The interrupt will be held active until
    it is cleared by writing to the bit in the General Interrupt Status
    Register."

This clearly has seen a lot of testing on real hardware.

> +	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
> +
> +	/* Route HPET timer to the GSI */
> +	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
> +	cfg &= ~(Tn_INT_ROUTE_CNF_MASK | HPET_CFG_ENABLE);
> +	cfg |= (HPET_WD_GSI << Tn_INT_ROUTE_CNF_SHIFT) & Tn_INT_ROUTE_CNF_MASK;
> +	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));

You need all of this muck because you did a shortcut in hpet_enable()
which takes care of most things already. The previous attempts on this
clearly took some effort to integrate this cleanly w/o duplicating code
and introducing new bugs all over the place.

> +void watchdog_hardlockup_enable(unsigned int cpu)
> +{
> +	if (!hpet_watchdog_ioapic_configured) {
> +		/*
> +		 * First CPU online after resume - reconfigure HPET timer.
> +		 * This also sets hpet_watchdog_ioapic_configured = true.
> +		 */
> +		watchdog_hardlockup_start();
> +	}
> +
> +	if (num_online_cpus() == num_present_cpus()) {
> +		ioapic_set_nmi(HPET_WD_GSI, true);
> +		pr_info("switched to broadcast mode (all %d CPUs online)\n",
> +			num_online_cpus());
> +	}
> +}
> +
> +void watchdog_hardlockup_disable(unsigned int cpu)
> +{
> +	if (num_online_cpus() < num_present_cpus()) {
> +		ioapic_set_nmi(HPET_WD_GSI, false);
> +		pr_info("switched to CPU 0 only (%d CPUs online)\n",
> +			num_online_cpus() - 1);

That's a truly useful lockup detector, which only runs on
CPU0. Seriously?

> +	}
> +}
> +
> +int __init watchdog_hardlockup_probe(void)
> +{
> +	return hpet_watchdog_mode ? 0 : -ENODEV;
> +}
> +#else
> +static inline int hpet_watchdog_init(u32 channels) { return 0; }
> +#endif /* CONFIG_HARDLOCKUP_DETECTOR_HPET */
> +
>  /**
>   * hpet_enable - Try to setup the HPET timer. Returns 1 on success.
>   */
> @@ -1031,6 +1232,10 @@ int __init hpet_enable(void)
>  	/* This is the HPET channel number which is zero based */
>  	channels = ((id & HPET_ID_NUMBER) >> HPET_ID_NUMBER_SHIFT) + 1;
>  
> +	/* If watchdog mode, hand off to watchdog driver */
> +	if (hpet_watchdog_mode)
> +		return hpet_watchdog_init(channels);

And if that initialization fails for whatever reason the HPET is
disfunct, but then all your hpet_is_watchdog() checks are false too and
e.g. hpet_late_init() will fall flat on its nose.

>  	/*
>  	 * The legacy routing mode needs at least two channels, tick timer
>  	 * and the rtc emulation channel.
> @@ -1122,6 +1327,9 @@ static __init int hpet_late_init(void)
>  {
>  	int ret;
>  
> +	if (hpet_is_watchdog())
> +		return -ENODEV;
> +

>  #include <asm/hypervisor.h>
>  #include <asm/apic.h>
> @@ -31,6 +32,14 @@ struct clock_event_device *global_clock_event;
>   */
>  static bool __init use_pit(void)
>  {
> +	if (hpet_is_watchdog()) {
> +		/*
> +		 * The PIT overlaps the HPET IRQ line which we configure to
> +		 * NMI in watchdog mode, rendering the PIT non functional.
> +		 */
> +		return false;
> +	}

So your approach of enabling the HPET watchdog brute force on the
command line ends up here because hpet_enable() returns 0. So now if
apic_needs_pit() is true, then this unconditional enable results in a
full boot fail.

This clearly has been made "work" by the throw enough stuff at the wall
and see what sticks approach.

As it had been discussed before:

   1) There is no reason to hijack channel 0 as this can be made work
      nicely with the extra channels above channel 2 and MSI delivery

   2) HPET read in the NMI handler is not going to happen and can be
      solved by other means. A mostly working implementation exists
      already in the mail archive.

   3) Restricting it to CPU0 when not all CPUs are online is a
      nonstarter. Think smt=off. Again, solutions for this have been
      discussed and implemented.

   4) Side channels into the interrupt configuration are not an option.
      That has been properly integrated before...

I'm definitely not impressed by this AI slop...

Thanks,

        tglx
