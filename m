Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EB4EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 08:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjFTIOY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 04:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjFTIOX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 04:14:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA4D9E
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 01:14:21 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f918922954so20251345e9.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 01:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687248860; x=1689840860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQbdggw74AN0qE4N6rw9FwT496orbg2m9a2V0ULV/Uw=;
        b=qeI0jNx4MMXFY5pvb2+qLIUHE7ZFkv9z5nksQ+dxl7WQDJDA6+otDYPwrUmXxmcMc7
         OwY/zr/aawnu6IYyKH0dL4oTgDWILHJ8GE4g7oM4ZXA44gQCTVks6rRprW25HTKvFTCe
         Y/kcZOLY0w/EttyjMfaGUb2cOvcA8GAA1i+SIrr9fKqmIpVL8OC0Wy4v6543snbr7Osi
         hMsqWpBVWBjzsVHJrPwqBJDJjYH+PEKgscMI+vADvpubrPH+k69kTmWDJ1SgwO90Xa2/
         eLre4gs9T3eHRkhofGMc6nIUp+6nh3QXJPGHQpvxVMOu2DHff/Y32hNGd0RVHbuGMvWU
         Wk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687248860; x=1689840860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQbdggw74AN0qE4N6rw9FwT496orbg2m9a2V0ULV/Uw=;
        b=axnoFasUDX6ZCG2cQBSY0XZCREJ/IwPELY1DmzdY8Fktx4I8kxZEstw5JBojk9LSjq
         9Z2WzgR6uNgGK2KAVbitHlJcPBVT9xDyd6/6DfKbQgtyxXpy6oFElMvmUs7bj4FyLuL+
         wQEI1kft0gaOHOS/WoRTarJfJPO65ffPJSkNiwEuMTSgaHAmR5Ka0W4kERgcyZm3lvsF
         el814DhzBbSxrU0lFqZu4jqe78ObJmXZyXuATota8+IWjOpzDnNuHwpBfym0kgIpBCSJ
         0EU1dY8D9jAHCGRpKZKZaGaxKHf8+S6Po0Wnwjj04wuFTo0Hvb+VqkzyQySbZT+mzAZJ
         yShQ==
X-Gm-Message-State: AC+VfDzU8YhAwamcDOulzPB5dXw/YK8Vh9GtirsYu8I0lP9SOGeGqDyD
        DjgTAvBiYCuSEj8bC+KWazh6dQFbNqz6z0hLEKIeQw==
X-Google-Smtp-Source: ACHHUZ5rqXNURmljNNaXdt2sxgcF4jdXG62ZAho+mTu2bFDoCR6HsKSjbY5W5NzBKLCkQujzUGfPXnfTUJlhfbfEcQ8=
X-Received: by 2002:a05:600c:2252:b0:3f9:14c:11d3 with SMTP id
 a18-20020a05600c225200b003f9014c11d3mr5850732wmm.12.1687248860464; Tue, 20
 Jun 2023 01:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com> <ZJFS1K/LltE57MJ4@sunil-laptop>
In-Reply-To: <ZJFS1K/LltE57MJ4@sunil-laptop>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Tue, 20 Jun 2023 10:14:09 +0200
Message-ID: <CAHVXubhcStveNOzwA8i0R79P3spR7m1oEbWtBXaVSr2-bL3mvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
To:     Sunil V L <sunilvl@ventanamicro.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 20, 2023 at 9:18=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Hey Alex,
>
> Many thanks for writing this up!
>
> On Mon, Jun 19, 2023 at 11:49:13AM +0200, Alexandre Ghiti wrote:
> > @Sunil V L Something about ACPI is more than welcome :)
> >
> > And thanks to @Bj=C3=B6rn T=C3=B6pel and @Atish Kumar Patra for helping=
 in
> > writing this document!
> >
> > On Mon, Jun 19, 2023 at 11:47=E2=80=AFAM Alexandre Ghiti <alexghiti@riv=
osinc.com> wrote:
> > >
> > > This document describes the constraints and requirements of the early
> > > boot process in a RISC-V kernel.
> > >
> > > Szigned-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  Documentation/riscv/boot-image-header.rst |   3 -
> > >  Documentation/riscv/boot.rst              | 181 ++++++++++++++++++++=
++
> > >  Documentation/riscv/index.rst             |   1 +
> > >  3 files changed, 182 insertions(+), 3 deletions(-)
> > >  create mode 100644 Documentation/riscv/boot.rst
> > >
> > > diff --git a/Documentation/riscv/boot-image-header.rst b/Documentatio=
n/riscv/boot-image-header.rst
> > > index d7752533865f..a4a45310c4c4 100644
> > > --- a/Documentation/riscv/boot-image-header.rst
> > > +++ b/Documentation/riscv/boot-image-header.rst
> > > @@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
> > >
> > >  This document only describes the boot image header details for RISC-=
V Linux.
> > >
> > > -TODO:
> > > -  Write a complete booting guide.
> > > -
> > >  The following 64-byte header is present in decompressed Linux kernel=
 image::
> > >
> > >         u32 code0;                /* Executable code */
> > > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.=
rst
> > > new file mode 100644
> > > index 000000000000..b02230818b79
> > > --- /dev/null
> > > +++ b/Documentation/riscv/boot.rst
> > > @@ -0,0 +1,181 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Early boot requirements/constraints on RISC-V
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > +:Date: 23 May 2023
> > > +
> > > +This document describes what the RISC-V kernel expects from the prev=
ious stages
> > > +and the firmware, but also the constraints that any developer must h=
ave in mind
> > > +when touching the early boot process, e.g. before the final virtual =
mapping is
> > > +setup.
> > > +
> > > +Pre-kernel boot (Expectations from firmware)
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Registers state
> > > +---------------
> > > +
> > > +The RISC-V kernel expects:
> > > +
> > > +  * `$a0` to contain the hartid of the current core.
> > > +  * `$a1` to contain the address of the device tree in memory.
> > > +
> > > +CSR state
> > > +---------
> > > +
> > > +The RISC-V kernel expects:
> > > +
> > > +  * `$satp =3D 0`: the MMU must be disabled.
> > > +
> > > +Reserved memory for resident firmware
> > > +-------------------------------------
> > > +
> > > +The RISC-V kernel expects the firmware to mark any resident memory w=
ith the
> > > +`no-map` flag, thus the kernel won't map those regions in the direct=
 mapping
> > > +(avoiding issues with hibernation, speculative accesses and probably=
 other
> > > +subsystems).
> > > +
> > > +Kernel location
> > > +---------------
> > > +
> > > +The RISC-V kernel expects to be placed at a PMD boundary (2MB for rv=
64 and 4MB
> > > +for rv32). Note though that the EFI stub will physically relocate th=
e kernel if
> > > +that's not the case.
> > > +
> > > +Device-tree
> > > +-----------
> > > +
> > > +The RISC-V kernel always expects a device tree, it is:
> > > +
> In general, the firmware can pass either DT or ACPI (not both at the
> same time) to the OS. So, I think the statement that kernel always
> expects DT probably causes confusion. Can we mention some thing like
> below?
>
> The firmware can pass either DeviceTree or ACPI tables to the RISC-V
> kernel.
>
> The DeviceTree is either passed directly to the kernel from the
> previous stage using the `$a1` register, or when booting with UEFI, it
> can be passed using the EFI configuration table.
>
> The ACPI tables are passed to the kernel using the EFI configuration
> table. In this case, a tiny DeviceTree is still created by the EFI
> stub. Please refer to "EFI stub and device" tree section below for
> details of the tiny DeviceTree.
>

Great, this is way better so I'll go with that:

Hardware description
--------------------

The firmware can pass either a devicetree or ACPI tables to the RISC-V kern=
el.

The devicetree is either passed directly to the kernel from the previous st=
age
using the `$a1` register, or when booting with UEFI, it can be passed
using the
EFI configuration table.

The ACPI tables are passed to the kernel using the EFI configuration table.=
 In
this case, a tiny devicetree is still created by the EFI stub. Please refer=
 to
"EFI stub and devicetree" tree section below for details about this devicet=
ree.

Thanks!

> Thanks,
> Sunil
