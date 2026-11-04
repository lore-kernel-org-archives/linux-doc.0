Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799738;
	b=jhN6zW0iSO+/pOQ8l7KkUFu66km5zywMWjxjBGmDaEYxLL2ChWpuN3A5w1qVlUpwDce1
	 ygZnPLQoeL7rb/597ssXgb2YlmogMpESWJeYZ+melalJLqHFFkJQAdFWtodzCtDsNuRz7
	 zTEJL4UERrNw8JUSsUoSRUxjewL7L2PteX+RNusvy6WhuVMMvcmMlLupwjLdJBa/+7d4U
	 i6mtIZwtlerQg21OGXwoqL9mdb7jZNllKoYXHXu8iOHOOnTc07Lh6oLRHDdiqoRgOIZLc
	 jJwojTdIgQTYlgHakqTgj5E/3ZVUbtvkedU7DpX4A722srmsRHrYm18TNUnzDaMLhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799738;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=7A6EzrmD/6cLs5gAPRszzGcnzuhra3AG0PLg82V945o=;
	b=n9C7+dwsqxDFd35fTpZirK94GlN0SbPEc4bqtciga4NT2juGMvvqWPzYthcWgfLGwDyx
	 4ogxBm0BlNL/hTXhTvJ6MvEbOz+xg/fNp4kkoMsS7nEg5vuhmCOwXXIDOzza6dsHwZCHo
	 hQ7WMszM2bgMid+9VOV5sYmrc+Z5qPRYj63TtPOtiKf+LOtBfGj6+XVT0C5eK/MYgf/Z4
	 wHZhoaNx7ORtGfBVN0jU3q0sCkTmi619KrS1XUdpcSkl/h3KIL9AYoSSmvqr4emYN+6bQ
	 D2s6kt4iaoKYcbX6BOJFzQR3Aq4rt7v08vesAR4dfEmNBp5BWS9tOXrbKrlChsZNsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="vYs/eRYe";
	arc=none smtp.remote-ip=95.215.58.144
Received: from mta1.migadu.com (out-144.mta1.migadu.com [95.215.58.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE1606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 13:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFE1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=vYs/eRYe
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DqIybH6UEWiAwWj9+XITZFNv0qfSjLYASB0w2MeWhvw=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793799734; v=1; x=1794404534;
 b=vYs/eRYe9o3Tqmb+rM59Sx1h9DAEvLYvn69TncnRlsTv2bSVHUIP98wrvSPPyc/yiDebyeTV
 gYMZBhNtuc4nxh3wuaAGoRn4tMUlgNfq9uXuErr3J4od/vEwx6CNLe3+C1fS+FsEQkwtQI0OgWO
 atJUigbJ0j/+nzQ99mx8v1V3175oVHwxyKxptedg7chCAwAvwznUPVq9JntSgq8fdaoNqVZkn8O
 HjhT7YV3MsFazPkRQZ1hQZi7MlNqoKSTImjy/SFUqJUHyiGfKElmYx3D4BrejFtvYkaYDu8gGEA
 Knj+Y3xiS0RDfpPTA4GpqfrdQ/VmFkWRzU9riNpZvYJ1A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d539b880dcd73fa;
	Wed, 04 Nov 2026 13:42:14 +0000
X-Mizu-Trace-ID: 1d539b880dcd73fa
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 21:42:05 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: =?iso-8859-1?Q?R=E9nich_Bon_=B4Ciri=B4c?= <renich@evalinux.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: fix stale :Original: reference in
 xfrm_proc.rst
Message-ID: <aus2LTFjmZaZPomM@wyuan.org>
References: <20260920073144.546566-1-renich@evalinux.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260920073144.546566-1-renich@evalinux.com>

On Sun, Sep 20, 2026 at 01:31:44AM -0600, Rénich Bon ´Ciri´c wrote:
> Commit 03e23b18c720 ("net: Move XFRM documentation into its own
> subdirectory") relocated Documentation/networking/xfrm_proc.rst to
> Documentation/networking/xfrm/xfrm_proc.rst.
> 
> The Simplified Chinese translation was not updated accordingly,
> leaving its :Original: tag pointing to a nonexistent file and causing
> tools/docs/documentation-file-ref-check to report an invalid reference.
> 
> Update the :Original: path to point to the new location.
> 
> Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
> Signed-off-by: Rénich Bon ´Ciri´c <renich@evalinux.com>
> ---
>  Documentation/translations/zh_CN/networking/xfrm_proc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> index a2ae86c44707..6990f8e2fdb4 100644
> --- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> +++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> @@ -2,7 +2,7 @@
>  
>  .. include:: ../disclaimer-zh_CN.rst
>  
> -:Original: Documentation/networking/xfrm_proc.rst
> +:Original: Documentation/networking/xfrm/xfrm_proc.rst

I simply checked it and the patch itself seems to be fine.

But I guess the better solution is to sync the path of Chinese
translation file?

Sorry for the delay and thanks.


