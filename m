Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A710335091;
	Tue, 17 Feb 2026 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329787; cv=none; b=WVaFOmfzizGNol9rxy6pGfhH8vQiWTMHIFuACXPwVVFI5gkzDG80eJ4cDF9zeMlQP9CXeb6LRz5qBuKrbwm45dfbF5ayxLBvo/g+Z9CX15DFR/8siB5hilGhfJfjeULFabEKVX+g4g0pqbGBI3owv+PqVE9+ipit7U7hywZrqWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329787; c=relaxed/simple;
	bh=OG0JE3ZDSDuBNbp+6jCwFLyNlStXOPQThoSVaHZplx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YS1HmsGEmbrDq1ooQSgc5hEVyEr7zmb0VbMrfPPFhIEp0+URdMB8/mH+OKMXJNz4YiA1wY/Myn5J/S9qt5PSfyHj4BgW5EMl0Z5jIb8RS3LEJha+KUFgF2vg0Fk2o+ONf1FiAJkas82/50yRFfOsnb4Bus/jJg6X62SlA0fyWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgRf/6Q6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgRf/6Q6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B651C4CEF7;
	Tue, 17 Feb 2026 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771329787;
	bh=OG0JE3ZDSDuBNbp+6jCwFLyNlStXOPQThoSVaHZplx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JgRf/6Q6Wf448bI25XnrqX0FldCqSn8HMrHu9cFI8/IrX1gq7gkuY5leptfsghRQB
	 W+JKKOGryjvf3iF9mQQkztwezc0m7dYNMaTdOycyDg6vv/H90QKoNNIAi97S0KBYFf
	 bLkL6UVWwNrwPEJAYef3mQeAMNgrsad54dGtIvhh3EUGHetmAco4tqgx4U+wlXK3A/
	 A7ezpQDql0dLHe3b3kNnMsq8BRo9wHU9jSOG3JhCPP+qgfkfMQnfgDFxVXE4PbW7wT
	 I6ldl0zh5LxsNZ8dzHr01hm4Yf1PaoxhVzb8Kg/9AoOaVcPoGWBVbw5r5IDXSVoT3a
	 XS9evF+cryRrA==
Date: Tue, 17 Feb 2026 12:03:01 +0000
From: Will Deacon <will@kernel.org>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com,
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com,
	ascull@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZRY9UTSgw0Zf2Y-@willie-the-truck>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>

On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> Hi Catalin,
> 
> On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > Although it is currently possible to fully disable MTE on MTE-capable
> > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > the kernel because CPU capabilities are traditionally exposed directly
> > > to userspace.
> > > 
> > > To address this, introduce a new cmdline argument (inspired by the
> > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > the kernel. Combined with KASAN, this results in only the kernel using
> > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > field are hidden from userspace.
> > [...]
> > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > +			support for userspace
> > 
> > Why would we need this? It's a user-space choice whether it uses MTE or
> > not. It's not like the kernel is forcing it onto the user processes.
> 
> Correct. This patch is useful when working with a pre-compiled distribution to
> ensure that a MTE-enabled userspace falls back to untagged allocations, without
> the need to introduce system-wide policies (and ABIs) for said distribution,
> which would also be inherently less robust than this kernel-level gating.
> 
> In Android, we can simply append the flag to the kernel cmdline instead of
> relying on sysprops (or similar early userspace concepts) and hoping that all
> users are properly gated on that sysprop, etc. This can be used for A/B testing
> of the feature or as a highly-reliable "remote kill switch", for example.

Why isn't arm64.nomte sufficient for that? It seems weird to insist on
tag-based KASAN support for the purposes of userspace A/B testing...

Will
