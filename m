Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D062C692
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710754794; cv=none; b=E2gKzrkCDAK6afgerJBnH7A4/4GaxNKGk1E+7IjKvrX5AOJKc2j1sczgywwnfo437afM7uuxR0q44KoZ53mn1v4ZxJVfBYcDCptJg4rgojMZauQFfZYQG0HNfBO7qgjDDf4rvb7vj2kMsg8sv8G5zAX88g4JXksbNrtGdZyNt9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710754794; c=relaxed/simple;
	bh=bfuzsRfuXkmNpndomsywMcVEVwNDgDj0OmEEHHC6bf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GBgFelKOF24HT8BrrFa026ma5yCo1vwhRNmSUEGm3zg9cSuSlUCO9Mbg2QiaqK/1/PLBL6y+nujr8xOk5XSRbbu1FXTm9v9ghD+nJEvs5eM5eHh/Jt5SI/1e2dVpellygpPR/JzhvMiuA9kpzS95QtTxnFVclg7/FXw56o0kiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KKZu2Y+V; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KKZu2Y+V"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 02560418C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1710754791; bh=SxhtaeZdJ8EAaK0BppG3I+S4Zqa+6dOv80Rxe25pGzM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KKZu2Y+VxY1WMaIEC9WwdXytEp9evVod/2Fsq3Fyu/gV3lyCvOoNH/uRoBxT/PxlJ
	 aclBYuoHhAWOqfnEMR2y4Id9YUUwoVL88AkEtmQNiBqur8zxpIJ3I57XLbaK5vqgt2
	 dnlWLPiij1ci1JxkdQwLJWeqIoSa1NL9cMxIo5DROIi5XM5Il6uk7KeNupJM1maMqe
	 ae3MOWXL5rqtJOelPPMjL3bc/rO35F02qfbQTRmm5OaR/PenVmfTb5Xudx6+n1n6Y3
	 vrJI4Bh9OQsqK/N6ZFiGS4DBzrBWhbgzcjxzM2ZSB5mLLSCIRmaWvlHTAk1BJ3xkkz
	 zWyU2pE0XMWrw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 02560418C4;
	Mon, 18 Mar 2024 09:39:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kendra Moore <kendra.j.moore3443@gmail.com>, linux-doc@vger.kernel.org
Cc: Kendra Moore <kendra.j.moore3443@gmail.com>
Subject: Re: [PATCH] doc: Fix typo in admin-guide/cifs/introduction.rst
In-Reply-To: <20240312084753.27122-1-kendra.j.moore3443@gmail.com>
References: <20240312084753.27122-1-kendra.j.moore3443@gmail.com>
Date: Mon, 18 Mar 2024 03:39:47 -0600
Message-ID: <87il1janfg.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kendra Moore <kendra.j.moore3443@gmail.com> writes:

> This patch corrects a spelling error specifically
> the word "supports" was misspelled "suppors".
>
> No functional changes are made by this patch; it
> only improves the accuracy and readability of the
> documentation.
>
> Signed-off-by: Kendra Moore <kendra.j.moore3443@gmail.com>
> ---
>  Documentation/admin-guide/cifs/introduction.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/cifs/introduction.rst b/Documentation/admin-guide/cifs/introduction.rst
> index 53ea62906aa5..ffc6e2564dd5 100644
> --- a/Documentation/admin-guide/cifs/introduction.rst
> +++ b/Documentation/admin-guide/cifs/introduction.rst
> @@ -28,7 +28,7 @@ Introduction
>    high performance safe distributed caching (leases/oplocks), optional packet
>    signing, large files, Unicode support and other internationalization
>    improvements. Since both Samba server and this filesystem client support the
> -  CIFS Unix extensions, and the Linux client also suppors SMB3 POSIX extensions,
> +  CIFS Unix extensions, and the Linux client also supports SMB3 POSIX extensions,
>    the combination can provide a reasonable alternative to other network and

Applied, thanks.

jon
