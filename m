Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eaN8Bjvs"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7E0E6;
	Fri, 17 Nov 2023 07:46:21 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6D0FB44A;
	Fri, 17 Nov 2023 15:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6D0FB44A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700235981; bh=O1HNmTz74/i/CDhc4bMNDJhTRxxWriZphNJ0xGOxKxs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eaN8Bjvsy7drsAXLFnxl3BNESupJlCLW3wDCmzW/WDdkEYBxLFxlo7QmvneVjNZTd
	 aZznGmZOkI3hZkWaq1dwEgmj0w926h2pOdO/QOrRz0ftangO25v7IgoE5Ma6mIUP+o
	 t5Qqb1lsE/eInkcYifRZCCxyvX+9qwe/L6QWerevV2uAsUJUWgiR3shX3t4BULO26p
	 ogNyzRkcTmKoOLpQZsr8dddUKv+RhWxETz1uoeh4nlHLd9XeIRoSfaD8OGSBfchS+X
	 iei33ymNZdUJo6T1yZfVA9Kzdx9iy0VX8Hfcg5o8TSHNhv96Kz/x7Svfabz2insiHR
	 Li5ooAxHK1NuQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Li Zhijian <lizhijian@fujitsu.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH] docs: dma: update a reference to a moved document
In-Reply-To: <20231101070201.4066998-1-lizhijian@fujitsu.com>
References: <20231101070201.4066998-1-lizhijian@fujitsu.com>
Date: Fri, 17 Nov 2023 08:46:13 -0700
Message-ID: <87edgoxu0q.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Li Zhijian <lizhijian@fujitsu.com> writes:

> Documentation/DMA-API.txt has moved to Documentation/core-api/dma-api.rst
>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>  Documentation/core-api/dma-api-howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/dma-api-howto.rst b/Documentation/core-api/dma-api-howto.rst
> index 72f6cdb6be1c..e8a55f9d61db 100644
> --- a/Documentation/core-api/dma-api-howto.rst
> +++ b/Documentation/core-api/dma-api-howto.rst
> @@ -8,7 +8,7 @@ Dynamic DMA mapping Guide
>  
>  This is a guide to device driver writers on how to use the DMA API
>  with example pseudo-code.  For a concise description of the API, see
> -DMA-API.txt.
> +Documentation/core-api/dma-api.rst.

Applied, thanks.

jon
