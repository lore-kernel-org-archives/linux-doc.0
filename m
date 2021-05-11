Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B7C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 14:54:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0024E6023B
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 14:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhEKOzm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 10:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbhEKOzj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 10:55:39 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C421C061574;
        Tue, 11 May 2021 07:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4msCzCUsyxau2TU6VXE1qeMg6CinUsxc6jRiNjbi3tc=; b=OzYPs8WpahnCaMws+AN28mbvA
        WjnznZcTPMVdwjPvEKihdw6zgH7SLO7wzAXCE6ufQWl6bX3pPQZ373uGIo3n5IVd9rVdYFjnFZ5x/
        l+d7OD2KFlXq+xhfiLYrr1pagReW3+RRKfa31wOqsYOHwk9i0r34zhZUqQ27eHP4k+wwoO5pzQhix
        r6zd8eOvb6uGNQuhzGUfG0tI3CQAjMQaLmAG5V0nXGR6jbrFaLXcc1vs4p+srl0ZWhdE20+3tC5Zr
        4i1xAJ1ola9Ldrnk4u76Mrq6fSFhPfFEzXKnZqezrYh2KXKJzeRqwxecTbyjVRV3kMXeCEYqVFX4q
        a49bb9VdA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43866)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1lgTm6-0002mh-Tl; Tue, 11 May 2021 15:54:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1lgTm4-0001Am-E1; Tue, 11 May 2021 15:54:16 +0100
Date:   Tue, 11 May 2021 15:54:16 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm: Enlarge IO_SPACE_LIMIT needed for some SoC
Message-ID: <20210511145416.GM1336@shell.armlinux.org.uk>
References: <20210511021656.17719-1-ansuelsmth@gmail.com>
 <YJnq3Y3/I1kdV1Ov@casper.infradead.org>
 <YJnswvYFUjlNS7Fa@Ansuel-xps.localdomain>
 <CAMj1kXGLihr4gq3iwHy6mLKG4UHWnh5XAgxZDZmnmNPErfJ-bg@mail.gmail.com>
 <YJp1WYTXHsSAA0ES@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJp1WYTXHsSAA0ES@Ansuel-xps.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 11, 2021 at 02:15:21PM +0200, Ansuel Smith wrote:
> 0000:01:00.0 Network controller: Qualcomm Atheros QCA9984 802.11ac Wave 2 Wireless Network Adapter
>         Subsystem: Qualcomm Atheros Device cafe
>         Device tree node: /sys/firmware/devicetree/base/soc/pci@1b500000/bridge@0,0/wifi@1,0
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 53
>         Region 0: Memory at 08000000 (64-bit, non-prefetchable) [size=2M]

It seems this Atheros device does not make any use of I/O, so this
device should be fine.

> 0001:01:00.0 Network controller: Qualcomm Atheros QCA9984 802.11ac Wave 2 Wireless Network Adapter
>         Subsystem: Qualcomm Atheros Device cafe
>         Device tree node: /sys/firmware/devicetree/base/soc/pci@1b700000/bridge@0,0/wifi@1,0
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 54
>         Region 0: Memory at 2e000000 (64-bit, non-prefetchable) [size=2M]

This device also seems to not make use of any I/O.

I don't see any reason probing of these two drivers should fail if
there is no or reduced I/O space.

Please can you share the kernel messages so we can see exactly what is
failing and how?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
