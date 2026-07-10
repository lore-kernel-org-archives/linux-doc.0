Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660126AC3;
	Fri, 10 Jul 2026 00:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783644930; cv=none; b=Rb4OWlq8qVH8VwHixY5cIoMKCa3PfHzjBWGzliUyt0npDGJ15BaV1dUfxSdwzJTYbKQ6OaYojotJcfjtVU3OhDEmM0w97Zu7NNsMqThKDPiee0LJwQQztsWmyVjQT79HmsvVI3oDQxDBs1LF0mWYKcQOG0v6T0cAhl2Pzu2fACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783644930; c=relaxed/simple;
	bh=nXm/ag5fA7v2FMYVNc2dT9EP9yAywIWYd54rfyFqMJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlQjLLFxm9oZMeLAX10x9ZFBXD0SRAV5Tu8sH0PpbY+lA5RS4k1iUYOhWmt5+mg87Bd2kzJ7fFe9P4F8ajg6hhUt0firWSj1SdnFyvQtwhHCKoxqYOQgS+NEpQb+2Fg63sNTskB5hsgtSzXdJsAkogxLscIh5/XTvDGDSVGT3Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPjqKrHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPjqKrHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D70B1F000E9;
	Fri, 10 Jul 2026 00:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783644929;
	bh=85Usl0+rmwMgwBzA88SakyZjzo/AFVAsMDMyNtg5lKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DPjqKrHpXgeg5wMxvaNIVwpjxa/Kp9Qo/YYPHwp7WD/XJUdG1QYQGdAjMasJ/LtFf
	 ANcOAgfuyYnPy6xEeq1ShMNopJPfQ1kA50NQSSTpnaAufSLk/DX15c6NdgnOLTtGbS
	 6sVNuvrUq1fQq0fnm5phW06itfa7Htf5RGiDkyJ5LtIzvbvqL8fK9jqGKY94HeACVC
	 1RcwjE1dqTEyZNqIbdTa10NdOfAobVDMMSYnC3le3J9dvioQgor4J6/SbPRzm3dK8/
	 WPjW7nIcuDSWwpu0JKoMc6X2hxRLsTNbVJyslj5UksddVPb6N1hFLsOSVqeOIS6S9j
	 jf32oBNjL0HAg==
Date: Thu, 9 Jul 2026 17:55:27 -0700
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
Message-ID: <alBC_4TcyduQo2zF@google.com>
References: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
 <20260708232806.GCak7dBi1loq3QLjg7@fat_crate.local>
 <ak7kgJZyKmEVUdMj@google.com>
 <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709001242.GDak7nevAzb45IGkem@fat_crate.local>

Hi Boris,

On Wed, Jul 08, 2026 at 05:12:42PM -0700, Borislav Petkov wrote:
> Hey Namhyung,
> 
> On Wed, Jul 08, 2026 at 05:00:00PM -0700, Namhyung Kim wrote:
> > Well.. it's changed as Linus wanted to not update the headers for
> > trivial changes.  The script is still there but it's not running
> > automatically.  For perf, we used to check ioctl and other user-visible
> > changes for system call tracing.  And some headers moved to the
> > tools/perf/trace/beauty/include directory to sync separately.
> > 
> > I think the headers will be sync-ed less frequently.  So you may need to
> > update the header for tooling changes manually.
> 
> I'm reading this as, we should not touch cpufeatures.h in tools/ and let you
> guys decide when you actually need bits from it? In the sense: only when you
> really need bits from it, you'll update it and other, unrelated bits which are
> not needed, can remain different...
> 
> Or?

No, it's perfectly fine to update any tooling headers if you need it.
It should be up to you whether you update the whole file or just needed
bits.  Just expect us to do it less frequently. :)

Thanks,
Namhyung

