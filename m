Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD340DFA3;
	Sun,  3 May 2026 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821184; cv=none; b=NfVlsGarf+1PzwoNp+r79qXNaD+3CW01FvoUUFz9+yxDI5YE2gy7oHgxJaMG10qLW0f6ukYbUYZj62o+ViBr50I8z9fsja7pOt46a6w2oScmGfnyM1ScJklktVeVjItgEmgWNIF0RUbZt38U/UAwtCv+UYt1mkFWRh5bSj8H/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821184; c=relaxed/simple;
	bh=1amMSw/saOhDIivMhiFdlkgG92JiE7onlDFGsisPqIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XfNCC6OkfoPYdzURmTinv/A9XFyJWTZsIdTlBedWkhnwDCldQpg13LAzKiKFFb6TqTkH1BBAJCsoYdPOEI4NxHXd3RBxzVsD9ZZOYUXOq4qNtw3sqGw5g7DwvahjwKHPQo3ONEWIJVqVui495K8rne+m2/XZhNkwmluesOpweXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Y2yDI88Y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Y2yDI88Y"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E5EBB41202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777821183; bh=/YQUqsFStU2956ealL5E7zSM8rOtg1rhNXB73fks61U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y2yDI88YQVNwaCbMFhhTfZetpzyrr8SFljorRZ47PufjHeTc73HE0pohghmZIO/VV
	 4tEUq6BmMWdka02yveaj6hb2d8BuMpQ1y16+4Prt/onJp9I5klt42mu3DuDEufeHDl
	 sTcL0/h8elw+8VHNfKt0DMFghkzfhlPwh6fMMF9AyBQrzwlQrD+tZwRTmfxIgidQkT
	 rW2pOMk+0v+Zrrtn6HyEfenCvHwRj7ZgO8ZpbyZmehu7LQPNPpXAGzXyTxQx6CO27L
	 Kps+waq+qxOSAqxxgedaO3PBdSWxMffDV1zH1Nui8T+lr8SGhCxpKUc0Lrdu1s+iPR
	 Cst/sRCpPXRsw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E5EBB41202;
	Sun,  3 May 2026 15:13:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: filesystems: cramfs: correct stale
 hard-link and endianness claims
In-Reply-To: <20260422211039.270552-1-nico@fluxnic.net>
References: <20260422211039.270552-1-nico@fluxnic.net>
Date: Sun, 03 May 2026 09:13:00 -0600
Message-ID: <873408cyrn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Pitre <nico@fluxnic.net> writes:

> Two paragraphs in cramfs.rst have been misleading for a long time:
>
>  - "Hard links are supported, but hard linked files will still have
>    a link count of 1": mkcramfs does not preserve hard links; it
>    deduplicates by content (eliminate_doubles()).  Two names for
>    the same on-disk inode in the source tree become two separate
>    (content-shared) entries in the image, and cramfs always reports
>    a link count of 1.
>
>  - "Currently, cramfs must be written and read with architectures of
>    the same endianness ... PAGE_SIZE == 4096 ... is a bug, but it
>    hasn't been decided what the best fix is": the endianness
>    situation has been settled for years -- the kernel checks for
>    CRAMFS_MAGIC_WEND in cramfs_fill_super() and refuses the mount,
>    and mkcramfs has gained -B / -L for producing images of the
>    opposite endianness from the build host (useful for cross-builds,
>    but the reader still needs to match).  Restate this accurately.
>
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> ---
>  Documentation/filesystems/cramfs.rst | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

I've applied both patches, thanks.

jon
