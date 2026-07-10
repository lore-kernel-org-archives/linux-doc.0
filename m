Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82A34BA42;
	Fri, 10 Jul 2026 19:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710458; cv=none; b=Ko5EiWP8LB3WxPBE3UMOUu0NYIke2swwysQYXP90QT1vWTO71ZU8LQea2Gw8FUH8jo6LU8Yq7YxHCj/Br+DpU12hrUsMWPDZpCmQL9jpkdFFfIDsjQofKwpQaQogCgQsZuIPL1d2igrEP7oewqeOROcYkWnZsKdF2qBMbWLhSYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710458; c=relaxed/simple;
	bh=eVzl3ZKzOmwMgYUy4vaRUwOPxQoy1+4R3QbEUI1c+mw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jOgI21RsIQpJHialDryGo8qZnQ/GUzwIkhgEPWPD4HaRz9mOrH9x7sqs/IwrEWecLgZh/q4sFhcfWAqLVKFDheh31XsO2R/Rcz4OwXaf/FdKYPnJAhEq+elVSaGuEKu8GFbtu8nwimqvRl2HCzrXchoKXAVu/1RHITfodlfi4SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Yu+Xa2O8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Yu+Xa2O8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E2154108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710456; bh=DKAYXLbvcdS/nh/N0UtEn9RkpPQVxQ83fkRjJXpZedU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yu+Xa2O8GVdCgtW7Ra41DnenwKG/fQ22Q7cqt3mzOV43auwNS4BsJi1jhS1BQPmZh
	 QZicCcIxq0vFEgl8ARCbB6pDf4RnRsfa39SEd3+DaZpRp3irmxZS90UddJDpHUHtZH
	 CWdur9P429Mn1d3Fhuh7+KDN2eurGCVikQlXEuw/9mXqdBr0ZHTSR0bFq+1g1qUaWn
	 EGIlxW4P9EpGR9Z+u6vAL8qsdtPnv4wS1lUjOkR1wlE9lVoxeT/G7M1iwMByQamAHn
	 OOv7ExJ/CQlb3RQODR3mmXf0OFVArHkm0uKiWlJSdR2l7cXYhbrkOYA9/6bNEJg1BO
	 ia4LLJJB+HbqQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6E2154108A;
	Fri, 10 Jul 2026 19:07:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dma-api: remove needless bracket
In-Reply-To: <20260708194821.357548-2-manuelebner@mailbox.org>
References: <20260708194821.357548-2-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:07:35 -0600
Message-ID: <87pl0ull3c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> Remove single ')'.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/dma-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index ca75b3541679..ba23a472f794 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -508,7 +508,7 @@ call to dma_iova_try_alloc.  This can be useful in the unmap path.
>  
>  Is used to link ranges to the IOVA previously allocated.  The start of all
>  but the first call to dma_iova_link for a given state must be aligned
> -to the DMA merge boundary returned by ``dma_get_merge_boundary())``, and
> +to the DMA merge boundary returned by ``dma_get_merge_boundary()``, and
>  the size of all but the last range must be aligned to the DMA merge boundary

Applied, thanks.

jon
