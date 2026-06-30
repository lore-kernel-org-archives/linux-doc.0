Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C2382F3C;
	Tue, 30 Jun 2026 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849046; cv=none; b=rQ7+n4QFnT17sVPOUyc/8/tqOy6Wy5foyxs1JqZrkZxIyUUciyiBM8nF+6FrAAyHffcUEMOmgPSqB1/hhJg12XFT+i0PkUEZQ77onGQSl4TKZFEtx5KRxKMoTEmp4hqqJgJwBQdoWwgks8CK1fNNjvTvEseUl/SHq9FQ4lmJYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849046; c=relaxed/simple;
	bh=srXstzmEEjAxWvloY0XnSO33Y2b5qttxe6MyS6qGobw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TaS8HO0H3oItdgGJWoJjNSsia2iRlfnPan8O1VhJPJLm+JFnjGIZvqYYaKlAW092Ot4TeNcn0O1JZ/KzANZ3Khs/e5lap7MkH6pJWdBYcwZ0/uJpkvwhQi+qmXZUttjnPqbDpfeFdpduEK1NTyHiD9AUpmrqN8ijcl5Vx+ElQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fx2Vf3rl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fx2Vf3rl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0986140E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849045; bh=GgWw1iMGZlmw329dKAp+I9bQDEQmLl+BK1IBgUY78sQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fx2Vf3rlHILOjDrdcLRSEZILDQQJBxnLpY8WuANb3MdhI8GuVHsaq/0UKypFq38Te
	 e4cmbSkjkD6x1RxUHsn9zaEtew3ChHvcfp/0a8io4lQaoykZy/nfCirZGLDqa/mknE
	 fUmzG4UuRqgp3aZ1keW4Mw69LXc2KDB2oEwrgr21floUX6fif+7TQ4qNXAJPhBlrbR
	 xTJTBUXaTvYjD0bKALrTzSlcgAMuSZNtoK/C1Gm7AUA2wWop/mwhV2ocTcicg9b3o+
	 xfeUcAEx1scbP58b/0BRSLj8J+HN9zFeY82oqO5CSRkSzaaeZENAcgjAy46rkbte9N
	 CsxpLn2ixyG4w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0986140E27;
	Tue, 30 Jun 2026 19:50:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: Re: [PATCH] docs: kdoc: fix troff output description typo
In-Reply-To: <20260624122448.4853-1-alhouseenyousef@gmail.com>
References: <20260624122448.4853-1-alhouseenyousef@gmail.com>
Date: Tue, 30 Jun 2026 13:50:44 -0600
Message-ID: <87o6grrenf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yousef Alhouseen <alhouseenyousef@gmail.com> writes:

> Fix a typo in the ManFormat documentation string that describes the
> generated troff title header fields.
>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  tools/lib/python/kdoc/kdoc_output.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
> index de107ab4a..618b0d765 100644
> --- a/tools/lib/python/kdoc/kdoc_output.py
> +++ b/tools/lib/python/kdoc/kdoc_output.py
> @@ -624,7 +624,7 @@ class ManFormat(OutputFormat):
>      ``manual``
>          Defaults to ``Kernel API Manual``.
>  
> -    The above controls the output of teh corresponding fields on troff
> +    The above controls the output of the corresponding fields on troff
>      title headers, which will be filled like this::

Applied, thanks.

jon
