Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B93128D2
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117023; cv=none; b=lkZYEfq5g8vv8VpF+SrrK433PX8aYEvVLAqu7ZNTZTyXVkedQw8gCbzWlo75/5YZxzhDTl68X1kZpZv4Ys+vzbuO/XJc3+tM6VhztU3YU2BWizCY3OPaU76O5g/OtFGipgjJn7ckZQh76HK6Hkij1R60JzotgnHuSnLrQxbDNwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117023; c=relaxed/simple;
	bh=qc6Sfnve4rNFyHKfptj30emzlIgrq2GfjrWpTvSEMr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Obv01nLyVI+mYryxWnMlAHUjTXJvX5PFMT4zZkMXhT9wQWYC9VSZyNUZy4PRYp+al/MtEOVD9Ub9d+5hOxZsCQH3pni9PZKosWaift0P7m0Rev0mSG/F5EXmFVcbKp7ZwnZvav6RQxuRxPGH7lX4QheSKjBvOX2nVvSGlyFfjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=vDZWq6+9; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="vDZWq6+9"
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.157])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id BB75A200AF
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:43:39 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id C1D033E8D1;
	Fri, 14 Nov 2025 10:43:31 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id D12A540099;
	Fri, 14 Nov 2025 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1763117009; bh=qc6Sfnve4rNFyHKfptj30emzlIgrq2GfjrWpTvSEMr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vDZWq6+9nTte9lQ3WZOV7g0m2ud5+cDQ9bK9MFPrEMvzOkggLmui6RE7i7nRlfAy1
	 yMT2sfDAMI0jpn7Rsj4CuSuSOT4qc6U23CatAsWKVsNQ5vmzKWX20Hb5LMsHGVfQ9h
	 gMVfZqT3NE9euXyGgvwB+/6QhBJANEA//UG8H568=
Received: from [192.168.0.64] (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 38AEF4017F;
	Fri, 14 Nov 2025 10:43:27 +0000 (UTC)
Message-ID: <2c2f9775-a1cb-4ed3-b8dd-774d86479093@aosc.io>
Date: Fri, 14 Nov 2025 18:43:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs/zh_CN: Add blk-mq.rst translation
To: ke zj <kezijie@leap-io-kernel.com>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763105050.git.kezijie@leap-io-kernel.com>
 <f90d639dcb2a8064c6a5e85614c4da263b9942dc.1763105050.git.kezijie@leap-io-kernel.com>
 <1a228389-14dc-4d2f-ba15-e9397c83a4c6@aosc.io>
 <c278f8a7-b9e7-4ad1-85d9-6dcabebcd0df@leap-io-kernel.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <c278f8a7-b9e7-4ad1-85d9-6dcabebcd0df@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D12A540099
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.98 / 10.00];
	BAYES_HAM(-0.88)[85.80%];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi 子杰,

On 2025/11/14 17:33, ke zj wrote:
> Hi Yuli,
>
> Thank you very much for your review.
>
> Regarding the spacing issue: I checked several translated documents 
> and noticed that many of them did not include spaces between Chinese 
> and English words. Because of that, I didn’t realize this was now the 
> preferred convention.
>
> Is this a recently adopted guideline for translated documentation?

No, this isn't a kernel requirement — it's simply a convention among 
Chinese writers.

In more formal contexts, such as publications and academic journals, 
this has become a default practice and industry standard. (As an 
example, even back in the IE6 era, there was a CSS property specifically 
designed to add spacing between CJK characters and Latin text.) So 
unless there’s a specific reason not to, it's generally recommended to 
follow this convention.

Also, you're right — many Chinese translations of kernel documentation 
do mix Chinese and English without proper spacing, but that's actually 
the nonstandard behavior.

> If so, I will fix all spacing issues in the next version of the patch.
>
> This is also my first time submitting a patch to the community, so 
> please forgive me if I've made any beginner mistakes.

No need to stress over such minor details — it's just a bored mailing 
list subscriber nitpicking something they happened to notice :-)

You're doing great!

>
> Thanks again for your time and guidance.
>
> Best regards,
> Ke Zijie

Thanks,

--

WangYuli

