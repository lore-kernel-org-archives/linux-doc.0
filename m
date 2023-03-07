Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08E7C678DB
	for <linux-doc@archiver.kernel.org>; Tue,  7 Mar 2023 05:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjCGFG2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Mar 2023 00:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCGFG1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Mar 2023 00:06:27 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10937457C0
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 21:06:25 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id ky4so12915296plb.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Mar 2023 21:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678165584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ncIZQ84lksEd9kxqzUc4pmHzurSPn3jNUdkAVBVakM=;
        b=ZDrVtKw9CQtz5i5Rktk/5VuDFClMgI+RB514CO50h6TX40umhQQXF+3Al7jnCCXMPJ
         hrdzIs41xbHE6KDgEtj/FfBi18Vz5YkbagBEP6N1wmOxeuTjjivdwCKZh2RTzJE6loC/
         lzhACyYDd0OCcrXkO/T81CHBNKACaz6nsAf6E15zew/yj3OMUhPwVatN5ZAb4hrVTWYV
         PukVc2HJaWAVSRfl24P98E1EoRxJbXH9KoIQB96TlLPVCFVN7/vgZuRVwQuMwdfUf7zx
         Es9WWh7t1O9vTOsoSAQUcyz/3cIxhnas9VN7Q9VWGaXwdBAaf6eSR7rTquhMN3wr/6YP
         skLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678165584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ncIZQ84lksEd9kxqzUc4pmHzurSPn3jNUdkAVBVakM=;
        b=RKsYiTvwTUjLj+twSBq9bCc9MY/xemHOdKP9k4J4uIWoJKts76hGAMuKzgpMuEk6m6
         FeyyAjbrkEC8ca5+FVsJ00ZRIDi0Mb4aQmgpXYQW892G+5LtoqguSzAZZXwt8E5Y0hXq
         PvRhllvrIcOTlbfAj14UROkYo0Nx0Ua4pdEbxARbGzTyKb/ygy2DMBddm1X1Vc0J99kx
         hETTDuEGBVM2BlAouLEK2usnknl8gRKGSnlzW87q7Ts2PMGJuYbqUO9XgZybPsoEc6r8
         T9UOu+N1qaqPq1J/2evQEc7/SQNUSQ82dCsFIp/IuwHEDCDict9zIpTu9A96MMtpR2S0
         wO6w==
X-Gm-Message-State: AO0yUKXoQyLnP8WnNN4vwJfAoRWdz5DNzhGX/gMw56VkCB2v3ja5mM2B
        eeCOQY0x6fvrPb+5G/fWRqfVlg==
X-Google-Smtp-Source: AK7set+lsGeOZJEFKPysrv4y2Wbb94M1eNKlJPEGR3INGjRdcW5GKTB4n9YlJ3volc2UF6gUqL7yYQ==
X-Received: by 2002:a17:902:f693:b0:19d:e11:32de with SMTP id l19-20020a170902f69300b0019d0e1132demr16517253plg.34.1678165584256;
        Mon, 06 Mar 2023 21:06:24 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id le3-20020a170902fb0300b0019edf582a95sm470363plb.20.2023.03.06.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 21:06:23 -0800 (PST)
Date:   Tue, 7 Mar 2023 10:36:16 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
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
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
Message-ID: <ZAbGSA6F0kfv9YYw@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16007014-c5f2-4b07-baec-e19952236aa5@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 06, 2023 at 09:51:09PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
> > This patch series enables the basic ACPI infrastructure for RISC-V.
> > Supporting external interrupt controllers is in progress and hence it is
> > tested using poll based HVC SBI console and RAM disk.
> > 
> > The first patch in this series is one of the patch from Jisheng's
> > series [1] which is not merged yet. This patch is required to support
> > ACPI since efi_init() which gets called before sbi_init() can enable
> > static branches and hits a panic.
> > 
> > Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
> > but a PR is raised already.
> > 
> > Below are two ECRs approved by ASWG.
> > RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> > RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> > 
> > The series depends on Anup's IPI improvement series [2].
> > 
> > [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
> > [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@ventanamicro.com/T/
> 
> Building a clang-15 allmodconfig (I didn't try gcc) with this series, and
> Anup's IPI bits, results in a broken build, due to failings in cmpxchg:
> 
> /stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error: call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BUG failed
>         while (unlikely((ret = cmpxchg(&c->value, old, new)) != old)) {
>                                ^
Hi Conor,

I am able to build without any of these issues using clang-15. I am
wondering whether the base is proper. I had rebased on top of the master
and couple of patches from IPI series were already merged in the master.

Do you mind verifying with my branch
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V3?

Or if you could provide me your branch details, I can look further.

Thanks!
Sunil
