Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D2C678DB
	for <linux-doc@archiver.kernel.org>; Sat,  4 Mar 2023 14:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjCDOid (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Mar 2023 09:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjCDOic (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Mar 2023 09:38:32 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C8311655
        for <linux-doc@vger.kernel.org>; Sat,  4 Mar 2023 06:38:30 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ay14so17608354edb.11
        for <linux-doc@vger.kernel.org>; Sat, 04 Mar 2023 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUAgGXgRJv+laJqNVXMEReHwclDFkLvFtLnzR72uPrw=;
        b=dIVQYAwN0oY6GneEdKUwezanImjswih8kPJ1Hk7y+unDqTtkY8DJ56+T7nzP/leXQS
         bh1YNEuYIDW8d01I+YbSNf/D7NRvv6cKg3KSzMNIjQMhrMd/XwG+YXh063tMMl1gJtS/
         jWUwmPcnIg6hLyQy/yBBnYyG29z7elYzz3FQvDmYnBANKll8Rake9Px1391rCXfcy+l4
         QuvQ3jU025f6JnPVol8kPSrtRrDzpsdxwbTKxWx+Fyvb1wCOdG5UPR75wnE0OxViPhPr
         MS6Tg5ONjHalcocp7UciaHZ17zRJ+T2HloS7ugVdM2+HIToQigNv4z/5bxXOJLAHrm6G
         1SCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUAgGXgRJv+laJqNVXMEReHwclDFkLvFtLnzR72uPrw=;
        b=ezMxf9FLQZt8CtzVQnzNdL36Koy3GKvdYzhAE3jeWHWc6zVn6dc3f4aN1txV0wrKff
         poUHUtzarEFCWye5YjCGmuJOyUX1CErt5Bh+OunIbhfxTNAjJ6PLvYy3HSlnYzcAelYf
         oN78e/4Yc9TYODbvz5d7nQbnoDG4vbl49EijNof+QJol0vIj9hVhVGGac5cSN0iIQjYo
         5/lr5dfuRH8VicF0YJckebn1+6ecTWD+hyNuLlTxLprDy9l9vEF/B7/8G6mgYz+2/NjK
         w7hYzH9cN1rRIRRRe+o1J8QW7NS+AHuegLj+x9QJMhkIA4BjsWgjwAew0DFlomOfuuM0
         qOVA==
X-Gm-Message-State: AO0yUKUxS6gTG8NYSeyg9fAFrf0cta++UlmNsDrdg5CtO5kwzFugXjtk
        jUNsmIeVEQ+p9qxWxILmsaNF0w==
X-Google-Smtp-Source: AK7set8ioNcJPp/YawVWhmtAJLjQLjVLhXcs+aVHAAieiYpxHxPO/0j30k2MStzTMMBS7PIbvmXdjg==
X-Received: by 2002:aa7:c551:0:b0:4a3:43c1:8430 with SMTP id s17-20020aa7c551000000b004a343c18430mr8483606edr.4.1677940708917;
        Sat, 04 Mar 2023 06:38:28 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r29-20020a50d69d000000b004af70c546dasm2470291edi.87.2023.03.04.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 06:38:28 -0800 (PST)
Date:   Sat, 4 Mar 2023 15:38:27 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Sunil V L <sunilvl@ventanamicro.com>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 06/20] RISC-V: Add support to build the ACPI core
Message-ID: <20230304143827.mcampnt3ehkgwu26@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-7-sunilvl@ventanamicro.com>
 <20230303153617.ko4duynxjvixy3bf@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303153617.ko4duynxjvixy3bf@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 03, 2023 at 04:36:17PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:33PM +0530, Sunil V L wrote:
> > Enable ACPI core for RISC-V after adding architecture-specific
> > interfaces and header files required to build the ACPI core.
> > 
> > 1) Couple of header files are required unconditionally by the ACPI
> > core. Add empty acenv.h and cpu.h header files.
> > 
> > 2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
> > be provided by the architecture. Define dummy interfaces for now
> > so that build succeeds. Actual implementation will be added when
> > PCI support is added for ACPI along with external interrupt
> > controller support.
> > 
> > 3) A few globals and memory mapping related functions specific
> > to the architecture need to be provided.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig             |  5 +++
> >  arch/riscv/include/asm/acenv.h | 11 +++++
> >  arch/riscv/include/asm/acpi.h  | 61 ++++++++++++++++++++++++++
> >  arch/riscv/include/asm/cpu.h   |  8 ++++
> >  arch/riscv/kernel/Makefile     |  2 +
> >  arch/riscv/kernel/acpi.c       | 80 ++++++++++++++++++++++++++++++++++
> >  6 files changed, 167 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/acenv.h
> >  create mode 100644 arch/riscv/include/asm/acpi.h
> >  create mode 100644 arch/riscv/include/asm/cpu.h
> >  create mode 100644 arch/riscv/kernel/acpi.c
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 71754eb32ee6..f3108c7e19d8 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -12,6 +12,8 @@ config 32BIT
> >  
> >  config RISCV
> >  	def_bool y
> > +	select ACPI_GENERIC_GSI if ACPI
> > +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> >  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> >  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > @@ -617,6 +619,7 @@ config EFI
> >  	depends on OF && !XIP_KERNEL
> >  	depends on MMU
> >  	default y
> > +	select ARCH_SUPPORTS_ACPI if 64BIT
> >  	select EFI_GENERIC_STUB
> >  	select EFI_PARAMS_FROM_FDT
> >  	select EFI_RUNTIME_WRAPPERS
> > @@ -720,3 +723,5 @@ source "drivers/cpufreq/Kconfig"
> >  endmenu # "CPU Power Management"
> >  
> >  source "arch/riscv/kvm/Kconfig"
> > +
> > +source "drivers/acpi/Kconfig"
> 
> The above Kconfig hunks don't apply on the IPI improvement base. The
> second hunk also looks weird with the select under the default.
> 

Just following up here; as Sunil pointed out in chat, the base is
latest master with the IPI improvement rebased. I was using the
last IPI improvement branch. So that explains the problem I had
applying this and the weirdness I was seeing with the Kconfig
lines (select/default) as compared to v2.

Thanks,
drew
