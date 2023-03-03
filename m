Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203AFC7EE2F
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 16:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjCCQXM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 11:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjCCQXL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 11:23:11 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368C514212
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 08:23:10 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id d30so12517498eda.4
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 08:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ryeAsxysbo6DUGxfiuPOI8CvtI+vb6NelPj5oYksPo=;
        b=EzNCK3RZSJsJUeQFEWK8SnOi6P6PWK6BpIgChisWP1NzSH3VJqAhxv3yOHN49QZqxg
         V0BotQn335MAGYgJxAnQgTh9LVMsDSCDQ/xWw3H3ctNOmg8JAYT3/m7yFa9i2bJjF+ra
         ZttoECnbnJngdAr0peRBlCURcv4DOeWZMJr+UQInSQrH5dYL06UB85PPFrccZC8J4Gc5
         GpnECND/KUp0C2V8VxmBWE1aa+V5hB2gD6L4RrqZCHoc7p7UMC3cQOhZQQWzF3fnvlrH
         EbZbRFIvnTrDSVhUBd5gKFA+hE6u/UKpArsqB8YWOidtWPdOHOWOxQg2ufuiPbrJWj+4
         TIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ryeAsxysbo6DUGxfiuPOI8CvtI+vb6NelPj5oYksPo=;
        b=XYLod7IN5Ts8ZlTkDcPWzut2I2x0jchUGbtx9DkANxa8qCe9xmuwDaVu92zjbtTI4c
         h2H5D8jhWDEvpgMNL1SP4TYVdc7uSQ5mL3+Z7w5JLzMw0AGwu97os9Qfx1WUvf6U+V9d
         8aGeecYFLW3cF10nx187VDSuh01WoZQmD5HY9DDQ0DrKBtrAo+0djHdsh5DcyTSVqXCM
         8PEp/nyumE8xur3RZLFFkKeVh4TSa3TUlq4e7jo5Rwld1+J1QxGrsB3WX9hSIBctkDWw
         D4NsHLO0hKBYKb9tlKnaE6jgZzClu2OHmLGk07y03Lz3GusraU72Vud8Qnpsusd7IeoT
         TPOA==
X-Gm-Message-State: AO0yUKWrdkz1eV54hrGqP2tyMZ6VaJRT2g1B+o8K7+93ANwmUbGdBugy
        gXj/3rI68OjITn/cpHVJmlQ1Rg==
X-Google-Smtp-Source: AK7set+GMkAPdilJi56mUnW0fX32evecSe24CxSroekBxpjdNIx8xTEeM5pLsOlf4df3VzOOhkydOg==
X-Received: by 2002:aa7:cfc2:0:b0:4bf:f9f4:9b1e with SMTP id r2-20020aa7cfc2000000b004bff9f49b1emr2272745edy.4.1677860588730;
        Fri, 03 Mar 2023 08:23:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b2-20020a50b402000000b004be64b284b2sm1338509edh.3.2023.03.03.08.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:23:08 -0800 (PST)
Date:   Fri, 3 Mar 2023 17:23:07 +0100
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
Subject: Re: [PATCH V3 19/20] RISC-V: Enable ACPI in defconfig
Message-ID: <20230303162307.zz5amah65gjme7da@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303133647.845095-20-sunilvl@ventanamicro.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 03, 2023 at 07:06:46PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..8822b49ddb59 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> +CONFIG_ACPI=y
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
