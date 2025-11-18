Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3363A1CF9;
	Tue, 18 Nov 2025 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482839; cv=none; b=jEQ55TTcqM4/Q28Vj8GZL37HGipBuUhSVGJs9W1FxsejrfI6gShpTq7G1GN2hTmL1Wsknqs2/SyJzCKlM0/RKmjaXizK69M96K5WtarZuNAiNIvcxek7QiCpvdaLzAE5Ch0c+1fEwzz70SiPJOhTx0yxO7m5ilg7v0M7eCU0Gpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482839; c=relaxed/simple;
	bh=EjEzoMg86T7i6f16LF6vFkIiBgaFC6vpKMsBjXFh0cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hqyJm9KeRHZDDnse57hvTMiFj67nlz3RlzJKD4dXy4tHCswMdIYNmiMfsI4qXWo8hBc/wVG58d5s5b8GOjVPuVlk0sSGu739roJecTPVHZa1ZeKwd2RVrQ2N4g8/iehviRmB0l179wueZ7oVV5VCOX8Hm7Cz+IgOPafQ367j6Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i3ihoXQx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i3ihoXQx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D39840C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763482837; bh=NR8u5rBhi1DKoZamUgABaXWa4ryjm+Leybay/4F9f4A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i3ihoXQxmYKhHjawVvJ0UvK89y8ul5oI49LO5nG0oB/T2ucuxt9fpgrGNG9f56r4u
	 z+yHyXm7cHGYJkEoKtdv240RNOqqgsLUspeKazphpZMJyoCRuSNRZ0iNdAm2V2tbUU
	 PhA/bkCEbsBY7UpQIKboyOJ/eWK+FHtN6/ZA3yEK4qDQ5ubLb2qMmblCW+kpueDA2m
	 8qKewKIhRi9FfNmlPlstnywJusyrc7W+lKqM7AmPadKV3rM1jlfHade1vWTbmTRV+j
	 Y/NFXIXZuN8qjMcDk7qVtPGlHm17xyab1Wkm9aIT7C3JcqJ9oLq+ny9QIqsaBMG1qC
	 GBS40/Nmnuc8A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5D39840C42;
	Tue, 18 Nov 2025 16:20:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Borislav Petkov <bp@kernel.org>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] Documentation/kernel-parameters: Move the kernel build
 options
In-Reply-To: <20251112114641.8230-1-bp@kernel.org>
References: <20251112114641.8230-1-bp@kernel.org>
Date: Tue, 18 Nov 2025 09:20:36 -0700
Message-ID: <87a50j5n3f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@kernel.org> writes:

> From: "Borislav Petkov (AMD)" <bp@alien8.de>
>
> Move the kernel build options abbreviations to the .txt file so that
> they are together instead of one having to go hunt them in the .rst
> file.
>
> Tweak the formatting so that the inclusion of kernel-parameters.txt
> still keeps the whole thing somewhat presentable in the html output too.
>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  .../admin-guide/kernel-parameters.rst         | 97 +-----------------
>  .../admin-guide/kernel-parameters.txt         | 98 +++++++++++++++++++
>  2 files changed, 99 insertions(+), 96 deletions(-)

So I applied this, but it's dancing around the real problem: that this
material is split into two files in the first place.  I honestly don't
remember why it was done that way - maybe just to ease the RST
transition back in 2016.  I think we should really just pull all of
kernel-parameters.txt into the RST file.

jon
