Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E94CC05027
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 13:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjATN4h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjATN4g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 08:56:36 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0F4BF8B4
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 05:56:35 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hw16so14086327ejc.10
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H7eK0S32R7OzdAHjN8ANIsN9zhM51LWwumKsQBQQh8I=;
        b=C/UkHRCo3dJQXtq4TBwbY4SPLPXRYn2WOJG9lENA7XPB5yLT/zlXBogNk1MOZ6l55p
         5fZq+rGqYualx4+bpTovJMsfmDCsCUiGXcKUPTu5p9XB+OtbFWUScvNjeDDh5hex/JJG
         7jiytQBn/EBJWWPjwVKX3aGDhkoyfWgdWvr7wtMarwTpKBeJfG2Pal2Rsy7JWF4jJxzJ
         oglsLixFOL5wWywmmwJigjkv2eWfgidHwq4JRyQLkdXDXhXbcUkd2ml2YuwBDRFu61BQ
         fO2wS2UZQSpA1YUeHvkJM2V+gCuVbFL6bzDwsgzvfPL0U5dqQ9yjsUehYo7NpWAA1Jz1
         LmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7eK0S32R7OzdAHjN8ANIsN9zhM51LWwumKsQBQQh8I=;
        b=6BCWsVFOMO+y0T8Bed3QM8/VCOrvgNJF/3c2vK3570AHh15SVUFy++ZPl61zt/4Y+d
         Lc26wTGndB/Rzds873om+6ZEfVm0lbIgHcDHM0MicyHcTFUfSC339BC+4wfxkBwVqy0V
         pFTUK60ey3MVQDnWCwHFKzVuX6apOTD7Ic/WcqMpueIdMPESEZP1/tU6uy2L4xAY2xci
         GT0drk95VKTJ9c+ohLtPCs6Be+wEtH+GRWdXweM2MHHJ+GGmzDLmltqrUR1ZW/KdkKRy
         77I28gzLAgCmgk1tdzpVa0/OMwvGpclwjyb/BNExc93Y15Xj8zyiaonSQPfMGF/Lj6fh
         vlhQ==
X-Gm-Message-State: AFqh2koL4ucBacXxxY57i5+uQNBwEYGmuDx5IRihbOJHWh/Lxuml6RZo
        7YxWiFnjvrbWAbobJUFk9eKSxQ==
X-Google-Smtp-Source: AMrXdXsDjnqn1FOnw74lL1yVvsD6lGj78Ptra6ukhIH804E5wD8+CJKg4PdIcqvALwMEwneYz7HrQQ==
X-Received: by 2002:a17:906:4096:b0:79e:4880:dd85 with SMTP id u22-20020a170906409600b0079e4880dd85mr14823861ejj.47.1674222994156;
        Fri, 20 Jan 2023 05:56:34 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906218900b0084cb4d37b8csm18043546eju.141.2023.01.20.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:56:33 -0800 (PST)
Date:   Fri, 20 Jan 2023 14:56:32 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        conor@kernel.org, corbet@lwn.net, guoren@kernel.org,
        heiko@sntech.de, paul.walmsley@sifive.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <20230120135632.vb7ncvoapnaixluu@orel>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
 <20221205144525.2148448-3-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205144525.2148448-3-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 05, 2022 at 02:45:25PM +0000, Conor Dooley wrote:
> Ordering between each and every list of extensions is wildly
> inconsistent. Per discussion on the lists pick the following policy:
> 
> - The array defining order in /proc/cpuinfo follows a narrow
>   interpretation of the ISA specifications, described in a comment
>   immediately presiding it.
> 
> - All other lists of extensions are sorted alphabetically.
> 
> This will hopefully allow for easier review & future additions, and
> reduce conflicts between patchsets as the number of extensions grows.
> 
> Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 12 +++++++-----
>  arch/riscv/kernel/cpu.c        |  4 ++--
>  arch/riscv/kernel/cpufeature.c |  6 ++++--
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..ce522aad641a 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
>   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>   * extensions while all the multi-letter extensions should define the next
>   * available logical extension id.
> + * Entries are sorted alphabetically.
>   */
>  enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +	RISCV_ISA_EXT_SSTC,
> +	RISCV_ISA_EXT_SVINVAL,
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_ZICBOM,
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_SSTC,
> -	RISCV_ISA_EXT_SVINVAL,
>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,

Hi Conor,

I'm digging this back up because I'm basing Zicboz on it.

If we take "riscv: improve boot time isa extensions handling", then this
becomes a bunch of manually enumerated defines

 #define RISCV_ISA_EXT_SSCOFPMF         26
 #define RISCV_ISA_EXT_SVPBMT           27
 #define RISCV_ISA_EXT_ZICBOM           28
 #define RISCV_ISA_EXT_ZIHINTPAUSE      29
 #define RISCV_ISA_EXT_SSTC             30
 #define RISCV_ISA_EXT_SVINVAL          31

Keeping those in alphabetical order would either require manually
reenumerating them or to allow the numbers to be out of order as
we add more extensions. I think I'd prefer we just add new
extensions at the bottom and keep the numbers in order.

Thanks,
drew
