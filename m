Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C299C636CC
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 17:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjBMRjh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 12:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBMRjg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 12:39:36 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCE9B769
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:39:34 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id r9-20020a17090a2e8900b00233ba727724so6093791pjd.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6a6ybMdzwmsAq2eExsLYksMr5wMk1cwEz6ueJMHefY=;
        b=S1al247gcEL4BcZ/hYaKhkRKclAN/d/Ale6FwEo92a2U4NKMQGnnZfv/pQtwbomCPn
         xel0nlpjF31S2OXDqLyxhZ1GBfszQEiHN9drHwhUOHzllXGvtfWZlupGXFOEfcdKpbGN
         aCrGK03AEEhPOslZVns+Z2YoYJIz8kuUgJrMPX9B6PAfhNx6Imq9wt2yJtpu47XE4Knw
         BOuESdlY9sH87qSdwOTocsIj1/gwgVmY33KepTg0WN/atyjyCQPVEoGwSKxtaFrSNLw+
         ODBFjQJyrvM+d+JUUB2AwCMsuVYZcZ9KHmn/LoJWrDLEmkwBVR/EZPk8K+Mvb4RfmSlb
         bklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6a6ybMdzwmsAq2eExsLYksMr5wMk1cwEz6ueJMHefY=;
        b=fjDsHzyYwV4RTFvg6XFz/VGhIiSCtO5OrzBsQd6iiV8G29HOhUkNPP77CKkiZtPUrV
         gsfP8LBCCrjhfJZ/wMWNvErigC2ceDhauml0Ukn22SHTi6aQvOcpFWrlJy4VNNKA/p23
         AQRu2K/i/XOQXNiD7rzJ7ppRIhAB3LH845RfMo4y0QPxoZdGpByOZ1xNntTTDR6QIJ53
         XiBAZTp9zCMEmHLLeJmZ74MBidAUmCnQy4in5GsFKQo62gslabPia9Vwrr2z8AGfQ83d
         1JGIIwO+aDiBLfcE26Y7lnu6/tLpcDb608aA9S1o3jU3UksI8eWvmy1MffIYr5PanECs
         74RQ==
X-Gm-Message-State: AO0yUKW+0NCQ1nz40HaN3WR3WBuxpXhCOQvHjHrYH/Jd7Omdc7uNrfUY
        q85yqR/WKVz9VrkDvLuS1iiYpw==
X-Google-Smtp-Source: AK7set9smglHbeeBmhpcAdaBTlzB7n3/yd6cTJIGHGINpq27eZbXzJHju43D2BUxrMc4rZ6rGghP6Q==
X-Received: by 2002:a05:6a21:3397:b0:c2:e30c:9be5 with SMTP id yy23-20020a056a21339700b000c2e30c9be5mr25971400pzb.12.1676309974325;
        Mon, 13 Feb 2023 09:39:34 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n6-20020a637206000000b004fbb6200482sm1646779pgc.41.2023.02.13.09.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:39:33 -0800 (PST)
Date:   Mon, 13 Feb 2023 23:09:26 +0530
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
Subject: Re: [PATCH 16/24] RISC-V: ACPI: clocksource/timer-riscv: Add ACPI
 support
Message-ID: <Y+p1zjFDcPpgFxuw@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-17-sunilvl@ventanamicro.com>
 <Y+VecXd9PVpkDggY@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+VecXd9PVpkDggY@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 09, 2023 at 08:58:25PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:17PM +0530, Sunil V L wrote:
> > timer-riscv driver needs to get the timebase-frequency from
> > RISC-V Hart Capabilities Table (RHCT) on ACPI platforms. Add
> > support to read the information from RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 4016c065a01c..8079666753a6 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -10,6 +10,7 @@
> >  
> >  #define pr_fmt(fmt) "riscv-timer: " fmt
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/clocksource.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/cpu.h>
> > @@ -198,3 +199,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >  }
> >  
> >  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> > +
> > +#ifdef CONFIG_ACPI
> > +static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
> > +{
> > +	return riscv_timer_init_common();
> 
> I feel like I need to ask as it was deleted in the previous patch, how
> does ACPI determine whether the arch timer can wake the CPUs?
> 
We have plans to add a flag in RHCT. But that still needs approval.

Thanks
Sunil
