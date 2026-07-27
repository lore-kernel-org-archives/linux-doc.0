Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A132EF67A;
	Mon, 27 Jul 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161182; cv=none; b=g8mdlYEL/1kYNkxSFtJ4WakxFabJ1uBv/wqBNAFAkiOeWDCd/UO75P2ujjCkO1Pgzehpm3o7+Qg6Ks88ASPKNQPrG6mCr/72uWdnoKvGTdWGtZra1Rzcu9W0WoWaRsE2sS8UBdWJRtXDbLSICgmZTiWdiqafHmAupxcAa9rN6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161182; c=relaxed/simple;
	bh=CRXeQohyU7dRaoUsy7LILdKw30/Du1LIXmEpvSNoKqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmkD5JtloU0iFsg3cW7ObGJ91V6NO0S5eT6MbQ/J9EQMAomODMAX9b57jQCCAUtZo0LgRMScu6iPVYfzd4ue/nqj75SIWtXbjgs6gpmhhYDrde6bswLJJRmpRJC+1JUFaYYZgNuarcZwbZtPZwdpIEuF40VEWA2iLFHsoBvfEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eBzHFdJx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eBzHFdJx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5F09640E01CE;
	Mon, 27 Jul 2026 14:06:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jkDSBNXsJ8eO; Mon, 27 Jul 2026 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785161160; bh=sxycnYVl2D6HmHpVlRvxJEle0oxndrlE61rQEeoCsBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBzHFdJxlykavcM/rOIJYKpZXK6aNJQHvL/Di0r0TTc4/JuL1mOxzZX2UlO9HgvEM
	 h5bb0b63tLopxWeVJifCdv7u2rJXWzK+QNR8cbUYGhj9mpybXBYzQ/GPKKac5i3oxT
	 c5XXNqUADy5cnhQ1bwhgKRcYiuHSY4oKz+roGGUZuEmBYIoRB7/+aoiglDbBqQKizg
	 JfXKhoVc6wBVPERoJYzoobKNyNsrrYjURBC5nt8EeRqTubEXrlYGDMvEE1tt5xe8Lq
	 lSTLhuZpP6fAvx8IqTZ+LGPPwGBhxK8OpQHT4jTeBfNkM04kBEOxoFFrDuTJTHifpI
	 z6hrnV6vc0zV/YQtyiIwCe9IAFiCWfrWH4l3KWJE5nuaZ3OUgMfREYJfCizFzMzzTR
	 0MIfHjYFlBe3tMwvsSTXCHJcfQaW+g53jle8Ioz9KHCVwVKSkUXYAAKEWhRddq3TgP
	 pjtAvnxKOF+r3THJZXL7hytDQ8lVGqYp3xr+7rySPs8aN0An2OWIRWv5paZvFhUo/O
	 QU1514KzcvF8k7EhNiu+v/r3nX9MzCqcKyePAMksEqH1RBGCMQeqh/HP96XO5ln3js
	 /v6EoC9jkrqJfd9wqffMKRyFKxqIw9kGzOwLp0jO7rMqJ0mYvgXTTv/WVMAJe5Nf/0
	 nxirudKe1jjac2WlJnnEHKCk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 595C640E00B8;
	Mon, 27 Jul 2026 14:05:42 +0000 (UTC)
Date: Mon, 27 Jul 2026 07:05:39 -0700
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
Message-ID: <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>

On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
> One clarification here is that as I understand there has not yet been
> an actual user complaint. At least not that the pqos utility mentioned in
> this thread is aware of. Instead I struggle with the speculation about possible
> user complaints with different interpretations on how this change could be
> perceived by users. 

Sure, but don't you think that it is enough that we know about it?

I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.

And is the 

  pqos -m all:[0-191]

invocation not something people would usually run?

> When considering a change like this, should it be a stable candidate to
> help reduce the number of kernels with different behaviors?

Yeah. It needs to be minimal too for easier backporting.

> The patch notes mention that this change is planned to be reverted at some
> point in the future and I have not heard of any changes to this plan.

Where does it say that? I don't see that aspect.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
