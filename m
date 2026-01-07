Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147901DE4EF;
	Wed,  7 Jan 2026 22:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767824543; cv=none; b=mSPV10cTTe/zVsqanlFB2Dys3dFEH1hb0twYpMmBhtk9g1jM+AxvW/ZQqrREyy5qWTx/bhwlbEBDMqLQprOevuhr59C09C+qd8aX7+6FliILLflniFsjwW6Hcwnr6LDu7pTcRyAyU3IFFAxI2K5CscXVzfX0Vb44iD5me2cigFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767824543; c=relaxed/simple;
	bh=fIicO7rmg3bxKEC1z/egEqcOL5db1QSU1cczbE//JHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6VTtZt35uDtG+1ST+iVvpnUpUHctk/TB2GiHOxNOK9fGs1glSkHQ8GjzoQUmeaxfxay2sJSUCJFTALCRhhxWMKNPkI+uYFP1PYHXX4hVAtaL3mZM5vd+ouveB6TjmvBMByOMBFlnw2BIZMWwGgPiLMbRfyGOrfCuLIvewIIGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KFPbr1oc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KFPbr1oc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=n2xSaVy18GespaE+xrkWmFDww5nOlemn+2D9b3NueC0=; b=KFPbr1ocjsuad+SKtOgss0Ymn+
	M10sh5t3pFz2Hq2NrpPHljYa/MAV0FvwUCWpubUGJIVxPckc/el5LujAWmOtwsz3yvyvwIEnqJ1VM
	qrKA1lGbyjawV6b/gHip0ZCY7tJIBr90xDq2y+dRKFUD+eO5LIlx4WFsWDsCbqmJRMo53Mnvf0YwU
	BXMB5cQx8XyohAoktuji59Oce2pFu2+XjhAzGYLAl1OR9rv3IUg3D4dXAlcnWJVHW944P5W1CxDzj
	LPzL1SF7Wl0cFEGqlim3qensMh2VkZTc1NRz0VoqCCpslhHzmhhZ0ClkZWKGCN5F+WIIeDYjg7ufW
	f+pVknHA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbv1-0000000Fhbd-4BE9;
	Wed, 07 Jan 2026 22:22:20 +0000
Message-ID: <933f2607-c80a-474e-8da4-11387c89f26c@infradead.org>
Date: Wed, 7 Jan 2026 14:22:19 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: make kptr_restrict and hash_pointers reference
 each other
To: Marc Herbert <marc.herbert@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20260107-doc-hash-ptr-v2-1-cb4c161218d7@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260107-doc-hash-ptr-v2-1-cb4c161218d7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 12:21 PM, Marc Herbert wrote:
> vsprintf.c uses a mix of the `kernel.kptr_restrict` sysctl and the
> `hash_pointers` boot param to control pointer hashing. But that wasn't
> possible to tell without looking at the source code.
> 
> They have a different focus and purpose. To avoid wasting the time of
> users trying to use one instead of the other, simply have them reference
> each other in the Documentation.
> 
> Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
> ---
> Please just go ahead with any minor correction(s); I mean do not ask
> for my opinion.
> 
> Changes in v2:
> - Rebased on today's docs-next/master to fix textual, unrelated conflict
> - Stop using backquotes in kernel-parameters.txt for consistency
> - Link to v1: https://patch.msgid.link/20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  Documentation/admin-guide/sysctl/kernel.rst     | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a8d0afde7f85..b189dfd60059 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1969,6 +1969,9 @@ Kernel parameters
>  				 param "no_hash_pointers" is an alias for
>  				 this mode.
>  
> +			For controlling hashing dynamically at runtime,
> +			use the "kernel.kptr_restrict" sysctl instead.

			See Documentation/admin-guide/sysctl/kernel.rst.
> +
>  	hashdist=	[KNL,NUMA] Large hashes allocated during boot
>  			are distributed across NUMA nodes.  Defaults on
>  			for 64-bit NUMA, off otherwise.
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 239da22c4e28..0315eb7ee6d4 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -591,6 +591,9 @@ if leaking kernel pointer values to unprivileged users is a concern.
>  When ``kptr_restrict`` is set to 2, kernel pointers printed using
>  %pK will be replaced with 0s regardless of privileges.
>  
> +For disabling these security restrictions early at boot time (and once
> +for all), use the ``hash_pointers`` boot parameter instead.

   (once and for all),
or
   (until the next boot),

> +
>  softlockup_sys_info & hardlockup_sys_info
>  =========================================
>  A comma separated list of extra system information to be dumped when
> 
> ---
> base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
> change-id: 20251204-doc-hash-ptr-00e46e1a5398
> 
> Best regards,
> --  
> Marc Herbert <marc.herbert@linux.intel.com>
> 
> 


Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
