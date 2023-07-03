Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C0BC0015E
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 10:37:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjGCKhA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 06:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjGCKg7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 06:36:59 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10223CE
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 03:36:48 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so37863645e9.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688380606; x=1690972606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUJZLpavfpCPDqJy3pXLpLIqCzOwU8RnX0P6/kcZ78w=;
        b=pLQc5VBNz10JyE8u4S82Pshb/z8p2j6Wd4cb1AWb9s1CfAq7pUufFvxlFr5VJ81B14
         V7ssCPg9e6HNSC2/uawdUpF5JayjOdS8s7fu2njONaiFIP0b3tN1LV5nNCs1Y+0VuC/A
         /RTs5xaodKzQ0JEyewpHm534OdQGL5vKIUL1/yI6vL7wn5zePt1HU6x3nbvxT02MTWZz
         Cho2mXaSA1DUwhw44oO/1OaNZNpF6MyXh1ZSaZitX9xg4envXsrwQrYEmMBq/9Xn0mfv
         zcqiNwkd/3OsgeAtvxYVZEIfrFbK1+aZTBxXqMcVYNehX6GRXuhIKCzGgf3tPu2ShZ1v
         z2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688380606; x=1690972606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUJZLpavfpCPDqJy3pXLpLIqCzOwU8RnX0P6/kcZ78w=;
        b=JGOJ+KaIZnxl1q/lkxyyl4Z+/BuzH6b5wDj6KXrNh0e+PWJhBKv4vUWUTBHFYqbYXH
         B2/9vB7z4/NJ53SibanQDPcAFCdnpto/0AiKeKRfY4RkmEwmvRwBEtccrh02dYC2mquZ
         R5oYeyJF2v54GG7BPzhtbpTYReTJuA8tWashZqIBrRibzInlEODAtR4vfFGm80wa27p/
         mWjlOcprUK8LOCy7wz1X1/fE0axHZQvPg//4SPBeC3WdjiZLqbH5jeYXVK+CcmYFvIOX
         QitymP3Sxt2P0CYohWVwGrTsIzuDgRovBoDU/f4srCTZN292dNHRtj8icjRHvw1SwAq7
         wlgg==
X-Gm-Message-State: AC+VfDz+sB3eIQC6BToons0KCp+XMCidofDaZ2cDJ67iqVKCT1lq+l7g
        dpHAMEdRMa30eJR/m+sXcl+dxw==
X-Google-Smtp-Source: ACHHUZ7INqULviq9JqZiRLPMlqxzxKcXVe5ThIdtsIYRegEmO307Xwvjr6IdKy/Dpcb1Ts+edxstmA==
X-Received: by 2002:a7b:cc99:0:b0:3fb:b34f:6cd6 with SMTP id p25-20020a7bcc99000000b003fbb34f6cd6mr8716264wma.41.1688380606253;
        Mon, 03 Jul 2023 03:36:46 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bcb95000000b003faabd8fcb8sm20512776wmi.46.2023.07.03.03.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 03:36:45 -0700 (PDT)
Date:   Mon, 3 Jul 2023 12:36:44 +0200
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     palmer@dabbelt.com, conor@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Evan Green <evan@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v3 01/11] RISC-V: Provide a more helpful error message on
 invalid ISA strings
Message-ID: <20230703-8b9d59a770926dbfa5771966@orel>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-girdle-underling-880f633c4c73@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703-girdle-underling-880f633c4c73@wendy>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 03, 2023 at 11:27:53AM +0100, Conor Dooley wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Right now we provide a somewhat unhelpful error message on systems with
> invalid error messages, something along the lines of
> 
> 	CPU with hartid=0 is not available
> 	------------[ cut here ]------------
> 	kernel BUG at arch/riscv/kernel/smpboot.c:174!
> 	Kernel BUG [#1]
> 	Modules linked in:
> 	CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge0097d2c62d5-dirty #1
> 	Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
> 	epc : of_parse_and_init_cpus+0x16c/0x16e
> 	 ra : of_parse_and_init_cpus+0x9a/0x16e
> 	epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff81603e20
> 	 gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 000000000000006e
> 	 t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e80
> 	 s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
> 	 a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> 	 a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff816148b0
> 	 s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff81a4b090
> 	 s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 0000000000000000
> 	 s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 0000000000000000
> 	 s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000000000
> 	 t5 : ffffffff824dd188 t6 : ffffffff824dd187
> 	status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> 	[<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
> 	[<ffffffff80c04c96>] setup_smp+0x1e/0x26
> 	[<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
> 	[<ffffffff80c00384>] start_kernel+0x72/0x400
> 	Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9002) 715d
> 	---[ end trace 0000000000000000 ]---
> 	Kernel panic - not syncing: Fatal exception in interrupt
> 
> Add a warning for the cases where the ISA string isn't valid.  It's still
> above the BUG_ON cut, but hopefully it's at least a bit easier for users.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index a2fc952318e9..3af2d214ce21 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -66,11 +66,15 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  		return -ENODEV;
>  	}
>  
> -	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
> +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7)) {
> +		pr_warn("CPU with hartid=%lu does not support rv32ima", *hart);
>  		return -ENODEV;
> +	}
>  
> -	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
> +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7)) {
> +		pr_warn("CPU with hartid=%lu does not support rv64ima", *hart);
>  		return -ENODEV;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.40.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
