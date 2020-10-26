Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE55C4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 20:29:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F60721D41
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 20:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgJZU3R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 16:29:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37054 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgJZU3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 16:29:17 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1kX97C-0003sh-Lt
        for linux-doc@vger.kernel.org; Mon, 26 Oct 2020 20:29:14 +0000
Received: by mail-ed1-f70.google.com with SMTP id t7so3918212edt.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 13:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pBEYO4XpwYRaYgTmmtMnIBKfcuzOYxJIxnd6Dc7SwVo=;
        b=B1ddCbcZeDMrrzyHah45bbgSiFpEhuk9MUI/9I37nrR/cfeplhb+LcRGNMNvZsrkSl
         M0oNiDtA4R9QWX6g9/S2T5bUoCTrN4qRB3mFWq1lCahAP90Mj5vdFjBY0Fyg2oD4sLnQ
         6/IMOwEXMGEMwfDnXTuvzzvFMiBTj6sp5SF5Oa4PEqKrGZd1CBAmzqgEAOmrj+WmOmp8
         Uuupnz5VqCkxMwYrFnwHJRlpdWWAJUWOPNKCrca2SHtzz0ERKeN1QTvZB3uUyNoFEkJ7
         0OiKUJ+MlllPO242IlKBkgH2NygR68FJTlVXO7OGRqRNgGOxAcio6Zw1ts7cFkXkX7vq
         bjaA==
X-Gm-Message-State: AOAM532UCl6vurqd7Ss8+mXZ31fP9iMuqgF/dhSBcfq3ZU4WQP7S5D3l
        F0V3aBaotlPQqzYLzUYc9Z8jYxUFMyOiG/N5ccnF3s2QjIdr+BybyRurAzpJ6XwEl9pvyRduX3j
        rxgDF8CHhLtMnmlTkq2q71sZrvRfQaXD1iPs/d1cuPZv4RMBkw1PN6g==
X-Received: by 2002:a17:906:72cd:: with SMTP id m13mr18246190ejl.387.1603744152482;
        Mon, 26 Oct 2020 13:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdSiJoWemUST4jJlevJDxhbD24GUf2WsP6pUei9p5YDGRPprwvS5OD5sx9fFb0y0Geb5r1UOtnZM/V2qblhL4=
X-Received: by 2002:a17:906:72cd:: with SMTP id m13mr18246030ejl.387.1603744149971;
 Mon, 26 Oct 2020 13:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <1603346163-21645-1-git-send-email-kernelfans@gmail.com>
 <871rhq7j1h.fsf@nanos.tec.linutronix.de> <CAFgQCTvFwvvtPE0Eow4cebCEe5OD5OhgAQarckpbFc38Bphaag@mail.gmail.com>
 <CAHD1Q_x99XW1zDr5HpVR27F_ksHLkaxc2W83e-N6F_xLYKyGbQ@mail.gmail.com> <87y2js3ghv.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87y2js3ghv.fsf@nanos.tec.linutronix.de>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Mon, 26 Oct 2020 17:28:33 -0300
Message-ID: <CAHD1Q_yvb43P+b6PUzK4a1jU+RH3Shv2=4bO69nh5VDWXgv-ww@mail.gmail.com>
Subject: Re: [PATCH 0/3] warn and suppress irqflood
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Pingfan Liu <kernelfans@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>, Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Lina Iyer <ilina@codeaurora.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Oliver Neukum <oneukum@suse.com>, linux-doc@vger.kernel.org,
        Kexec Mailing List <kexec@lists.infradead.org>,
        Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 26, 2020 at 4:59 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Oct 26 2020 at 12:06, Guilherme Piccoli wrote:
> > On Sun, Oct 25, 2020 at 8:12 AM Pingfan Liu <kernelfans@gmail.com> wrote:
> >
> > Some time ago (2 years) we faced a similar issue in x86-64, a hard to
> > debug problem in kdump, that eventually was narrowed to a buggy NIC FW
> > flooding IRQs in kdump kernel, and no messages showed (although kernel
> > changed a lot since that time, today we might have better IRQ
> > handling/warning). We tried an early-boot fix, by disabling MSIs (as
> > per PCI spec) early in x86 boot, but it wasn't accepted - Bjorn asked
> > pertinent questions that I couldn't respond (I lost the reproducer)
> > [0].
> ...
> > [0] lore.kernel.org/linux-pci/20181018183721.27467-1-gpiccoli@canonical.com
>
> With that broken firmware the NIC continued to send MSI messages to the
> vector/CPU which was assigned to it before the crash. But the crash
> kernel has no interrupt descriptor for this vector installed. So Liu's
> patches wont print anything simply because the interrupt core cannot
> detect it.
>
> To answer Bjorns still open question about when the point X is:
>
>   https://lore.kernel.org/linux-pci/20181023170343.GA4587@bhelgaas-glaptop.roam.corp.google.com/
>
> It gets flooded right at the point where the crash kernel enables
> interrupts in start_kernel(). At that point there is no device driver
> and no interupt requested. All you can see on the console for this is
>
>  "common_interrupt: $VECTOR.$CPU No irq handler for vector"
>
> And contrary to Liu's patches which try to disable a requested interrupt
> if too many of them arrive, the kernel cannot do anything because there
> is nothing to disable in your case. That's why you needed to do the MSI
> disable magic in the early PCI quirks which run before interrupts get
> enabled.
>
> Also Liu's patch only works if:
>
>   1) CONFIG_IRQ_TIME_ACCOUNTING is enabled
>
>   2) the runaway interrupt has been requested by the relevant driver in
>      the dump kernel.
>
> Especially #1 is not a sensible restriction.
>
> Thanks,
>
>         tglx

Wow, thank you very much for this great explanation (without a
reproducer) - it's nice to hear somebody that deeply understands the
code! And double thanks for CCing Bjorn.

So, I don't want to hijack Liu's thread, but do you think it makes
sense to have my approach as a (debug) parameter to prevent such a
degenerate case? Or could we have something in core IRQ code to
prevent irq flooding in such scenarios, something "stronger" than
disabling MSIs (APIC-level, likely)?

Cheers,


Guilherme
