Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7D0C6FD1C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjCVQFF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjCVQFE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 12:05:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4323A19B
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 09:05:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id by8so18304091ljb.12
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 09:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679501101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQMj+UbSGYt/V4ItEl8Atz++wkEESN6wJSeRvZafcDU=;
        b=fXDTK4UwWJxghhGY844FVJkS0jod018sFRa0JBR2+G/lVjO/CNliTnwbakz6nPokPM
         ctesUpwtgM7AtGOBQBk/KcVJvZPTuY4YB+apo51lhApvb0i6T+YI89tfIMxJFGF/7ux5
         juJINe4wcZSKbe5qz65JOk30xQa36Jqx3MzzCnYaHQ5IYG6+PO2I14y5OIXs5kxDTkdF
         1GQzH/YyUtvAXNacXkMC5rRcgMYiaWgSG03Tag7KIj9qW4H+teBEqY4enNWq8SNghfg1
         9+EuKVWvhD8tt7Fbg3arhOW22QAjiVRVddT5aSc3tb9uQ5pIPLeFLjsMPz+Guw2w8av6
         2zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQMj+UbSGYt/V4ItEl8Atz++wkEESN6wJSeRvZafcDU=;
        b=w8x/iREdj+Ml+tlF5K8HLz4tcej2Ll1E+jQP7acV5ntdg2MCwEbOJWVCYEcVMLkoxZ
         vGOjN5InkmhHA01b+ooRzfrhvyT++MY3F+poQ7Bc7kMB53aDSJ3Kf39dAvARNGTVCbtf
         c/yCCARPxSN+ahMPKrF1fx2bgw3bowaVEO53cYrYYoRI7IhNERaUFD03ytPT97TxECw9
         fnEew36sqUmHARrvEiOi33qcJIOb/gBTfoIZFsj3AzkWjOsC9+C3SQaKj8TaE6/MsWbN
         9ENdsr3/uLDkDIdLSPlYNdfmp3iK27aIrxxXV4PF3Us4zKHrihMJgGY9+xUwQ9MYJ0j6
         w0YA==
X-Gm-Message-State: AO0yUKWT8JlkOtlk5FLlusc5IGwMsHpYY5UP/56L8UTtwIYKMP9CNBjD
        S0aEh5itXwAoLfhUnnYBoucjPykEfE+fXE5ItsZqFA==
X-Google-Smtp-Source: AK7set9V3VY49u6SCjZkRbppQZLZPGl6botYkgoHJVVX0x35uhukV8uSf3SrWFeWx07P5q2ZlbHvjlPYcJhJ919zgfU=
X-Received: by 2002:a2e:7e05:0:b0:299:ac4e:a8a6 with SMTP id
 z5-20020a2e7e05000000b00299ac4ea8a6mr2145466ljc.9.1679501101548; Wed, 22 Mar
 2023 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183220.513101-1-evan@rivosinc.com> <20230314183220.513101-4-evan@rivosinc.com>
 <8e132bed-c85a-4bfd-bff8-5147db1cec32@spud>
In-Reply-To: <8e132bed-c85a-4bfd-bff8-5147db1cec32@spud>
From:   Evan Green <evan@rivosinc.com>
Date:   Wed, 22 Mar 2023 09:04:25 -0700
Message-ID: <CALs-HsskLpLg=yEfULXZNOCFeFU3M9j9Kzcj49gPtw+0VGGhzA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
To:     Conor Dooley <conor@kernel.org>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, slewis@rivosinc.com,
        heiko@sntech.de, vineetg@rivosinc.com,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yep, you and Heiko are on the same wavelength these days. I'll make that ch=
ange.
-Evan

On Wed, Mar 22, 2023 at 8:36=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Mar 14, 2023 at 11:32:17AM -0700, Evan Green wrote:
> > We have an implicit set of base behaviors that userspace depends on,
> > which are mostly defined in various ISA specifications.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> > @@ -125,6 +126,25 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> >       case RISCV_HWPROBE_KEY_MIMPID:
> >               hwprobe_arch_id(pair, cpus);
> >               break;
> > +     /*
> > +      * The kernel already assumes that the base single-letter ISA
> > +      * extensions are supported on all harts, and only supports the
> > +      * IMA base, so just cheat a bit here and tell that to
> > +      * userspace.
> > +      */
> > +     case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
> > +             pair->value =3D RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
> > +             break;
> > +
> > +     case RISCV_HWPROBE_KEY_IMA_EXT_0:
> > +             pair->value =3D 0;
> > +             if (has_fpu())
> > +                     pair->value |=3D RISCV_HWPROBE_IMA_FD;
> > +
> > +             if (elf_hwcap & RISCV_ISA_EXT_c)
>
> Random thought while reviewing another patch, and I kinda felt a bit
> stupid following the existing code to try and make sure, but should this
> become a call to riscv_isa_extension_available(NULL, c)?
> It may be nice to propagate that helper, if it works, than check the bit
> directly.
>
> Cheers,
> Conor.
>
> > +                     pair->value |=3D RISCV_HWPROBE_IMA_C;
> > +
> > +             break;
> >
> >       /*
> >        * For forward compatibility, unknown keys don't fail the whole
> > --
> > 2.25.1
> >
