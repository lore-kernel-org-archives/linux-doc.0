Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0B8BF7DF7E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 31 Jul 2018 16:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732408AbeGaRoi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 31 Jul 2018 13:44:38 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41313 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732425AbeGaRoh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jul 2018 13:44:37 -0400
Received: by mail-pl0-f65.google.com with SMTP id w8-v6so7361152ply.8
        for <linux-doc@vger.kernel.org>; Tue, 31 Jul 2018 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MCCwJ+aQ3QluAcbv7Vnv7dpmLID9SHTC3R7LCcSvpZw=;
        b=e4eqVFHpMWLgqb8r300mBWpvUhRfuPDu5cOG5bwFJNipHub1t1qRWQ8JNVjMh5ac4j
         Ow/DQPSJyXC6M4IspXZlc0TFfveJE/is0rpnh45tkp+X5EzVny4DkUPK1JLIhuzXpglV
         KruSmDEJsqezuHZAC0thQpHP68yX+sxfYDKgt89jw7KyuShaY1Mysv+7hU8A0PrQI6D4
         PaS7w/xzCk+5S6qU6UWL76hH4RIxxc2lnuFW+jQ3ftUN9dwngrrUos0U/JGa/vD+JZLH
         q2yo5N+OsgzSvgFWmpRnuhraEWBbt/aQ+aV8GDGorUf2n8SazudfWlnLRhXQtnt8l/xb
         zWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MCCwJ+aQ3QluAcbv7Vnv7dpmLID9SHTC3R7LCcSvpZw=;
        b=GU+cDrLjwwrXhCOoUBxYn+tSw9HLR65p6EwxjSBqBx6UYORwCG2nS96wSyqVT4uh3E
         TzBa8NGVVrQc1emYh7iCEm77i2KXcGpGsllhBFeDrlZBrLg+1UVnkJtsfD+YkzgH+uja
         pTxpyXS6TwWJ9IGVWtS16sbo7QwKaNL4Wp+Pyk9oAL6cdbB3nMCvyT0gpyYwNGljsJKI
         z+VIiJ8dMwQxlnD/V78r6rz6KjQNnjDhl+8HaMK8mfAAQBd9/ia4N+UD3sxdU8ctcnf4
         ZCvy+7RETlGu5L21SObkMr11vXdTaCHnpToTr13bV3G8Tj44U2XRyYUexRybqbIW7Yrn
         6t7g==
X-Gm-Message-State: AOUpUlFE7b24M+OStFCXTRozRRib8xhOBiYXd89m+jkvONF1HG0DyQRC
        l91b4dfIz9aoIKO78tNlaEJ4jhMFlB/IeD2AKNeBww==
X-Google-Smtp-Source: AAOMgpf2idFMvU35lou06YRyZn4DlX/1O2jUwcXHj78PgU/JoKGFofBFTp9Iux7o+TnYGVZyb4nqmZSbvTsKfpHNVI8=
X-Received: by 2002:a17:902:740b:: with SMTP id g11-v6mr21160189pll.85.1533053017437;
 Tue, 31 Jul 2018 09:03:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:ac14:0:0:0:0 with HTTP; Tue, 31 Jul 2018 09:03:16
 -0700 (PDT)
In-Reply-To: <01000164f0fd5abc-df9ea911-9701-498c-adce-9f833e6df3ed-000000@email.amazonses.com>
References: <cover.1530018818.git.andreyknvl@google.com> <a2a93370d43ec85b02abaf8d007a15b464212221.1530018818.git.andreyknvl@google.com>
 <09cb5553-d84a-0e62-5174-315c14b88833@arm.com> <CAAeHK+yC3XRPoTByhH1QPrX45pG3QY_2Q4gz=dfDgxfzu1Fyfw@mail.gmail.com>
 <8240d4f9-c8df-cfe9-119d-6e933f8b13df@virtuozzo.com> <CACT4Y+Y=61VwwETQP3FwAN16ompSNJOCyDCG6Ew1Bm5f_Fe1Lw@mail.gmail.com>
 <01000164f0fd5abc-df9ea911-9701-498c-adce-9f833e6df3ed-000000@email.amazonses.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 31 Jul 2018 18:03:16 +0200
Message-ID: <CACT4Y+b6_d6b5Q4oScXuoXhsnkJPG+UZ1QxqPPGuM4_aU3n4mA@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] khwasan: add hooks implementation
To:     Christopher Lameter <cl@linux.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        vincenzo.frascino@arm.com, Alexander Potapenko <glider@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Mark Brand <markbrand@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 31, 2018 at 5:38 PM, Christopher Lameter <cl@linux.com> wrote:
> On Tue, 31 Jul 2018, Dmitry Vyukov wrote:
>
>> > Actually you should do this for SLAB_TYPESAFE_BY_RCU slabs. Usually they are with ->ctors but there
>> > are few without constructors.
>> > We can't reinitialize or even retag them. The latter will definitely cause false-positive use-after-free reports.
>>
>> Somewhat offtopic, but I can't understand how SLAB_TYPESAFE_BY_RCU
>> slabs can be useful without ctors or at least memset(0). Objects in
>> such slabs need to be type-stable, but I can't understand how it's
>> possible to establish type stability without a ctor... Are these bugs?
>> Or I am missing something subtle? What would be a canonical usage of
>> SLAB_TYPESAFE_BY_RCU slab without a ctor?
>
> True that sounds fishy. Would someone post a list of SLAB_TYPESAFE_BY_RCU
> slabs without ctors?

https://elixir.bootlin.com/linux/latest/source/fs/jbd2/journal.c#L2395
https://elixir.bootlin.com/linux/latest/source/fs/kernfs/mount.c#L415
https://elixir.bootlin.com/linux/latest/source/net/netfilter/nf_conntrack_core.c#L2065
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/i915_gem.c#L5501
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/selftests/mock_gem_device.c#L212
https://elixir.bootlin.com/linux/latest/source/drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c#L1131

Also these in proto structs:
https://elixir.bootlin.com/linux/latest/source/net/dccp/ipv4.c#L959
https://elixir.bootlin.com/linux/latest/source/net/dccp/ipv6.c#L1048
https://elixir.bootlin.com/linux/latest/source/net/ipv4/tcp_ipv4.c#L2461
https://elixir.bootlin.com/linux/latest/source/net/ipv6/tcp_ipv6.c#L1980
https://elixir.bootlin.com/linux/latest/source/net/llc/af_llc.c#L145
https://elixir.bootlin.com/linux/latest/source/net/smc/af_smc.c#L105

They later created in net/core/sock.c without ctor.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
