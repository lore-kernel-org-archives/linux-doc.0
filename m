Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF126EB64DD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Aug 2023 05:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjHIFtM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 01:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjHIFtL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 01:49:11 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DEB1BF0
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 22:49:10 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686be3cbea0so406030b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Aug 2023 22:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691560150; x=1692164950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVTaAMwRyC5EbNmGnKMt5GVO62sfdhMkzEYvy7bRsXA=;
        b=pMiFqkbnzjp3jnyPBYTlRVYHWKdOC3du5VSbz4kIkpsKYuFw9hdbPRFTVwZMALrr6e
         SZQa4f+4WZaBbUbb6WuQfpPki/JvBjPp3gjUfPEIXaiLa05X12JMBBOfzjSrRxroNd8E
         U8Edn8SEcynqoXeuGV5OH3SalOEtqtT5FxFqX3SU35gIbEJIMsWiFKFV8NvAmigpo6ZX
         1VFuoHP8/06kb6ySqnq3J06knDAvIozFyfM6zzK+UBFfagPTFrZhAS/6e+TQ40mMrgEV
         TIYNk8nuqoeDiKI9nMVSb8/4cZxnMmXu4gGya+KvDa2cNxeo6xZuYxs2vwpsCYCPIRLF
         DSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691560150; x=1692164950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVTaAMwRyC5EbNmGnKMt5GVO62sfdhMkzEYvy7bRsXA=;
        b=kD9csh3fDHoKHyXEAnzptTs8ouKDRBl1z3DwWZTgo7miPhS9nEkl8aewXkPsRAKJOM
         WQMIdt4bsXU+ElxsOJM8DfofaAPCjEfpyUVsK7IbSdLV/17kFdzJ7Nd/OITugF9lTL7E
         Y5Psbg0U9Ge1uFx5b5F6joB+buNdLu54j4PgbzFbPTfaPkiJle4xcVfzmsdYnXA/Hq0u
         F8D21SyS/ZGYrx75qLRyG1DL2hpgPxKSJUE7mKq8mOidV3ECAMgaenNTySwjrPxpXsDF
         yM6Mvg4si00DFdI2ZGhmYw0GTNgukRrmmHkysRlu9hK5AkEN+KyIXEZctAWN+oI3WrNT
         JmSw==
X-Gm-Message-State: AOJu0YwjdqnqPR1eJ6/Vifpuqc6eHkDxMovlYTr+Bc2nCKuSA15psKio
        EmHKT+PU8kRTteXBXMCV1gz+mA==
X-Google-Smtp-Source: AGHT+IE7jfHYeQCcbaWLiyPRjvliIUWRMsM3DMDq94jcA4CT6KzEh4TL3KUw8Az8khdjGzhK4KpCbw==
X-Received: by 2002:a05:6a20:9147:b0:141:2cb:2954 with SMTP id x7-20020a056a20914700b0014102cb2954mr2498077pzc.3.1691560149975;
        Tue, 08 Aug 2023 22:49:09 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id z21-20020aa791d5000000b006829969e3b0sm9001358pfa.85.2023.08.08.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 22:49:09 -0700 (PDT)
Date:   Wed, 9 Aug 2023 11:19:00 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Robert Moore <robert.moore@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Scally <djrscally@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Subject: Re: [RFC PATCH v1 12/21] irqchip/riscv-intc: Use swnode framework to
 create fwnode
Message-ID: <ZNMozPV2yU1G9+1z@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-13-sunilvl@ventanamicro.com>
 <20230808-chuck-jailhouse-0cb08b55d1bd@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808-chuck-jailhouse-0cb08b55d1bd@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 08, 2023 at 09:31:49AM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Thu, Aug 03, 2023 at 11:29:07PM +0530, Sunil V L wrote:
> > By using swnode framework, all data from ACPI tables can
> > be populated as properties of the swnode. This simplifies
> > the driver code and removes the need for ACPI vs DT checks.
> > Use this framework for RISC-V INTC driver.
> 
> btw, you are permitted to use more than 60 characters in a commit
> message...
> 
Sure.

> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  Documentation/riscv/acpi.rst     | 21 +++++++++++++++
> >  arch/riscv/include/asm/acpi.h    |  1 +
> >  drivers/acpi/riscv/Makefile      |  2 +-
> >  drivers/acpi/riscv/irqchip.c     | 46 ++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-riscv-intc.c | 12 ++++-----
> >  5 files changed, 75 insertions(+), 7 deletions(-)
> >  create mode 100644 drivers/acpi/riscv/irqchip.c
> > 
> > diff --git a/Documentation/riscv/acpi.rst b/Documentation/riscv/acpi.rst
> > index 9870a282815b..e2406546bc16 100644
> > --- a/Documentation/riscv/acpi.rst
> > +++ b/Documentation/riscv/acpi.rst
> > @@ -8,3 +8,24 @@ The ISA string parsing rules for ACPI are defined by `Version ASCIIDOC
> >  Conversion, 12/2022 of the RISC-V specifications, as defined by tag
> >  "riscv-isa-release-1239329-2023-05-23" (commit 1239329
> >  ) <https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-1239329-2023-05-23>`_
> > +
> > +Interrupt Controller Drivers
> > +=======
> > +
> > +ACPI drivers for RISC-V interrupt controllers use software node framework to
> > +create the fwnode for the interrupt controllers. Below properties are
> > +additionally required for some firmware nodes apart from the properties
> > +defined by the device tree bindings for these interrupt controllers. The
> > +properties are created using the data in MADT table.
> 
> I don't really understand this text, specifically what you are getting
> at w/ the dependency on devicetree properties. What exactly does "apart
> from the properties defined by the devicetree bindings" mean?
> 
> Is there prior art for this kind of "ACPI needs swnodes that look
> vaguely similar to devicetree" for other interrupt controllers?
>
Never mind. This will not be required with Marc's feedback.

Thanks,
Sunil 
