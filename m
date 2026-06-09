Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8469402427;
	Tue,  9 Jun 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024214; cv=none; b=RwAP/zHPOKQ9GIcLijyiImUneaqdebZF1ApTt+a8floJUlOe9wSsmh0TxebcoX4fm1gZBREeUO67t2eCME3p0SmDuLP+xP/C/rkNJ0kk/+rbAQ016te2isUSqeY6csftMH17NTZrPn+h3FGPhejif8GpTkmgXSwL1puFOfIcjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024214; c=relaxed/simple;
	bh=yVSgqA1YRqHOPUZzRZRDiGjbH7YpDugPsDgNSCyNE18=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YR00n2fVOQDxZjN6FmKagOp6qw63t1EmQAMi5pTC+hAldobiiu/bMRTdndIazIL00iaprYdfNNa9E5bRHCfBisX0FMUkEqV/WJTwV68sS+tC1xRQdFgFPQqtQ6+P/IRTfqUL/YBfW+kqL9MlFFWLibwYoNEUg5LEifP7Jn/Ur+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Bj+wqivD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Bj+wqivD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=5nClrPMG+OpAu8aP+72MzAHYsBT4h/EZHiaG3Bb1jtU=; b=Bj+wqivDZg3cNXZcVQvduoRLN7
	8wlCoQrxzyjlo0QI3yIgbnGE27ZoDASLk4NczHzAGjWHr5BS9ZcIXqbUCuA0Kv5IZp9Nw0Ny/z8qI
	Z6y2LMswOgQQ51KLM4bqNQ1fSLN2ynViLQKqLamBuAh/fWWPLQEKYDJHup+ACw53UbLPzM3ngey/P
	XWG4tKAkCugd8lr3VGnl0hlQRcJ4lHEQTh4stA41+2TFNfD79dhdmzokyeCJVJMgFVO354f7rrIKa
	oOJjpdKInJFI5SvL0rP1eiGFEs1oORR0MPsdmIgHYeWhOadFx/4X7CGRe0trw2nQewnQ4mTlyNqFu
	MVgFNqsg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzkw-000000065uL-1Y2T;
	Tue, 09 Jun 2026 16:56:50 +0000
Message-ID: <cbb6b92f-815d-46b1-8ba6-8e25c35f3450@infradead.org>
Date: Tue, 9 Jun 2026 09:56:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Fix minor grammatical error
To: Brigham Campbell <me@brighamcampbell.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION REPORTING ISSUES" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260609070618.12566-1-me@brighamcampbell.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260609070618.12566-1-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/9/26 12:06 AM, Brigham Campbell wrote:
> Fix minor grammatical error in the administration guide.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Since v1:
> * Drop pedantic line re-wrapping.
> 
> In hindsight, I should have guessed that reflowing the paragraph was
> overzealous. Thanks for the guidance, Randy, Thorsten. I'll remember it
> if I make minor doc fixes in the future.
> 
>  Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index cb178e0a6208..3432dc8e1a85 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -217,7 +217,7 @@ again.
>  
>     There is a catch: 'localmodconfig' is likely to disable kernel features you
>     did not use since you booted your Linux -- like drivers for currently
> -   disconnected peripherals or a virtualization software not haven't used yet.
> +   disconnected peripherals or virtualization software not currently in use.
>     You can reduce or nearly eliminate that risk with tricks the reference
>     section outlines; but when building a kernel just for quick testing purposes
>     it is often negligible if such features are missing. But you should keep that
> 
> base-commit: 738bb6e6c8d992f33335b3cbcce051ab118a33dc

-- 
~Randy
