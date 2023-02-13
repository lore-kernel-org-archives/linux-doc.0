Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A7AC636CC
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 15:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjBMPRi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 10:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbjBMPRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 10:17:31 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EB61E5E9
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 07:17:10 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id oa11-20020a17090b1bcb00b002341a2656e5so979969pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 07:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fW9P4YF/3a14nOH87/GWxu30MpWhz8jhu4XnTy7s6ak=;
        b=h5Vlh1gY5rc7zpbKn+Y6D2QfpTGNjy5blXlIPIP/vu9xDQiPFQEknETCY/aSdY2Ixf
         XmT1+6F8o+mk/rfKRcJ1MgxW3LUNh4GucCzZkiKFGnGReu5hv7PZwldXIsevouVROrwL
         Wr6CsQJR4XU3q2Gl076MmPfJa0JUY3wAcq9ADPb+4hwlTGNl+D4XgR6Qv50M9sOJ5KqX
         r5v/a/1rHYBF/VlaBklsAOx5yYs4x8zjyPmbXd8i4ihGWSwcBLQ6UrbO/1/A83XWpaVc
         xj+G31N3gGli3nHdiMDD88MCqtMkdeRWTPGBOpuLd6xF1E3B7M6rWgnQ4u69IsTJ2Y55
         FhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW9P4YF/3a14nOH87/GWxu30MpWhz8jhu4XnTy7s6ak=;
        b=1sFZDtYn1PkKI4FAzPeIfk4aCxpHgJ0c2ch664ayJoNqS7wd/thcKgfITs/sMSj3QJ
         MCNaeOTpD+X6lWzmCFR7cgGS4u9BFaNyPPQhW1+oQN/b5hH6Y3og5H3F+lO6GHLxAITM
         TQo6uAlj0Ty+9HleSg2C5morqhopaXyu3PkF9UnLjVjCVM/7CUJ9pAvRsx+MXHtQhlaI
         kAj12ixYUcayuGqSIxOs7BY5TQi7adhN2gIMZ7FNIxdqLSyJJX5vYrKPvw0gq3s70gi8
         TurhyV3nlo5b0DtwRvHO4y64WaiQiofVEklR/w/gbH9hW8FWTCd8cYk5g3m7NepsCkK9
         /+/Q==
X-Gm-Message-State: AO0yUKWYRL8ffCvPmfMtzCoPfQhSBNG+rg820vZUDbPAzUb9vH/Q/ny7
        HZ3nj2s/mg65mnupxX24wTVc7aaew5aA1WHa
X-Google-Smtp-Source: AK7set+fu87w7xVckZc0DhTU5ZxMyzfrfk9Q5YAK7jJg7eAg2wOdCS49Vbz2Fhc1bhaHIkiNCkZvmg==
X-Received: by 2002:a05:6a20:3cac:b0:b8:7905:b6c4 with SMTP id b44-20020a056a203cac00b000b87905b6c4mr28794030pzj.61.1676301425646;
        Mon, 13 Feb 2023 07:17:05 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id v17-20020a62a511000000b005825b8e0540sm8052212pfm.204.2023.02.13.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:17:04 -0800 (PST)
Date:   Mon, 13 Feb 2023 20:46:56 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 05/24] RISC-V: ACPI: Add basic functions to build ACPI
 core
Message-ID: <Y+pUaAsaTBm9vPgO@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-6-sunilvl@ventanamicro.com>
 <Y+QM9zQyJfSgzc7R@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+QM9zQyJfSgzc7R@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 08, 2023 at 08:58:31PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:06PM +0530, Sunil V L wrote:
> > Introduce acpi.c and its related header files to provide
> > fundamental needs of extern variables and functions for ACPI core.
> > 	- asm/acpi.h for arch specific variables and functions needed by
> > 	  ACPI driver core;
> > 	- acpi.c - Add function to initialize ACPI tables.
> > 	- acpi.c for RISC-V related ACPI implementation for ACPI driver
> > 	  core;
> > 
> > Code is mostly leveraged from ARM64.
> 
> 
> 
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> 
> > + * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> rg "\bpage_init\("
> arch/riscv/kernel/acpi.c
> 54: * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> arch/arm64/kernel/acpi.c
> 86: * __acpi_map_table() will be called before page_init(), so early_ioremap()
> 
> This function doesn't appear to exist, perhaps what you are looking for is
> paging_init()?
> 
Yes, will update.

> > + * or early_memremap() should be called here to for ACPI table mapping.
> > + */
> > +void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
> > +{
> > +	if (!size)
> > +		return NULL;
> > +
> > +	return early_memremap(phys, size);
> > +}
> 
> > +void __init acpi_boot_table_init(void)
> > +{
> > +	/*
> > +	 * Enable ACPI instead of device tree unless
> > +	 * - ACPI has been disabled explicitly (acpi=off), or
> > +	 * - firmware has not populated ACPI ptr in EFI system table
> > +	 */
> > +
> > +	if (param_acpi_off || (efi.acpi20 == EFI_INVALID_TABLE_ADDR))
> 
> There's an extraneous set of () around the second item here.
> 
Okay.
> > +		goto done;
> > +	/*
> 
> A small nit: a newline before opening the comment block here please!

Thanks, will fix these in the next revision.
-Sunil

