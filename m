Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9CDEB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 07:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjFTHSz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 03:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjFTHSw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 03:18:52 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCB5EA
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 00:18:51 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-39ed35dfa91so1406160b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687245530; x=1689837530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GUUYJwzB+/81t+QqwYXl7JaMezVbu3J4sAop8uSN7n0=;
        b=T0y9hsPa+jPUTVxUkXz+0ICo2jn5rn+hiUsX/dFa5RadKbF1gzcyfUYWAY4aGTpxwD
         ZBtdUA8plTc2UqbRyfn8cKPYRkFXH3QpVhToC9CYrn8Qujep8sW6frbR4txxejhcuBP1
         HPUQpOLVuzbh4UW4ud9udMhBegliJITKwJGJwiHa5G+A0RH2yKt/hvNQG0BNiOgy49AH
         XpQhCpkJdAC1agryyj1t17HiquhIDa0cYk+ew7WGs5YSSHGsl+FEkzclYtVt2fdHFtBd
         SAf749Qj11D/dGIpJyZ7vJ8xFUg91jczUVZhYdzCneeXdXp4/OnT42igbld0EVHPEw3G
         60xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687245530; x=1689837530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUUYJwzB+/81t+QqwYXl7JaMezVbu3J4sAop8uSN7n0=;
        b=Xl2/jrtCJIqDjMLX8OnNb7APkzs8K92ylSakta/TAv0sfFoBK40gu3gp2tIJdREXE2
         x7GwaGSKCLkzPe9P7nKfSycdP3fdfvcvuO2fQvmKEy+mDcXXq10xOM8n8XEzwkW8UhQN
         rAM2TNrWDEAk+ZLYizQcf7IgYRK0raxUX5CshFVhNuQ0IO+ezJP6D8TRfZf/o+qYkoNL
         u7+zKqqNRuXD8lM040tV8JNLXE77AtgnQ/K0qvbrk2Kd0K6flpxatjr0vp4Cr7N5xhcT
         DPw0vWr2nlfVIeOlUQcsK/cFbwUnOF6uew597J9m6ZjKPI4y02FEEXv6m//qlti5VNs3
         ERNg==
X-Gm-Message-State: AC+VfDyor6AaGGLT3j01DlFRqk4qMGnaFZEPI+V+nzXrscsQCxGhAQIJ
        cZnvH6hJrr4Gj/7zsO2UJruGmQ==
X-Google-Smtp-Source: ACHHUZ76mpc84tL5SCQDDRTPwRHiQaar30lEGbUyp8ywnhEF/JtZ8To/ByVviDLmfe4jc2+uod5cFA==
X-Received: by 2002:a05:6808:200e:b0:39a:ab69:778e with SMTP id q14-20020a056808200e00b0039aab69778emr11361190oiw.23.1687245530444;
        Tue, 20 Jun 2023 00:18:50 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090a2a8a00b0025e2358f146sm7168228pjd.13.2023.06.20.00.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:18:50 -0700 (PDT)
Date:   Tue, 20 Jun 2023 12:48:44 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <ZJFS1K/LltE57MJ4@sunil-laptop>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHVXubjOUeEtnFnERjT2YOG+h5=2YX7kxeEBFSStO3WZvcv36A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey Alex,

Many thanks for writing this up!

On Mon, Jun 19, 2023 at 11:49:13AM +0200, Alexandre Ghiti wrote:
> @Sunil V L Something about ACPI is more than welcome :)
> 
> And thanks to @Björn Töpel and @Atish Kumar Patra for helping in
> writing this document!
> 
> On Mon, Jun 19, 2023 at 11:47 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > This document describes the constraints and requirements of the early
> > boot process in a RISC-V kernel.
> >
> > Szigned-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  Documentation/riscv/boot-image-header.rst |   3 -
> >  Documentation/riscv/boot.rst              | 181 ++++++++++++++++++++++
> >  Documentation/riscv/index.rst             |   1 +
> >  3 files changed, 182 insertions(+), 3 deletions(-)
> >  create mode 100644 Documentation/riscv/boot.rst
> >
> > diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
> > index d7752533865f..a4a45310c4c4 100644
> > --- a/Documentation/riscv/boot-image-header.rst
> > +++ b/Documentation/riscv/boot-image-header.rst
> > @@ -7,9 +7,6 @@ Boot image header in RISC-V Linux
> >
> >  This document only describes the boot image header details for RISC-V Linux.
> >
> > -TODO:
> > -  Write a complete booting guide.
> > -
> >  The following 64-byte header is present in decompressed Linux kernel image::
> >
> >         u32 code0;                /* Executable code */
> > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.rst
> > new file mode 100644
> > index 000000000000..b02230818b79
> > --- /dev/null
> > +++ b/Documentation/riscv/boot.rst
> > @@ -0,0 +1,181 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=============================================
> > +Early boot requirements/constraints on RISC-V
> > +=============================================
> > +
> > +:Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > +:Date: 23 May 2023
> > +
> > +This document describes what the RISC-V kernel expects from the previous stages
> > +and the firmware, but also the constraints that any developer must have in mind
> > +when touching the early boot process, e.g. before the final virtual mapping is
> > +setup.
> > +
> > +Pre-kernel boot (Expectations from firmware)
> > +============================================
> > +
> > +Registers state
> > +---------------
> > +
> > +The RISC-V kernel expects:
> > +
> > +  * `$a0` to contain the hartid of the current core.
> > +  * `$a1` to contain the address of the device tree in memory.
> > +
> > +CSR state
> > +---------
> > +
> > +The RISC-V kernel expects:
> > +
> > +  * `$satp = 0`: the MMU must be disabled.
> > +
> > +Reserved memory for resident firmware
> > +-------------------------------------
> > +
> > +The RISC-V kernel expects the firmware to mark any resident memory with the
> > +`no-map` flag, thus the kernel won't map those regions in the direct mapping
> > +(avoiding issues with hibernation, speculative accesses and probably other
> > +subsystems).
> > +
> > +Kernel location
> > +---------------
> > +
> > +The RISC-V kernel expects to be placed at a PMD boundary (2MB for rv64 and 4MB
> > +for rv32). Note though that the EFI stub will physically relocate the kernel if
> > +that's not the case.
> > +
> > +Device-tree
> > +-----------
> > +
> > +The RISC-V kernel always expects a device tree, it is:
> > +
In general, the firmware can pass either DT or ACPI (not both at the
same time) to the OS. So, I think the statement that kernel always
expects DT probably causes confusion. Can we mention some thing like
below?

The firmware can pass either DeviceTree or ACPI tables to the RISC-V
kernel.

The DeviceTree is either passed directly to the kernel from the
previous stage using the `$a1` register, or when booting with UEFI, it
can be passed using the EFI configuration table.

The ACPI tables are passed to the kernel using the EFI configuration
table. In this case, a tiny DeviceTree is still created by the EFI
stub. Please refer to "EFI stub and device" tree section below for
details of the tiny DeviceTree.

Thanks,
Sunil
