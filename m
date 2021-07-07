Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3420C07E95
	for <linux-doc@archiver.kernel.org>; Wed,  7 Jul 2021 18:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B00C61C72
	for <linux-doc@archiver.kernel.org>; Wed,  7 Jul 2021 18:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhGGS03 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Jul 2021 14:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231190AbhGGS03 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Jul 2021 14:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625682228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mF5DpeP80QzR+srksvVofJQ5IcNTAEAob1kzMD7f+i8=;
        b=MWv29evPpLgWw0RWHBKs3TRyi8WXALF0PtVH5LD2Ofq0HkQBIFMmBoyyBGOaDNXFm471GU
        /VVOnStR23zl5eLFTdrlvsOvaoMAS1dF1vwObAqThi/NIdDqToqQQl/8xbFpeo1rvI/MCF
        usIzrKZBEqxzu5yjBm2HhRvBpTjqW+k=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-mKRu31qzO9OEhU0_yZ_FwA-1; Wed, 07 Jul 2021 14:23:47 -0400
X-MC-Unique: mKRu31qzO9OEhU0_yZ_FwA-1
Received: by mail-lf1-f72.google.com with SMTP id y19-20020a1964130000b029035a3f9d08cdso1526904lfb.21
        for <linux-doc@vger.kernel.org>; Wed, 07 Jul 2021 11:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mF5DpeP80QzR+srksvVofJQ5IcNTAEAob1kzMD7f+i8=;
        b=BZl4Z/D0yF8AnUJYH45Xz0zBLkVZYLxujobUvXCCugxDZmXjoq8Txgw1Men5xk5iPC
         bO88L/bNsy+pmqxpGKopzxcvOyi/lIs5Hs0u24mCBM5NiIwTtqzx84XFsHL4JypouZgr
         8fdMndjRDF1OR1WRmiXOooQvrxTqtyQipxWNfvf6MgdQ8R6db+s35UtceJZlimZN73uJ
         iP8awwtGwC95SlC5cC3mYk73HGX2MX4GwK0kys6CYW29SkE7ZiAd6lmSAprPyYMSNzZX
         yTVyz4N5ByLXALtopB5m0TTK6hS+UEEjiDVc6oo3biCE8b4OU4buMGwBHo4hCHjb7kEe
         J0Dw==
X-Gm-Message-State: AOAM5328NTFXLVpFwz8F+DhM8u0HcPk0d7paGu+m0tYi+HWBIgSVLw1X
        FdeNFeQlQ/PQSP0qStOP/v2S/h6IwcNCjJxcOLwqHWTB2TSmQAQAuK4b2L+YeqhtP6+cnj63/il
        BeNe3M5qJ7YEPcjVcHesnPGLWq96Yx4o35HDL
X-Received: by 2002:a05:6512:102e:: with SMTP id r14mr18889753lfr.34.1625682225879;
        Wed, 07 Jul 2021 11:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4VicBqw5BsVoDBTNFKPvGAeJlL3wDstpjkgYJrOsDZySOMD3MZoE7XcqdtBYd0iNslu+I/yE/+9jHfk6lnPs=
X-Received: by 2002:a05:6512:102e:: with SMTP id r14mr18889718lfr.34.1625682225596;
 Wed, 07 Jul 2021 11:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.2d906c322f72ec1420955136ebaa7a4c5073917c.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <de6b97a567e273adff1f5268998692bad548aa10.1623272033.git-series.pawan.kumar.gupta@linux.intel.com>
 <20210706195233.h6w4cm73oktfqpgz@habkost.net> <4cc2c5fe-2153-05c5-dedd-8cb650753740@redhat.com>
 <CAOpTY_qdbbnauTkbjkz+cZmo8=Hz6qqLNY6i6uamqhcty=Q1sw@mail.gmail.com>
 <671be35f-220a-f583-aa31-3a2da7dae93a@redhat.com> <CAOpTY_paTO=xqfGXPCC2Paty5ptJ6Dqpo4Tzb4C2hrO_t=vS8w@mail.gmail.com>
 <CALMp9eSJyvU1=FndZyR+hZMtKPWwgibKisBqp0Xcx4jxjrWn2w@mail.gmail.com>
 <CAOpTY_pefOmJ0zJjUzitgTGxqgX6XxwTP0fMKoiyuBCHrh+AWg@mail.gmail.com> <CALMp9eSNS+yKsDgS3TXH6bSf4eUM2sJaRrLxZa+Y8e0FqVhRJA@mail.gmail.com>
In-Reply-To: <CALMp9eSNS+yKsDgS3TXH6bSf4eUM2sJaRrLxZa+Y8e0FqVhRJA@mail.gmail.com>
From:   Eduardo Habkost <ehabkost@redhat.com>
Date:   Wed, 7 Jul 2021 14:23:29 -0400
Message-ID: <CAOpTY_qyWbpRMHL7Ob7fvvLehOPzVBC=7cMHELYJ3E=mPAc7sA@mail.gmail.com>
Subject: Re: [PATCH 4/4] x86/tsx: Add cmdline tsx=fake to not clear CPUID bits
 RTM and HLE
To:     Jim Mattson <jmattson@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Tony Luck <tony.luck@intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kyung Min Park <kyung.min.park@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Victor Ding <victording@google.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Anthony Steinhauser <asteinhauser@google.com>,
        Anand K Mistry <amistry@google.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        kvm@vger.kernel.org, Jiri Denemark <jdenemar@redhat.com>,
        "libvir-list@redhat.com" <libvir-list@redhat.com>,
        Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 7, 2021 at 1:18 PM Jim Mattson <jmattson@google.com> wrote:
>
> On Wed, Jul 7, 2021 at 10:08 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Wed, Jul 7, 2021 at 12:42 PM Jim Mattson <jmattson@google.com> wrote:
> > >
> > > On Wed, Jul 7, 2021 at 8:09 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > >
> > > > CCing libvir-list, Jiri Denemark, Michal Privoznik, so they are aware
> > > > that the definition of "supported CPU features" will probably become a
> > > > bit more complex in the future.
> > >
> > > Has there ever been a clear definition? Family, model, and stepping,
> > > for instance: are these the only values supported? That would make
> > > cross-platform migration impossible. What about the vendor string? Is
> > > that the only value supported? That would make cross-vendor migration
> > > impossible. For the maximum input value for basic CPUID information
> > > (CPUID.0H:EAX), is that the only value supported, or is it the maximum
> > > value supported? On the various individual feature bits, does a '1'
> > > imply that '0' is also supported, or is '1' the only value supported?
> > > What about the feature bits with reversed polarity (e.g.
> > > CPUID.(EAX=07H,ECX=0):EBX.FDP_EXCPTN_ONLY[bit 6])?
> > >
> > > This API has never made sense to me. I have no idea how to interpret
> > > what it is telling me.
> >
> > Is this about GET_SUPPORTED_CPUID, QEMU's query-cpu-model-expansion &
> > related commands, or the libvirt CPU APIs?
>
> This is my ongoing rant about KVM_GET_SUPPORTED_CPUID.
>

I agree the definition is not clear. I have tried to enumerate below
what QEMU assumes about the return value of KVM_GET_SUPPORTED_CPUID.
These are a collection of workarounds and feature-specific rules that
are encoded in the kvm_arch_get_supported_cpuid()
x86_cpu_filter_features(), and cpu_x86_cpuid() functions in QEMU.

1. Passing through the returned values (unchanged) from
KVM_GET_SUPPORTED_CPUID to KVM_SET_CPUID is assumed to be always safe,
as long as the ability to save/resume VCPU state is not required.
(This is the behavior implemented by "-cpu host,migratable=off")
2. The safety of setting a bit to a different value requires specific
knowledge about the CPUID bit.
2.1. For a specific set of registers (see below), QEMU assumes it's
safe to set the bit to 0 when KVM_GET_SUPPORTED_CPUID returns 1.
2.2. For a few specific leaves (see below), there are more complex rules.
2.4. For all other leaves, QEMU doesn't use the return value of
KVM_GET_SUPPORTED_CPUID at all (AFAICS).


The CPUID leaves mentioned in 2.1 are:

CPUID[1].EDX
CPUID[1].ECX
CPUID[6].EAX
CPUID[EAX=7,ECX=0].EBX
- This unfortunately includes de-feature bits like FDP_EXCPTN_ONLY and
ZERO_FCS_FDS
CPUID[EAX=7,ECX=0].ECX
CPUID[EAX=7,ECX=0].EDX
CPUID[EAX=7,ECX=1].EAX
CPUID[EAX=0Dh,ECX=0].EAX
CPUID[EAX=0Dh,ECX=0].EDX
CPUID[EAX=0Dh,ECX=1].EAX
- Note that CPUID[0Dh] has additional logic to ensure XSAVE component
info on CPUID is consistent
CPUID[40000001h].EAX
CPUID[40000001h].EDX
CPUID[80000001h].EDX
CPUID[80000001h].ECX
CPUID[80000007h].EDX
CPUID[80000008h].EBX
CPUID[8000000Ah].EDX
CPUID[C0000001h].EDX


Some of the CPUID leaves mentioned in 2.2 are:

CPUID[1].ECX.HYPERVISOR[bit 31]
- Can be enabled unconditionally
CPUID[1].ECX.TSC_DEADLINE_TIMER[bit 24]
- Can be set to 1 if using the in-kernel irqchip and
KVM_CAP_TSC_DEADLINE_TIMER is enabled
CPUID[1].ECX.X2APIC[bit 21]
- Can be set to 1 if using the in-kernel irqchip
CPUID[1].ECX.MONITOR[bit 3]
- Can be set to 1 if KVM_X86_DISABLE_EXITS_MWAIT is enabled
CPUID[6].EAX.ARAT[bit 2]
- Can be enabled unconditionally
CPUID[EAX=7,ECX=0].EDX.ARCH_CAPABILITIES
- Workaround for KVM bug in Linux v4.17-v4.20
CPUID[EAX=14h,ECX=0], CPUID{EAX=14h,ECX=1]
- Most bits must match the host, unless
CPUID[EAX=7,ECX=0].EBX.INTEL_PT[bit 25] is 0
CPUID[80000001h].EDX
- AMD-specific feature flag aliases can be set based on CPUID[1].EDX
CPUID[40000001h].EAX
- KVM_FEATURE_PV_UNHALT requires in-kernel irqchip
- KVM_FEATURE_MSI_EXT_DEST_ID requires split irqchip
CPUID[40000001].EDX.KVM_HINTS_REALTIME
- Can be enabled unconditionally

--
Eduardo

