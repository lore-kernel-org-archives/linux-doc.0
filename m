Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E1215F78
	for <linux-doc@vger.kernel.org>; Tue,  4 Feb 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688285; cv=none; b=MnjKvnxRGMmvmOanyTqMCWLbvbrealWUmAYnJIfJfgJADpoBdVCntvZSly3+4zfEt6Tl+H5mFZTMs5AMfCVw4TRucA7/ZxWwu8sew+8bvY5ZoUAoJxzoeihjARAvpZvoH6b79yZvAwqSTrBjSGCwgZsyStrUKy+3/scJ/VJ5++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688285; c=relaxed/simple;
	bh=5545abMCOQgtdonHH6rImHcdZBZNzb+BASJ6mOcS3c8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c16Me0WUHCFYNI3oP/TnNgzv7PM82L8m4Io7oV65R8w/OmmBgBX+eDQCT+YvdARYuxwijfYUJeyVS23Ss8YigixhH6FCmdmBWbGIJiQd23MhJ334jUmEnAux18nK19WRM/6xHlmCZ0iRQbffW9oF+JCZt2BsOJHqmZM23vzsHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AoOgg+1a; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AoOgg+1a"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5B664404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688283; bh=WxsrZS1ue7OsP/S3ZDMFTJAtEo6b2mBVNnhrTjyB5KU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AoOgg+1akPpBi1zw1DdyeNEnIouXOo4vRwW1k6ULMXkptp4Iu25rp5SilKLvOtdez
	 ILKbnZQjobFVJOiWheZckqLagpDWNqusO6/Zya52hKqmsuY1d1Zcn9LhsZ45vfb9k2
	 7LCS9fXEYMrHABJaIU9uHsCWZp1YuiShlAL2eyu5pa4574VamuUTHbpPmsZ2/sGI7H
	 UT/RwTMDobOm+S9Y/va/onduMRmqjfd/TqGL/aFWBm6xS6HF/OvJpYaShNZKj6nMuc
	 NvFj6yv1QFKcrunhh5keXN/BoO98G9jyZptMBlZXW4W2VZGMQp1c0ZybmLP8IqOLo/
	 j1Yy1EMP+I+Kw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5B664404FA;
	Tue,  4 Feb 2025 16:58:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuxian Mao <maoyuxian@cqsoftware.com.cn>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: zhaoyuehui@cqsoftware.com.cn, zhaoshuo@cqsoftware.com.cn,
 zhangwei@cqsoftware.com.cn, linux-doc@vger.kernel.org, Yuxian Mao
 <maoyuxian@cqsoftware.com.cn>
Subject: Re: [PATCH v4] docs/zh_CN: Add snp-tdx-threat-model index Chinese
 translation
In-Reply-To: <20250124102136.561488-1-maoyuxian@cqsoftware.com.cn>
References: <20250124102136.561488-1-maoyuxian@cqsoftware.com.cn>
Date: Tue, 04 Feb 2025 09:58:02 -0700
Message-ID: <87tt99fy05.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yuxian Mao <maoyuxian@cqsoftware.com.cn> writes:

> Translate .../security/snp-tdx-threat-model.rst into Chinese.
>
> Update the translation through commit "cdae7e8a69c3"
> ("docs/MAINTAINERS: Update my email address")
>
> Signed-off-by: Yuxian Mao <maoyuxian@cqsoftware.com.cn>
> ---
>
> v4:
>
> Translation errors have been fixed
>
> v3:
>
> Message header fixes
>
> v2:
>  
> fix remove the unnecessary blank lines
>
>  .../translations/zh_CN/security/index.rst     |   2 +-
>  .../zh_CN/security/snp-tdx-threat-model.rst   | 209 ++++++++++++++++++
>  2 files changed, 210 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/security/snp-tdx-threat-model.rst

This doesn't apply against docs-next; can you respin it please?

Thanks,

jon
