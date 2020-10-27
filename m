Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DE2C388F9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 12:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9A8022265
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 12:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751006AbgJ0MaS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 08:30:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57846 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505200AbgJ0MaR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Oct 2020 08:30:17 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1kXO6B-00009h-SZ
        for linux-doc@vger.kernel.org; Tue, 27 Oct 2020 12:29:11 +0000
Received: by mail-ed1-f69.google.com with SMTP id t4so613844edv.7
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2020 05:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTgjDePmf/qhP9yTlxEchVjAXLV59jrPV/VUxzJG83E=;
        b=L8Sv26pJ/DvVOxzUyt1iX7a0CvwSo8jVjljig8gSb006+VVeXUsTvZn0jWlz6/u0go
         fYLJNVspBp4bVOLhhYe9usAdvBy14065IZaCEm6wnyyjbBnwmNyraNo9W0s3CrSWtivz
         5mR5PKGZi8v2ATkhetUrFD9j1yMJcaDXaalvppa7YVIdBScnKGV2nLUvdFkmfd2/w/Ud
         alWj3LsOCpFAm2eCYk1WJTF6kEpGyj4YlKZYTWt7bvm3+FCf7e6v9UT6eXuQ5Rwh/TpH
         3tROBW0cbpGK64ZkOck5CbU9M0aQAcp2FhJrYzQpPQ/LO3uMQocGZCePgebqnAw+YYM3
         SEbQ==
X-Gm-Message-State: AOAM53399lAb6lVZbQDb2O4DXsyLuPqhVJ6BencvFGhATQa6ncjJrtCU
        Qm+bEvC0r0DgmbpKcoLPHsK3WruKaSDXLIEYfk2876MIFtAUbVDcifp0g5PGPdwBSq74xhEEdCO
        AF7/ppn7uNTas6JodHJaOg3LBmgrV1QYQczd1xeN4c7pu2KZlSoMItg==
X-Received: by 2002:a50:9e87:: with SMTP id a7mr1981555edf.297.1603801751402;
        Tue, 27 Oct 2020 05:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/pzTCu7BD0cDL2tKkBWCEtjogacacAFo+K72z4fQQrd+XvzL97es2P0sE1mbTDypGKGkghTxouH9se1bgFxM=
X-Received: by 2002:a50:9e87:: with SMTP id a7mr1981519edf.297.1603801751118;
 Tue, 27 Oct 2020 05:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <1603346163-21645-1-git-send-email-kernelfans@gmail.com>
 <871rhq7j1h.fsf@nanos.tec.linutronix.de> <CAFgQCTvFwvvtPE0Eow4cebCEe5OD5OhgAQarckpbFc38Bphaag@mail.gmail.com>
 <CAHD1Q_x99XW1zDr5HpVR27F_ksHLkaxc2W83e-N6F_xLYKyGbQ@mail.gmail.com>
 <87y2js3ghv.fsf@nanos.tec.linutronix.de> <CAHD1Q_yvb43P+b6PUzK4a1jU+RH3Shv2=4bO69nh5VDWXgv-ww@mail.gmail.com>
 <87o8ko3cpr.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87o8ko3cpr.fsf@nanos.tec.linutronix.de>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Tue, 27 Oct 2020 09:28:35 -0300
Message-ID: <CAHD1Q_z1UZR-iAN=FWY3wsc2nKFWN1yxQ15U0jE0_2cGuGGSRQ@mail.gmail.com>
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

On Mon, Oct 26, 2020 at 6:21 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> [...]
> > So, I don't want to hijack Liu's thread, but do you think it makes
> > sense to have my approach as a (debug) parameter to prevent such a
> > degenerate case?
>
> At least it makes sense to some extent even if it's incomplete. What
> bothers me is that it'd be x86 specific while the issue is pretty much
> architecture independent. I don't think that the APIC is special in that
> regard. Rogue MSIs should be able to bring down pretty much all
> architectures.
>

Thanks Thomas! I partially agree with you, I can speak only for x86
and powerpc. In x86 we know that happens, OK. But in powerpc, we had a
special PCI reset, we called it IIRC "fundamental"/PHB reset - that
procedure would put the PCI devices in good shape, it was something
that the kernel could request from FW - see [0] for an example. It was
present in all incarnations of powerpc (bare-metal, powerVM/PHyp - a
virtual thing) except maybe in qemu (although it'd be possible to do
that, since the PCI devices are attached on host and passthrough'ed
via vfio).

Anyway, in powerpc the PCI devices are really reset across
"soft-reboots" be it kexec or what was called a fast reboot (that
skipped some FW initializations), effectively disabling MSIs - x86 has
no such default/vendor-agnostic reset infrastructure, BIOSes usually
do some kind of PCI reset but with no interface for the kernel to
request that in kexec, for example. That said, the option was to use
the arch code to early-clear the MSI state in all devices, that being
a kind of reset. And it's "supported" by the spec, that claims MSIs
should be clear before devices' initialization =)

Anyway, I'm glad to discuss more, and I'm even more glad that you
consider the approach useful. We could revive that if Bjorn agrees, I
could respin an updated version. ARM64/RISC-V or whatever other
architectures I can't say about, but I think if they have early-PCI
handlers (and !FW reset, like powerpc) it would be possible to
implement that in a more complete way.


> > Or could we have something in core IRQ code to prevent irq flooding in
> > such scenarios, something "stronger" than disabling MSIs (APIC-level,
> > likely)?
>
> For your case? No. The APIC cannot be protected against rogue MSIs. The
> only cure is to disable interrupts or disable MSIs on all PCI[E] devices
> early on. Disabling interrupts is not so much of an option obviously :)

Great to know that, we imagined if it would be possible to have a more
"soft" option, but it seems clearing MSIs is the way to go.
Cheers,


Guilherme

[0] kernel portion:
git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/platforms/powernv/pci-ioda.c#n3161
FW portion: github.com/open-power/skiboot/blob/master/core/pci-opal.c#L545
