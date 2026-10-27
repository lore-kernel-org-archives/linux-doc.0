Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089922;
	b=iXx+INnJfjPqSP8IDWS8MCAmvCR2U/OxUGXPmb8Ecxbj8JNMdt6NZLi2A30/Khhb5JQc
	 oEVuGdLkKPhMqESTFGAIMcyYHIbXA8N+JS6KCt1GyVkGKhnQxQIgT1oEqshK7n4lCYe22
	 G1/YaBJqL7PzNxcIAnjugoVFEjVkBFwRoP93/5VeA68bukpyU3RY/36jfJhqtyWulOY1C
	 eLj6aR2zkQUxBpz3Dpt8CZNAZsK2hCkOORvHTW27g0J3V5BOmebs0SMVfQLdIJUrS/VKr
	 rZrmdf2mE91feu80XFYjcHBMV8pL61jdZNnRK/zBpm0Zq0zB93ex9jIUosohnPQkofg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
	b=KHFe5gGTlfo4+gWFybwJw3gSgjd1eCTBq7oEqCw6s1s5NcKPo5Zd2BzoBkdIaRDBPwH7
	 QSUm3bwIHyjteR8wFEUXOlDt0AHddREgv/SYTLIKIhPKMwDic4h8iAVm3dDpvZloRY8Qr
	 RUtaM0ycz4FZZZ4ooygDCOHf8ypW7IRwy2QvcMPKjfAf1A590dUrWhMnTAIYCUPXLIaWp
	 vnuDPFpJ9hmbUYLfoRYlHAnaymDmAdrPMGaBYPe7MMUI8f0+19MumetXrren2BOAtrqzs
	 CGi/59lxg4aebBKBbvH8ExmMvP6GKwnnoqTt9nfPDTy/5C5KVQTidlQl7RGTZ7ya1Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BsP2BtHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78E6606A320
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BsP2BtHE
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so8761609eec.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 01:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793089921; cv=none;
        d=google.com; s=arc-20260327;
        b=Xrr3OLR/4k5VK7j6drTBk+4EGkvX4gBlN9ieorb5yKUCHPDDZeTKpZ6uk456EIkLBv
         NqZCBW1ZzNOWj3YiJGn3woFfc0nM1JLSWSjmZtqoIFVUuimi950lkXGsG3vT4jSxX9V+
         kFEIlYCKvk9J4Pm2FL9Df7pnOqrfu/ziU8s1+Zbhdfv2RfT6qBwKTMhEUHSMvSKkaVyS
         sgfURH9OzFfERuKFro4sIzNDMr1s3LKsVrxhQ4Hjsh+Ezdhsyv/NElBLBtI8PTtckgC2
         koZ+g+MYQoZepVwDzm9G78Tu3F8a0cyKMUG0FnELx3H8Wm5yT6djv7/PqEXAI0J5osVn
         SKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        fh=iVeHj7IQbGyajyTXetrhHJGx9PRlsL2f95Ywy9uhzII=;
        b=eSCnI8Lnc3WWnS5CajbVg7dKuTi9nLA6u4aUUS+TqIzPlMxDBq5bla5nmd5rQ9wrJB
         18/kiKtvpKX7zFQKO9ARFm4BkcUgld/iBdtv45KMlLLrper7IufJmXpDHQ5TAE0UR1rQ
         DhzuupuHhimItNotzMiCAoBK92rwyKb3HQoJEV5fyVKY6XGcrmRiuGAsfzEVQxJxDJi0
         Mz1pL8PAY4sImtgZ7HnvKv15Gv01XQKr5zuFSOYpng5lGXn0+XOE2Iqye4iKRdgucCvh
         u3HO45QYAUpI8xq/6ZhfiheCwf+17tXnzWF3LRpRzqzkyzH195+cNxi37wGr3zUKGoih
         Aa9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793089921; x=1793694721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        b=BsP2BtHEv0wXTPACcvoDY2idUZIDQOphHgDfe3DrH70XbaArBHqSgI+rwn0A+Pk1Ap
         2wZSkAPH3wDoJzdLXVIe9emBW+ugoYWV5ntAzIOuYe/GgRGNRgc7UH0z9lmJou4disZP
         k8URLHsDR5BO+ycsPJhhoUX2UG5QLu1GI0wmFb1NW7jMLI3fVnuDiMAaDKIqKZRW8Gup
         LzdI2yBHZv+Sk50ZCl+N9D3GRe3QZPu8BygMWqaOoNMj86kzXvwYEvZR+0elEyz7Wo84
         EUOpx7WGDb7hKf50BepHtsdYotLV+CejhSSJKX/b2HmsTgVuUbE5J/crIfEe+GdvAH2F
         IRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089921; x=1793694721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        b=xpIZ8gw8KIIb4xKBz7gyRR2RZf5p9pBageufDqBLxMgs1Fhmsfgv8FBEiiLZtJT1fO
         4G/3GqKXksqOaHbzSNTI3Z88cp52NRTx/XZThLuRu/fwudF5+cpQe0uiWg1hSiq51xVs
         IdFIyYcDJNqkI4AfxD8MwLvbZuDAee3O9iOGIylrV0gM+IjHszK1JxuLU/1h31PeMALl
         hsuST9tJRlE50RzAzijD7IRLwOfkg47rzFUp/r/pV6kO2JU4EKjYrQ9uBeC+cKJY2zGL
         sya1qvVGkTnq9BLaF+QjFUEm8pwRj4rhhoQaWOpIQU54z66PtsLa2beRK3wK0oz+xZ8f
         avAg==
X-Forwarded-Encrypted: i=1; AKwUvBzVOpyfIDQ+RbpNrnyPOZIw2g8Y/hDUcfqDbyUnJpYIqtoMPKJLcnxO5Lbgr+bk97HomWpFpprig1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6ildMRwz6fvzDOxUM7Tsu9JWl8gVQZa8vqcsZ7UKYlQBc06aR
	NX8iPIJ8KzA59hhpKFZ0dLSqlJ1oOb62k4jor/x3NTzBPeUpJ2FOfDuLFjiWtSgFFkKf/pEIBe4
	VgbKxkGGna2ZmKJb+fE1B8S//Nix3B/94Unw6KMSU
X-Gm-Gg: AYBFou3lA6ZSXke7mTwgE7n53QdWdVIvduVeFhfmGPXf9GHco4LDRYeBEQShBijABqJ
	Rjz6RaWrlKLmTkR0HmccKNziwgYfGAgFsC/Q32mkZ9SJVNFltQbXFpbfxpjogyC+sDyB8hHfok1
	G6e9gqR/vr27V3DNa4N1A6qWKt7H39Oj5/pVlM+7mnoQQITXriXUmNkweexVSZUSaQsB+z/2OJD
	nPwS4RXZZdNoYgad5k19yEhU8iQrZIZG8x09iDR/ASGy1L+tM+KgQrbsoU//Bqvo8nPFIq6mf4A
	iQ/WliuW+WPWEiLtvb86oOSWNJUOZe7vg7jAmzos8TvSpuzs15SV9Bm+p2eo2v4+oufDxYBR0m3
	S7AjVB95EAc2+qhf0IKw+JbGl/JyMgzLaaxoIeb1OYfa4ZzQsLBuSOiIx5g1AO2BzzW1Q
X-Received: by 2002:a05:701b:2719:b0:14c:c947:6afb with SMTP id
 a92af1059eb24-1993505eb6fmr12920689c88.15.1793089920040; Tue, 27 Oct 2026
 01:32:00 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auA7FdubFEDVPB7v@chrisdown.name>
In-Reply-To: <auA7FdubFEDVPB7v@chrisdown.name>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 09:31:23 +0100
X-Gm-Features: AclHuK9Z31j2srRPq0cvI1MA14RltVYpiKhG7tlR1MRKpnbY3pyvJ0pGLxERO2E
Message-ID: <CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
Subject: Re: [PATCH] kfence: Allow selecting static keys mode at boot
To: Chris Down <chris@chrisdown.name>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 06:48, Chris Down <chris@chrisdown.name> wrote:
>
> KFENCE can gate allocations by toggling a static key for each sample, or
> by leaving the key enabled and checking an allocation gate. Static keys
> mode saves a load and compare per allocation, but sends IPIs to all CPUs
> twice per sample interval.
>
> Which tradeoff makes sense depends on the host. For example, on machines
> with many CPUs or latency-sensitive workloads, the IPI cost can outweigh
> the saving in the allocation path.
>
> For this reason on some machines we prefer to have static keys, and some
> we don't. However, today this is configurable only by
> CONFIG_KFENCE_STATIC_KEYS, so this means building and shipping separate
> kernels. It also for that reason makes comparing the modes on a
> particular workload more cumbersome.

On which systems have you found static keys to provide a significant
improvement? Can you share benchmarks?

IMHO, I was thinking of deleting the CONFIG_KFENCE_STATIC_KEYS mode,
because on most systems, it's not worth the complexity for the small
(if any) performance improvement anymore.

> Let's add kfence.static_keys= as a boot parameter so that the mode can
> be selected per host. The default still comes from
> CONFIG_KFENCE_STATIC_KEYS.
>
> Testing with the unoptimised branch layout showed no obvious changes in
> performance across allocation sizes.
>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +++
>  Documentation/dev-tools/kfence.rst            |  9 ++--
>  lib/Kconfig.kfence                            |  4 ++
>  mm/kfence/core.c                              | 47 +++++++++++--------
>  4 files changed, 42 insertions(+), 24 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index e75344f4e0cd..cda98e1b0b68 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2989,6 +2989,12 @@ Kernel parameters
>                         Format: <unsigned integer>
>                         Default: 75
>
> +       kfence.static_keys=
> +                       [MM,KFENCE] Whether to use static keys to set up
> +                       KFENCE allocations. Ignored without CONFIG_JUMP_LABEL.
> +                       Format: <bool>
> +                       Default: CONFIG_KFENCE_STATIC_KEYS
> +
>         kgdbdbgp=       [KGDB,HW,EARLY] kgdb over EHCI usb debug port.
>                         Format: <Controller#>[,poll interval]
>                         The controller # is the number of the ehci usb debug
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
> index b03d1201ddae..15212ea1047d 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -259,10 +259,11 @@ SLUB) returns a guarded allocation from the KFENCE object pool (allocation
>  sizes up to PAGE_SIZE are supported). At this point, the timer is reset, and
>  the next allocation is set up after the expiration of the interval.
>
> -When using ``CONFIG_KFENCE_STATIC_KEYS=y``, KFENCE allocations are "gated"
> -through the main allocator's fast-path by relying on static branches via the
> -static keys infrastructure. The static branch is toggled to redirect the
> -allocation to KFENCE. Depending on sample interval, target workloads, and
> +When using static keys mode (boot parameter ``kfence.static_keys=1``, which is
> +the default with ``CONFIG_KFENCE_STATIC_KEYS=y``), KFENCE allocations are
> +"gated" through the main allocator's fast-path by relying on static branches
> +via the static keys infrastructure. The static branch is toggled to redirect
> +the allocation to KFENCE. Depending on sample interval, target workloads, and
>  system architecture, this may perform better than the simple dynamic branch.
>  Careful benchmarking is recommended.
>
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..2b2ad21aa36c 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -70,6 +70,10 @@ config KFENCE_STATIC_KEYS
>           enabling and disabling static keys invoke IPI broadcasts, the latency
>           and impact of which is much harder to predict than a dynamic branch.
>
> +         Sets the default for the "kfence.static_keys" boot parameter.
> +         Selecting the other mode at boot adds one extra jump to each
> +         slab allocation's KFENCE check.
> +
>           Say N if you are unsure.
>
>  config KFENCE_STRESS_TEST_FAULTS
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 55d5c114eadf..cfbefca5b78b 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -119,6 +119,9 @@ module_param_named(deferrable, kfence_deferrable, bool, 0444);
>  static bool kfence_check_on_panic __read_mostly;
>  module_param_named(check_on_panic, kfence_check_on_panic, bool, 0444);
>
> +static bool kfence_static_keys __ro_after_init = IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS);
> +module_param_named(static_keys, kfence_static_keys, bool, 0444);
> +
>  /* The pool of pages used for guard pages and objects. */
>  char *__kfence_pool __read_mostly;
>  EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
> @@ -845,7 +848,6 @@ static struct notifier_block kfence_check_canary_notifier = {
>
>  static struct delayed_work kfence_timer;
>
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
>  /* Wait queue to wake up allocation-gate timer task. */
>  static DECLARE_WAIT_QUEUE_HEAD(allocation_wait);
>
> @@ -878,7 +880,6 @@ static void wake_up_kfence_timer(struct irq_work *work)
>         wake_up(&allocation_wait);
>  }
>  static DEFINE_IRQ_WORK(wake_up_kfence_timer_work, wake_up_kfence_timer);
> -#endif
>
>  /*
>   * Set up delayed work, which will enable and disable the static key. We need to
> @@ -897,17 +898,17 @@ static void toggle_allocation_gate(struct work_struct *work)
>                 return;
>
>         atomic_set(&kfence_allocation_gate, -kfence_burst);
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
> -       /* Enable static key, and await allocation to happen. */
> -       static_branch_enable(&kfence_allocation_key);
> +       if (kfence_static_keys) {
> +               /* Enable static key, and await allocation to happen. */
> +               static_branch_enable(&kfence_allocation_key);
>
> -       wait_event_idle(allocation_wait,
> -                       atomic_read(&kfence_allocation_gate) > 0 ||
> -                       !READ_ONCE(kfence_enabled));
> +               wait_event_idle(allocation_wait,
> +                               atomic_read(&kfence_allocation_gate) > 0 ||
> +                               !READ_ONCE(kfence_enabled));
>
> -       /* Disable static key and reset timer. */
> -       static_branch_disable(&kfence_allocation_key);
> -#endif
> +               /* Disable static key and reset timer. */
> +               static_branch_disable(&kfence_allocation_key);
> +       }
>         queue_delayed_work(system_dfl_wq, &kfence_timer,
>                            msecs_to_jiffies(kfence_sample_interval));
>  }
> @@ -956,7 +957,7 @@ void __init kfence_alloc_pool_and_metadata(void)
>
>  static void kfence_init_enable(void)
>  {
> -       if (!IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS))
> +       if (!kfence_static_keys)
>                 static_branch_enable(&kfence_allocation_key);
>
>         if (kfence_deferrable)
> @@ -967,22 +968,29 @@ static void kfence_init_enable(void)
>         if (kfence_check_on_panic)
>                 atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
>
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
> -       register_reboot_notifier(&kfence_reboot_notifier);
> -#endif
> +       if (kfence_static_keys)
> +               register_reboot_notifier(&kfence_reboot_notifier);
>
>         WRITE_ONCE(kfence_enabled, true);
>         queue_delayed_work(system_dfl_wq, &kfence_timer, 0);
>
> -       pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p\n", KFENCE_POOL_SIZE,
> +       pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p%s\n", KFENCE_POOL_SIZE,
>                 CONFIG_KFENCE_NUM_OBJECTS, (void *)__kfence_pool,
> -               (void *)(__kfence_pool + KFENCE_POOL_SIZE));
> +               (void *)(__kfence_pool + KFENCE_POOL_SIZE),
> +               kfence_static_keys ? ", static keys mode" : "");
>  }
>
>  void __init kfence_init(void)
>  {
>         stack_hash_seed = get_random_u32();
>
> +       /*
> +        * Without jump labels a static key is just another dynamic branch, so
> +        * static keys mode would only add the cost of toggling it.
> +        */
> +       if (!IS_ENABLED(CONFIG_JUMP_LABEL))
> +               kfence_static_keys = false;
> +
>         /* Setting kfence_sample_interval to 0 on boot disables KFENCE. */
>         if (!kfence_sample_interval)
>                 return;
> @@ -1175,10 +1183,10 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
>         allocation_gate = atomic_inc_return(&kfence_allocation_gate);
>         if (allocation_gate > 1)
>                 return NULL;
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
>         /*
>          * waitqueue_active() is fully ordered after the update of
> -        * kfence_allocation_gate per atomic_inc_return().
> +        * kfence_allocation_gate per atomic_inc_return(). There are only ever
> +        * waiters in static keys mode.
>          */
>         if (allocation_gate == 1 && waitqueue_active(&allocation_wait)) {
>                 /*
> @@ -1187,7 +1195,6 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
>                  */
>                 irq_work_queue(&wake_up_kfence_timer_work);
>         }
> -#endif
>
>         if (!READ_ONCE(kfence_enabled))
>                 return NULL;
>
> base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
> --
> 2.54.0
>
