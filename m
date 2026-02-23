Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A60364EA1
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771881743; cv=none; b=miUnc7w/ZZvlPWNSN5iPWoC3UT2Od9mDtWuEIvIavS87u8VZ4oBDC5Lk0HiRFGJRz6zy2+AetGcI0cOrDX3+tl8DoE2GvyC2H2qzXs+1LIO3UVzFN0xAlgkIqSUCkURQ8AL5SYkcykMvZYjwAeZFORjP0dk/lnOpqojH5EDKOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771881743; c=relaxed/simple;
	bh=DmD+wQO/0bsck2EPBcpDc8z118GCt7qT7SOfJE3x3bw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pf7P7SBGoKbdUfpvOBpZG9ihZHtPcWWmjJWG4XoDOQSsOQbR6B8jWdYdbq6WxDAglFCnFZCerK6hbNao1d/jT2NU0jtrg7RR5cu0WRE5GCwKnjcfYojKPAmdzEaxNoHrH5J8QNCxxKEfgjedTuFbPIACxg9CB8tBNu1uyBPJlkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RTMpCgmM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RTMpCgmM"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7CF0F40423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771881741; bh=2QxteradZy30KTpTsK4W1XQGjPHFpfZN+l1t00D/5es=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RTMpCgmMFKsKRNLNZaCfhYN+96Cu4t1wvZ9bYaaLCbrm/z2UTEiqHYSjFDIFE232b
	 1EnFoNt+zIg8Zy07naSJw0h7xfx+NtkjKLHha1Mc6c7Bv7ZoOCyQio7woCPB4Zyzs0
	 H2npjYVwi+J60jlEe65UK91NSQZQNvyYqnZanCRKndVgXZDKTGqHayPajzE/PzjFCo
	 R2e8YiDtVyQvUmjltDrtulHkC7uq33YrC8x6BgRE12ox2wT+hdDnhxdxgIXfGdc7gx
	 8lWNTGSCDtKqqr54pKKHdgZFseKXfglSaWAo6VV1Ta+XLhktNSRCCsXHbuFVe5Tyqk
	 UXkNzhcIZJqgg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7CF0F40423;
	Mon, 23 Feb 2026 21:22:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
In-Reply-To: <CAMAsx6cu=SpJBvKd=q+ZyuXHVHMcSwBNdZxRoc22t2y-g6Lhyg@mail.gmail.com>
References: <20260204113210.185221-1-danielmaraboo@gmail.com>
 <87a4wz5fzm.fsf@trenco.lwn.net>
 <CAMAsx6cu=SpJBvKd=q+ZyuXHVHMcSwBNdZxRoc22t2y-g6Lhyg@mail.gmail.com>
Date: Mon, 23 Feb 2026 14:22:20 -0700
Message-ID: <874in75f5f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

>> The merge window has passed, the floodgates are opened, and I have
>> applied this as the first 7.1-destined docs patch.  All looks good,
>> thanks for your patience; I'm sorry that the timing worked out so
>> poorly.
>>
>> jon
>
> Hi Jon,
>
> Thank you for applying the patch as the first 7.1-destined docs patch!
> I'm very glad to see the pt_BR structure landing in the mainline.

I did speak just a bit too soon.  Your new document included a label at
the top:

> .. _process_howto:

That duplicates the label in the English version, leading to a build
warning:

> Documentation/translations/pt_BR/process/howto.rst:6: WARNING: duplicate label process_howto, other instance in Documentation/process/howto.rst

Bizarrely, this warning doesn't show up until something else is applied
later; I'm mystified and will have to track that one down later.

The normal practice when dealing with labels of this type in
translations is to add the language code at the beginning - to make it
"_pt_process_howto" instead.  I have taken the liberty of just applying
that fix this time around.

Thanks,

jon
