Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF9235677C;
	Mon, 24 Aug 2026 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787591621; cv=none; b=qbE/2TAkXuoDmMeM3j916pEHW00q5fEI/I845K8Z1hv7veDQYgWo1glr/00plq49tSzEru0zuiTQqgbmAnn5LSbe6EZLOmEjWHyOv+PbnO7zpmrFSN9qB6LZtzbO8NyV6G3XBeTVFpsM7ZXrMlRqxEWwIZVm4xYWyI6xV/PctdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787591621; c=relaxed/simple;
	bh=WHwmqYZuEwhWcNjwwZlZRtHvZEY3zxBrShHl9ejLdyU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pZWeobiVIr7Iax9i47Iq4MyaSiMdsj499I2ala/Br8Mzcalj8iiYNOUPrZ1gplUnxbUrx3QL0KhXMlw8fy6vCGg6vgaIJSiCt4T4cQGl2qUmtr4XFU1y3f4PyTsUW/H+rRwXbcxJu55XV4L/qCcvFQZ8ma4J2vcrhRwiCXTTRog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I5XMCCzr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I5XMCCzr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2B185408F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787591619; bh=GrjBxMDLFvDI4bL59EmOEI2m/q8sLn68ShjwW49xN88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I5XMCCzrLbpqyIsm8vQOdWPspSuMSgJJfld7F57ffW8zH+JOhYY03arv+x2aBPnoS
	 lW6e606538m3WcrJWeIyjYBNoh6RXumPhfIqIAvoNmo7h0DcMj7wHGdegHK84oE01W
	 nKRVLiEDoTjxSctj5K7OV9yzGD0DldDlM2ZAddpD9kRrNAQcyOq+A40whnn2PLVvf8
	 eeo49eSsh6LfH2xeADWDupWt7TuI6Rc9rei/hlHlMaItuDmMc9qFP0mrLGObcnPi7T
	 /fRk1MrF0ztsYGFecLsuHZLQW5CsBS3rXGJj9854e25KOzpApem8VVBdvD3oySAHxR
	 u2/7Sbp9fmJlw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2B185408F8;
	Mon, 24 Aug 2026 17:13:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-doc@vger.kernel.org,
 feng.tang@linux.alibaba.com, pmladek@suse.com, include@grrlz.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
 andriy.shevchenko@linux.intel.com, kees@kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net,
 gpiccoli@igalia.com
Subject: Re: [PATCH V2] docs: panic: Disclaimer about console verbosity when
 using panic_print with pstore
In-Reply-To: <20260819183419.2203903-1-gpiccoli@igalia.com>
References: <20260819183419.2203903-1-gpiccoli@igalia.com>
Date: Mon, 24 Aug 2026 11:13:38 -0600
Message-ID: <87pkz7xwzh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:

> Users of panic_print / panic_sys_info are usually aware of the potentially
> huge amount of information displayed with such options - their goal by
> using them is indeed to dump more information during panic!
>
> What might come unnoticed at first is the impact that the console_verbose()
> call on panic path has, specially in cases that users rely on pstore as
> a means to collect the panic logs. Recent experience shows that dumping
> all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute
> delay on panic time due to writing such information to console. But in
> that case, pstore was used, so there was no need for console printing,
> and suppressing that reduced the full time to less than 0.5 second.
>
> The option "printk.console_no_auto_verbose" aims exactly at this use
> case: avoid automatically increasing the loglevel during panic path.
> So, let's officially document this to avoid users wasting their time
> either on long panic printing or debugging the panic delays.
>
> While at it, improve the readability of the panic_print text, by
> adding some line breaks.
>
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Bradley Morgan <include@grrlz.net>
> Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>
>
> V2:
> - Added line breaks as per Petr's suggestion (with some text improvements
>   as well) - thanks Petr!
>
> - Added review tags - thanks Feng Tang and Bradley, feel free to check
>   again given we added the line breaks, etc.
>
> V1 link: https://lore.kernel.org/r/20260805205026.1699568-1-gpiccoli@igalia.com/
>
>
>  .../admin-guide/kernel-parameters.txt         | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)

Applied, thanks.

jon
