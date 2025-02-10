Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1F22257D
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211375; cv=none; b=ntu/pUmOpICHNp9CzRhXnDKnk1wAbEd1h0pPOtfrIUfNP83KZJUhN9uulrAucAuePQXT9Jv+u4uvBwwHIKObNRyQpy/Cm3SADjLXz5i3dSnUAey5EE3EZhTt8B6rUaUVZY6fGuvw5AqsoZ3fvmeiGYCKxpGXybH1ePE2npPCUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211375; c=relaxed/simple;
	bh=SyK+5W315fCn0v2e+loj1dWGd2fn1e8RjNX3Ord7xW4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fS3DdAv/W24CbsDIlgPeGrwp8CutlbRpUVmLruMWaWWNc/7G0GF0R7LnIqhNI+FHfDjko8pSM4Hkrs25idqR1Vf4TFIi/5cgZtdguYx+vaRPhZjVOrc+BW+2y6AGFsYE1EmUugBMqj0o1nGflY5jSnCS2iOrz/ASPUMczg6SOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=enNAOM9z; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="enNAOM9z"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2F1D5411A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739211373; bh=GbJnZz8Z5YmQ5nfqiFmWgg2oZMPFeiVrNN/sZKzrfQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=enNAOM9zUU1rbLYhSQUvVpzyKwzHExemYeDw7FZsqe+q63V+Y5UR6YIC0JsPQL91d
	 IJbeESlRPkaF4LQPZP8roFQZ2SCSh486fyExA80H54Xmyns7KjUG0X2+4lZ/oml2on
	 qHk8vY2f5i1caSoQwkA4Rq3grCI28zjUnWSjAIILGrUoZCwKSvr09hF6PDp873DG7b
	 KRlcuwsKf5Rlz51GZL5T/sQRnL6zbZyD5ImwwKfT0PhWfhx4+fXgzP2FAp65t7Cebu
	 MTBe/jSjfKdmV58PdnzRAsXH2sjyx4dhXxUfP5goHJNN1NZfuzIxU+Oi+IeG8jLeXf
	 CC63sS8CRnj9Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2F1D5411A7;
	Mon, 10 Feb 2025 18:16:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: zhangwei <zhangwei@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoshuo@cqsoftware.com.cn, zhaoyuehui@cqsoftware.com.cn,
 maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org, zhangwei
 <zhangwei@cqsoftware.com.cn>
Subject: Re: [PATCH v5 0/3] Translation self-protection.rst into chinese
In-Reply-To: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
References: <cover.1738923258.git.zhangwei@cqsoftware.com.cn>
Date: Mon, 10 Feb 2025 11:16:12 -0700
Message-ID: <87pljpzmvn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

zhangwei <zhangwei@cqsoftware.com.cn> writes:

> Translate self-protection.rst into Chinese
> and add index.rst under keys and secrets
>
> Changelog
> v5:
>   * Delete my signature in the index file
>
> v4:
>   * fix remove the blank lines in keys/index.rst
>
> v3:
>   * add index.rst under keys and secrets
>
> v2:
>   * fix remove the unnecessary blank lines
>
> zhangwei (3):
>   docs/zh_CN: Add self-protection index Chinese translation
>   docs/zh_CN: Add keys index Chinese translation
>   docs/zh_CN: Add secrets index Chinese translation
>
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  .../zh_CN/security/keys/index.rst             |  22 ++
>  .../zh_CN/security/secrets/index.rst          |  17 ++
>  .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
>  4 files changed, 311 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
>  create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
>  create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

Series applied, thanks.

jon
