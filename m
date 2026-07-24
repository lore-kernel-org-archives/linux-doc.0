Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E223B3C15;
	Fri, 24 Jul 2026 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934804; cv=none; b=kzhdABGKSBSBgVsdfKClo4ATFM/qpM+1YyxPKAGzJel/57aTh9awD1+3X+kpwAzeXJQDY2D1qMwJOosIYlUb2SYGAWDpVyRb35EIzn/sW9rNPaUNlp5BKudXbbc2txUvvOSarHlL6elxz0Rzbmj0EVEvdT63I2EyvkOj2UiHpAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934804; c=relaxed/simple;
	bh=8d8Ja0/4K0vZHKmqN495MllP+ura0LDa1vDrPtnA2eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ac0IobzNAO75SllDs4MqQg6PhWxIplfXr1jyhIoJbjulnn5aqx1RTHd0HEYz8/7P6B1EKwgsJqzLN/UvTKpdLN5RkRUUOFHfm3KyxBSCskG7WvyzS/hCsbXFH0sPcOcJnvXXas55QiUUfvRzYJ/Kqj6XNxPeLuhEEdLQAoShwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ROvqYbGc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ROvqYbGc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8718F40E0031;
	Fri, 24 Jul 2026 23:13:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 69uTtP0VKAtq; Fri, 24 Jul 2026 23:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784934781; bh=Kjb78haC35JKQdS2qCDgjLD1mrjIA4R4tn8ATDKF9f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROvqYbGc7DkOX/lTJm13vU9GrzkE4dfibCvIqrKojrC6OjA9VTk1uNCt3BQOmTIIP
	 r2WFBdkns1zEUiaLooFvVMuenZofwC6gI/ATdoHD5oL4oRDDZd/2CXUV/xtQahZC8v
	 N2DsAwCIip0ebVP5CTrEp2HoUYKnglaGZfsjIvQ6kw3vptlMIqLO3Xet2zNqOZzDck
	 9RSHuly1pHmiPaV207M32x4S6Dz7cgzRkSC5uQZhanOXOdscW2WAcEz9xzoM7/RpxO
	 S5RJog3oJ23WT0VCi3M+4qdTgi3AdWxAY4E/EL/EfaLtkQtsZlQ+861/5CuKP9liHN
	 NhMpjwQx9RM99AsM6BrRKRdq2b8PtiotmtF6QFxTwJkEISsfIRb9+P9QcNw3FEyNlb
	 +2Mhvc+quXJh6iSPU/q+lwGi+wusrt9IVlJvdddrLYfvc2T0OXT0fPediaHwS4RSJ7
	 BfGim080Yb2bWwCGg7s0PV2+tSCKECZ7Y/5ZPSpJfYn4CcbQVC/NHZSZBg+uGaKEhX
	 T+ZsjDM68MbzNk2vUDjcMAFssml6O74KaIkfiZf4i9JGVCx95Hz4vmZdw5ThOziVyA
	 GBKudnQR0NpZ5BwoC2y2JS6O7z8H6nM2qE1hXvqv5YnSMb/e+hwN5lfuKpJbtnsoWU
	 UZtgCpw/91mHnBNsjFosSJj8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D01CB40E00E6;
	Fri, 24 Jul 2026 23:12:43 +0000 (UTC)
Date: Fri, 24 Jul 2026 16:12:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com,
	james.morse@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
	tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, eranian@google.com,
	peternewman@google.com
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <d337915a-ef4c-43b2-a915-e97381b7dca0@intel.com>
 <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>

On Fri, Jul 24, 2026 at 03:28:18PM -0700, Reinette Chatre wrote:
> I understand that if users only use a fraction of the supported monitoring
> groups then the counters will indeed be valid but (a) this is a small number
> compared to the supported monitoring groups, and (b) hardware does not
> expose this number.

It takes only one user to go to Linus and say, my tool doesn't work anymore
the way I used to use it. Then stuff gets reverted immediately. Because we
don't break userspace. Ever. 

It really is that simple. And I see your point about wrong usage and so on.
But as long as users do use it this way, we don't break that usage.

But let's see what other x86 folks think.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
