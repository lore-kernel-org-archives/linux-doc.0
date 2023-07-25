Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377A3C00528
	for <linux-doc@archiver.kernel.org>; Tue, 25 Jul 2023 07:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbjGYHh0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjGYHhN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 03:37:13 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE13B1FF5
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 00:35:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31757edd9edso1773763f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690270515; x=1690875315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy1+b1K519FpXkmyThSnFmRzN6pFlVKnNg610BuI7MA=;
        b=Y1Y741t+P9RDREXrYmfmRP7Im2iZvT/2t5X35M4FEgebyODy107yyHKGzzduzu7oVs
         7i7TfIq5srzIjlwZKmlX3jZroJNfrnIQ1x68Be5+BvAhpQdR4Lt22LovPXgMPbV9CvK2
         MHMegHGW8CQq5bNmZmYHk41U8oYO5rmNDaJmqnbL1jYGv4UPPQch0g8RH5W0u8LP9JPF
         I1P5aCQNGqjfe/Ucg4/kCJP2NiPByg0tB4y96td55gv7I751Dg+TsoK2I117gid6PH94
         VCx5HJ/z/ewrUd2Qjq0BOpLjjqMuwTAJgjyAoTZvxaNdqhXFaJOYXH/276CJxZzmv3MQ
         lE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270515; x=1690875315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy1+b1K519FpXkmyThSnFmRzN6pFlVKnNg610BuI7MA=;
        b=S3/00XK8He1Pu7TKrdRE2D8ov9F3EDg/ZyNuzBEQXtcESzgzflhF57x7lT4zw2Z9nD
         aw5ebvKUxVU+xDAv38uh136rqFVuJgHMiThxusI0hT+95LzsbCZR/sySRgJmCD0GFIg2
         cpF1rGV7ArIyuYq1HwoPLNLEmUrIY3rdBtoBQCBNhlV+9bUMauVIVy0lzhddnv6ULah2
         virthiSEPvqR8nbG0rcj8b50F58BuVY+A5svnNWfaKIhb8vK/cQTI6uLivi2JNR2Y6OE
         KADsEs5dbpLa7CJOBPaYClTMAuxIqI3EB6UYN7oBm4R5+A5O7IbucNVNTQ3Ek6ecsW3X
         Na1Q==
X-Gm-Message-State: ABy/qLZoQ3udHuqRyaHwQcjlNrLz36KEq3iiimuzn+uvHm/gqHJpyRWW
        lDz61P0MFjXJDovYO6qRfqAnLCaNe8uZrBlNwvez790K5yr5vyjj
X-Google-Smtp-Source: APBJJlEgoVwzOTj4qyh7bbPD5Y148/nsOgK9/pmcLRCusowR2d/kOU/yMmm/J3uwnDa9WNI+wzL+eqTf98zs6wW3zLg=
X-Received: by 2002:a5d:4e12:0:b0:317:69d2:35c2 with SMTP id
 p18-20020a5d4e12000000b0031769d235c2mr1018661wrt.2.1690270514987; Tue, 25 Jul
 2023 00:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722113445.630714-1-alexghiti@rivosinc.com>
 <20230722113445.630714-2-alexghiti@rivosinc.com> <b0826064-0cd6-dfd0-a377-5cd56c4035be@infradead.org>
In-Reply-To: <b0826064-0cd6-dfd0-a377-5cd56c4035be@infradead.org>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Tue, 25 Jul 2023 09:35:04 +0200
Message-ID: <CAHVXubg_gGqLnoCaQCLe4SgS4eVT0rqSTC1DHc+-CEmifH6V6Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] Documentation: riscv: Add early boot document
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

On Sat, Jul 22, 2023 at 10:19=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Hi,
>
> On 7/22/23 04:34, Alexandre Ghiti wrote:
> > This document describes the constraints and requirements of the early
> > boot process in a RISC-V kernel.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> > - Changes in v5:
> >   * Rebase on top of docs-next
> >
> >  Documentation/riscv/boot-image-header.rst |   3 -
> >  Documentation/riscv/boot.rst              | 169 ++++++++++++++++++++++
> >  Documentation/riscv/index.rst             |   1 +
> >  3 files changed, 170 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/riscv/boot.rst
> >
>
> > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rs=
t
> > new file mode 100644
> > index 000000000000..f890ac442c91
> > --- /dev/null
> > +++ b/Documentation/riscv/boot.rst
> > @@ -0,0 +1,169 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +RISC-V Kernel Boot Requirements and Constraints
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > +:Date: 23 May 2023
> > +
> > +This document describes what the RISC-V kernel expects from bootloader=
s and
> > +firmware, but also the constraints that any developer must have in min=
d when
>
> I would s/but/and/.

Ok I change that, thanks.

>
> > +touching the early boot process. For the purposes of this document, th=
e
> > +``early boot process`` refers to any code that runs before the final v=
irtual
> > +mapping is set up.
> > +
> > +Pre-kernel Requirements and Constraints
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The RISC-V kernel expects the following of bootloaders and platform fi=
rmware:
> > +
> > +Register state
> > +--------------
> > +
> > +The RISC-V kernel expects:
> > +
> > +  * ``$a0`` to contain the hartid of the current core.
> > +  * ``$a1`` to contain the address of the devicetree in memory.
> > +
> > +CSR state
> > +---------
> > +
> > +The RISC-V kernel expects:
> > +
> > +  * ``$satp =3D 0``: the MMU, if present, must be disabled.
> > +
> > +Reserved memory for resident firmware
> > +-------------------------------------
> > +
> > +The RISC-V kernel must not map any resident memory, or memory protecte=
d with
> > +PMPs, in the direct mapping, so the firmware must correctly mark those=
 regions
> > +as per the devicetree specification and/or the UEFI specification.
> > +
> > +Kernel location
> > +---------------
> > +
> > +The RISC-V kernel expects to be placed at a PMD boundary (2MB aligned =
for rv64
> > +and 4MB aligned for rv32). Note that the EFI stub will physically relo=
cate the
> > +kernel if that's not the case.
> > +
> > +Hardware description
> > +--------------------
> > +
> > +The firmware can pass either a devicetree or ACPI tables to the RISC-V=
 kernel.
> > +
> > +The devicetree is either passed directly to the kernel from the previo=
us stage
> > +using the ``$a1`` register, or when booting with UEFI, it can be passe=
d using the
> > +EFI configuration table.
> > +
> > +The ACPI tables are passed to the kernel using the EFI configuration t=
able. In
> > +this case, a tiny devicetree is still created by the EFI stub. Please =
refer to
> > +"EFI stub and devicetree" section below for details about this devicet=
ree.
> > +
> > +Kernel entrance
> > +---------------
>
> How about "entry" instead of "entrance"?

I have to admit that I don't have the nuance between both words, if
'entry' is more appropriate, I'll change it.

>
> > +
> > +On SMP systems, there are 2 methods to enter the kernel:
> > +
> > +- ``RISCV_BOOT_SPINWAIT``: the firmware releases all harts in the kern=
el, one hart
> > +  wins a lottery and executes the early boot code while the other hart=
s are
> > +  parked waiting for the initialization to finish. This method is most=
ly used to
> > +  support older firmwares without SBI HSM extension and M-mode RISC-V =
kernel.
> > +- ``Ordered booting``: the firmware releases only one hart that will e=
xecute the
> > +  initialization phase and then will start all other harts using the S=
BI HSM
> > +  extension. The ordered booting method is the preferred booting metho=
d for
> > +  booting the RISC-V kernel because it can support cpu hotplug and kex=
ec.
>
> preferably s/cpu/CPU/

Done!

>
> > +
> > +UEFI
> > +----
>
> [snip]
>
> I can't say how correct the documentation is, but it is well-written
> and has no issues with punctuation, grammar, or spelling AFAICT, so
> you can take this if you want it:
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for the nice comments, @Conor Dooley (and others) really helped!

I'll respin a new version today,

Alex

>
> thanks.
> --
> ~Randy
