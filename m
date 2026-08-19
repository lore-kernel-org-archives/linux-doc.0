Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC3A3ACA5C;
	Wed, 19 Aug 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787161119; cv=none; b=r0K1B62qMrofcq8Iu8Qan1m151uM9RI1JRJ7Srxx7bdKN0qBsGg+ng/sTelbUKiFAeh6OqRV4f1YydVk9qzzBUKfuMLuN599xPDR+H6BX2Kx4/CSyCzS2VV+XNjVEkLvfEaFRILNWATkcjkFCbSUfn/6UGzT6xJuNdNKOSeW75A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787161119; c=relaxed/simple;
	bh=dbuLWIU5zYA/SQrICJ1L7/6rgx7tIb7Cbmv8iZtZ5ZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hTFylj+W7N05TKlw42UC9YClZDT+FSgQa3TTluFKjB4du7FLJ6JC7gTgxXpdphttBoRCuPnZivaoVNHOdEc7gKj0UDCbkrobzhjNTliLgSMm90qRnqfNJy/aqSRyUht/RS2mM1pNqonB73W0mTM3B1PgymNdcCmDrFyV6/Rme6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KHevdGKS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KHevdGKS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 14B2D408EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787161110; bh=2djyXCtlAvjkhAIYynMcM8U5nUBN5Y/toUPBeiF4+kw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHevdGKSvYc5n+P4B7fmIdaB4RFXRYosi4kfaG0LF29okX4/jUr/J6Rt6GbnO4PTl
	 wI3R1LKcUyZXKuXE5oNS0g2uz3AN9GC0GOP805aZT7u/PHe9N1lg3ASC6z7L6fCu6x
	 1/HzbjUAPdPr1aJCEXfgNowJANQ5r+5kWLdlOnNmslqObpZsiMEaIzYOMM1hoeQT0h
	 clxpo/x10chR2viSc9tERPR3kAjnrc80+cyQdIIla5AXow3oeIQAYtHeH4LVNgHkSr
	 WgUlewcOSm+XS9to60z5WT22HNQ4Y/akrDWGzaQILHCsjVSq0tYk+6ZWsg6r+8FjmW
	 QEWPQOj0Fhcgw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 14B2D408EC;
	Wed, 19 Aug 2026 17:38:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, Yanteng Si
 <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Yeh
 <chenyou910331@gmail.com>, Eric W. Biederman <ebiederman@xmission.com>
Subject: Re: [PATCH 7/7] docs/zh_TW: remove the last maintainer contact
 references
In-Reply-To: <20260819145808.291567-8-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-8-chenyou910331@gmail.com>
Date: Wed, 19 Aug 2026 11:38:29 -0600
Message-ID: <87cxve80yy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chen-Yu Yeh <chenyou910331@gmail.com> writes:

> disclaimer-zh_TW.rst is included by every zh_TW document and told
> readers to mail the listed maintainer directly; index.rst asked
> would-be contributors to send patches to the same address.  Point both
> at MAINTAINERS instead, so the contact information lives in one place,
> and drop the remaining contact blocks in the top-level files.
>
> This mirrors disclaimer-zh_CN.rst, which names no address and refers to
> the Chinese documentation maintainers and reviewers instead.
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  Documentation/translations/zh_TW/IRQ.txt              | 8 --------
>  Documentation/translations/zh_TW/disclaimer-zh_TW.rst | 7 ++++---
>  Documentation/translations/zh_TW/index.rst            | 2 +-
>  Documentation/translations/zh_TW/io_ordering.txt      | 6 ------
>  4 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
> index 8115a7618307..b9a3e18495d2 100644
> --- a/Documentation/translations/zh_TW/IRQ.txt
> +++ b/Documentation/translations/zh_TW/IRQ.txt
> @@ -6,8 +6,6 @@ communicating in English you can also ask the Chinese maintainer for
>  help.  Contact the Chinese maintainer if this translation is outdated
>  or if there is a problem with the translation.
>  
> -Maintainer: Eric W. Biederman <ebiederman@xmission.com>
> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>

As noted elsewhere, this file is long gone, suggesting that this
translation is ancient indeed.  While I approve of removing all of these
extraneous lines, I wonder if it wouldn't be better to do it as part of
updating the material in general?  (A question, not a demand!)

Meanwhile, as a matter of general politeness, if you're removing
somebody's name/email from a file, it is best to copy them; I have added
Eric here.

Thanks,

jon
