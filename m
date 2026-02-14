Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CFE2BEC4E;
	Sat, 14 Feb 2026 17:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089127; cv=none; b=dIHmfHN++v4JBnE9vnZnDgTfs7mNP4fs4kHCpXTHDj99KawyDYLXhXP2/mAAg6jUvoKsK2qPIxd82GRHXZQzpcknDgMZbcd2oR5xr/95gDwIYRnpYRgk+sWgTTDiRMcCny/JRVJRiFkta2Mg9NtuF5b+wQJfVi0fZ06AKUksIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089127; c=relaxed/simple;
	bh=Quh3Ioad6W4ChvXQ4SVBTfRFF2fNvmQN8pr3SD5AiZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XX+mLBD6o1DLHJ6JGY9sQbc6v9DmvKlmARga7nM9OwzX5Tceg+/D1qCmB8fbcsqiwtFiG5hAIZYInNiHKMt10j3W4nWl74AxPZoCNtCPqx97uiiR2i/a7ipddub13dl6gQiKoCS7kMCsG3B+NXkj+J3hWSJdRtGUdyYgbRAHUDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tTaVXGOx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tTaVXGOx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1961E411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771089124; bh=K6OPypjgj01w/WU0ODGSh1dDFnNHtK1mfSIB5RVAOpU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tTaVXGOxH1Cz/jmUopXSE/wFDdss/1zaIQKxb+8U7XfIpHqHDeWabjZpd8tfWIq3v
	 4jTnUOLvad0jIEbr6ly2NrdxFrXMLEzJBxmXTud1/91BGIX6koP+EyXa7a9yivQqdi
	 5IKE1VNNBuMKo8zPxfcmngowTkpfJNJc2medTtJ0LVLjQ/fRkgoUOHI4ufzmY9kl4i
	 QkzS1RvZbdNC1JgI8HPpattEe00DTF5W7q166y/vmtHY0HKPjOm4qFMTIZdbwMcM5g
	 6S0k5QzcHqfFl8h7Aw6Uvbkb6itV0ZZFMwypuJ8zPu4HRBgZNd2XeugNF9IfKwRtKM
	 6vj1i26XWUiZQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1961E411EC;
	Sat, 14 Feb 2026 17:12:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Min-Hsun Chang <chmh0624@gmail.com>
Cc: rob@landley.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Min-Hsun Chang <chmh0624@gmail.com>
Subject: Re: [PATCH] Docs/core-api: fix typos in rbtree.rst
In-Reply-To: <20260210060829.42975-1-chmh0624@gmail.com>
References: <20260210060829.42975-1-chmh0624@gmail.com>
Date: Sat, 14 Feb 2026 10:12:03 -0700
Message-ID: <87ikbzqmfw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Min-Hsun Chang <chmh0624@gmail.com> writes:

> Correct minor typographical errors in the red-black tree documentation:
> - Remove redundant "a" in the cached rbtrees section.
> - Fix "updated" to "update" in the augmented rbtrees section.
> - Fix "be looking" to "by looking" in the interval tree sample usage.
>
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/core-api/rbtree.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
