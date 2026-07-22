Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5366E3F7AB4
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 04:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784693966; cv=none; b=jS9FJDd0DAcoWi9UP5ZVnjiQl7Bea034Q9P9dQbL4dz8pNMOFEHukZvj5lT5KniYMNUQvcQJbtOkAW++XfeGlKKTuAK3ofI6I1NATftEte1bA0hGKVKVAjTPZmxqUNSWxCsi6VUa1wuZtDJ5WASTGR5lvmje9XCIkQFbv3AF4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784693966; c=relaxed/simple;
	bh=9WGq6TOnPFPtzjoCu2km1c5cncgwqgLdUyLgWxRW18g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/60habv6oeLaD50vwhRe4hIy5xUA9tEoqI3DmZuyxkjqj09HI+EkC3KrHVS8vmZtSAUg/46p5TN+E+AKRrbuFAp/Z8QKfb7T/h2mQKTIFt577+Y2HnT9NW313RFZlzplXbiollnbvdguoiKu23baBVMfA/QIrx2SK1DjZlLUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqBUERcg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqBUERcg"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc73e322dbso143897275ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784693962; x=1785298762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZyY1l4SComaripzfwSmuIT5HdbD6ZYoRdYmUR46E5I=;
        b=VqBUERcgpX8TxIONtLmfIGhzX/Csdj655F+RKoVrCPoRiaZFJuwWl+Lzcp6iBnO3MW
         oXnGTOn6FQYcna+Cd0RsjCGGjrV/Kp86RJsJvpUI5uN7SHuVzTXbNqoJJC/OIX0v1Hbq
         tfsBTux3TqRf9Oj1pS+AEZS/p2Nw6bAormdR8nOBRQFNHYI7Mt428TIlWV72CnZjtd4q
         i/3DkRQdR5wywlKIqt4l1fvnzNTCtDYIrBXIfItZqEt/3d70X2ottq6mi2VTiPaxNyXJ
         M5wsefKi7YSCaXb5EbmAD9mTvB6o+Vow0pxzsldeyO8iqKT40nogS8bc+8P68gsEXpX7
         Z9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784693962; x=1785298762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZyY1l4SComaripzfwSmuIT5HdbD6ZYoRdYmUR46E5I=;
        b=VBUWfvu0q2M6wQjPr7OkLLP7WghS6kU3oM1BOLlG3VMWcYv0obUdawhyQFarY29R5R
         OQrbr+fJB9Ixzgp3h8iY0AHF53NM1KYwb5cvVNxJAcLhk3J92UXA99/G9yna/ul6tEZk
         VL6rdezdQvJH48kt2Jueodi/m5sGTPLD3SSLcx+JIE9aLcGQLC0hq2VNv7hnp8mKjk0p
         A3B2kwylDPlqCySAaVZrFtcBeSirZ3fvfm8PnrCmAGdhT4f+2pMdBcEvvlxYpHopoUYi
         +w0+GCuYYtZ4vM038WmGl4DNwS2f/cTrKZayLQG1uoBhowYPAO4A+tXcYtM26EG+4rF1
         i8gw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1zfTlB1xftjWxEj564MTNkRIOztMi6OsDgBik4c3urz36v31HlKFiHM3bz5+JXW185lfCHoSD6HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYv9J8JAVcMjLhLnX6WC8YQMY52D6aQlEBaaosUaleR1SeB8ek
	W1QvXwnI4rY/C9veSRaBLT5NON3gPeumOpZKeayu8GpemRMGZltx3cn4
X-Gm-Gg: AR+sD1060YEzE5D0K7VuKTLnGZf6wBKv1w+ZCZ1D3obgd5Ad3+9GQf/c13v7jnAadM/
	kOcJ4SJ2JD5crhI7JP9/Fwr7aytwSN2IBsPjHn1TFrSN+VBEHlQ1jqnmbjHg52diJUzrxaf2LAg
	rlEF5NozghCUKE1rziFPV2qBBzhp/xsvk+8VIOzC3OFZs20Te55F7RKmL2JaxRhhcbdMef4KkSP
	Ip5oQ58V9USP12lF1gZLyqhZi8Kw4YQoFN9GO5OPl1yVizd43dDB/1Gumx09fiNEb60+/9Gp9Tr
	I8jM6yAN6WgXZ5pTEtrJTD5Lzq8IZHP7J/4mZQaIn1viC2KOfZ/ipkIIQ5MlQBkFHmISlZljoa8
	pvREegvxssrMvBaf4JqfrxfZ3Yn6/kA2HE4oM1Iyn4m3tZWcFjGvh1CMc9j9eI6vwC9g30xBOzh
	RDF4J74wvIXrTx/CWspj6E4n3862lEs0VbPiv/vbk4ndPAbG8=
X-Received: by 2002:a17:903:3d06:b0:2c9:960c:f73b with SMTP id d9443c01a7336-2cf349bb795mr222451375ad.24.1784693962419;
        Tue, 21 Jul 2026 21:19:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2039:4:e1c9:b467:ed38:9c4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa9918sm7044095ad.16.2026.07.21.21.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 21:19:21 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:19:16 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jyun-An Chen <jun930436@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:MIN HEAP" <linux-kernel@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3] Documentation/core-api: min_heap: remove documented
 but unimplemented min_heap_empty()
Message-ID: <amBExAcfF6ORsy11@google.com>
References: <20260721184334.143152-1-jun930436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721184334.143152-1-jun930436@gmail.com>

On Tue, Jul 21, 2026 at 06:43:34PM +0000, Jyun-An Chen wrote:
> min_heap_empty()/min_heap_empty_inline() are documented as part of
> the Min Heap API, but no such functions or macros exist in
> include/linux/min_heap.h or lib/min_heap.c. Remove the stale
> description instead of adding unused API surface.

I think we can drop the last clause "instead of adding unused API
surface". It reads like unnecessary AI generated text.

Regards,
Kuan-Wei

> 
> Signed-off-by: Jyun-An Chen <jun930436@gmail.com>
> Acked-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes since v2:
> - Fixed subject line.
> 
>  Documentation/core-api/min_heap.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
> index 9f57766581df..919dcf1bdec7 100644
> --- a/Documentation/core-api/min_heap.rst
> +++ b/Documentation/core-api/min_heap.rst
> @@ -240,19 +240,6 @@ This macro returns `true` if the heap is full, otherwise `false`.
>  
>  **Inline Version:** min_heap_full_inline(heap)
>  
> -- **min_heap_empty(heap)**: Checks whether the heap is empty.
> -  Complexity: **O(1)**.
> -
> -.. code-block:: c
> -
> -    bool empty = min_heap_empty(heap);
> -
> -- `heap`: A pointer to the min-heap to check.
> -
> -This macro returns `true` if the heap is empty, otherwise `false`.
> -
> -**Inline Version:** min_heap_empty_inline(heap)
> -
>  Example Usage
>  =============
>  
> -- 
> 2.43.0
> 
