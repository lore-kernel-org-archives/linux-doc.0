Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216C7C677F1
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 08:47:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjBXIrZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 03:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjBXIrH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 03:47:07 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DFB63A06
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 00:47:00 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id u20so4680842pfm.7
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMm4tTnCBx/UWlRMFi35xdsLvkcX8RtXFHwDjnM/k8g=;
        b=R7WanfuN4UrhQd8BNoxEa9os2dRd/evoOBxPjVlUaje5t2eNCIqE9nwXs+ujFcBbxH
         uC9Ppmp0NfNCCWnqND/LaF7KEEXc+6dV7aFZmADi8tGi/BCrc4MvnFxB7AbxGaHb0zPs
         kuj5udBV2ymPfzH4kosWoqwAo972VHDL6bqv+JKeY2cYOSQb0PBpLoEfw+NseDtccsWh
         wwPgNxRzCvcHibW67bPDVX2Vhr+raVNK/XfC7pfcmicZSI0XddoajlozT946Kb3tTSHr
         yZOg4aDSQftzxDd/e4u2Fk+8QCxJULu3hr6xkcWj5w+ym5wCagTNm2Ju6P64ko+UY6/F
         ARJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMm4tTnCBx/UWlRMFi35xdsLvkcX8RtXFHwDjnM/k8g=;
        b=glYjne1nDHGtYLzw6RxoKrmq1EgVkp7M8DLVwIOCJKLqAlFwRr6e6VdJGsbUnmvlC7
         iEWbabxwV6rPkP6LOYwNO+qNNwtfEz46ZQz6Gyq9GJhOyJIRDDCtdZla8MVeqi19DmBW
         a6bpN5Gbi9U93kbZw+7or1D905YzAZmuvZvQJfEzBFkrAFxCWldufwLGroQtzict0T7Y
         /RZV8o7xymbC820uuwkabxFMJbmmpooY7CDj+Ab8G/y09VQgMLJ3cQEH/2LNmgQQLRn3
         kQgJmdiH05NFU6J5B299xJm6dtW33g1l+9FPd/j0AgL6edhZyuXeGJa+sJdVSejaiueL
         +jEQ==
X-Gm-Message-State: AO0yUKUJf/QAoRf/NBNlGY9TkKfHRB1IZeRsdht+5aiobO/frzi8n9oM
        ZLoINxdro0PU3riEgsr2sS0X1A==
X-Google-Smtp-Source: AK7set8FrW7c54xe2wApbvz8+IVHsJOwdjux1tqWoB5KJLo1CTFzoYM8ZtgqRDfWykSZaFnESf3lkQ==
X-Received: by 2002:a62:1545:0:b0:5a9:d676:ae58 with SMTP id 66-20020a621545000000b005a9d676ae58mr13650050pfv.13.1677228419747;
        Fri, 24 Feb 2023 00:46:59 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id q22-20020a62ae16000000b005d6fcd8f9desm4483802pff.94.2023.02.24.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 00:46:59 -0800 (PST)
Date:   Fri, 24 Feb 2023 14:16:50 +0530
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
Subject: Re: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Message-ID: <Y/h5eoPyZeEpUSL8@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-20-sunilvl@ventanamicro.com>
 <20230220200909.gkwmpklocw36632w@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220200909.gkwmpklocw36632w@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 09:09:09PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:41PM +0530, Sunil V L wrote:
> > Add support to build ACPI subsystem in defconfig.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 128dcf4c0814..f89f79294b34 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > +CONFIG_ACPI=y
> > +# CONFIG_PCI_QUIRKS is not set
> 
> I'm guessing the addition of the CONFIG_PCI_QUIRKS line wasn't
> intentional?
> 
Yes, I realized after sending the series. Will remove it in next
revision.

Thanks,
Sunil
