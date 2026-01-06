Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1B2AF1D
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 22:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737021; cv=none; b=i0CPMK+2dTg0NB4iYM2vFW5pI64yI0rJteVeg/h8UlK3PkmuqOKuL97qEU+uHY3xg6qQ9UMZ6lIv/E9lp7xVDMDBDQ6/7Cpko5lUi7+i1T35CV3TB++rrWSSN/yHEiIIZ+GHNR1np/W0tvniNftqZil8unEU7hChqVycmgrg9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737021; c=relaxed/simple;
	bh=uBlZ4mlt0fnUuGvob6YnvTchiUgtu8SV1xUfZpw/lw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E5xJ76C5AqQjjHNCaVICZghNurN3yiCZZciodK79a3gl76WDMe/7l5NNtJcdqhkZs1T3CdcArAoXhYh3efy5ZlAQQ5Kir//8mMNjQpJzu6Jbvn9B0wMZ9bkJtbZ+UNi+KVRpd7SDSmih7sO66HnyyyaEZqS7ewZw51NqibOQoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UOvjcusg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UOvjcusg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1A82740C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767737019; bh=+FWUVDj4/FqymaJ8Eet2w6TQ+roL7Rxd10hRZSTghBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UOvjcusgtak4MJT14tBpWTVN0LoaDnm0uox+FWdUAIlBDUe9TbrN2BvGRYMsZdOsx
	 XIkhXdEQk6GnqvBKpsmlW2eZcYL+Mkt6qAzmZJjgK8PkYL0+oLyyw1/X/lIliqya4E
	 yqPSJD3tigX6v2ayu0k10Baasfb5rBjfTk23r+urrLWW1VwUs586rhSqozF2z9eyC6
	 pejm4Y6hNp5uKSGKmYgL28/5zHAoNwuUjVycmiT30s/Fue75cjQDO9unUHFVCyPrM3
	 epurD1C6Xaa/VACtep/iN/bRKy615hE4HmPuSHONwBkMUvWw/LXMUtMFKw1H9v/WRA
	 /p6P3A26b7ZTg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1A82740C7D;
	Tue,  6 Jan 2026 22:03:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH] docs: keystone: fix typo in knav-qmss documentation
In-Reply-To: <20251223112946.2580519-1-weibu@redadmin.org>
References: <20251223112946.2580519-1-weibu@redadmin.org>
Date: Tue, 06 Jan 2026 15:03:38 -0700
Message-ID: <87a4yqcsat.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/arch/arm/keystone/knav-qmss.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/arch/arm/keystone/knav-qmss.rst b/Documentation/arch/arm/keystone/knav-qmss.rst
> index 7f7638d80b42..f9a77eb462b2 100644
> --- a/Documentation/arch/arm/keystone/knav-qmss.rst
> +++ b/Documentation/arch/arm/keystone/knav-qmss.rst
> @@ -39,7 +39,7 @@ CPPI/QMSS Low Level Driver document (docs/CPPI_QMSS_LLD_SDS.pdf) at
>  
>  	git://git.ti.com/keystone-rtos/qmss-lld.git
>  
> -k2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin firmware supports upto 48 accumulator
> +k2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin firmware supports up to 48 accumulator
>  channels. This firmware is available under ti-keystone folder of

Applied, thanks.

jon
