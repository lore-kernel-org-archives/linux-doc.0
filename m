Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="IC7T0Djf"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC59CE6
	for <linux-doc@vger.kernel.org>; Fri, 17 Nov 2023 07:52:32 -0800 (PST)
Received: from localhost (unknown [75.104.68.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 95EB644A;
	Fri, 17 Nov 2023 15:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 95EB644A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700236352; bh=f5f7qZ888nv6RUgDnnDH5JYXJ4dojwp+DFeQyGhkCrQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=IC7T0Djf8jBf9OPY3kg8xjKw0vEXNdF6k9rTmSk8730hpkfwV8aDJ0r6qERPJeOQt
	 LYwuDeNief0tHynZr0Sz54bBKfHw27z8fuJFHq9Vf+jwcaBo9aO6kjMmLqaSiUhmru
	 ajbxAzLrbNj5BSReCxed9Q0Wrtip0omOmBZQgq9ueDjIsbJqeW4u9cEbLHNxBykzNH
	 Wy6QkUnmqaDjLuumNISr/VNYXZgt+gRhhgVLwyEhCOEM69bUnVtXnLzwp7CQkmMMcf
	 FwamzohKbFqreBgeA8v15DXPfUDP950G1S0mN5mBKUnJ5Pk9UUZ6B/wzS7F4yAj8Xl
	 dGjaPUuIJgRMQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 linux-doc@vger.kernel.org, Brian Johannesmeyer <bjohannesmeyer@gmail.com>
Subject: Re: [PATCH] docs: dma-api: Fix description of the sync_sg API
In-Reply-To: <20231103162120.3474026-1-bjohannesmeyer@gmail.com>
References: <20231103162120.3474026-1-bjohannesmeyer@gmail.com>
Date: Fri, 17 Nov 2023 08:52:24 -0700
Message-ID: <87a5rcxtqf.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Brian Johannesmeyer <bjohannesmeyer@gmail.com> writes:

> Fix the description of the parameters to dma_sync_sg*. They should be the
> same as the parameters to dma_map_sg(), not dma_map_single().
>
> Signed-off-by: Brian Johannesmeyer <bjohannesmeyer@gmail.com>
> ---
>  Documentation/core-api/dma-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 829f20a193ca..8e3cce3d0a23 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -448,7 +448,7 @@ DMA address entries returned.
>  
>  Synchronise a single contiguous or scatter/gather mapping for the CPU
>  and device. With the sync_sg API, all the parameters must be the same
> -as those passed into the single mapping API. With the sync_single API,
> +as those passed into the sg mapping API. With the sync_single API,
>  you can use dma_handle and size parameters that aren't identical to

Applied, thanks.

jon
