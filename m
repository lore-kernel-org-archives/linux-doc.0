Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142B9C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 14 Dec 2022 16:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiLNQiX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Dec 2022 11:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238502AbiLNQiW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Dec 2022 11:38:22 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB14B60E7
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 08:38:20 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h10so319559wrx.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Dec 2022 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XQ9UK+L/0iK+KFqjWQesqR3gEiIaaEkyB4WhDQSSEk=;
        b=1sRvZWk4v6BhCyZTXJ2+f46RRZoXBbAchW/Nd0IonBe71PFBY3xQlZJN78/B1C9AOX
         O6U60oJ6kHQUPkFxgtYaux8Z8Fz+bVSKvBTLykYbGs5prvLBsaqwXgWA0XV/ice73Hdf
         oyz7kh52knuU7/BrncKSqlfagE7nHPX4LaaaoYADWYkF3baBh0tDQXVbXNlj+KL6St5x
         lxvKv88iCD2u8zD/Wm89B0n6pfUBOjctLvm+HkFc/sqZG/Bx8btVe/MC/JOZN3vDCW1B
         4i7BO8w0bu5RWUH2A5OAHRRc9OupsX7aegDRYTPXh8MsbK8IJcJlCoNc6CptrKQ2pg50
         ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XQ9UK+L/0iK+KFqjWQesqR3gEiIaaEkyB4WhDQSSEk=;
        b=P2NXSrf9qaUbt5BSW8qDVOwLVKgYHoKx36UiwuODfRCxxATZ2MxMiHDVBRK9bp3IOs
         I4wznO0FxvdE652dIp1XNOy6ny0vUqxVnqhmT8XExH1c7sjdxStQpDSHBHZ4xONZgghH
         oBFd6mDtHxjtA8thR7cVI7Rj98EDFDHywJXz7kSj+cHPhrZQ2nNpvhBgMpgvBgIDAfRZ
         GxL2rQitxKoKpXS6rg0OCxDtaAdGaoF1e8t/3crNqZhnX0nrAhu0bd2l+/KNeHViDVrm
         J7W/zfcCq9jUcRv6g0zMWK+YYBrmq9rQZ/pV9HXGSSbAqUSkWn69AadgaIY5ARKSAvIK
         zAIA==
X-Gm-Message-State: ANoB5plRiMrxfiIF0SegOCsDNFCjXzJ0NzQBOXTuIoEdx/DPdM43mBnI
        lqnTXptuue8HhvEaSPYIeF1auQC5p8BAknQSDy7T9w==
X-Google-Smtp-Source: AA0mqf7Vq9T9tV5/hj5nHZjSecDz/ZDSCVTGbOpMMHcUxGzyHQ6ylbSGIsEibGaAkuvj3IzOFsHOLo7QrFmxZzz/y1E=
X-Received: by 2002:a05:6000:1a4e:b0:242:71b:e3cf with SMTP id
 t14-20020a0560001a4e00b00242071be3cfmr36380152wry.144.1671035899393; Wed, 14
 Dec 2022 08:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20221214143311.960266-1-alexghiti@rivosinc.com> <87cz8m3sha.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87cz8m3sha.fsf@all.your.base.are.belong.to.us>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Wed, 14 Dec 2022 17:38:08 +0100
Message-ID: <CAHVXubidb5gQBHSFMJiY=egoi4QOiqOh884VvAhxYqADxNDB6A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Allow to downgrade paging mode from the command line
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 14, 2022 at 4:39 PM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wr=
ote:
>
> Alexandre Ghiti <alexghiti@rivosinc.com> writes:
>
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index b56a0a75533f..8140fefe0e57 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -752,12 +752,35 @@ static void __init disable_pgtable_l4(void)
> >   * then read SATP to see if the configuration was taken into account
> >   * meaning sv48 is supported.
> >   */
> > -static __init void set_satp_mode(void)
> > +static __init void set_satp_mode(uintptr_t dtb_pa)
> >  {
> >       u64 identity_satp, hw_satp;
> >       uintptr_t set_satp_mode_pmd =3D ((unsigned long)set_satp_mode) & =
PMD_MASK;
> >       bool check_l4 =3D false;
> >
> > +#ifndef CONFIG_KASAN
> > +     /*
> > +      * The below fdt functions are kasan instrumented, since at this =
point
> > +      * there is no mapping for the kasan shadow memory, this can't be=
 used
> > +      * when kasan is enabled.
> > +      */
> > +     int chosen_node;
> > +
> > +     chosen_node =3D fdt_path_offset((void *)dtb_pa, "/chosen");
> > +     if (chosen_node >=3D 0) {
> > +             const char *cmdline =3D fdt_getprop((void *)dtb_pa, chose=
n_node,
> > +                                               "bootargs", NULL);
>
> The command line handling needs to honor CONFIG_CMDLINE_FORCE and
> CONFIG_CMDLINE_EXTEND (which makes it possible to use no{4,5}lvl *and*
> KASAN ;-)).
>

Indeed, I forgot that, thanks for noticing! I'll prepare the "real"
command line before matching the new parameters.

Thanks again,

Alex

>
> Bj=C3=B6rn
