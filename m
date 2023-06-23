Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5B1EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 15:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbjFWPfA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 11:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjFWPe4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 11:34:56 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC332105
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6+W2hry1AcXhsigH/cF9EASBVVJLJxcSUG3JYvs/xq4=; b=YhcDaN5C/V3C7rXSuAZJbUV/UI
        nc0GqUDnjIb7Smn3BYFrQEcCHKxAnVwnn+qNKDrcOtzF1mXONidIEKFcDny9o2x8w0rxSCQR3IF6/
        tbwU/rNkHf+6xAv5HXAePHDEBV+8xAbOdbFIdmzaFn7w9CyInMY5hdBGKUSCCP3qNdUSjc5Lw7ELd
        kpKMu7NThY5MX7IB0itqCl5FU+S1MImSgL3NpzwkyZTOK3q/u8DWBXekF3Q9BRVqyW56FgNB3oSkt
        1595rfBTLnwgM6m5gEMSJgH0EvaeHwAIMcRP6YjViIVrUdMVMqs2/Baer2aSVvcf95h43apFhDhDI
        fXKdDImQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48960)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qCio8-0005ZA-UD; Fri, 23 Jun 2023 16:34:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qCio6-0001ZY-Fe; Fri, 23 Jun 2023 16:34:42 +0100
Date:   Fri, 23 Jun 2023 16:34:42 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>, Quentin Perret <qperret@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 00/17] arm64 kernel text replication
Message-ID: <ZJW7kvWqLVZV4KVr@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <ZH2lUj0zDWFppdJI@shell.armlinux.org.uk>
 <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHn0oho_CZMSc5N1updfdZDq+3VAfzw8kZqzzpTSgkXew@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 23, 2023 at 05:24:20PM +0200, Ard Biesheuvel wrote:
> (cc Marc and Quentin)
> 
> On Mon, 5 Jun 2023 at 11:05, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > Hi,
> >
> > Are there any comments on this?
> >
> 
> Hi Russell,
> 
> I think the proposed approach is sound, but it is rather intrusive, as
> you've pointed out already (wrt KASLR and KASAN etc). And once my LPA2
> work gets merged (which uses root level -1 when booted on LPA2 capable
> hardware, and level 0 otherwise), we'll have yet another combination
> that is either fully incompatible, or cumbersome to support at the
> very least.
> 
> I wonder if it would be worthwhile to explore an alternative approach,
> using pKVM and the host stage2:
> 
> - all stage1 kernel mappings remain as they are, and the kernel code
> running at EL1 has no awareness of the replication beyond being
> involved in allocating the memory;
> - host is booted in protected KVM mode, which means that the host
> kernel executes under a stage 2 mapping;
> - each NUMA node has its own set of stage 2 page tables, and maps the
> kernel's code/rodata IPA range to a NUMA local PA range
> - the kernel's code and rodata are mapped read-only in the primary
> stage-2 mapping so updates trap to EL2, permitting the hypervisor to
> replicate those update to all clones.
> 
> Note that pKVM retains the capabilities of ordinary KVM, so as long as
> you boot at EL2, the only downside compared to your approach would be
> the increased TLB footprint due to the stage 2 mappings for the host
> kernel.
> 
> Marc, Quentin, Will: any thoughts?

Thanks for taking a look.

That sounds great, but my initial question would be whether, with such a
setup, one could then run VMs under such a kernel without hardware that
supports nested virtualisation? I suspect the answer would be no.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
