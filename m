Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E92F43
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451154; cv=none; b=I78Ln2nxMnoeq+kEsmj4aToUrRyon5Ywyji24VMRuzyngmbA3vdRUMjzWK8cbGNVVfRB32XES33X8UItnXSYIEDJwc7MmmanMuvzId9U6HqkpuqoyzBWYalw0V5bipkK0hSSlklfuxg99mC1ycD/1ucGQZya1ww5Mv1mL/NG0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451154; c=relaxed/simple;
	bh=nghkOl1K190HiJFBbm0WL+3KEGEYlGjXnSMo3hpTvDA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tPqm2txcM6KnVak4tDCUJG0KXivz62elOn1oFhVmQ8ofvoeVmlyhdhtbCkIiGc/vrUkXmKtcRGaou7rELF2QLi6T79d275oufh16naW4yBhFH5KXI/RjYW61aUbfio1QecazP8QsK8PX1N2cixPCQ9G95eHmKyDb3XphfMWEEUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OkSYpHBC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OkSYpHBC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6D398404F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736451152; bh=I6lPwd/8Lu6toVWaVDDHyv4GVQgWDWFQdVFrweor3a8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OkSYpHBCr+syoCYqLw7QIb8Kmj/s535Hjb/utq2ry7r3WGag7THCzFQ2V0raor6yk
	 cAfBidW+w5Q+hzha0mppzemsyOwIIKVUO4n77idAWIMNdiIjfu2H7WkdfThZeCu4iX
	 jOJTLOsaMbI39c+AAaJ2PavwyPvMwhK78pYy876acy4eSEVKVS7KwIA/c+XkezzvHp
	 w5us5rl8EFxuMk0aFsT9nA5P1CI8nq5fr7fpSNlxJ2JrUwuyUeQG6pS3p9/0kL0cS2
	 ooYjISwWeS22tyIfSny8/rX5A1OFIHFanMVotWcuQTCImawD1roxlgd3ryM2Wda5nG
	 E405rkgvt0j9A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6D398404F0;
	Thu,  9 Jan 2025 19:32:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org, Yuxian Mao
 <maoyuxian@cqsoftware.com.cn>
Subject: Re: [PATCH v3] docs/zh_CN: Add landlock index Chinese translation
In-Reply-To: <877c73n82e.fsf@trenco.lwn.net>
References: <20250108071142.3538-1-maoyuxian@cqsoftware.com.cn>
 <877c73n82e.fsf@trenco.lwn.net>
Date: Thu, 09 Jan 2025 12:32:31 -0700
Message-ID: <87cygvlr5c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Yuxian Mao <maoyuxian@cqsoftware.com.cn> writes:
>
>> Translate lwn/Documentation/security/landlock.rst into Chinese.
>>
>> Update the translation through commit dad2f2071516
>> ("landlock: Fix grammar issues in documentation")
>>
>> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
>> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
>> ---
>>
>> v3:
>>
>> change the email address of Yanteng Si
>>
>> v2:
>>
>> complete the commit tag 
>>
>>  .../translations/zh_CN/security/index.rst     |   2 +-
>>  .../translations/zh_CN/security/landlock.rst  | 123 ++++++++++++++++++
>>  2 files changed, 124 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/translations/zh_CN/security/landlock.rst
>
> This patch, too, does not apply; please base it on docs-next and resend.

Version 2 of this patch did apply, so I have taken that and applied the
Reviewed-by fix in v3 by hand.

Thanks,

jon
