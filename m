Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E284C5519F
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 16:33:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A93922228
	for <linux-doc@archiver.kernel.org>; Fri, 27 Nov 2020 16:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbgK0QdF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Nov 2020 11:33:05 -0500
Received: from foss.arm.com ([217.140.110.172]:45924 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730603AbgK0QdE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Nov 2020 11:33:04 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB72C1516;
        Fri, 27 Nov 2020 08:33:03 -0800 (PST)
Received: from bogus (unknown [10.57.59.53])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373573F71F;
        Fri, 27 Nov 2020 08:33:00 -0800 (PST)
Date:   Fri, 27 Nov 2020 16:32:54 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     David Brazdil <dbrazdil@google.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel-team@android.com
Subject: Re: [PATCH v3 06/23] kvm: arm64: Add kvm-arm.protected early kernel
 parameter
Message-ID: <20201127163254.zxdrszlveaxhluwn@bogus>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-7-dbrazdil@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126155421.14901-7-dbrazdil@google.com>
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 26, 2020 at 03:54:04PM +0000, David Brazdil wrote:
> Add an early parameter that allows users to opt into protected KVM mode
> when using the nVHE hypervisor. In this mode, guest state will be kept
> private from the host. This will primarily involve enabling stage-2
> address translation for the host, restricting DMA to host memory, and
> filtering host SMCs.
> 
> Capability ARM64_PROTECTED_KVM is set if the param is passed, CONFIG_KVM
> is enabled and the kernel was not booted with VHE.
> 
> Signed-off-by: David Brazdil <dbrazdil@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  5 ++++
>  arch/arm64/include/asm/cpucaps.h              |  3 +-
>  arch/arm64/include/asm/virt.h                 |  8 +++++
>  arch/arm64/kernel/cpufeature.c                | 29 +++++++++++++++++++
>  arch/arm64/kvm/arm.c                          |  4 ++-
>  5 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 526d65d8573a..06c89975c29c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2259,6 +2259,11 @@
>  			for all guests.
>  			Default is 1 (enabled) if in 64-bit or 32-bit PAE mode.
>  
> +	kvm-arm.protected=
> +			[KVM,ARM] Allow spawning protected guests whose state
> +			is kept private from the host. Only valid for non-VHE.
> +			Default is 0 (disabled).
> +

Sorry for being pedantic. Can we reword this to say valid for
!CONFIG_ARM64_VHE ? I read this as valid only for non-VHE hardware, it may
be just me, but if you agree please update so that it doesn't give remote
idea that it is not valid on VHE enabled hardware.

I was trying to run this on the hardware and was trying to understand the
details on how to do that.

-- 
Regards,
Sudeep
