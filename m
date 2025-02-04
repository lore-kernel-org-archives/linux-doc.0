Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A8214816
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688605; cv=none; b=D7tegcQi+sW5BFlOsCs/OQIiaAlJcweMeY5/qLzGOxt8oIMmX+WQ08n1wLQTD19qBGdzCph4N/hW5Kc3dbVXNtTzLPHVF+dYsppXgGEvrp0XUXxanG58iQVUk3uiOvIz74ruZTjLvE3cnwulGQ3MY6Bw7qrS59lf4F/daIRShSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688605; c=relaxed/simple;
	bh=gMjtbuhpv0g/9AHIbWsO4pl9eoA1i9dhChx7byd8t/I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HrpsJuOVEZDTFgpZSiP5UfX0xgQaOCQCZJ0JzNpSciu0wAGRL1vhivIdHYjFGB2HDB/vIwzUKyxJZDo/eRcBDBVp3z6A1ybD3AhEsvM2R02BNjuvNt3JXwkZZmcX8khP5FYniPf5vCeSZCsll563y1vxbvZ0YBmLmJ2Vuqppke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jtcrihxg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jtcrihxg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D4A7A404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688603; bh=OsukquoMnl673UX9Wqm/VKZFGHHy8vkxxC7cIiC9XoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jtcrihxgtKgu23j9H1UKjpp/y0sJqOGZd7OSeuJdp3bR+/nJpSuPHNjWXQoaRDuO6
	 UvY1qbIhbnqHZQG+ZKypuWajiH92/euAiYpxFESyC5K9cIZV6JLjRfWMbhD1gv72Fy
	 +LvHsoNzjXd9zr5KZ6trxx2xgubNSkaNr2Pjss6MW+MPDCpnjaNhTEkFwq19TaA2jp
	 lb3Gaim0Jlmu8jll9flt1tRdukfoOoZTa35KEIs0woIW4jF/twJmNMJ50gr/0fNmlc
	 9PWlqzy1W0okcMht/SOH7SOmr/h7YeO7SEgQdWgbDlM3SYz5GyW6m4oXjfCyUJn83/
	 RpLT0p78rsNNw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D4A7A404FA;
	Tue,  4 Feb 2025 17:03:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Add security credentials Chinese translation
In-Reply-To: <20250114022843.22489-1-zhaoshuo@cqsoftware.com.cn>
References: <20250114022843.22489-1-zhaoshuo@cqsoftware.com.cn>
Date: Tue, 04 Feb 2025 10:03:22 -0700
Message-ID: <87msf1fxr9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Translate .../security/credentials.rst into Chinese.
>
> Update the translation through commit cf92ec602ac5
> ("Documentation: remove current_security() reference")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>  .../zh_CN/security/credentials.rst            | 479 ++++++++++++++++++
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  2 files changed, 480 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/credentials.rst

Applied, thanks.

jon
