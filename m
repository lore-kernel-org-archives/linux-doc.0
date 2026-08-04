Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8D36B92A;
	Tue,  4 Aug 2026 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857324; cv=none; b=TrmGrd41DiKSjZJ7jNW7tC6E7VufKZVNmHw54d4ORAoRLw1lfEeaNZbnx7VgOlL0WfNWHn3Q7dA2kc9NZO+TU0It+x68Q2WLx7QBguP+TwWX7NMYzOBAIuHjYQ4Z1HdnVIaS2rDJNmFrH+63OaNyhSe4VIM3mFe1rBsHJFwifQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857324; c=relaxed/simple;
	bh=qKu1Uq8Ws4ezcv1MmeqyoQS8otvhNCUZgtGEnfwrwDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aq5EQd/6ps0h9JWmsBifhNYZtRlcTmjcJm6IZRAdkeP9ccHIgLWjzoMg4ZFtEmTMZohKH7wGz1ZUH/lEvJ3I5X/Afo2ixIX2DsXawNE9Yu6by5z0Cx4fHMHYv+Nn76QAOwDBSNVaM5fKF1Gadswq5GEmw0osrU7CM4pFWbmjxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQcZs7cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQcZs7cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FBD1F000E9;
	Tue,  4 Aug 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857322;
	bh=ZYbbqjWngEpE/AeQwnGOGwW8Q/t20SmBx/XPZzicJVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQcZs7cj6Xljp/HiJ22bJWeugENk5fcBDjxnsDDQ150tn3JXQX06FFoODTG0IfZeL
	 GhwWK0t0fklziHtUVyTFGzcgkN8bFKNdLTRT1yn7kJqdu+I5qibr4EE5VE4IeHT8ke
	 HMIZzVtM8ztd+K0Cpa+15v1zkibxJ4dR1jWw+QvcDviX1/L7j/d51J7vwMhwRcxsxJ
	 uciEPhg1kn2yapVcbShN08Z7tbROB1NXZFazicizo6D3oTRP9Cbt/XZZ0Vr+I2QCp7
	 FDNNf+QRPnWm6Y8PsQmzTeiDLFJdVfNdcg7DOHA4+jwzCsIMnY1gwbI/1ZcxEKXsas
	 j5L+Fb0pGo38g==
Date: Tue, 4 Aug 2026 16:28:36 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <anIFJJ3H-pHWhuL5@willie-the-truck>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
 <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
 <amzKZgqrqqM7E_9Q@google.com>
 <90d1e043-22bd-4396-9661-7d6bc09c577b@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90d1e043-22bd-4396-9661-7d6bc09c577b@cyberchaos.dev>

On Fri, Jul 31, 2026 at 09:32:04PM +0200, Yureka Lilian wrote:
> On 7/31/26 18:16, Will Deacon wrote:
> > What do you think about a funny sort of hybrid approach where:
> > 
> >    * We have idle=, but it really only affects the idle loop
> >    * We have a cpu_errata entry to detect (based on the MIDR) this CPU
> >      and then avoid patching in the WFIT instructions (i.e. don't detect
> >      the ARM64_HAS_WFXT capability).
> > 
> > I think that would solve the case for you, as well as giving others finer
> > grained control over the idle implementation and adding the infrastructure
> > we need to handle a CPU with broken wfit.
> 
> The idle param portion, if implemented like you say only affecting the idle
> loop, should be rather uncontroversial.
> 
> Getting the other part of it (the WFIT in the delay function) right is much
> more difficult, but it also has less of an performance / efficiency impact
> if it's a bit on the conservative side and we can find a good solution
> independently of the idle param.

Thinking about this some more, why isn't the WFIT side handled with an
idreg override? If we extend the ID_AA64ISAR2_EL1 override entry in
arch/arm64/kernel/pi/idreg-override.c to include wfxt, then you can
nobble that on the cmdline as well.

Will
