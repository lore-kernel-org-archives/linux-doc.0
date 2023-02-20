Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E28C05027
	for <linux-doc@archiver.kernel.org>; Mon, 20 Feb 2023 17:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjBTRyl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Feb 2023 12:54:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbjBTRyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Feb 2023 12:54:40 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2C120568
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 09:54:32 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id eg37so3962290edb.12
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 09:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxVGzwL+4x3d9xJ01+WEs/SSEAgiQEFyyqTh9v+9xno=;
        b=EfMA0ETWjV96fNEC4CzFcupfrFJjDfHulIs6YlojxbS20dQfrNIna6iFxdhIddGqFN
         xwTGlwiFI4Zxn6sLWa3ttv8ecDYNj3j6mr59r/EzdgEOG5WfgyILX7l+d8CQ7/WRigF4
         TUfyWFFf3nB0pmQlnIChNZvWOlp/2eT4Yqh3IP/ZMUKabl94zPk9dw0Kgse75wTlhL98
         eijn6NLcGthMcxB4a3srFLN2eyiny5hJJTTaXFXfW7v+urnDrENTho/HgXLIaaUiihNY
         WcURuND807FTzSyxRxzpc2xvzG4ndLY1/lA8XHu3j54A0hL4tyojiUuyEh384iHdpJmF
         nlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxVGzwL+4x3d9xJ01+WEs/SSEAgiQEFyyqTh9v+9xno=;
        b=TbdUaDqqDGRQpcG0oeFECNker82yV4lOZ49rZjH/sOIRFOqImkcyC71uq6ZXdZqf4+
         dVtxRH7d2KP6cVen8h2TtsNbeWjD7R1ydS7faejg9YcsvVwUS21bBC8gzFx96C5q1U4G
         XVc3fJVBJ2kcHXT6nBGB24RnucxuQ8YGOKEOxFQHsdOmv3/TAz4v8P/5pii/tZc+QwsX
         UD2IrZv5Us2vhd6aefvNMy0sx1cPJKpyXOr3I7RS5E52hfc5HUjdhs9JPcRErHNzJM9P
         WO+6DEjq3geInp9el9vOdp305f00fj6Cni+zAYjRK11KO70eNmpuUDALttzyQ6WlGbYc
         aV8A==
X-Gm-Message-State: AO0yUKU2JZNo4sh7kXlCm1hUcxgxx3Csx0xew/jjVv7RU2ORhm1GSfr8
        5a/lykkpC1cBBfdQVqliGlIaaA==
X-Google-Smtp-Source: AK7set9+seOO5w23B1b675NlE1L1sk3LefUXMHQbeTRgRc1BMWWM2yO+dRohFd2Tcef33VUGV0PBdQ==
X-Received: by 2002:a17:907:1686:b0:8af:2f5e:93e3 with SMTP id hc6-20020a170907168600b008af2f5e93e3mr7996390ejc.29.1676915671483;
        Mon, 20 Feb 2023 09:54:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ke27-20020a17090798fb00b008b12b9c6c49sm6041450ejc.125.2023.02.20.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:54:31 -0800 (PST)
Date:   Mon, 20 Feb 2023 18:54:29 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Sunil V L <sunilvl@ventanamicro.com>
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
Message-ID: <20230220175429.dzojoryw2dhhbodl@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-14-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-14-sunilvl@ventanamicro.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 16, 2023 at 11:50:35PM +0530, Sunil V L wrote:
> On ACPI based platforms, few details like ISA need to be read
> from the ACPI table. Enable cpuinfo on ACPI based systems.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/kernel/cpu.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..a227c0661b19 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,12 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/sbi.h>
> @@ -256,26 +258,41 @@ static void c_stop(struct seq_file *m, void *v)
>  {
>  }
>  
> +static void acpi_print_hart_info(struct seq_file *m, unsigned long cpu)
> +{
> +	const char *isa;
> +
> +	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
> +		print_isa(m, isa);
> +}
> +
>  static int c_show(struct seq_file *m, void *v)
>  {
>  	unsigned long cpu_id = (unsigned long)v - 1;
> -	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
>  	struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
> +	struct device_node *node;
>  	const char *compat, *isa;
>  
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> -	if (!of_property_read_string(node, "riscv,isa", &isa))
> -		print_isa(m, isa);
> +
> +	if (acpi_disabled) {
> +		node = of_get_cpu_node(cpu_id, NULL);
> +		if (!of_property_read_string(node, "riscv,isa", &isa))
> +			print_isa(m, isa);
> +		if (!of_property_read_string(node, "compatible", &compat) &&
> +		    strcmp(compat, "riscv"))
> +			seq_printf(m, "uarch\t\t: %s\n", compat);
> +		of_node_put(node);
> +	} else {
> +		acpi_print_hart_info(m, cpu_id);

I don't think we need the helper function for the two lines which would
otherwise nicely complement the two similar DT lines above.

> +	}
> +
>  	print_mmu(m);
> -	if (!of_property_read_string(node, "compatible", &compat)
> -	    && strcmp(compat, "riscv"))
> -		seq_printf(m, "uarch\t\t: %s\n", compat);

This will now print uarch before mmu for DT systems.

>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
> -	of_node_put(node);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
>

Thanks,
drew
