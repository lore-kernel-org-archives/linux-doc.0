Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0433AA9D1;
	Thu,  9 Jul 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783555204; cv=none; b=FkBnYW0rbpOuv1qPirh2sNpZ0ImeCIlf5xgM2DWolVM6kasGPNRVfAEg/XDKhuzb1APJOYFCBjdq+50vK1MUM9CSjwGMOipXh0V4tuR6DZQ2eaC0Al1q+6N/T0I+6818UnvZBGQu1ozg8VxRI1WI06ww0vpCTSPWhmNnU3xCzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783555204; c=relaxed/simple;
	bh=CN+j1ci183pXEmOjg1N3F/o7p3M5RcPRfGMcfrRUdig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsIcRRu+SkYM6c+Cw3ajr66JnvE7SyHUaOe0S1uY+1l8xXc6KNxdIRGhow6nO+NDwzVDNE1YLkPamhMAQaSwiYu4UrpDcstN8ZUPW4uEZjOXRH3NBI0jHZkVVc0IbmFEi48zD3s7bU5xBPMAHzpB1yrNrVcMmFXJeYk6/9ktjh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4E7f0fU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4E7f0fU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2D21F00A3A;
	Thu,  9 Jul 2026 00:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783555203;
	bh=1F+72s4tH7w3Cnf8voLWM78n4YOiurcby61hUJ0YTXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4E7f0fUpHeubojOJaU24vuI4R3BPaWcrLQMvNB5YH+Yhdqtweovo07lIb4Vxx/5J
	 myef6p7uqthdF8T+3vydUqwzOye45OgQF2Rk7LT5Hk9mIbXA1r7iu+62UlySYxNwws
	 pjnRvWwbG3Rpnysj+lv1mCWwaO20BgSQ7pWcsh005wz4HcJdnA0R7L46tlj4xUqL6R
	 hOe6SRbzJfL+kwB18y2YpctpizJrwSMA5NDfzwWYFxE3RVVWrTlMv9V2oXMaqk4AMZ
	 dvlcRet7iEaDLKB8c6VAPCEGzyGaWSLh2dD7QzGWXAXF1yzM60Cp81K9jS0yvlsnBX
	 gf9iTxi7eM0Bw==
Date: Wed, 8 Jul 2026 17:00:00 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Babu Moger <babu.moger@amd.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, corbet@lwn.net,
	tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
	james.morse@arm.com, tglx@kernel.org, ben.horgan@arm.com,
	fenghuay@nvidia.com, skhan@linuxfoundation.org, x86@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, rdunlap@infradead.org,
	peterz@infradead.org, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, elver@google.com,
	enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com,
	xin@zytor.com, pawan.kumar.gupta@linux.intel.com,
	tiala@microsoft.com, chang.seok.bae@intel.com,
	kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
	kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
	elena.reshetova@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.lendacky@amd.com,
	eranian@google.com, peternewman@google.com,
	qinyuntan@linux.alibaba.com
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
 Zero Association (PLZA)
Message-ID: <ak7kgJZyKmEVUdMj@google.com>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>

Hello,

On Wed, Jul 08, 2026 at 04:28:06PM -0700, Borislav Petkov wrote:
> On Wed, Jul 08, 2026 at 11:55:30AM -0500, Babu Moger wrote:
> > > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > > index 1b4a48bff18f..bf6fc71f87fa 100644
> > > --- a/arch/x86/include/asm/cpufeatures.h
> > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > @@ -517,6 +517,7 @@
> > >   						      * and purposes if CLEAR_CPU_BUF_VM is set).
> > >   						      */
> > >   #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
> > > +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
> > >   /*
> > >    * BUG word(s)
> > > diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> > > index 937129ce6a96..1fa4d5aef17e 100644
> > > --- a/arch/x86/kernel/cpu/scattered.c
> > > +++ b/arch/x86/kernel/cpu/scattered.c
> > > @@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
> > >   	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
> > >   	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
> > >   	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
> > > +	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
> > >   	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
> > >   	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
> > >   	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
> > 
> > Sashiko reported:
> > 
> > --- Patch [1]: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level
> > Zero Association (PLZA) ---
> > commit 0f2aa093b81d7a2e0dc203ce3466562f708898df
> > Author: Babu Moger <babu.moger@amd.com>
> > x86/resctrl: Support Privilege Level Zero Association (PLZA)
> > This commit adds support for AMD's Privilege Level Zero Association (PLZA)
> > feature. It detects the feature via CPUID_Fn80000020_EBX_x00 [Bit 9] and
> > adds the corresponding feature flag to the x86 cpufeatures array.
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> > > diff --git a/arch/x86/include/asm/cpufeatures.h
> > b/arch/x86/include/asm/cpufeatures.h
> > > index 1b4a48bff18f7..bf6fc71f87fab 100644
> > > --- a/arch/x86/include/asm/cpufeatures.h
> > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > @@ -517,6 +517,7 @@
> > >  						      * and purposes if CLEAR_CPU_BUF_VM is set).
> > >  						      */
> > >  #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for
> > 4k vCPUs */
> > > +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association
> > */
> > Should this addition also be mirrored in the tools directory copies of
> > cpufeatures.h and kcpuid.csv?
> > If tools/arch/x86/include/asm/cpufeatures.h is not updated to match, tools
> > like
> > perf can generate build warnings during check-headers.sh verification. Also,
> > without updating tools/arch/x86/kcpuid/cpuid.csv, the kcpuid tool will be
> > unaware of the new PLZA feature bit when users query CPU capabilities.
> > 
> > 
> > I thought tools/arch/x86/include/asm/cpufeatures.h would be synced after the
> > changes to arch/x86/include/asm/cpufeatures.h are merged. Has that process
> > changed?
> 
> I guess that hasn't changed:
> 
> tools/include/uapi/README
> 
> Let's add those perf tools hackers to confirm.

Well.. it's changed as Linus wanted to not update the headers for
trivial changes.  The script is still there but it's not running
automatically.  For perf, we used to check ioctl and other user-visible
changes for system call tracing.  And some headers moved to the
tools/perf/trace/beauty/include directory to sync separately.

I think the headers will be sync-ed less frequently.  So you may need to
update the header for tooling changes manually.

Thanks,
Namhyung

