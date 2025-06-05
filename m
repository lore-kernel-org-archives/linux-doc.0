Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B85680
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 03:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095824; cv=none; b=hp1XFjerLspRRYrlfOOfbSOSYcDUxwFcJwurV4a6men4pcdh92Bm9KKiblC1+ut3Huv07A7hdBG8gFUgOHj/hTK2BBgJHrWsyhxA7vJxnJP8OJfKBzMSmrS48YxSLGrC8rzPaKNL5yvgkB34iUL/shoSqpxCn6Chovs37hrFMrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095824; c=relaxed/simple;
	bh=XZ8vXyZ5075j4urOLb/8dWXKE8CJVX9ReP2U92rpGB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzKSsP3dPds1uNBhztlZRRtEVWns+/m/J5RJoYo5BY7g4h4kVNZR/LpGoDodgBx4u7uTu+ldJEA+sgCO2CIxDv43f9zf/Xmx//m/viePjAHiDT8VuMlKk6PiIr334NrUEKNwnF+YNyMi+b7W7Zd6o37sRWqDj5xRplIHjmB4S/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NqsHUNNe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NqsHUNNe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+eE9lh4Gz2x0u5E2C43WEJuwX9Fcj7TOD9BONJLyB58=; b=NqsHUNNeGhOQZwYaGXMtokFnDX
	2levCIgd4VC4JqOgeRNxVbsgUBWt9cp8JNx8ARY0i2RapaWd+NI6rVL1ekMJWPuEhh0m3W+UNWoaY
	BXI4ugJJR6S4M8Zv+rxd9EnnwHbTahQ6hBpHiVWlOXAjT+u//gl9BVo+61+Y1AxCgDrK113ICdFgN
	o9yZt+nNshNneEjgfgZknDsLzzsd9wmy+0IREfKD9USpCHDeLaaYkHu03o1jkixrwgqWuLF/dYj3M
	u601PWiv7+jjk2OU0aJ0RcDzEV9BLBHF911OVeG/WYtulhb7Z4649uXIUCGq9/RvOYFLkoaYEu3V4
	POCK1BAA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1ip-000000013YI-2tQX;
	Thu, 05 Jun 2025 03:56:55 +0000
Message-ID: <76de355e-411a-4aeb-b4f0-8cef4c387e4b@infradead.org>
Date: Wed, 4 Jun 2025 20:56:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Include scatterlist APIs in htmldocs
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, James.Bottomley@HansenPartnership.com
References: <20250604195753.823742-1-willy@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250604195753.823742-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/25 12:57 PM, Matthew Wilcox (Oracle) wrote:
> We have all this fine kernel-doc written, and it's not published
> anywhere.  Expose it to public view.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>


Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/dma-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 2ad08517e626..190ed8fe55ba 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -915,3 +915,9 @@ the driver. When driver does unmap, debug_dma_unmap() checks the flag and if
>  this flag is still set, prints warning message that includes call trace that
>  leads up to the unmap. This interface can be called from dma_mapping_error()
>  routines to enable DMA mapping error check debugging.
> +
> +Functions and structures
> +========================
> +
> +.. kernel-doc:: include/linux/scatterlist.h
> +.. kernel-doc:: lib/scatterlist.c

-- 
~Randy
