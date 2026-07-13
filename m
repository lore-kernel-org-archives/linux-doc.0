Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F13403ED;
	Mon, 13 Jul 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956978; cv=none; b=QdG8ZGg8Ty1SQISlAwTDiSKWvDbXDCp6J+H7DP1tkC6vDUKr/7pKXABGpJXgSRTPxdVGYHuvwzvN5IXSyhV48BYBzlW4sxz0Tz9kdycYkcFmvyJzT+jat9asM+tNMHdSkfYb5uORkT9KhIDBZcbxSqkyxHb4SfNcYQKgUoaiPTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956978; c=relaxed/simple;
	bh=WYnHhDw+JL0Y+727pFqBpboSyhi/PJPXgQPVwk+yWH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtP7VjJjQtiFr0eCUXmVhpBbJmT9t7dFtyjRA/AWNVoZq4GI3aVJw156+6ulgRXvkvQTx1g1VmI0tEgVn5066f/Win+cMA19xc4LJ91qQWPgUzYnzchoo/ffYBeaMBCuVYbFOXRMif8/5iuHeVOKdpqTrDa2cFqXZ9gbYqoAgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcBWmpIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcBWmpIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C151F000E9;
	Mon, 13 Jul 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783956976;
	bh=AW+6C3mGxyqjIQ6odBPzE1BnbGtadF5GPXL3aQwcacU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcBWmpIpn+USM69JwOJ3+RqVZbOYAGf+EYQjngjkeq4BYj8hxL1uKmyGUqx18TFGC
	 3m4rP2TpCm8j+RKUdqQY+D3X8tPa4585hFmEjnZsr5967DvgIE4WidFgDZxQDErcyQ
	 8dqcYkMnzM2Q+FxTDmpnpF6Ho+jM4qyE5mChnba+B4lB7b97OEerjj1AeCxaQaO7pM
	 Hu6wCRjCe/P5sSPoMWe72SxqxUtjZQYdgYrpc9+bZi6FESwdRTbKYnsQZ8bj7UUT//
	 fge7UcGqSnHg/o1Ap7UwI6z6pUlLYSiOrQc/75e3De9K3IdVLC2+kyEVBTPLbo8kKq
	 ZcVQ+O+7tt3vg==
Date: Mon, 13 Jul 2026 16:36:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Jonathan Corbet <corbet@lwn.net>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260713-comical-iguana-of-drizzle-befa6d@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
 <22ba1b98-ddc8-4fff-a372-6e4aa2b59c7c@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22ba1b98-ddc8-4fff-a372-6e4aa2b59c7c@arm.com>

On Mon, Jul 13, 2026 at 05:54:16PM +0530, Anshuman Khandual wrote:
> On 13/07/26 3:27 PM, Sudeep Holla wrote:
> > On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> >> Overriding the idle mechanism might be useful for debugging and performance
> >> testing. Add a cmdline parameter for it, similar to the existing idle=
> >> parameter already present for the x86 and ppc architectures.
> >>
> >> It is also useful on platforms where the WFI instruction misbehaves,
> >> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> >> be treated as an erratum and patched using the alternatives framework.
> >> However, in the Apple Silicon case we need more flexibility because it is
> >> difficult to detect whether the erratum applies. For example, Linux VMs
> >> inside macOS have the same MIDR and may even seem like they're running
> >> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> >> handled correctly by the hypervisor there). Thus, we prefer to
> >> let the m1n1 bootloader add the idle=nop parameter[1].
> >>
> >> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> >> Suggested-by: Will Deacon <will@kernel.org>
> >> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> >> ---
> >> Changes in v2:
> >> - Applied suggestions by Anshuman Khandual (Thanks!)
> >> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> >> ---
> >>  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
> >>  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
> >>  arch/arm64/kernel/idle.h                        | 13 +++++++++++
> >>  arch/arm64/lib/delay.c                          |  5 ++++-
> >>  4 files changed, 68 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index b2d7d3540ded..d7f5471edf8f 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -2239,6 +2239,29 @@ Kernel parameters
> >>  
> >>  			idle=nomwait: Disable mwait for CPU C-states
> >>  
> >> +			[ARM64,EARLY]
> >> +			Format: idle=wfi, idle=yield, idle=nop
> >> +
> >> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> >> +			instruction in the idle loop. This is the default and
> >> +			allows the CPU to enter a low-power state until an
> >> +			interrupt arrives.
> > 
> > Just curious as when and why one would need to use idle=wfi if that is the
> > default behaviour. I am missing the need to have it.
> 
> I guess once there is a list to chose options from in the command line,
> should not the default option be listed there as well ?
> 

I don't know if it is a requirement or just a practice. But for reasons
Will mentioned, it becomes a requirement.

-- 
Regards,
Sudeep
