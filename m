Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E39CD299
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739726671; cv=none; b=AZt0wzjVDwjgzTu13nxUxIEdlV4HzQT3ORmOO8JvfSVyuCU64kBoouZmrG7UGNFY04qLYG9LI3srS/ZCUSu9yqYUSySSxVKKCdbM/s/I3eHR/DE/+CYNlXzONq7Z4vg1UA14OlnhQYEgBQVaCZybvrozpKtBWn/acxgcAomZYbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739726671; c=relaxed/simple;
	bh=ePIIWpSFZpScHCeFlHjOKZfF2NTU7f2qBx33D30B87U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o2QbOdc6PDLOONZhRpPZT2kk6F/V1YHlZwcFNuN8/V/qANcswquoofG1evnsWPbDQ7xsL6BpdpddxHs3c4sj6+wizXsNgYCbpsujC/vJMZLvosL6V1woB2feJqbIgiCjsHG53Qqmu0GLnxNcYHUZvP7+uu4OT45lrheBjJaE5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VN6Jd/4u; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VN6Jd/4u"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32A7548EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739726669; bh=rrvdMnsxaYwdh9JrKguQYHWCRZaeywGMIDje4hDj3u8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VN6Jd/4uHky14g4AuTLHDIGuloR6c4Q4vArpM6wXx9EZhCOuxbZrqcS3Wyolu2gQ+
	 L0WjcApjE+PD8n0co6DkTr2CBNaWmJjv3XbSyYhd9eCXzpdnS1BLUsyDIuwRGhGrBZ
	 L98tQ2rj6YWZJ+f5VmJX3x+sZq2jfm5NqmkWX5ZIXFpJBK4V50efPouBLLD+LYEica
	 FR82eRCum9M11ABr1aSyEawcU0BIXqtLHvfUcfzPPFw1kv10rV/UjqLg6hxK4+9vzd
	 rQ9trw7WjN0Po6TcNoXN+rOdbDTPoML5looFpaFyzPp8D66oNzz5TP89aBrOhgPOoa
	 CPICEhXWVVl4w==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 32A7548EB3;
	Sun, 16 Feb 2025 17:24:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andres Urian Florez <andres.emb.sys@gmail.com>
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation:gpu: fixed spelling mistake
In-Reply-To: <20250216160644.18924-1-andres.emb.sys@gmail.com>
References: <20250216160644.18924-1-andres.emb.sys@gmail.com>
Date: Sun, 16 Feb 2025 10:24:28 -0700
Message-ID: <874j0tvm43.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andres Urian Florez <andres.emb.sys@gmail.com> writes:

> Fixed spelling mistake identified by codespell in the drm-uapi
> documentation
>
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..64e002c6383c 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -518,7 +518,7 @@ ENOSPC:
>  EPERM/EACCES:
>          Returned for an operation that is valid, but needs more privileges.
>          E.g. root-only or much more common, DRM master-only operations return
> -        this when called by unpriviledged clients. There's no clear
> +        this when called by unprivileged clients. There's no clear
>          difference between EACCES and EPERM.

This is a fine patch, but it should really have been copied to the DRM
maintainers; I think scripts/get_maintainer.pl should have told you
that?

Thanks,

jon
