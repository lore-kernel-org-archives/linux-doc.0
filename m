Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552646;
	b=17FZNJfm9Qpe38KjAUwoPinEphnlp+XT6KqYVKGBAwEOugyU7NuF9Nk/yH+q0fjX9iQ3
	 v3QAK41NUCv/yaPepLQmL4wlNfY54TbXHFTvaFpEru2ryeehRc+Z+fUTVnrgLhrxQgjVl
	 QBGKX8NlGasmBh+iWVitaMoL8JDZAvHLRlxPm7t3EZsLlHV5qLu2Y/XNJag3jipUu/ylp
	 5Spp6pgLMwY7SAkAm5Bc+ND6i68pD+Ob30upzqARn7QtU5Xn7srYzCU0lADR5dLW2rgCf
	 e+Wp9w1FafSnYIELhDUe7FKXjmRTtkePlgrOIU78z7K6v1zf2zAtimd/iOxSCiaragA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552646;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0c9YSXQ8qs6FkTZSs/aCWtzNkPquzUM7JFakPCdb6XU=;
	b=4zDlX8o8K6nNPVK8mLW2jKDrgKSIUczG+LXmOmOdr0toNzVxhbsVs8OyAu8eCKc6pBzQ
	 LOIOqWG5YUfbVgAD5eLrrAT8oolUTiDlJ4LFJKgs0YUF+fsk7uBt8C2xkwnT2bqq9vBL0
	 ObNYu1W2iKFBJaBSCv3xcyi2faeBkVUrt+7fF7Q2oDSi46g3fA6Oi1V/aqlTGPhmN+Gi+
	 pJOP09bQGV/F+k9S+F74xj8pUdyyfnEeKQrZa8N7+A+U/tnMFMLrlYhm46PXTipC07Bp6
	 p9WFA9iAwjlw8wHmlWyehEWJN/E38FyqAKBabCSE/IZINkDfH2UkyyKaJhJ4UZ3MllQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OIsvx6O8;
	arc=none smtp.remote-ip=95.215.58.209
Received: from mta1.migadu.com (out-209.mta1.migadu.com [95.215.58.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C634A60A3E58
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C634A60A3E58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OIsvx6O8
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Edw2hBrIlneBEdBFCqM6xrgbmwDc3urwnrYB4hLMOFM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792552638; v=1; x=1793157438;
 b=OIsvx6O8Wcd9l7WwD7Lla2iS9XGjctV/FYvNwfkgT39jrcTEvE4eWX7KcfzQYmH9jL4Q3vad
 4gq8fKJj1rWfDA/n7YOy3IgMsxcbOnc/uBkIi/0duYztBw8So9T/qIIyx1MtVivK1wybnwHD2Nw
 MgxCd/O5hu/4pSoWoIKDpGDnFtpjl9rNKvpaTCi8AlabLIV8uv9pxo28s1Ijm1tkzkcy9qUjpOd
 O8e9J2orNfLyewPDLxFxEdIR37yxAxmQuKgbbDSyQLk2ygdZ7hszmBYOxKzSV7yRlXQoNDr7Jmo
 3shsMpAV49gjbMeUac/cRSgB5aZ1xLOkiFUQXiBMlaTTg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12c96e374fc691f1;
	Wed, 21 Oct 2026 03:17:18 +0000
X-Mizu-Trace-ID: 12c96e374fc691f1
X-Migadu-Flow: FLOW_OUT
Date: Wed, 21 Oct 2026 11:17:14 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <atguukYG6qCfLHMv@wyuan.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020212235.1143086-1-ebiggers@kernel.org>


Eric Biggers <ebiggers@kernel.org> writes:

> Many patches still don't include base tree information and can't be
> applied.  Such patches can't be properly reviewed or tested, nor can
> they be accepted.  submitting-patches.rst already describes how to
> include base tree information, but it's characterized as optional,
> appears only towards the end of the document, and is missing details.
> 
> Make some tweaks to hopefully increase the number of patches that
> include base tree information:
> 
> - Characterize base tree information as required, not optional.
> 
> - Mention it in the "The canonical patch format" section too.
> 
> - Clarify what commits are acceptable to use as base commits.  Also use
>   origin/master instead of master in the example.
> 
> - Mention how to handle prerequisite patches.
> 
> - Suggest setting the format.useAutoBase=true git configuration option.
> 
> - Mention falling back to free-form text as a last resort.
> 
> - Don't say base-commit can go "below the '---' line", since that
>   implied it could go before the diff, which is an unnecessary
>   alternative that differs from what 'git format-patch' produces.
> 
> - Free up some space for the new information by dropping the mention of
>   needing at least git v2.9.0 (since that's quite old by now) and the
>   example of 'git am' (since that isn't directly relevant to submitting
>   patches, which is the topic of submitting-patches.rst).
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

LGTM!

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

