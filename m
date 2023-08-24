Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED64C6FA8F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 22:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbjHXWH4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 18:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243887AbjHXWHf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 18:07:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F991BF0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 15:07:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so460749e87.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692914849; x=1693519649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l11912n3qa2CSpw+kZXNOtODsxBrBizs0n9GmmfpDCU=;
        b=jFwrMYJdrwzpJtmpEf4heHBoQiKWCODnVVviQ2Y5TouOiHrgkdwUYPuy+TcVQbYxA6
         XCRA+Yhh9pq5u9VZ+amDDkLt7jjxrufQ9ZfoLF1cZFpT2hQfjUzsT9iJj2tAuywQVeM8
         bDhzZN5OVMIKMDM5VnIJNu5VrGDN6LJpTM+fnmN6v931weJ6vu6Rikqw6ugU1Rmr4CX+
         m3GNzlyvJ/PTP6CXsuwKb/IJO5/RHR/BptfFivVzDKucupIlru2aqEhiH60OhYbOax+t
         qkKdQ7e9klys/UT7EC5nuxTzScF9UOcw/HcZ+OWW2OP4T13qVnTMpWgCV1hTC9UGpEVm
         hDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692914849; x=1693519649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l11912n3qa2CSpw+kZXNOtODsxBrBizs0n9GmmfpDCU=;
        b=OzGHDM2KLWKT5zk2RtYK0FfNRvMw/ydzW5RjlZUCDEo/wpff2J1n3yS4Js6tiLQO2e
         /T78QMbojiObQrNCuvIclcjBT2SB0maJ0pv34bcmkk900owS+p+c2o2uIjPOVUFg23bJ
         n0/3Ev+sNmZ3GGr6YtTyMTIYqrGS9K9DrfhcCDKHA5Y+rjjbG1nptNXIzkNkQTDfZz7T
         7HQol53WVXaw1ugV6MpQ/XBa4A/tIVn6Lt2djC2Nldz8B3HGRVpDAU9zbsoQolAu97DR
         zakuna9jiz+XR+L2eE39pXLM0Lp2Cxo6mFFS9PRagQbUxJzvGFOwg6OGq7YD8V3LWGfc
         o5yA==
X-Gm-Message-State: AOJu0Yx6yuxIWcbToq00CY9g6YDMivLEE7fu//e0o0Nv3b8aP207Mw2b
        YkJL2gOCtxh5jXWMojkTZG+a6VRzALVxts3q9fAmRA==
X-Google-Smtp-Source: AGHT+IGHliznsl8IHMzh8+mmPAASwa3zHuMXxpd3WMGnZUqFAJe0ZmozwDjGhtg5A8SAU2rE9JZwtqWwi3cTvGHg/6w=
X-Received: by 2002:a19:5f0e:0:b0:4fd:bdf8:930d with SMTP id
 t14-20020a195f0e000000b004fdbdf8930dmr9788363lfb.22.1692914849169; Thu, 24
 Aug 2023 15:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com> <20230824-exploit-spectacle-ecedd91e9075@spud>
In-Reply-To: <20230824-exploit-spectacle-ecedd91e9075@spud>
From:   Evan Green <evan@rivosinc.com>
Date:   Thu, 24 Aug 2023 15:06:53 -0700
Message-ID: <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To:     Conor Dooley <conor@kernel.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 10:29=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, Aug 24, 2023 at 09:18:16AM -0700, Evan Green wrote:
> > On Thu, Aug 24, 2023 at 5:20=E2=80=AFAM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Tue, Jul 11, 2023 at 01:18:30PM -0700, Evan Green wrote:
> > > > In /proc/cpuinfo, most of the information we show for each processo=
r is
> > > > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > > > compatible, and the mmu size. But the ISA string gets filtered thro=
ugh a
> > > > lowest common denominator mask, so that if one CPU is missing an IS=
A
> > > > extension, no CPUs will show it.
> > > >
> > > > Now that we track the ISA extensions for each hart, let's report IS=
A
> > > > extension info accurately per-hart in /proc/cpuinfo. We cannot chan=
ge
> > > > the "isa:" line, as usermode may be relying on that line to show on=
ly
> > > > the common set of extensions supported across all harts. Add a new =
"hart
> > > > isa" line instead, which reports the true set of extensions for tha=
t
> > > > hart. This matches what is returned in riscv_hwprobe() when queryin=
g a
> > > > given hart.
> > > >
> > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > ---
> > > >
> > > > Changes in v4:
> > > >  - Documentation: Made the underline match the text line (Conor)
> > > >  - Documentation: hanged "in question" to "being described" (Andrew=
)
> > > >
> > > > Changes in v3:
> > > >  - Add some documentation (Conor)
> > > >
> > > > Changes in v2:
> > > >  - Added new "hart isa" line rather than altering behavior of exist=
ing
> > > >    "isa" line (Conor, Palmer)
> > > >
> > > >
> > > > I based this series on top of Conor's riscv-extensions-strings bran=
ch
> > > > from July 3rd, since otherwise this change gets hopelessly entangle=
d
> > > > with that series.
> > > >
> > > > ---
> > > >  Documentation/riscv/uabi.rst | 10 ++++++++++
> > > >  arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
> > > >  2 files changed, 28 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uab=
i.rst
> > > > index 8960fac42c40..afdda580e5a2 100644
> > > > --- a/Documentation/riscv/uabi.rst
> > > > +++ b/Documentation/riscv/uabi.rst
> > > > @@ -42,6 +42,16 @@ An example string following the order is::
> > > >
> > > >     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> > > >
> > > > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > > > +------------------------------------------
> > > > +
> > > > +The "isa" line in /proc/cpuinfo describes the lowest common denomi=
nator of
> > > > +RISC-V ISA extensions understood by the kernel and implemented on =
all harts. The
> > > > +"hart isa" line, in contrast, describes the set of extensions unde=
rstood by the
> > > > +kernel on the particular hart being described, even if those exten=
sions may not
> > > > +be present on all harts in the system. The "hart isa" line is cons=
istent with
> > > > +what's returned by __riscv_hwprobe() when querying for that specif=
ic CPU.
> > >
> > > Thinking about this again, I don't think this is true. hwprobe uses
> > > has_fpu(), has_vector() etc that interact with Kconfig options but th=
e
> > > percpu isa bitmap isn't affected by these.
> >
> > Ugh yeah it's kind of a mishmash isn't it. hwprobe_isa_ext0() uses the
> > lowest common denominator for FD, C, V, but per-hart info for
> > Zba,Zbb,Zbs. Given the interface, per-hart info seems like what we
> > should have done there, and the FD, C, and V were my bad. The good
> > news is we can define new bits that do the right thing, though maybe
> > we should wait until someone actually wants them. For this patch we
> > should just remove this sentence. We can also correct the
> > documentation in hwprobe to mention the shortcoming in FD,C,V.
>
> I'm not really sure it's all that much of a shortcoming for V or FD,
> since without the kernel support you shouldn't be using those extensions
> anyway. A hwprobe thing for that sounds like a footgun to me & I think
> the current behaviour is how it should be for these extensions.
> It not being per-cpu is arguably a bug I suppose? But I would contend

Yeah it was mostly the not being per-cpu I was pointing to in my previous e=
mail.

> that we are conveying support for the extension on a per-hart level,
> with it then also gated by the kernel supporting V or FD, which is on a
> system-wide basis.
> Any other extensions that require Kconfig-gated kernel support should
> also not report via hwprobe that the extension is supported when the
> Kconfig option is disabled. It just so happens that the set of
> extensions that hwprobe supports that are Kconfig-gated and those that
> require all-hart support are one and the same right now, so we can kinda
> just conflate the two & use has_vector() et al that handles both
> kconfig-gating and all-hart support. Until something comes along that nee=
ds
> anything different, I'd leave well enough alone for hwprobe...

Sounds good.

>
> > Palmer, do you want a spin of this patch or a followup on top to
> > remove the above sentence?
>
> It's not actually been applied yet, right?
>
> Do you want to have this new thing in cpuinfo tell the user "this hart
> has xyz extensions that are supported by a kernel, but maybe not this
> kernel" or to tell the user "this hart has xyz extensions that are
> supported by this kernel"? Your text above says "understood by the
> kernel", but I think that's a poor definition that needs to be improved
> to spell out exactly what you mean. IOW does "understood" mean the
> kernel will parse them into a structure, or does it mean "yes you can
> use this extension on this particular hart".

I'm imagining /proc/cpuinfo being closer to "the CPU has it and the
kernel at least vaguely understands it, but may not have full support
for it enabled". I'm assuming /proc/cpuinfo is mostly used by 1)
humans wanting to know if they have hardware support for a feature,
and 2) administrators collecting telemetry to manage fleets (ie do I
have any hardware deployed that supports X). Programmers looking to
see "is the kernel support for this feature ready right now" would
ideally not be parsing /proc/cpuinfo text, as more direct mechanisms
like specific hwprobe bits for "am I fully ready to go" would be
easier to work with. Feel free to yell at me if this overall vision
seems flawed.

I tried to look to see if there was consensus among the other
architectures. Aarch64 seems to go with "supported and fully enabled",
as their cpu_has_feature() directly tests elf_hwcap, and elements in
arm64_elf_hwcaps[] are Kconfig gated. X86 is complicated, but IIRC is
more along the lines of "hardware has it". They have two macros,
cpu_has() for "raw capability" and cpu_feature_enabled() for "kernel
can do it too", and they use cpu_has() for /proc/cpuinfo flags.

-Evan
