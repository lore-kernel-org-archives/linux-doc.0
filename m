Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B923FB35
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cyiiL9MM"
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873C2113
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:45:44 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso70232111fa.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697651143; x=1698255943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHadPeMbwC2xjZjhyzQo2TzXpSpoTFPJhsEQY4iQg+4=;
        b=cyiiL9MMewyKAI3dniJbe8vLlv+W/e98+o9jjMnvP8/bozHaiDJdZNuYub+Y4H9dDD
         xU0q4X43d49/7aqljTWHCrCw2sYseYxTDJ29i49E8KSVDWUAdA4NqZQ6JQK+qgSMVcGo
         /K4YMbkuSYJ3Q4RsFCKf6Tgfv5c63CuPg046tpS707IIcNIOPGswUuYI8HzZ3PzmVah0
         f9Y/CetrnhQCzT2K+RG1Ouy+3Pp/eqLYDYEVGZ/vLEQz2g493l41AT89dSBJjHezE7f1
         uDGaJ6GFvNMUvrRUk1FluAECAQEzgwc3gUyX7ZpQa2oDmMIL50Od/vvkyufAc+bWV/vf
         JAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697651143; x=1698255943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHadPeMbwC2xjZjhyzQo2TzXpSpoTFPJhsEQY4iQg+4=;
        b=co1InWzKVuw3VwztZrhrkhdWZycTWhgyNQyxw6bmliV+eyA/Nlj1QUPkD0ZouilC7H
         wQqnekfIpbt2BsB/c6QukPIZ8kphOOAFpLG0gumJugrv2xzmsBwOOiha6XLYw5in39oB
         Z76R3S5szMeKNDPoT98mQa4irTogbMDGrmbfA+6RkMsve2t77bvwXA/EQa0flIlsryYI
         ImyPaCevhTAOl85nKeMDU0jbTV35V+MLOKCZzZC99EglI/2eVD5EGrWIFui3IVNfQMCg
         omvUNQTD52bfqC9wvgsis2bcrgJ8S/DkEdObY/nnhJztbqbz/rATA4RXXJ8ClWCxhI+Z
         nHqw==
X-Gm-Message-State: AOJu0YwoaDeFVM9nNUq5ew0B1hcGe8QO0vyeY/m5V884hlPFcHVZjbqy
	8qBOKNZ7E3le+NG7e6u+OWWh2axrZ3dfefuzewQUsw==
X-Google-Smtp-Source: AGHT+IF0Qm+imyEQ605WJaqcgBCjou2M4E+StpMU1j6f3I4T8OP3Gvxt6S2uZ4MvstkkZp8oaiAgvOEmwpOTuXOShyE=
X-Received: by 2002:a2e:b8c5:0:b0:2c5:8db:1c7b with SMTP id
 s5-20020a2eb8c5000000b002c508db1c7bmr5726942ljp.2.1697651142704; Wed, 18 Oct
 2023 10:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud> <20231018-flagpole-footpad-07a6228485f3@spud>
In-Reply-To: <20231018-flagpole-footpad-07a6228485f3@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:45:06 -0700
Message-ID: <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Ortiz <sameo@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023 at 10:37=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Oct 18, 2023 at 06:33:34PM +0100, Conor Dooley wrote:
> > On Wed, Oct 18, 2023 at 10:24:15AM -0700, Evan Green wrote:
> > > On Tue, Oct 17, 2023 at 6:15=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleg=
er@rivosinc.com> wrote:
> > > >
> > > > Factorize ISA extension reporting by using a macro rather than
> > > > copy/pasting extension names. This will allow adding new extensions=
 more
> > > > easily.
> > > >
> > > > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > > > ---
> > > >  arch/riscv/kernel/sys_riscv.c | 32 ++++++++++++++++++-------------=
-
> > > >  1 file changed, 18 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_=
riscv.c
> > > > index 473159b5f303..e207874e686e 100644
> > > > --- a/arch/riscv/kernel/sys_riscv.c
> > > > +++ b/arch/riscv/kernel/sys_riscv.c
> > > > @@ -145,20 +145,24 @@ static void hwprobe_isa_ext0(struct riscv_hwp=
robe *pair,
> > > >         for_each_cpu(cpu, cpus) {
> > > >                 struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
> > > >
> > > > -               if (riscv_isa_extension_available(isainfo->isa, ZBA=
))
> > > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBA;
> > > > -               else
> > > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBA;
> > > > -
> > > > -               if (riscv_isa_extension_available(isainfo->isa, ZBB=
))
> > > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBB;
> > > > -               else
> > > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBB;
> > > > -
> > > > -               if (riscv_isa_extension_available(isainfo->isa, ZBS=
))
> > > > -                       pair->value |=3D RISCV_HWPROBE_EXT_ZBS;
> > > > -               else
> > > > -                       missing |=3D RISCV_HWPROBE_EXT_ZBS;
> > > > +#define CHECK_ISA_EXT(__ext)                                      =
             \
> > > > +               do {                                               =
             \
> > > > +                       if (riscv_isa_extension_available(isainfo->=
isa, __ext)) \
> > > > +                               pair->value |=3D RISCV_HWPROBE_EXT_=
##__ext;       \
> > > > +                       else                                       =
             \
> > > > +                               missing |=3D RISCV_HWPROBE_EXT_##__=
ext;           \
> > > > +               } while (false)
> > > > +
> > > > +               /*
> > > > +                * Only use CHECK_ISA_EXT() for extensions which ca=
n be exposed
> > > > +                * to userspace, regardless of the kernel's configu=
ration, as no
> > > > +                * other checks, besides presence in the hart_isa b=
itmap, are
> > > > +                * made.
> > >
> > > This comment alludes to a dangerous trap, but I'm having trouble
> > > understanding what it is.
> >
> > You cannot, for example, use this for communicating the presence of F o=
r
> > D, since they require a config option to be set before their use is
> > safe.
>
> Funnily enough, this comment is immediately contradicted by the vector
> subset extensions, where these CHECK_ISA_EXT() macros are used wrapped
> in has_vector(). The code looks valid to me, since has_vector() contains
> the Kconfig check, but does fly in the face of this comment.


Ohh, got it. The word "can" is doing a lot of heavy lifting in that
comment. So maybe something like: "This macro performs little in the
way of extension-specific kernel readiness checks. It's assumed other
gating factors like required Kconfig settings have already been
confirmed to support exposing the given extension to usermode". ...
But, you know, make it sparkle.

-Evan
