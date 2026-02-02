Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43612223705
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051191; cv=none; b=NqqZKfDLoNTAipsTHB2KdVT3UvAyCvGDSFuykwcSmT+3wt3MM2qiDyZvhrJAkepVfXnLSnvqt0hxjmKTxnT84qMEXmWtqBwMDzYJ89ASOKEJplTKhaAuUulsw8tjEhva31mK4ESlpNObSvQZohcCXU5NfVfDlB+3PE43bIRzl/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051191; c=relaxed/simple;
	bh=RWDz35oPfgdN+FHHajWuSr9OXY/ndWC5+Y3nD/jv3Vg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MWX1wP6e2ymFr63hmTf3BS/AOblSYstrhTnDk7jQ2EUC/pn6aKHlrYTRgiYD8PFaW/3hh66+KlFHmuVFhac+ofNO+0SII++ZOlKIKUlpV4wAtYLUwcbrU2M5x20xfU+TgC9SR8+t/UD339RR7xCWj4wXUZ5kxmI1A0UXNQggz9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q/w2cDDk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q/w2cDDk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 77E3640422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770051189; bh=u6/PBGsnz3hBR6srBUIQbs9+5NjF8F+KFIK7vtCkSn8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q/w2cDDkNpCR1cwgrdHligoEjw8R2l0u5eYbVsGIJcsUqylS3kM/WTMroUspnV6PR
	 PuRVQfCzWez+UG36mZ8TRzIcFcFAS97bAtZxMoM31HgJe7Ng12JT0joLTTQe20fUZw
	 1MlL/eGGtYFnL3tzLEErqe0VjcYob+SY/TR5MvFztJ+rConvjIJWnXzv+knpKtIg38
	 kh86v/VLn6/x/cXq+phXbuSXJplOclfoNdHMWSYaay2uF2AdOffPtDye8F5bDZuB03
	 ECRfq4Gxf5Mnxf58jcHHLWjNVyuqW7wexwHLN7OLb0YWbJPHVBLzuPXSWqwRHw1KfS
	 a09ACDEqcm4Pg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 77E3640422;
	Mon,  2 Feb 2026 16:53:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Gabriel Whigham <gabewhigham@gmail.com>, linux-doc@vger.kernel.org
Cc: Gabriel Whigham <gabewhigham@gmail.com>
Subject: Re: [PATCH] docs: ioctl-number: fix a typo in ioctl-number.rst
In-Reply-To: <20260130042131.51975-1-gabewhigham@gmail.com>
References: <20260130042131.51975-1-gabewhigham@gmail.com>
Date: Mon, 02 Feb 2026 09:53:08 -0700
Message-ID: <87o6m7rssr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Gabriel Whigham <gabewhigham@gmail.com> writes:

> "userspace" was misspelled as "userpace".
>
> Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 7232b3544cec..b5c6447455fd 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -15,7 +15,7 @@ macros defined in <linux/ioctl.h>:
>      ====== ===========================
>      _IO    none
>      _IOW   write (read from userspace)
> -    _IOR   read (write to userpace)
> +    _IOR   read (write to userspace)
>      _IOWR  write and read
>      ====== ===========================

Applied, thanks.

jon
