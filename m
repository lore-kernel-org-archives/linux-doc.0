Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C73C6379F
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 17:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjBMRwh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 12:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjBMRwg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 12:52:36 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE261EFD9
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:52:34 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id n2so8490066pfo.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlT2nrHv97JEE2ugERQ9alO7/A7bMkftqWFyBvOXtUI=;
        b=pEaBHwVMb2YtjHC6RClUo8awsFmuS0Ru/0SJyXX8QrgJRN9D+hDCgtwuw+Lf4Q041k
         BuZF4Mxjg35xZ9xf7vFYYxMFwU/KF5H4MlNMbKGVF3jh54e3bCD7Ju2EEW4rDhcLEbvG
         +xkqtWj7AGrhPIv6bFc2Ab/mWo6hGTAwMQTTkVwvSEn2vjzT4IbMyZFsSYeNUBmcnJxS
         d/sHjBEV1PGvCSvD+XZG5jk74Of3zbaDZX07fLYFWs6GgOPX4yPZjaOBM2cftIUXSltR
         acBQGViAGcWI40++cyXnGnxKadZHJ1Uk0gPpMlIrnYXuFDkkAXE2TG/+tlvxrT80Lada
         DGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlT2nrHv97JEE2ugERQ9alO7/A7bMkftqWFyBvOXtUI=;
        b=7iN9xq6kxKJRZxtyjwdgBwJn4xEIbX8JV4x1qKTFz6dubENersmwpt6NuVgMolEyvS
         n9qE7/oxpPYuTyVHz0nT6qaRBIYxio1F7b3vgocPktNtEB06SzkWEo/dhyq4Op049hpi
         +nm1MZOyPoHuA/lXD/oT3Q5JMSKhJadB7VKBH8alYZtG2IqL7fEKoh2Ej6Mfw7yBOXjm
         NpjS7tQYodEnANrnVKHWSu7yRDeutJ0lmxHq/RZVEYs36VCsq266OoMh/SeRZD9RycEd
         q5lqJ+JKPqHNgvzL4eq5Iol6pRrehaMozakrH9zSoXTF1bb0t0g5K6RStf7FOolMU7T0
         Q+3w==
X-Gm-Message-State: AO0yUKX17MLdUwdHK7p74JxZLdI6JPSX01OLPhZUZIycAkrm1XM6S6r5
        I1xKbqO8ZBlqOmEes9NENNEJ8BAocUzXnqZB
X-Google-Smtp-Source: AK7set8alFg61Xh23doaM5qBMsHqQlpv14xMzuu4uIcLFrgZ7U3iUqMJn6lB0L/b1/5c1PvcPAVyIQ==
X-Received: by 2002:a62:7915:0:b0:5a8:ab36:d0f7 with SMTP id u21-20020a627915000000b005a8ab36d0f7mr5756776pfc.14.1676310753686;
        Mon, 13 Feb 2023 09:52:33 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id u2-20020a62ed02000000b0058bca264253sm8153600pfh.126.2023.02.13.09.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:52:33 -0800 (PST)
Date:   Mon, 13 Feb 2023 23:22:26 +0530
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
Subject: Re: [PATCH 21/24] RISC-V: ACPI: Add ACPI initialization in
 setup_arch()
Message-ID: <Y+p42n3bm5xkTtSr@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-22-sunilvl@ventanamicro.com>
 <Y+Vrd88ShoaDc0Pv@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+Vrd88ShoaDc0Pv@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 09, 2023 at 09:53:59PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:22PM +0530, Sunil V L wrote:
> > Initialize ACPI tables for RISC-V during boot.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/setup.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 4335f08ffaf2..5b4ad1baf664 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -8,6 +8,7 @@
> >   *  Nick Kossifidis <mick@ics.forth.gr>
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/init.h>
> >  #include <linux/mm.h>
> >  #include <linux/memblock.h>
> > @@ -276,14 +277,22 @@ void __init setup_arch(char **cmdline_p)
> >  
> >  	efi_init();
> >  	paging_init();
> > +
> > +	/* Parse the ACPI tables for possible boot-time configuration */
> > +	acpi_boot_table_init();
> > +	if (acpi_disabled) {
> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> 
> I only poked it with a stick, but I think this `#if IS_ENABLED()` can
> be changed to a normal `if (IS_ENABLED())` while you're already
> modifying this code.
> 
Sure,

Thanks
Sunil
