Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 310057E22E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 11:39:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755324AbeDCLjX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 07:39:23 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:57724 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755231AbeDCLjW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Apr 2018 07:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qLQhq3iY7hF49eIDuYbrjg5KLP1qzGt1xNWmRL0Ij5c=; b=ll8ZDaVLJk6Cm8JP3pVrG1PAT
        mfwPwGq+PkspvGSKDh/DQPYDDau/3Q3KVYmh82/QEI3IPVfQ5SfB4qu4HuexOoYhUcQHGLdkoyWHq
        2btw0SyI4ZV3VXMUh9Afrk156ADQ2AnN9MchZV40iKFKzvfsl7RyTRD3jRqM9sSi8AAdY=;
Received: from n2100.armlinux.org.uk ([2002:4e20:1eda:1:214:fdff:fe10:4f86]:43345)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1f3KGx-0001UM-AY; Tue, 03 Apr 2018 12:38:43 +0100
Received: from linux by n2100.armlinux.org.uk with local (Exim 4.90_1)
        (envelope-from <linux@n2100.armlinux.org.uk>)
        id 1f3KGt-0002wl-Mp; Tue, 03 Apr 2018 12:38:39 +0100
Date:   Tue, 3 Apr 2018 12:38:37 +0100
From:   Russell King - ARM Linux <linux@armlinux.org.uk>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Abbott Liu <liuwenliang@huawei.com>, aryabinin@virtuozzo.com,
        dvyukov@google.com, corbet@lwn.net, christoffer.dall@linaro.org,
        kstewart@linuxfoundation.org, gregkh@linuxfoundation.org,
        f.fainelli@gmail.com, akpm@linux-foundation.org,
        linux@rasmusvillemoes.dk, mawilcox@microsoft.com,
        pombredanne@nexb.com, ard.biesheuvel@linaro.org,
        vladimir.murzin@arm.com, alexander.levin@verizon.com,
        nicolas.pitre@linaro.org, tglx@linutronix.de, thgarnie@google.com,
        dhowells@redhat.com, keescook@chromium.org, arnd@arndb.de,
        geert@linux-m68k.org, tixy@linaro.org, julien.thierry@arm.com,
        mark.rutland@arm.com, james.morse@arm.com,
        zhichao.huang@linaro.org, jinb.park7@gmail.com, labbott@redhat.com,
        philip@cog.systems, grygorii.strashko@linaro.org,
        catalin.marinas@arm.com, opendmb@gmail.com,
        kirill.shutemov@linux.intel.com, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 2/6] Disable instrumentation for some code
Message-ID: <20180403113837.GK16141@n2100.armlinux.org.uk>
References: <20180402120440.31900-1-liuwenliang@huawei.com>
 <20180402120440.31900-3-liuwenliang@huawei.com>
 <7837103a-bcf0-6b00-14d6-bd6b80649886@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7837103a-bcf0-6b00-14d6-bd6b80649886@arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 03, 2018 at 12:30:42PM +0100, Marc Zyngier wrote:
> On 02/04/18 13:04, Abbott Liu wrote:
> > From: Andrey Ryabinin <a.ryabinin@samsung.com>
> > 
> > Disable instrumentation for arch/arm/boot/compressed/*
> > ,arch/arm/kvm/hyp/* and arch/arm/vdso/* because those
> > code won't linkd with kernel image.
> > 
> > Disable kasan check in the function unwind_pop_register
> > because it doesn't matter that kasan checks failed when
> > unwind_pop_register read stack memory of task.
> > 
> > Reviewed-by: Russell King - ARM Linux <linux@armlinux.org.uk>
> > Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> Just because I replied to this patch doesn't mean you can stick my
> Reviewed-by tag on it. Please drop this tag until I explicitly say that
> you can add it (see Documentation/process/submitting-patches.rst,
> section 11).
> 
> Same goes for patch 1.

Same goes for that reviewed-by line for me.  From my records, I never
even looked at patch 2 from the first posting, and I don't appear to
have the second posting in my mailbox (it's probably been classed as
spam by dspam.)  So these reviewed-by lines seem to be totally
misleading.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
