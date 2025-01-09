Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76460194A6C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447641; cv=none; b=SVeBgKn/5/XkA2UzqL6wk7a3jesrf/J6/Kdm9CIRX4Td8V6W2hW5D7Q9uiJNvD6o8dugsfNU61BEW7b1nHG146sqlod3byopchzfzilN99xpbr+2CYS06qM9KILSOKO2xWxxr8cMyUsz8WkbgCvOTfZjp+ZkE4vEgnoCJEGHNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447641; c=relaxed/simple;
	bh=x51KGaT02l2b3n/FApXL0qL/csBD9VruTvHfCk3pQP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ha3auMqFXzrw1MERabc6nJe8IwH8wlh/WmFdE+U8xat675fIAK1zPQNlLlHp5a738g76Sw5duSlubA+PPSl3pGgST9PnyaUL8KLJ/W9drP0MB/SNUrg89mR8ECIdPiYTMRerMcVNzbN02re9jCWR7YrSfUA/GhirPbECM97Ccvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=IgylLzMI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IgylLzMI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0B374404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736447631; bh=ENXguRXrBBFRx9OgfN6ouoXecgsknov3RNJhS+pwL+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IgylLzMI+cBmlWPHqckhYq84xLmL8rGHukSYDdnyZGbyrBmVoP0tcg4IqxM6iw+gM
	 Bs7rMpVHV4ctGsdJ4pS1QMezbr31f31Oe/OFkKL2c0YRwRpsf/tdeEWjFJH5f90Ep4
	 326JeqE8Ki0emFCK+gOSRWWuS2ZFhQt+SDF8DeO98f6Ih2qKFR8zYoK3b/x69eY9KZ
	 ivkkh4Qu7ocjjy2XM9VTkRrsmyCMc2QolNCcpGh4SL774uudF95D/Si4nv8pilUPET
	 NYXe37IPHL4oa6H2+nVoa4vVZL9x4rQO/GOGox5lwuvEBMCMvH52OYgAWilTdzOnXw
	 fIKqnU+zx09Fw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0B374404F0;
	Thu,  9 Jan 2025 18:33:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, maoyuxian@cqsoftware.com.cn,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs/zh_CN: Add security digsig Chinese translation
In-Reply-To: <20250108080136.19398-1-zhaoshuo@cqsoftware.com.cn>
References: <20250108080136.19398-1-zhaoshuo@cqsoftware.com.cn>
Date: Thu, 09 Jan 2025 11:33:50 -0700
Message-ID: <87jzb3n8fl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuo Zhao <zhaoshuo@cqsoftware.com.cn> writes:

> Translate .../security/digsig.rst into Chinese.
>
> Update the translation through commit d56b699d76d1
> ("Documentation: Fix typos")
>
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
> ---
>
> v3:
>
> Change the email address.
>
> v2:
>
> Add authors and dates and modify some translations.
>
>  .../translations/zh_CN/security/digsig.rst    | 103 ++++++++++++++++++
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  2 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/digsig.rst

Applied, thanks.

jon
