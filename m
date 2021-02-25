Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8E9C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 14:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 067BF64EC3
	for <linux-doc@archiver.kernel.org>; Thu, 25 Feb 2021 14:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbhBYOn3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 09:43:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231248AbhBYOnZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Feb 2021 09:43:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C24564E28;
        Thu, 25 Feb 2021 14:42:40 +0000 (UTC)
Date:   Thu, 25 Feb 2021 14:42:38 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Baoquan He <bhe@redhat.com>
Cc:     Chen Zhou <chenzhou10@huawei.com>, mingo@redhat.com,
        tglx@linutronix.de, rppt@kernel.org, dyoung@redhat.com,
        will@kernel.org, nsaenzjulienne@suse.de, corbet@lwn.net,
        John.P.donnelly@oracle.com, prabhakar.pkin@gmail.com,
        horms@verge.net.au, robh+dt@kernel.org, arnd@arndb.de,
        james.morse@arm.com, xiexiuqi@huawei.com, guohanjun@huawei.com,
        huawei.libin@huawei.com, wangkefeng.wang@huawei.com,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v14 02/11] x86: kdump: make the lower bound of crash
 kernel reservation consistent
Message-ID: <20210225144237.GA23418@arm.com>
References: <20210130071025.65258-1-chenzhou10@huawei.com>
 <20210130071025.65258-3-chenzhou10@huawei.com>
 <20210224143547.GB28965@arm.com>
 <20210225070717.GG3553@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225070717.GG3553@MiWiFi-R3L-srv>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 25, 2021 at 03:08:46PM +0800, Baoquan He wrote:
> On 02/24/21 at 02:35pm, Catalin Marinas wrote:
> > On Sat, Jan 30, 2021 at 03:10:16PM +0800, Chen Zhou wrote:
> > > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > > index da769845597d..27470479e4a3 100644
> > > --- a/arch/x86/kernel/setup.c
> > > +++ b/arch/x86/kernel/setup.c
> > > @@ -439,7 +439,8 @@ static int __init reserve_crashkernel_low(void)
> > >  			return 0;
> > >  	}
> > >  
> > > -	low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, 0, CRASH_ADDR_LOW_MAX);
> > > +	low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, CRASH_ALIGN,
> > > +			CRASH_ADDR_LOW_MAX);
> > >  	if (!low_base) {
> > >  		pr_err("Cannot reserve %ldMB crashkernel low memory, please try smaller size.\n",
> > >  		       (unsigned long)(low_size >> 20));
> > 
> > Is there any reason why the lower bound can't be 0 in all low cases
> > here? (Sorry if it's been already discussed, I lost track)
> 
> Seems like a good question.
> 
> This reserve_crashkernel_low(), paired with reserve_crashkernel_high(), is
> used to reserve memory under 4G so that kdump kernel owns memory for dma
> buffer allocation. In that case, kernel usually is loaded in high
> memory. In x86_64, kernel loading need be aligned to 16M because of
> CONFIG_PHYSICAL_START, please see commit 32105f7fd8faa7b ("x86: find
> offset for crashkernel reservation automatically"). But for crashkernel
> low memory, there seems to be no reason to ask for 16M alignment, if
> it's taken as dma buffer memory.
> 
> So we can make a different alignment for low memory only, e.g 2M. But
> 16M alignment consistent with crashkernel,high is also fine to me. The
> only affect is smaller alignment can increase the possibility of
> crashkernel low reservation.

I don't mind the 16M alignment in both low and high base. But is there
any reason that the lower bound (third argument) cannot be 0 in both
reserve_crashkernel() (the low attempt) and reserve_crashkernel_low()
cases? The comment in reserve_crashkernel() only talks about the 4G
upper bound but not why we need a 16M lower bound.

-- 
Catalin
