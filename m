Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47582D24B7;
	Mon, 13 Jul 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956389; cv=none; b=JUjHpGPbGVl/mT1RNdijrQxoHufoiTVnvCNjRjyBt1NlmndoJlmni5IUvsCCu7rZSRLtJDYX70v5OUfemUkOfTRVXN+hD163ULxKiC6aH2noxE4naGjwWpmnAcp1uQyrSetjjTqrrJ4+J0CC+SO+uCo2nfhMdhuH6eNk4X16XDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956389; c=relaxed/simple;
	bh=9EPNQBJvr7JAx8C+NnzMbL+BVCZKgwa6QbV19tCWlZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkxEirK/3nlIKxx6xPPt1ETU0V8+stv79Rox4k5wlM1YSqsvG7u/DB/ZJy6AW3FsT6p9DM9SqvBaIIcoX1uxiD110oOn8PmjiSGTVG+LxBW/RJyKeyv1p4C7bdm00oBS1HeJnDPrF+sxvxvhEGuiEB+M2Ppne1ObTPjMF+hQFyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl+on/vT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl+on/vT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BE41F000E9;
	Mon, 13 Jul 2026 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783956387;
	bh=KWkHqistC4QCWTdZeY/UMz9VShi6CbU4xhDCXtjbcEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dl+on/vTDIen4WlPhOmtx9HaeEmfcrQUK6ZlEhwv5eX/PU2G078DnL50UgJ0d/iIW
	 YSsaF3Z/OCdvEq3bOZTQ+1Vibaw5w7nj5RMwV7+gX83ux1tc8VjuHIGfO5LevHhy7v
	 ueaI/zuWuZRVeuY8z+MZ7rfgbNLcevFvDvIg3KXhPtyHG19/LQty/eHoRYedEuGsTv
	 78V3FsWZI9+nKBS0BNqPQ4Bh59ASNyq9hGfnfUSWM5Bi3wpIXP1gWbARM9V+1rEwnG
	 886tSTYDoIkJE3921W1eMuYRjN4UD1Mey9qLdklZ1UgYW5eWhJOn+g2DnGZVxvjFE8
	 77HfXaWHhF3ow==
Date: Mon, 13 Jul 2026 16:26:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260713-silky-imperial-kangaroo-a7df94@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
 <alTTIx_aw3L0ibqN@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTTIx_aw3L0ibqN@willie-the-truck>

On Mon, Jul 13, 2026 at 12:59:31PM +0100, Will Deacon wrote:
> On Mon, Jul 13, 2026 at 10:57:38AM +0100, Sudeep Holla wrote:
> > On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> > > Overriding the idle mechanism might be useful for debugging and performance
> > > testing. Add a cmdline parameter for it, similar to the existing idle=
> > > parameter already present for the x86 and ppc architectures.
> > > 
> > > It is also useful on platforms where the WFI instruction misbehaves,
> > > such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> > > be treated as an erratum and patched using the alternatives framework.
> > > However, in the Apple Silicon case we need more flexibility because it is
> > > difficult to detect whether the erratum applies. For example, Linux VMs
> > > inside macOS have the same MIDR and may even seem like they're running
> > > in EL2 in the case of NV, but should continue using WFI (it's trapped and
> > > handled correctly by the hypervisor there). Thus, we prefer to
> > > let the m1n1 bootloader add the idle=nop parameter[1].
> > > 
> > > Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> > > Suggested-by: Will Deacon <will@kernel.org>
> > > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > > ---
> > > Changes in v2:
> > > - Applied suggestions by Anshuman Khandual (Thanks!)
> > > - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> > > ---
> > >  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
> > >  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
> > >  arch/arm64/kernel/idle.h                        | 13 +++++++++++
> > >  arch/arm64/lib/delay.c                          |  5 ++++-
> > >  4 files changed, 68 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index b2d7d3540ded..d7f5471edf8f 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -2239,6 +2239,29 @@ Kernel parameters
> > >  
> > >  			idle=nomwait: Disable mwait for CPU C-states
> > >  
> > > +			[ARM64,EARLY]
> > > +			Format: idle=wfi, idle=yield, idle=nop
> > > +
> > > +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> > > +			instruction in the idle loop. This is the default and
> > > +			allows the CPU to enter a low-power state until an
> > > +			interrupt arrives.
> > 
> > Just curious as when and why one would need to use idle=wfi if that is the
> > default behaviour. I am missing the need to have it.
> 
> It's probably useful to have so that you can override an idle= option
> present earlier in the cmdline. e.g.
> 
> 	idle=nop idle=wfi
> 
> will give you the wfi behaviour, which is handy if the cmdline is
> stitched topgether from different sources.
> 

Thanks, that makes sense.

-- 
Regards,
Sudeep
