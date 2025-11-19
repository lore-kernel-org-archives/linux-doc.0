Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434BE364E96;
	Wed, 19 Nov 2025 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763579423; cv=none; b=J2cpkjeraz8urNGZ4LQD5cUqCukiWjb9PFKLybWlm5C0jqMKZ9/DxoozFzjf0AGKFkv0TXtLMkS7kyakI6jhSE4vXQVZwV1c0zPuQDiaoyeWURlOlYcpzX3dxCpMK5PTeTrAfqXL1ERoD9W6hoT1f11o50/HVuQiUGyrZNOJnXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763579423; c=relaxed/simple;
	bh=hLdTHYC856mPlawrxO+i2u4cYNNJFUkA9BUlqgjORtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNJhwF/iBJJOB1/ZYQXqEaFeVtlFcUnwUlD0TGd49kaMsz33+gcio2pl5KZefXGc0qxjkyTL19KjKCd0rbumR/dfgXewGASJTQy0QVsG7htCvZ2KubC1cU7FHF7SnKOxgDc6nR5VJx9cz1kxGQFELKL+3KOBZEzWNmwahJL28ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=i0bmUd90; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="i0bmUd90"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CB46040E0257;
	Wed, 19 Nov 2025 19:10:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GpAfuV2SyfHz; Wed, 19 Nov 2025 19:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763579405; bh=HwefRv2ISqMb+UKKq/vwb6fDflwZyUC15wQXb6O04ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0bmUd90ZoDN+/5mFN7iG3GL3YX1Db4SeLmFSwJ7n8lvmLirvqE/GrrfNNkwG8ZLo
	 bNh6lae5f2rFwrfYE1F/8khrF0YDBpiq8kMwSyS5TMiAOhukv+9SWmtSYVsxfjlb6p
	 YW+xK1SpQZVTN2PBwc8fGeRWPu+Su0ZdKROcCLwIgk1fPzKSEXc23FWKcLI5yp4xQ3
	 JKF14bpIDvz1rNeXg2Xf23nDSaFYLXmlTuX+WHuuHcxXz5L+EQB2PtrQf/lLXpCk1G
	 qGPtFoPMviLwf5UotGFiMXyz88Q0xnnNKmP+v7bMW7Z3wyRLHgCmE66kQBDclCiEtX
	 EorejppkIJ5AOjtoXTrFIMVdJihxeATBV2xBNBBXRiccsCraelkkmUqneupUHFr/Wc
	 /l4qnjXe5kRJnershBTZ71RwRYWqy22m2T7Q2FmDkTfYslATcEvIBklIFc1vPkV2gV
	 HBoyUJfVKetvsuBRxANlZucZUthI7Ud5YsqXa9EIbEouXPTuSB8Ro0Jt2wJiyfBNNU
	 Kvzcsr7EL9nWnx9KZ6wPGqpNQ5dNFGW9KQkBe76ODnmem5Zl3i234da4t8g4yzZDj3
	 voz7puoc43xSe1bFdLe61xaX9sFy2PmyJZuV5Ns58WNpCRQ+CvkfB5B79FKxC7uFY/
	 BBIu6B0/NmpHcjvXstVw1X1g=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4A6F340E015B;
	Wed, 19 Nov 2025 19:10:01 +0000 (UTC)
Date: Wed, 19 Nov 2025 20:09:55 +0100
From: Borislav Petkov <bp@alien8.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Borislav Petkov <bp@kernel.org>, linux-doc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/kernel-parameters: Move the kernel build
 options
Message-ID: <20251119190955.GGaR4WAyMn7tkLhgeN@fat_crate.local>
References: <20251112114641.8230-1-bp@kernel.org>
 <87a50j5n3f.fsf@trenco.lwn.net>
 <20251119150616.GDaR3c6MW9VkFKpH_C@fat_crate.local>
 <87ldk2111o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ldk2111o.fsf@trenco.lwn.net>

On Wed, Nov 19, 2025 at 08:42:43AM -0700, Jonathan Corbet wrote:
> But we could certainly just put the whole contents of kernel-parameters.txt
> as a literal block within kernel-parameters.rst and at least have it all in
> one place.

That would've been my next idea...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
