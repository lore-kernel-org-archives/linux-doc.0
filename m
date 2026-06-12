Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299D3793D0;
	Fri, 12 Jun 2026 19:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292233; cv=none; b=WnMBoITYnljFKhFYnMLximh1QG6Um9ujSLX86CYdcgPBhwjqyoh18oeJy5hPO6CEuq3yiA8aeTmYG4PTTYDRY5oDGaOLbzeYnbCIhL62ZWi2G4uqa7ouT7nMQzyeZYAspS2G4ecgGVp1t3VBUxklvuEM0s03fia1XDlHgr5E8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292233; c=relaxed/simple;
	bh=4xtK+a0IjGXf019h+V0+qStEWUMLujQdQjHyw64xXaY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Egbf5b5M3bWM+/8/egvpLpOlqyF0MM6oTlnbz9DbChLMilWO8y5yOHj4F0i7hnKC9rZ77IbYdSxcOMcXlDuIz0TUhoMYl8vxQAhXQB8vsVWA503KOhcvQck7DRLNl98V7WmMScuA+HyU6QFJDCtGGf9rrX1G5w+sUkk73y5gl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QlcwcqF7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QlcwcqF7"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6D41A40E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292231; bh=HWfqNUeAOV69yYS3chmL1JV+C/hYUPNMOabZkJPmfjg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QlcwcqF7Qys/9702W3AJW070221tXhGuHOYGECWyNRC6uGeuH5PKEejkishYwfLrP
	 gDMUvwtArJ1r8yZ2NvfM44v5PbR7H8kcCigjIiif3ZcjRepnr46UiZY066FBIPjhd9
	 tUzw5vdPJEcNJbRRlIhctT+7UJCvHPIJSG3BIx/ufXS4vsgeFVJZk71pyTBn5wiJiv
	 VGA33QB3naSP35EfZsbLLJV4w8WmR7yxAq2vEt57u4gxmxkzz06joQibjaAd5c2BQQ
	 tEPd7KMre2kaFqcls/dbAJwOUP3mndIsmGcs4b9tJOzDbz8sQnLVOwSlPOEf/9o4K0
	 WdE5AfurhnR0g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6D41A40E4D;
	Fri, 12 Jun 2026 19:23:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH v1] docs/ja_JP: translate submitting-patches.rst
 (interleaved-replies)
In-Reply-To: <20260606035954.27605-1-weibu@redadmin.org>
References: <20260606035954.27605-1-weibu@redadmin.org>
Date: Fri, 12 Jun 2026 13:23:50 -0600
Message-ID: <875x3n7ebd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "Use trimmed interleaved replies in email discussions"
> and "Don't get discouraged - or impatient" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)

Applied, thanks.

jon
