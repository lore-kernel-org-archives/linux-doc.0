Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8B6C64ED8
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 08:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjBXIp7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 03:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjBXIp6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 03:45:58 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21CB363551
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 00:45:56 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id c1so16230387plg.4
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/g1Br9nMWuN1kMcnj12xFgT0Rd9SMTlaPziJnIgRsI=;
        b=HJVHq/ZFu4hLwrKBdjVcvVDh8BY2u5vhJLGEkVHDDj91kJv4YRW/orPIWQhCaQxpt3
         T196f1t9afHRM06Hddxj2UDAO/ZGAp/4kLtWatrr2Okps1PTMLtqCUl5fVyPFfyBJ1r9
         njk21YOnKbov8YmqfqNYhKCy42RNelscCPU+Er6jPjma9ntQP2o8VWzzyB1lhdt34cre
         wX8Am/J5HGndXiNov/b4ZFzZeWYXynWWExyK8oc+79LtF5/IxHIvGTbOynOGQzioxjCs
         0Sh3H6i9pQCMtts9OvyTkbzRTMlymONFJDCHlrq9Da5sNVqQf+ayqR2CP41xXwzYfjyl
         81bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/g1Br9nMWuN1kMcnj12xFgT0Rd9SMTlaPziJnIgRsI=;
        b=CwelzBli7OYMRJ1PSvdCTb+lGjLI2vZp6+J5lU/i+0YsV+tI9lA9nDFVfV6JyJfUE4
         MO2fXs4jhZlO67PKrgbDQ0zOpgL9ABz0obWMYEj+AYxgcjJ0ygjvkLt3RpoEHZy/oj6D
         +yOrprpyZxcC5YHISwvEK2jag8BU29BouN/3xI9WiC1qLT7de4Ta4cqzTl9MCQ9+ibYd
         JzCH5mVE28m6QRayLUSLQ73bPQVpcQ8UP9Y1fJHA7MJmradcBXX/11Z2b/9UUXd5qis+
         fT2ci4SZ7xscgb1wMJDYoJl30GHbD+SKx5r3D1Ma6NW4C04lcv+Z/h0OAYQt7lxvMEc9
         HmLg==
X-Gm-Message-State: AO0yUKXvn1s13L4VCBdoWax7OduZiBgzwv/fukuz5LuE+8EswrqjaJTY
        EBGsXYc9tN21cmFgJSYpKyXejg==
X-Google-Smtp-Source: AK7set8MdWRkAMrfAw1y8GkgFBrDn6UZ97qOIFghP/NVv/y5GdQIrkhZih6PNeZKPMELP0frUqPa5A==
X-Received: by 2002:a05:6a20:3ca0:b0:be:e0c3:5012 with SMTP id b32-20020a056a203ca000b000bee0c35012mr14992895pzj.1.1677228355548;
        Fri, 24 Feb 2023 00:45:55 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm2665775pfn.107.2023.02.24.00.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:45:55 -0800 (PST)
Date:   Fri, 24 Feb 2023 14:15:46 +0530
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
Subject: Re: [PATCH V2 05/21] ACPI: Kconfig: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <Y/h5OiF61xtcdUQP@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-6-sunilvl@ventanamicro.com>
 <20230220160518.zuppmgvvhvipawxe@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220160518.zuppmgvvhvipawxe@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 05:05:18PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> > Enable the ACPI processor driver for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/acpi/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > index ccbeab9500ec..b44ac8e55b54 100644
> > --- a/drivers/acpi/Kconfig
> > +++ b/drivers/acpi/Kconfig
> > @@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
> >  
> >  config ACPI_PROCESSOR
> >  	tristate "Processor"
> > -	depends on X86 || IA64 || ARM64 || LOONGARCH
> > +	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
> >  	select ACPI_PROCESSOR_IDLE
> >  	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
> >  	select THERMAL
> > -- 
> > 2.34.1
> >
> 
> The commit message doesn't tell me if this is a premature config
> enablement or if it's already necessary for this series. I think
> if it's already necessary, then it should point out what requires
> it in the commit message or be squashed into whatever patch
> requires it (and also point out in that commit message why it's
> required).
> 
Thanks Drew. Let me drop this patch. We will need it in future when
we need to enable LPI/CPPC etc.

Thanks,
Sunil
