Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F535C61DA4
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 12:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbjBXM2B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 07:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjBXM2A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 07:28:00 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD1D14233
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:27:58 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so2507215pja.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwYpSkYarWM8KK06DmjpU0SsZ80bpXD8ml+czU18ph4=;
        b=oTGbRFBV85WT/P+apuKTFB8ImIliAlw8Q1W+9qFq7T1rquTOiN7YtSjiu7ZSPKsbtz
         3TdWTwd8QJ5wX1ZII1KsmMnSOJhZliUJOv9OCs6BBYn+xlnJ6XCpllseBFj4NuicmRTt
         CIx1TZO6K1zeMl45l5bADxsZOnD281Hh4DMRbtZA6/y2Qonv7MjwQDV94kdFo3um9h1X
         9SURMFmrw6khKTBjyc9/m7ktkJtr1QH6lmbxGLxu9pXbjFhG/mZBv8U/vygcRGRvyE3g
         geryxmJTxC84mhl0ev42ge6nYequ28IDr4X3PRj3p1Dzp/6o9FRH18i6+WcZrjUuxpSt
         g7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwYpSkYarWM8KK06DmjpU0SsZ80bpXD8ml+czU18ph4=;
        b=O1QkHTxP68HyMeS/nJ2iEKCSdxvnEYpjVnIqPFrMNfdUcgn+e/a8Xk+r3Onl6giwUo
         HUpt0Go5CqojvdsRMiHC6L5GU7SgnBJ7rWgebaJvduKdJSPAcABrAmfDDLktRgmtT5w2
         nf8cjCCPLMa/qVSKanCBn2kJCVoeyyD439NGediGOAOA11Ij0gEnLGnWe+jTJh+tx1jm
         Oq2XQWcra1r5w1vAdND06rK9zwFuk76ZHrDLtznOFbvj7YodGY+bniQF5HAg7tXL6zks
         tXfAjjMfEbY+RnisE65bDfPYRj8usb+QeHU5apEIUOhXJqn5LCnA1DhTRwf4Z97sZZ04
         JDUQ==
X-Gm-Message-State: AO0yUKUcuuTUROxSfbtXfUPKbcdnysjsU9Ekh2hsAgrt8fBrwzc2WuMa
        YrcimNfR0d5lW6fSBxT8FrGvKg==
X-Google-Smtp-Source: AK7set/jhV4LyEc2Pc7U9dYmeepbpGtwrM+HLOiB2J748SFbDrW80kFfcTA8PubYOPn/br7Mj7juCA==
X-Received: by 2002:a05:6a20:8f10:b0:cb:a66b:3a88 with SMTP id b16-20020a056a208f1000b000cba66b3a88mr12686571pzk.1.1677241677760;
        Fri, 24 Feb 2023 04:27:57 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id h18-20020a656392000000b004fbe302b3f6sm1047553pgv.74.2023.02.24.04.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:27:57 -0800 (PST)
Date:   Fri, 24 Feb 2023 17:57:48 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 13/21] RISC-V: cpu: Enable cpuinfo for ACPI systems
Message-ID: <Y/itRLrYiWCJjCcc@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-14-sunilvl@ventanamicro.com>
 <20230220175429.dzojoryw2dhhbodl@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220175429.dzojoryw2dhhbodl@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 06:54:29PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:35PM +0530, Sunil V L wrote:
> > On ACPI based platforms, few details like ISA need to be read
> > from the ACPI table. Enable cpuinfo on ACPI based systems.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..a227c0661b19 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -3,10 +3,12 @@
> >   * Copyright (C) 2012 Regents of the University of California
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/cpu.h>
> >  #include <linux/init.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/of.h>
> > +#include <asm/acpi.h>
> >  #include <asm/csr.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/sbi.h>
> > @@ -256,26 +258,41 @@ static void c_stop(struct seq_file *m, void *v)
> >  {
> >  }
> >  
> > +static void acpi_print_hart_info(struct seq_file *m, unsigned long cpu)
> > +{
> > +	const char *isa;
> > +
> > +	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
> > +		print_isa(m, isa);
> > +}
> > +
> >  static int c_show(struct seq_file *m, void *v)
> >  {
> >  	unsigned long cpu_id = (unsigned long)v - 1;
> > -	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> >  	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
> > +	struct device_node *node;
> >  	const char *compat, *isa;
> >  
> >  	seq_printf(m, "processor\t: %lu\n", cpu_id);
> >  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> > -	if (!of_property_read_string(node, "riscv,isa", &isa))
> > -		print_isa(m, isa);
> > +
> > +	if (acpi_disabled) {
> > +		node = of_get_cpu_node(cpu_id, NULL);
> > +		if (!of_property_read_string(node, "riscv,isa", &isa))
> > +			print_isa(m, isa);
> > +		if (!of_property_read_string(node, "compatible", &compat) &&
> > +		    strcmp(compat, "riscv"))
> > +			seq_printf(m, "uarch\t\t: %s\n", compat);
> > +		of_node_put(node);
> > +	} else {
> > +		acpi_print_hart_info(m, cpu_id);
> 
> I don't think we need the helper function for the two lines which would
> otherwise nicely complement the two similar DT lines above.
> 
Agree. Let me remove it.

> > +	}
> > +
> >  	print_mmu(m);
> > -	if (!of_property_read_string(node, "compatible", &compat)
> > -	    && strcmp(compat, "riscv"))
> > -		seq_printf(m, "uarch\t\t: %s\n", compat);
> 
> This will now print uarch before mmu for DT systems.
> 
Yeah. Let me fix it.

Thanks,
Sunil
