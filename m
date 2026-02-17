Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181671624C5
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 11:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327213; cv=none; b=HTj34zDGQfxV7rTZnT4GDOZCo0++MXBwBVytyKM0o5nj+IwYUAz39PB5SOgkd855EH2NqXZsBHyAk2THRrltuWjhvxDLcvx4RyK0JZ1XxbJ53kbk+KLG+mwIrXEEGokw2irjii+PMaWJEnwVF9hfwC6u1Niy+NF7YYrMcWpUNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327213; c=relaxed/simple;
	bh=tyIXxWSnlPo0/oBNyqXHtSIuwggrjqlBKj0fnkv/ORE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0/zXwrO5B7OmfM5VxLH1sCO7AXTZu+vL9/X/KtPTU2KDDQsjeewaCnJzCBwpD/V7K5I2TQ3azpsw0zt3K2BsZdlkoZnhkhPoqrY4lDJRkctbvYtEk6zJ7Twf63/0ZIpePVQxGrU1aJ+lv5dBPDaR35ZxaoO830ZOEykc30nfXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oY4f175r; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oY4f175r"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b883787268fso498230766b.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 03:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771327210; x=1771932010; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIwZCY0zKRfC1+dyqf7bcb8270ONyoPFzl0pET2TSeE=;
        b=oY4f175rOq28HPEFfI3/v4TzTdWkDDXyUG3I3dr7psSeCxt8+YICO3yjp9nV/Em5Qi
         Zr5uUPJ6e9Jfez1qpH3BU+f2m8UQVpVYo5AIcgY3eyYTY/uNsAZk8iVyQz5nCE/+a6aD
         opDQ1v+++XAW8R4t5bjepgKPhnUfbKbshpiff4/PcDxD3bP3p1SURC/D7UNN3qrOPwi+
         K22bo1bBnDPNpmaqccgRwbDkjSnmGGynx7ImneAC5zT5XVoDL0/QoD2TytKbMC6SHKwv
         P715j1+dn5SKOReQ9bfSMi8rO2rt0qinQWkRntrKj1PsM6hoYQrn5HCLHsiysGK0gkeF
         poAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771327210; x=1771932010;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIwZCY0zKRfC1+dyqf7bcb8270ONyoPFzl0pET2TSeE=;
        b=o594ktHCpnrGxUrrNSf5v2OOVlRnjpBFR215h0JGur01DSMi8HqrzxP1iM40gEwgFX
         HfVnfwbmfN9hGpFoEa4YibHOckMMLQfNDt5kSYk2r+z5TaH9y52Rk9kY+RiQhsNrd2LS
         8X6Hw/P9PMR6YPUxN8VUB95AoO1PK3eArpT2EG2pjvhNbrsOzGmfsWj30WJNuQNZ8Hpw
         /M3pHv6WGMrBTmfUTHhzXBH1QQms9UCfzkaybLkCnPxBBXZKrhxD49CrHyJSw53ZyTLr
         3ZWph0XnlV2NHXLe4f+harmRbLoT8Qh+uYnh+V0mz/jqPktSGWcBh3lv/Xap8GqKqwry
         kbZA==
X-Forwarded-Encrypted: i=1; AJvYcCX4ppAW0OY69hV1jXt2PcIzyQLFAIzZAM3yXtPxWIUzALAd0lVL0mpYND06O/hC8tPJAWMjvQm7j7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SZzAAsmeZsAKt8f1y7OIZ7sHrQVEMgHoopx+rjNq9AQndPgI
	3tUpk9S2jXrgN3dDomxvF0S7qSr4SLpe4fK1OJMaiWXGQp7McPv1QXdUBw608wKTfw==
X-Gm-Gg: AZuq6aIlVZvJtcs0w5JRYjHKxYLj9i52tKKu2U4aexd35ndGqKZnYmQfdLT0K5qESBr
	vqvmuI1+P7IubPQBdZXHYy6IBZR9zQ68I8aWE99tZ5g26f8CacazEc6UBf/exz7k/G+pyeFKAOt
	EjWANvl+AR4ZX9JL8gT+pjV4XFi98Q7H3n88PE3qBFR4WfiJQhZOH79Kdo0T++PfKUAv2fw7aj1
	eRqUBwLlROcEsr+AMpUT+M65RSs/DxGy/KQk3AvHRhwtgR8TzsNg+chcOh3aobxHRNM0Y64w2mT
	ZrWDuyf21xKwwk1qT+EgKjxBp07ZooO8rgtGuyrniiBxcgTT8gdm12PeT3XzsbR9gEIfb8Ov/z5
	rVayMCIpJ6gX5Yo1JmLIi1lmozhp/mDt+Hl5YSu16vLi9BscUCk+8CGmfrmHtnBq5r2Il3x5g15
	h0cLRmnff5dy2l0aNvusZTJ1fqxgqIqMT68ToiYNZ4Lm4E0oQYfwCiCyyNdVml
X-Received: by 2002:a17:906:6a17:b0:b87:6af7:c186 with SMTP id a640c23a62f3a-b8fc3d30cb2mr612995466b.54.1771327209938;
        Tue, 17 Feb 2026 03:20:09 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d185sm331579366b.14.2026.02.17.03.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:20:06 -0800 (PST)
Date: Tue, 17 Feb 2026 12:20:02 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	corbet@lwn.net, yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	ptosi@google.com
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZRIHZ2Wq81S-FZY@arm.com>

Hi Catalin,

On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > Although it is currently possible to fully disable MTE on MTE-capable
> > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > userspace (with kasan=off), there is no way to limit the use of MTE to
> > the kernel because CPU capabilities are traditionally exposed directly
> > to userspace.
> > 
> > To address this, introduce a new cmdline argument (inspired by the
> > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > the kernel. Combined with KASAN, this results in only the kernel using
> > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > field are hidden from userspace.
> [...]
> > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > +			support for userspace
> 
> Why would we need this? It's a user-space choice whether it uses MTE or
> not. It's not like the kernel is forcing it onto the user processes.

Correct. This patch is useful when working with a pre-compiled distribution to
ensure that a MTE-enabled userspace falls back to untagged allocations, without
the need to introduce system-wide policies (and ABIs) for said distribution,
which would also be inherently less robust than this kernel-level gating.

In Android, we can simply append the flag to the kernel cmdline instead of
relying on sysprops (or similar early userspace concepts) and hoping that all
users are properly gated on that sysprop, etc. This can be used for A/B testing
of the feature or as a highly-reliable "remote kill switch", for example.

I should have mentioned this in the commit message and will in an eventual v2.

> 
> -- 
> Catalin

-- 
Pierre
