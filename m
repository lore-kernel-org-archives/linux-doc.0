Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72891C41513
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 08:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbjHDITl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 04:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbjHDITk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 04:19:40 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED23E6B
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 01:19:38 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68706b39c4cso1288913b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 01:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691137178; x=1691741978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6p8ZmyjWt9EkIhx2x7mQdHkPI32JR/rPIgt/KaUyrM=;
        b=Xy7UXj5rKhL+uu8tkHk9ALkF9uUbocA2LUGuUDTCT+UGGvvTrismPG1zBkJkoUphar
         GFIBh9B6MWwxSsxdU7gxlE57mN66vXeN52obzKwYx5CxoHQybxqezGy7NIg+855c764S
         XNF/oYMsJJ5Rt/2MYOeT2lTd6jXCIw8p1xhmuAbrL+ZL+sCs0RmmNBE1mk+AOBq6Eq9W
         F4pwgeCm+zv78ejFX6n1IKU186BdKmiIkBCc3ojk6wDZAKKAN2w8IQf6CZtDJd5Pa6Dq
         /f/CXnPRCEHLAkvvcZXchDfjlnHhtZnzkRvEjbeedsy/ciaI5ykfwG3vd5RKwNUEGKzl
         UCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691137178; x=1691741978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6p8ZmyjWt9EkIhx2x7mQdHkPI32JR/rPIgt/KaUyrM=;
        b=Uabomt3ymuIrE5RZkF3+Af48WP5yo5G48Zf9rVVS0b3Kw84wMWirloWbnDVlenmAWG
         WO5aLnhyCTsN4QaT6VWjXNf2y8m/kKiFt7QRBU3koDA4iryHsFl8jhrPB9qxKqqrfFeH
         lQAYPBcSn/hHjYYxX0emuJWhnyLkU/UHZfKDqN4NFKwjmaCMsZdB7ydHyy07LAGLw8fN
         lvbXtyzyzJsCf/yO7LsuAe5EtmZBIM5udMUE/nsSDwAb4cxmiCSSFmFByXLbiq0lyACo
         mWoHFQBe3+3i4UG7YKvPoPx9UL40PAugxxS9jarPl2ij6X/GhHJwcyJ9aJ1jDQw7/vve
         3bvw==
X-Gm-Message-State: AOJu0YyYTJisf1h3DyjKpI5HUlj+keSuucPq5mY25oaQ80mYFRManfAp
        TtFhDYSB7NfDcIqQizT5VGpbpw==
X-Google-Smtp-Source: AGHT+IFmU2okWiufqxbBgTJlqhXztctK8e0s9XMhsjLRvyxOqapi7NDJcuaofoqHVSzZkHv7M/zO9Q==
X-Received: by 2002:a05:6a20:938a:b0:13e:8ce5:cacd with SMTP id x10-20020a056a20938a00b0013e8ce5cacdmr944703pzh.26.1691137177799;
        Fri, 04 Aug 2023 01:19:37 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0068620bee456sm1046915pfd.209.2023.08.04.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:19:37 -0700 (PDT)
Date:   Fri, 4 Aug 2023 13:49:24 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <anup@brainfault.org>,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Moore <robert.moore@intel.com>,
        Haibo Xu <haibo1.xu@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [RFC PATCH v1 04/21] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <ZMy0jC55N0+nKEye@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-5-sunilvl@ventanamicro.com>
 <ZMyRCRRkTnR/sK0u@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMyRCRRkTnR/sK0u@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 04, 2023 at 08:47:53AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:28:59PM +0530, Sunil V L wrote:
> > Enhance the acpi_os_ioremap() to support opregions in MMIO
> > space. Also, have strict checks using EFI memory map
> > to allow remapping the RAM similar to arm64.
> > 
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> You may use --cc to the command line when forming patches.
> 
> Also we usually consider Cc: as a part of the tag block, meaning no blank line
> should be here.
> 
Thanks!, Andy. I specifically wanted Ard and Alex to look at this patch
and hence added Cc. I was not aware that no blank line should be there.
Thanks for letting me know.

> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> ...
> 
> >  #include <linux/io.h>
> >  #include <linux/pci.h>
> >  #include <linux/efi.h>
> > +#include <linux/memblock.h>
> 
> Can you squeeze it to have some order, like to be after io.h (taking into
> account given context)?
> 
Yeah, sure. Let me update in next version.

> ...
> 
> > +			if (memblock_is_map_memory(phys) ||
> > +			    !memblock_is_region_memory(phys, size)) {
> > +				pr_warn(FW_BUG "requested region covers kernel memory @ %p\n",
> > +					&phys);
> 
> How %p can be useful here (it's mangled), but also wouldn't this give a hint to
> an attacker about the kernel memory location and diminish the KASLR protection?
> (IIRC after boot we always have the same salt for the mangling the pointers when
>  printing, so at least theoretically it might be possible to bruteforce the
>  printing algo to give a clue about the kernel address.)
> 
Okay. This is copied from arm64 version. But I think this is a good
point. Let me just print the warning message without address in the next
version.

Thanks!
Sunil
