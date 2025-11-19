Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404672E7BD2;
	Wed, 19 Nov 2025 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566967; cv=none; b=Zk4fWL6If/WD+5H+OWpjQwqTmY3Fb/WMH6fFKtTgUTdKcoJyvVLr8o8YOFOso+LdXhU2QME5yMLKWXHmehk2OSpWcFwRf8niuRLOoa4+7av7B6N6P+8m9mj5GxW6v3YYkFJZfLI9yeS+dJ22JdEpee1729io1uw1244rd/mdjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566967; c=relaxed/simple;
	bh=cx8/LFIbYjNAK0Bdyw/c9ah8Hi2oBdVnPIhkEw1f+y0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cphge4OLitrqszQgErH7UHwGgMukneAwB42sjkJaNei0q2RrSLnTcENgAueUzMy3ukZ2x6XsDfRP5rx3UicCWFr63AGks3YqpEwQUkrpNYIDeTzP/Oli6uU0s6ix4249kHgug3Mku0WB/emngnnFohox7GS2BIeZsFc2SrJpVL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NP/8ce26; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NP/8ce26"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 525D3406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763566964; bh=fln+OLw3ZMIrqe3p9539wWcVpM/TPfc2VIsvgT7mBwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NP/8ce26nYY4Hj6EihLRmfAZ3kN7N82h7hpbC9OMr7BxZfvda1Q2vw70aViWpMapC
	 D13vtTA6Ei0VmvrPNdowuBjBh6UQJHPn/SiMCHJ/I9y2yvQ4r+YvBdiuCaf0LI+aV5
	 8U8dMSEBZkXklLR28GE+vq72ni/leLsgRmvLavqHbCguaXddD9zz9RjGXLX+sT14Wa
	 kZ+JJyXbs9CxoCn5jG+IYDWWJxiMbVqnKPsXXnZ5JOBMTlxCzpYJ8cN96MnDhk7DHC
	 lsQFZskeSFum3zO5I5lSij3agNv0HEUgwlOcu6CcAoyB91ays4kUOQ/nD4zFe5HwfE
	 CxFWF22ZFldyQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 525D3406FB;
	Wed, 19 Nov 2025 15:42:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Borislav Petkov <bp@alien8.de>
Cc: Borislav Petkov <bp@kernel.org>, linux-doc@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/kernel-parameters: Move the kernel build
 options
In-Reply-To: <20251119150616.GDaR3c6MW9VkFKpH_C@fat_crate.local>
References: <20251112114641.8230-1-bp@kernel.org>
 <87a50j5n3f.fsf@trenco.lwn.net>
 <20251119150616.GDaR3c6MW9VkFKpH_C@fat_crate.local>
Date: Wed, 19 Nov 2025 08:42:43 -0700
Message-ID: <87ldk2111o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> On Tue, Nov 18, 2025 at 09:20:36AM -0700, Jonathan Corbet wrote:
>> So I applied this, but it's dancing around the real problem: that this
>> material is split into two files in the first place.  I honestly don't
>> remember why it was done that way
>
> I was wondering the same thing.
>
>> - maybe just to ease the RST transition back in 2016.  I think we should
>> really just pull all of kernel-parameters.txt into the RST file.
>
> Except the .txt file has its own formatting and if the conversion to .rst
> makes it more unreadable due to the .rst formatting gunk, that would be a step
> in the wrong direction, I'd say.
>
> So including it verbatim as it is done now looks like a good compromise.
> Unless you have a better idea...

What the effect would be of making it all into proper RST is unclear, I
don't think anybody has tried.

But we could certainly just put the whole contents of
kernel-parameters.txt as a literal block within kernel-parameters.rst
and at least have it all in one place.

jon
