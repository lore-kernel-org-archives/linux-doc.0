Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=BODY_URI_ONLY,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD0E97D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 22:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965064AbeFSWS1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 18:18:27 -0400
Received: from mail-yb0-f195.google.com ([209.85.213.195]:34267 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964958AbeFSWS0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 18:18:26 -0400
Received: by mail-yb0-f195.google.com with SMTP id n23-v6so516953ybg.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 15:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSe+OmkgmTCnaER2cb7DzpJkBEG5Omh2Zt7bm2q68kQ=;
        b=o/mfD6jxpzAVsKiX3n6SHThgp2y41E8c5eWFCWA4IQU76RhXlzz70p+R+DVzTHhUIZ
         jmEgmE5fdIp8YwaxWS1Ky4/wAasx6a0iISTS0+JIWZRvK/1JpzuphfiaNkyHkFxUo75h
         ceGJ3UXyjb+K7TdmL2x8+6fl23tAneDaY/YePfxEs/pIkBTYQkKM+OnBU/Grg43fGl/N
         1trnuDmVM3N7y9u1wdnp3C+RhpLhM+/94bjNOHAEQ5uXxfzXxNcK2Uxn1m1zYtDl1wA2
         2SKP0r29Jv5ATH3CBYMCQV2wLlJJy2pPxscLER4iPnow7NFuNXkeuAXipeq2KJW5MhnO
         V05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSe+OmkgmTCnaER2cb7DzpJkBEG5Omh2Zt7bm2q68kQ=;
        b=L165t00mlX7dOryIi6OI3/6v0xJyCgtDYb6hxgbzka+sv6yT0KtrN8oJM9OptO/sQs
         0wd+Cn4DnBH+gwsYaLLsBB835qWRAIY29GQ9bTyj6nG660AvoMUSnZFgTMPsLmc0ufuW
         Azrqc7HPDA3Z0WUdUJsF/FsKkXCZi2C4ql/Hn3Hw3CDw5LI0dN29S7lZVqDmcK4QiYVr
         OzzinIL98m0HMqAnriNSYOpxnK5FWDS1nwa0w1crfFS9gSKXX+aL8TXSfcsXBU1GJtwq
         hOIBeExFuqfg0PTqazskz63Abxe4csy9eKYMXxl/UJNgSy4ZuWhnAhFf7P4qtatJDy3G
         /NPg==
X-Gm-Message-State: APt69E2XKla7b39KlrMFg7WJve+yhFfx+XBZYSw3X9VLc4tt18y0SZL2
        af75Nv0OeRauDgUIqF2+4dDIhXfNhhRlPGauBbvFGw==
X-Google-Smtp-Source: ADUXVKIDeBbjiNsdwgQjDxKvaf0/vQ3kVcTMZwDZaICdJdgOOQ4bEXInigFRtR964VstMeQ1lsypsHQGYE2r6WlGFtI=
X-Received: by 2002:a25:9d0b:: with SMTP id i11-v6mr9444174ybp.1.1529446705212;
 Tue, 19 Jun 2018 15:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20180522222805.80314-1-rajatja@google.com> <20180523175808.28030-1-rajatja@google.com>
 <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com>
In-Reply-To: <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 19 Jun 2018 15:17:49 -0700
Message-ID: <CACK8Z6H7tRndUD4zvPu_GaRkAH7uNwacEb=a-O2ho9vGwHg3kg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Expose PCIe AER stats via sysfs
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        "Busch, Keith" <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sure, no problem. Will do.
On Tue, Jun 19, 2018 at 3:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, May 23, 2018 at 10:58:03AM -0700, Rajat Jain wrote:
> > This patchset exposes the AER stats via the sysfs attributes.
> >
> > Patchset v2 has minor changes to v1 based on the review comments,
> > no functional change.
> > Primarily:
> >  * Fix license header
> >  * Use tabs instead of spaces
> >  * Remove use on unlikely() etc
> >  * Move documentation to Documentation/ABI/
> >
> > Rajat Jain (5):
> >   PCI/AER: Define and allocate aer_stats structure for AER capable
> >     devices
> >   PCI/AER: Add sysfs stats for AER capable devices
> >   PCI/AER: Add sysfs attributes to provide breakdown of AERs
> >   PCI/AER: Add sysfs attributes for rootport cumulative stats
> >   Documentation/ABI: Add details of PCI AER statistics
> >
> >  .../testing/sysfs-bus-pci-devices-aer_stats   | 103 ++++++++++
> >  Documentation/PCI/pcieaer-howto.txt           |   5 +
> >  drivers/pci/pci-sysfs.c                       |   3 +
> >  drivers/pci/pci.h                             |   4 +-
> >  drivers/pci/pcie/aer/Makefile                 |   2 +-
> >  drivers/pci/pcie/aer/aerdrv.h                 |  15 ++
> >  drivers/pci/pcie/aer/aerdrv_core.c            |  11 +
> >  drivers/pci/pcie/aer/aerdrv_errprint.c        |   7 +-
> >  drivers/pci/pcie/aer/aerdrv_stats.c           | 192 ++++++++++++++++++
> >  drivers/pci/probe.c                           |   1 +
> >  include/linux/pci.h                           |   3 +
> >  11 files changed, 342 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
> >  create mode 100644 drivers/pci/pcie/aer/aerdrv_stats.c
>
> I broke this by putting all the AER code in one file in v4.18-rc1,
> sorry!  Would you mind rebasing these on top of that?
>
> Since everything AER-related is now in aer.c, I'd suggest putting the
> stats code there, too.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
