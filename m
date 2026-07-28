Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD145DF50;
	Tue, 28 Jul 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785266335; cv=none; b=Ug5pigJssSoUIwRS3J8XXOsdlFxkd1N4SyPf2KM42nboHX3WRzKVlAvH8gT1SiiGJ0kl8X2KlMROQ3wUmSxOBW95nlAyk/MlkzOGu+j4AvHhr9qunoRMqVhgtR2yKLLAl9e/3aJXBMZgnkkL5EcRERBMPwpa4IJvypELOmNPmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785266335; c=relaxed/simple;
	bh=vBkErghisMseG/LCuuhPYYzC4pq4jbqlUPxPvwUimNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I44v3c/u1cl4xrG2D8gOk2hUbZJSo8KRegf5mxV2fS2BG5RU7iapNWbvfcp5Uv1mEHSDLZfvv+EIAIz8klzMwNhsok8M5Qvli8qctNthlxqTTqQAtxJtOdqEtTcNVAADat07Un1F5BYXauthJNI9jmD/WUIcdBZTeZxu7RmCLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bQhqTWXy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bQhqTWXy"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3BAE540E01CE;
	Tue, 28 Jul 2026 19:18:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5upBYYmVPCeB; Tue, 28 Jul 2026 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785266318; bh=1bZBGD/y2dgzACp0S8f/4f69uLxfY6itk0anaMzkkZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQhqTWXyz0sJLikYWNe1gpUQWgBVd4vIfAYoVle3o0gDiRkyx4lFF14oV9kbPw5/g
	 PN0fVWLmsTF1+gNpG8rWtL80U/8gUgCBkdN4O7csuA+9FDX62G5zOCZn3iFlv0CXMx
	 7PDck2eEPCVf7nLEXVsypc7D8i5pRPkRtGCyk4DM9QZZ9oHp/tmLgwNueiTtQGx6BV
	 ZtMal19odsliCVUDfVUNproZmk4jj8PMLD2CsOKj57qLfjzT8jKBC54rsFB93y9Stm
	 DMnysUMbEesPLbB6kw0zvNzPprzgCpQc45UK5BtRmbojDkwclcrKm3vSiL1/JHtb06
	 wvkZFh6CcX1w3E/jP1SXP0ecT1bTQL2O8HBBStF3jUK5HgZ7uJ1CFT5UkXmV0kiyTN
	 gl9gcx4UXMqwbikzhEigVtGL3dOgCtmokT/tlNiGpxkiUADukz3Jcu6++nandKS1i2
	 aW/+6tIyQdths8c/MEnKJv1R8fSE9Wv0zYM+z+GZbewJo7Rw2udKV6+D9zi2Rt7KbC
	 tpbXq7Frnc3HBAFqzVh0gWAok4fJq2NYxvZs/ZWTCwnQmZmcy6ykEQHdPE+QAu4xwn
	 4oIQtqcCvUzfpBFE0HxW6HkYjUazZs/AeUAsfRxQEctBBRC2UkrjALA6iBF7PRV6NR
	 wkAvRNXtkY+TdWqouXaTc6Yg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 823D540E00C3;
	Tue, 28 Jul 2026 19:18:21 +0000 (UTC)
Date: Tue, 28 Jul 2026 12:18:18 -0700
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org,
	Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	eranian@google.com, peternewman@google.com
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>

On Fri, Jul 17, 2026 at 04:13:55PM -0500, Babu Moger wrote:
> The kernel currently enables the ABMC-based "mbm_event" mode by default on
> hardware that supports it. However, this can cause bandwidth monitoring
> failures with existing userspace tools such as pqos.
> 
> The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
> groups by default. On systems with 32 or fewer ABMC counters, this default
> configuration can consume all available counters, since each group requires
> one counter for local MBM and another for total MBM. If additional
> monitoring groups are created, counter resources are exhausted and pqos
> tool reports memory bandwidth counters as zero for those groups.
> 
> Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
> mode during initialization.

Question: why doesn't the default mode suffer from this counter exhaustion? Or
if it does, why is the whole issue better in the default mode?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
