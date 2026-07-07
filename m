Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE68A2FFDE1
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430619; cv=none; b=lCVkQxLfCa2vN9vvzLfnIkqIkzbTmiUycCFGgJFExXHkhwugNTd064P0zmDOlI3IMvlYWlikJh0WePAoW1l0ACPcJFboeEZIyu9L3aKYhCuCWYGt4n8p5IexIsA/vl6To4W3YvY0dbdHk9xJSmdTwWJkA9tzL/d9u1IHqyHe7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430619; c=relaxed/simple;
	bh=A7wtOtvaY9HeozoFHBzDhct5R9t8t6hlM7khqAp+eUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o/+Gpld4H4HSBLlhU/M7DIWF0G/P5sJWp4JVSszSajDDOo14s9OK74paesdlSGg0oGAHvtF3aBEqAuL4g83WDYcFofO8tvbnhBXwL9aqnJJbSu/k3fkU85Q0YuZQKErnnTzzKpTqPhpc9bjj3cojIF4Yl09f7j5Ybl7Qm1fLsm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=llXCzkhx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="llXCzkhx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E8DE40E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783430611; bh=rc1X2XGlvyR1p/dFa8cjaLKPjG7UoROg87uM26KtvoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=llXCzkhxz33/WEYm9rlqlinoy7tlT9hortJZAYdtk36SBVm0dRnQ/dHPmv4FZlErW
	 EmjCvwX+MREXxWVW65RP5AYYREopfCwzQihX7B+hA1CwDcq8VwCNojfXe7rk/4EBFs
	 9rzh7OoQIHlmligSKU7xoiXY+1SvrrV5jrUcN1waYWOvb3P7YlsWp3T4zYhagJA8Zx
	 5Vk8C7Jq0O8TnB+mMX2DeR4sZ9y0UuC/ixR7rTzLjsTTAD5wGCJmbrDdH8Wwx32UXs
	 PAgNt79qcgneTXhhd7sfyYB7O6rNgxB3CbwMVi9msBBh2Pv1kRGzpqZhQA91Ar/Qcz
	 V1yeT+UsUeDDQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E8DE40E27;
	Tue,  7 Jul 2026 13:23:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Doehyun Baek <doehyunbaek@gmail.com>, linux-doc@vger.kernel.org
Cc: federico.vaga@vaga.pv.it, skhan@linuxfoundation.org, Doehyun Baek
 <doehyunbaek@gmail.com>
Subject: Re: [PATCH v2] Docs/translations/it_IT: update current minimal
 requirements
In-Reply-To: <20260707092613.1373425-1-doehyunbaek@gmail.com>
References: <20260707092613.1373425-1-doehyunbaek@gmail.com>
Date: Tue, 07 Jul 2026 07:23:30 -0600
Message-ID: <87zf03q6gd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Doehyun Baek <doehyunbaek@gmail.com> writes:

> Update the Italian minimum requirements table to match
> Documentation/process/changes.rst for Rust, bindgen, pahole, Sphinx and
> Python.
>
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> ---
> Changes in v2:
> - Rebase on current docs-next.
>
>  Documentation/translations/it_IT/process/changes.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
> index 7ee54c972418..1f89bae7b6c2 100644
> --- a/Documentation/translations/it_IT/process/changes.rst
> +++ b/Documentation/translations/it_IT/process/changes.rst
> @@ -34,14 +34,14 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
>  ====================== =================  ========================================
>  GNU C                  8.1                gcc --version
>  Clang/LLVM (optional)  17.0.1             clang --version
> -Rust (opzionale)       1.78.0             rustc --version
> -bindgen (opzionale)    0.65.1             bindgen --version
> +Rust (opzionale)       1.85.0             rustc --version
> +bindgen (opzionale)    0.71.1             bindgen --version

I don't quite understand...this text is still far removed from the
English version.  If you are going to update the file, why not make it
current?  Especially since you should be able to just cut and paste the
appropriate section directly from the English version?

Perhaps even better would be to find a way to include that text directly
so that we only have to maintain one version, but that can come later...

Thanks,

jon
