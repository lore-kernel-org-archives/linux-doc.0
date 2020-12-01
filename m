Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA4AC64E7B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 14:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 241FE2076C
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 14:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390426AbgLAO7d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 09:59:33 -0500
Received: from foss.arm.com ([217.140.110.172]:44412 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389972AbgLAO7d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Dec 2020 09:59:33 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6CCA30E;
        Tue,  1 Dec 2020 06:58:47 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.30.155])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 444ED3F575;
        Tue,  1 Dec 2020 06:58:43 -0800 (PST)
Date:   Tue, 1 Dec 2020 14:58:40 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     David Brazdil <dbrazdil@google.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, kvmarm@lists.cs.columbia.edu,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH v3 06/23] kvm: arm64: Add kvm-arm.protected early kernel
 parameter
Message-ID: <20201201145840.GC86881@C02TD0UTHF1T.local>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-7-dbrazdil@google.com>
 <20201127163254.zxdrszlveaxhluwn@bogus>
 <20201201131913.u7m2eifvtus74dra@google.com>
 <20201201140734.GA86881@C02TD0UTHF1T.local>
 <20201201144349.bglz7yicc3peixe6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201144349.bglz7yicc3peixe6@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 01, 2020 at 02:43:49PM +0000, David Brazdil wrote:
> > > > be just me, but if you agree please update so that it doesn't give remote
> > > > idea that it is not valid on VHE enabled hardware.
> > > > 
> > > > I was trying to run this on the hardware and was trying to understand the
> > > > details on how to do that.
> > > 
> > > I see what you're saying, but !CONFIG_ARM64_VHE isn't accurate either. The
> > > option makes sense if:
> > >   1) all cores booted in EL2
> > >      == is_hyp_mode_available()
> > >   2) ID_AA64MMFR1_EL1.VH=0 or !CONFIG_ARM64_VHE
> > >      == !is_kernel_in_hyp_mode()
> > > 
> > > The former feels implied for KVM, the latter could be 'Valid if the kernel
> > > is running in EL1'? WDYT?
> > 
> > I reckon we can avoid the restriction if we instead add an early stub
> > like with have for KASLR. That way we could parse the command line
> > early, and if necessary re-initialize EL2 and drop to EL1 before the
> > main kernel has to make any decisions about how to initialize things.
> > That would allow us to have a more general kvm-arm.mode option where a
> > single kernel Image could support:
> > 
> > * "protected" mode on nVHE or VHE HW
> > * "nvhe" mode on nVHE or VHE HW
> > * "vhe" mode on VHE HW
> > 
> > ... defaulting to VHE/nVHE modes depending on HW support.
> > 
> > That would also be somewhat future-proof if we have to add other
> > variants of protected mode in future, as we could extend the mode option
> > with parameters for each mode.
> 
> Agreed that 'mode' is a more future-proof flag and I would very much love to
> have an option to force nVHE on VHE HW. I however expect that the early stub
> would not be a trivial addition and would not want to get into that in this
> series. Could we agree on 'protected' as the only supported value for the time
> being?

Sure, that works for me.

Thanks,
Mark. 
