Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCA3ACA5E;
	Tue, 23 Jun 2026 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247733; cv=none; b=e2FG1q+jqgV3hJxpRYkAsrvdbMsJLXAErcZKpkZResLoetiq0WMFYgRNITLG4Xut0uI6qhmmgAUPLWUtXMWmdj+dsIb3WUxwz0mruvdd/o5fLreDgzvn+yeR9a78dN2rszj2ouTlg73D8IpesZaq87vLbBMJ1cpe2J7Sx32Ap3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247733; c=relaxed/simple;
	bh=jrix0fzbH6O6mJCVhV2ZKYpjoxRRZxvM7iZfQqlCIpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EoBHbPfboRsaopZIgMlld0Nx7YPZ5/NQY1Cdey6DGh6CpyoiXU4EVxvDlChVQ+50ukJMyLkEVxiYwa8DOMEKzWevv6o2u52HVJ8kgj9eCcoqyIW+rmDD9PPLnprPVNJypBNAgZc9WSrmIay93lXm8VLoVlsVlY1/UWNcDHkkEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BGmPVMn0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BGmPVMn0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C67C040E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782247732; bh=qcOF/QCYVq2YizlDqs23lDt0Cd9a0Ib9OXfZYAezBRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BGmPVMn0Kn3AaefoyDUsN/VdSgbk/Qv0WSbwpolwcZTnNcunG647YsTeappSXIOsU
	 RO6UeOfznV2U4LHMZjwwY1XisOMSbpz7XeardONL5up7+mwaeBQFA4nDrzKQs2Uo9F
	 q1Jzob+YCW9jckMIOZ4e9Hj7UerzR336NO+8g1el3lCgNNHuRO8iYNEwvaMtOAVdf8
	 Gs9aFW5sEH4y9l6ruqQ4/rMmWLvM0xoTdwcLdOdTxrqIcyhxUvVyQv6nGrF7RNbIty
	 a/Wr/Q/t0TC1NXP02yOFPRTiHCFfUhSZ/hdBngk6jBE/NWwz9oSAnRtqXuHMghkamS
	 CpUlpTpUdNm0g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C67C040E41;
	Tue, 23 Jun 2026 20:48:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Declan Wale <decwale37@gmail.com>
Cc: skhan@linuxfoundation.org, mchehab+huawei@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: tools: Fix typo in unittest.rst
In-Reply-To: <CADz3o9mbM60-p1PV8t=nOm7099KnFeYQOyo5J+bC2iiP9PtBJQ@mail.gmail.com>
References: <CADz3o9mbM60-p1PV8t=nOm7099KnFeYQOyo5J+bC2iiP9PtBJQ@mail.gmail.com>
Date: Tue, 23 Jun 2026 14:48:51 -0600
Message-ID: <87wlvp9e4s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Declan Wale <decwale37@gmail.com> writes:

> From 355e0c80a9ba337d0cac106c8cb66859927a501c Mon Sep 17 00:00:00 2001
> From: Declan Wale <decwale37@gmail.com>
> Date: Sun, 31 May 2026 19:03:06 +0100
> Subject: [PATCH] docs: tools: Fix typo 'ackward' to 'awkward' in unittest.rst
>
> Signed-off-by: Declan Wale <decwale37@gmail.com>
> ---
>  Documentation/tools/unittest.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/tools/unittest.rst b/Documentation/tools/unittest.rst
> index 14a2b2a65236..0fa8716741df 100644
> --- a/Documentation/tools/unittest.rst
> +++ b/Documentation/tools/unittest.rst
> @@ -11,7 +11,7 @@ While the actual test implementation is usecase dependent, Python already
>  provides a standard way to add unit tests by using ``import unittest``.
>  
>  Using such class, requires setting up a test suite. Also, the default format
> -is a little bit ackward. To improve it and provide a more uniform way to
> +is a little bit awkward. To improve it and provide a more uniform way to
>  report errors, some unittest classes and functions are defined.

Applied, thanks.

jon
