Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D716C56202
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 17:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E524121D7F
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 17:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404369AbgKZR2p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 12:28:45 -0500
Received: from foss.arm.com ([217.140.110.172]:41384 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404312AbgKZR2p (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:45 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BE7331B;
        Thu, 26 Nov 2020 09:28:44 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.30.234])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA92C3F23F;
        Thu, 26 Nov 2020 09:28:40 -0800 (PST)
Date:   Thu, 26 Nov 2020 17:28:38 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     David Brazdil <dbrazdil@google.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 03/23] arm64: Make cpu_logical_map() take unsigned int
Message-ID: <20201126172838.GD38486@C02TD0UTHF1T.local>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-4-dbrazdil@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126155421.14901-4-dbrazdil@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 26, 2020 at 03:54:01PM +0000, David Brazdil wrote:
> CPU index should never be negative. Change the signature of
> (set_)cpu_logical_map to take an unsigned int.
> 
> Signed-off-by: David Brazdil <dbrazdil@google.com>

Is there a function problem here, or is this just cleanup from
inspection?

Core code including the cpuhp_*() callbacks uses an int, so if there's a
strong justification to change this, it suggests there's some treewide
cleanup that should be done.

I don't have strong feelings on the matter, but I'd like to understand
the rationale.

Thanks,
Mark.

> ---
>  arch/arm64/include/asm/smp.h | 4 ++--
>  arch/arm64/kernel/setup.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 2e7f529ec5a6..bcb01ca15325 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -46,9 +46,9 @@ DECLARE_PER_CPU_READ_MOSTLY(int, cpu_number);
>   * Logical CPU mapping.
>   */
>  extern u64 __cpu_logical_map[NR_CPUS];
> -extern u64 cpu_logical_map(int cpu);
> +extern u64 cpu_logical_map(unsigned int cpu);
>  
> -static inline void set_cpu_logical_map(int cpu, u64 hwid)
> +static inline void set_cpu_logical_map(unsigned int cpu, u64 hwid)
>  {
>  	__cpu_logical_map[cpu] = hwid;
>  }
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 133257ffd859..2f2973bc67c7 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -276,7 +276,7 @@ arch_initcall(reserve_memblock_reserved_regions);
>  
>  u64 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = INVALID_HWID };
>  
> -u64 cpu_logical_map(int cpu)
> +u64 cpu_logical_map(unsigned int cpu)
>  {
>  	return __cpu_logical_map[cpu];
>  }
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
