Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416E3559CA
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011898; cv=pass; b=S4yrZ5h+yJRv8CqGz8D4KHPthVEf5+b+iIAKvUCRmBJXYHxcUFUz9DKrpK2By51ANkThjCU7riy3NdBW98UOfkKh17cnPnBNvVgsxGgYKZmKuPX77Fnrp2sRl0OqWhlMdyQ1aohO8/YIhZDCLFAXmCNRDr4PjRYlQ+YiRlNRm5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011898; c=relaxed/simple;
	bh=sp3vomFJbomNRXwJxSXApRuLFyKOlFqDaIARfWjsK6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIGD6g/+QT5jl39EFjhyHX0jx2KKYa3vhYEKCmmxV73g7XA8Ne+qzXelrKFeSIrsJflMTTzHqrjJvYFvEsCIzqf2Sq3cwm3GXx6yWnOOw06qUBvkL7GoabqKHW5ikxK9wMVLa3qIU+wzUm7elMMyXdxP6mxPms4rffSOnCO6hiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezcd+O69; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezcd+O69"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso78536eec.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011896; cv=none;
        d=google.com; s=arc-20240605;
        b=aJoEK1ftodRuXYl9aEJPyN+PwFVpSPZ49YwlVV/2YKa9KIVv6HlmTcRARGjalEFvbS
         k6f1dmV2crH6usa0sadtSKsRwULvtVcYuydpjIUTWOJmXG2u0NmTjP0SbKINYS0ySBpq
         ewSRBZCZ1hiXj04YqE6QdhOhp+GKfk5BErGrQqkmM/1hy6k938fdb+fblvPU/Ijg28iQ
         PMzWRA++jjVeyi8r5NEHD4Le1MFK/Z+Fb2d6EItc4lKEcMrj4hvuyuWdzFDUzi07ABGt
         kwEGzH81fGJqkNQUmmpxTWoFySuPLqIRYiJy2A1JV98aAjfPSgxsUwAK3pFe2EDtbuNk
         7Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        fh=MJntRfgSwPgRNhagbQoCh6YO+5TdeleKNukrd2jyxDs=;
        b=BtQqw3d+33oGfn1GYBEV5xf1oDuag4yI98sgooq8SkgKm6BskJEj44PcmEYMBSufSj
         geWiM/kqyIsfridzlOO35olj2G244sL+mpccg0sMisx9cyXXRQcQFZSp5jiXwObBVtFx
         kjr6DTsax6kS1aUjVA+iV3B+kuC292cnXlJxGmS/zr+HUwRWtGUsV1iFtBnTb5sr4iG8
         /aJDo1ubzY+ylC3S+wRyZwNXL7OMAr8j7Mra0wkQu0Z8KYZ6zbDgRWDLWguLqcPcXvax
         h52JBVq0RcV4H3wtlSyT/9zg33NqwayVIBart1yFfKorJ6QU8NZb8Uscp8lhL4TlRAff
         iLOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011896; x=1779616696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=ezcd+O69uadPZ5Wn6BCRWd4rAgDFUxZf32qb5GJWtHU18iWKQU4Uh21aCs8PGCrg2o
         gXE+MdJsnqk38JpqTQd1LEKAMVOZVNmwLdIFdXhBDFPA8FP8g+CSWLJ6oHhb1M+GtfzB
         Avp0eFXoU94fg+VzXsTkqCLpTYCmglZhhNPTO/AGYo0BCildVj4sFccyyLk6AK4zF9EJ
         8sB+RYGq21xgC0seNiRkF4p5/EqTqfdypgkYudazGubG/EsaOyOuLtKt/myuBbPc7SB+
         oDpNDwzOJZpSV5TvWdBd3kEfBl2+u1ytDxJFY/sgCwQtDuHqo+9dyC50EjUnppd371Uk
         YGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011896; x=1779616696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqpuiZThL83l8Qc09+lfYk8qhRxHAyIAYn4X8Yv8HCY=;
        b=OcLlKInw07TzP5bhPqgrml2r6I4aqLhpznAZnnNeUbeu4dG23aoOGY+HiyPPgxJsxg
         qsqQf+zRAYveZmn7LMgCgauugCE3PmzFb0MVQrVpEyVYDkeR5iUlo+iVRwTVEhQXcM+x
         abvjIxk6re/Ck0xxnnU0USYI+X6i27ygkpAHFYYst7ECHlOwJK25a7mYKtqVgrKp2JI4
         F6RJE0apcHqjNlYM2D9Bqy6NWhS9ocIox5hZp7wG4kVVVTWjTcoPcgCkLdoxsztXjKKw
         ilisG+5mgwknnYksBIf0qunUfPMcd/fPkWgDoB7qQ/0NKy6Szm3qAXP7mtMPYG6nRiKM
         hKyA==
X-Forwarded-Encrypted: i=1; AFNElJ9jg1dSxFvmmFrVD9FHyow0S+dEfM3/Rffw9rM+FJYVzb6GwKPbatuwktnY9L/edNCtzmo2Ji6TgM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQtgx9p+rUOjPyOcgcZCeD/qoQyNzeDCqYbMZMscTDn97A9xa
	zeI9duV5qmXRCjWCpm7n4D3PI0UMnvpwzfuvi4CnMQjYReQKZPnA0tv1EWjVs7Ync8lswfkDeGt
	+Pvg5PYt2so2SsMtMIlbQb95JZ0x9K+c=
X-Gm-Gg: Acq92OHrY7ouKi7gmM81cULxyFqLhHhM+8SIum890Oa1BxX4Zw6IDBoiIiHfriipixq
	R6r7YErb8A4QuLIDdqp4oTba6O/UhmtbVAT2hG10Jy3DoS6o2dVGx1qyHN0u/xf79APyF4rjXxK
	n/j6valMmqvqBOS7xv96T2m+sjs145yWYHy5MosLOFcU/6DpE2WZD+0V25sndQ7JYed025vGRcE
	y6NGDtokeTVgwQFXkqEb9+1WGLC9VhTWF6bhFGOSFNFLyv/jdtBNbGLOop1zaR7kiM8M0zBXmWK
	2cC2fROtbkhjTfqKWHF9Yj0QtKnk5aTaUIL3Gpk0LEnPZGOY1TDdc44LfqQKl0CVlqZnchDnpSM
	nSUJ1ZUX2OpPUUaPDejHEfF6h8nQJKtZFkw==
X-Received: by 2002:a05:7301:6785:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-30398176f35mr2482107eec.2.1779011895953; Sun, 17 May 2026
 02:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
In-Reply-To: <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:58:03 +0200
X-Gm-Features: AVHnY4JGl9cz96kI-HTqmFFF02vhAFr-_P_prP7jRQ5fdei8qmaB-O5q3qa_jXI
Message-ID: <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 8:10=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I think it is simpler to just inline all of this code into its
> single call-site.  The safety of the code is obvious in context,
> and you can avoid checking for impossible errors.  For instance,
> since all of the options have required arguments, it really is safe
> to dereference optarg without any null check.

If we are going to have unsafe code, then let's please build safe
abstractions wherever possible, just like we do elsewhere. We should
also write `// SAFETY` comments and enable the lints that catch that
etc., just like elsewhere too.

(This is not to say we should use `getopt` instead of something like
`clap` -- as soon as we start using `cargo vendor`, then it makes
sense to at least consider having a set of vetted, well-known crates
to write Rust tools in-tree, as I mentioned in v1.)

Cheers,
Miguel
