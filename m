Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C52C636D7
	for <linux-doc@archiver.kernel.org>; Mon, 13 Feb 2023 05:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjBMFNx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Feb 2023 00:13:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBMFNw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 00:13:52 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED228DBD2
        for <linux-doc@vger.kernel.org>; Sun, 12 Feb 2023 21:13:51 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so11076736pjp.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Feb 2023 21:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/rXlbQZUiYssX0GWdtn60fAH8aeaRBmLehOaQBY1mE=;
        b=BczA9Dit8WldsIfP8UBgYlgc8TWJhovdzXsusWUlS+5qwERWfEecSRfNvw2jdkipTt
         FftWA7ruHlkUk3JVzZ1R2/G95S9ueaU75uXAfKH/d+o6Wvx4A4+tsy2UkZIZma/LHypW
         b1HtPzukBNiYeS0/OLsWF5NHpFKXqO/xMwlEYEGDKUzBZ8D91k9sx7/8fVBaxjddDALw
         /YCfRX/nPAgzOb51JRnSuTkMLiQr0ZQA5dXciGNdnFXKrI+gu84pYpUm/ENQNd65VC1s
         ugorSZLeiHIEBj3MNBjGdwfT2IeeGdw1kY8bm8vt05A2ZhJTkpwI5IEJNhKGy16PpfJv
         i99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/rXlbQZUiYssX0GWdtn60fAH8aeaRBmLehOaQBY1mE=;
        b=sWKP6oMFrLwKPmjsfkPJzqj4PpDINjR4agv7PDk/GomCe5HSuPXqVFN1OpLpP3P03V
         5J4SWLxAnjTmWk6ibd6vFgqhqRwrtvKi9dI5IrYRzoaLUumNQAbucSYt7V9pjoZCPIa9
         TQ/22wM1oq/Ds4moI1aAaX9mm4r4SfYdN1UgzkAm0UrpoUphDRtt6qI8F9T+mFrHgS9e
         msOqxifZixATp+Clxjg6pTzm7Ne0GDBiC078tS2hN/KCNejvU76ulImSAf3ERCHkw2pU
         fJQtatDbDwaQaP5ef2dDcSCgi4WAylqa/12nXmBpnHC1frvdz/VKFmYkBwM/TYoB/bwE
         3aRw==
X-Gm-Message-State: AO0yUKWCWcjh+ioy02ETKYt6AsbF3D3AmB6z3L8kH4jS3uUPpEoKaaNJ
        ZKILQy/xqwwuxpsc1gBtKqFB7w==
X-Google-Smtp-Source: AK7set+HBd/TKOpekO2R5ZNBdJ5nlE4W2Q0OVyhq7zVLBYibkTxtu4XeGFM4NuzAT9/O7iEzdrKiyA==
X-Received: by 2002:a17:903:24c:b0:198:a715:d26d with SMTP id j12-20020a170903024c00b00198a715d26dmr25510023plh.8.1676265231494;
        Sun, 12 Feb 2023 21:13:51 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902784900b00198f9fa23a3sm7079601pln.287.2023.02.12.21.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 21:13:51 -0800 (PST)
Date:   Mon, 13 Feb 2023 10:43:42 +0530
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
        Atish Patra <atishp@rivosinc.com>,
        Robert Moore <robert.moore@intel.com>,
        acpica-devel@lists.linuxfoundation.org
Subject: Re: [PATCH 02/24] ACPICA: MADT: Add RISC-V INTC interrupt controller
Message-ID: <Y+nHBivfemYR2NGD@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-3-sunilvl@ventanamicro.com>
 <Y+P/BDbP68vNTOao@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+P/BDbP68vNTOao@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 08, 2023 at 07:59:00PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:03PM +0530, Sunil V L wrote:
> > The ECR to add RISC-V INTC interrupt controller is approved by
> > the UEFI forum and will be availabl in the next revision of
> 
> nit: available
> 
Thanks!

> > the ACPI specification.
> > 
> > This patch is not yet merged in ACPICA but a PR is raised.
> > 
> > ACPICA PR: https://github.com/acpica/acpica/pull/804
> 
> I had a quick check with git grep, and as this doesn't appear to be a
> regular pattern in the history, so could you please make this a regular
> Link: trailer?
> 
This patch should be merged in acpica repo first and then we will get
this in standard format. Until then, it exists to allow other
patches get reviewed. I believe by the time we get all other patches
reviewed, acpica will have this merged.

Thanks!
Sunil
