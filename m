Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE741C860C
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781310190; cv=none; b=YhK3wOi9DF+xxWxWOPBwz407cWL3opL3fnILfQz2/y9o+l6y6onR3fpsUh1S7SQ9Ftc8nrAsxSlA1tgbr2Ovjf5jBTpebvw1SL4XxkemWqrsb0WiVPC/P7bX+vvaMqOOvMOFVjADzMzbE3uC2GYmVSFfB2gRrBtMQa4cDlqe2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781310190; c=relaxed/simple;
	bh=gGURmQ38JebTziLuKXD+s+29dgdWcr/VmctNb2MC550=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZW8QUYgvzS3/ZpzmXO5YIfIjoK67SNhjUNev/U3NRPYqz0d30wuhWbQ+c9NQ4Ah+/jo2ESz+K/ymVmnH3G5JR04chmXU2XYYwo43bPwRX/Ya/SeVbODbdrQksGS2zN+TowcpyHs61Wr16O3YxuC6OrTHsi6ONHY7cjg+UkkThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9aj3x6F; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9aj3x6F"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1336742714fso2025c88.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310189; x=1781914989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=Z9aj3x6FxQWQYDk0L9alNpfTmM87F1bZcGTcxrggf4DU8hqEdU3qYU9FiMLeYQ/aQr
         y8WjnEQRUQsQWJD2A1Y8r8wmKyTukxziUzun0Rfg+p+o7swMMGSkcpeSgqeJ1NimuD9w
         KHIVXMMx8hh9jfxiOZP/6h94wu/D5bb+gFazYB8eY4s6b8T8Q50AUiD8Ar1rqoF4UfXt
         ZvQ+UKqeBQriXUsq91dc/m+rKzBvvUKy4bRVLXWqKQmxqwb7IO2edi4GG+Fkx+nUCpQ8
         GqSk8q089oJx5GJC1R2eYzrbnX7aguAAhYGVEoGOK/kSbLLl2t5q7LqeKg/CK2p9tj9i
         vthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310189; x=1781914989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQuTjrXkDdFV2QV/Z7GUPJ6mtkFqvtbAqj6efLfB6Xc=;
        b=cAYNxaz9Gys6aACu/r7H3Q7Z7cFZGAv4+kYeHxsSWlnXLFsjaxJHcRw08n7wgIpaHV
         ieY2iHzR9Y5nMwK61iYA7q7L7HBJPHLgK3svp6PGxnBXNfdEFhNBmeQ3HvhBZfaT1KQt
         3wjqL6+XhD+C6c+cr61I+iJ2JK6pF4Ne55W3mTD03UM6TT8aLtzqpzmBqxXVaMbp4Z+u
         gy2NkwQsgsqWN4e/RtzjIjG99hHVDbnOcpxR1V4StnSLn471ISFogYOfTSZYUr+2dvnK
         QpdKpy8WQXL2SoaEI5sXzZhZ2y6GMot5dHC6AAyw9tRTAp9v1ujhHw0IcIj7pzMmRF30
         /MOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IkIN8/Jkp4chjOnM23I9Tg/rb+67U7ORMtxDDWSzGoJR8I4X+Uh19PCO02kRtykW141xgXfPRaf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi24eh1NTXu0jJISw8AUvfw0o4hgG2/SAIjEhi5pz3fsuY/0cx
	zSvbgaWxyCaRJqLTHA/VJO1SyfXYuLKRCvHop6JqW+z71+7Bf7zK8W9k+O17/TLIgw==
X-Gm-Gg: Acq92OEXpbeU4xGYADGmKfWACH3wgmqdxWwXp6880sFuu3g/W8mMi3VgFc1P6BLEDFW
	pf0jcFKnfybqmeSPUSzbqijG/npHqjzdUaSqXiNTkEh1pIiRwYgtsfq94BmjLrXQJXX9ujqTgi0
	c7jMT0DJHwFTxexybHHhXeizT+YJtUaEtVWoi5kYpL64KPgFa1KRG28p4ou1TN9csiZm1Fwhafs
	LSn9UusGYddJmjGZBeGzjDaH/Lf2Clz/cAj2KdFgXAfOrlw5uogbLrMU1ofkihLg60UpWZ4T/lh
	w0+7GxJOwr088mhkTRZSPi05Uq8IOiap/dw35b1/YjBjIYADAd6obMLUSvY2RQoq4wQB7pXkKS9
	PFdbnPY7wzRVbOAn0J5HPyGRMi8UdbTILOi5mxGcaYNETskJXWVWf1OJGEYJPsavIQbDZ88ySkQ
	VVF4+P9hJkuKF/Fi2ixpj61NoQHoeWU1WUUZmXAF/xXNv/cmbWOLtrbdqmozJQJV0H
X-Received: by 2002:a05:7022:98f:b0:136:fcda:bd43 with SMTP id a92af1059eb24-138f3b6d806mr40653c88.5.1781310187835;
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2e51:8:e362:1a25:b90f:e3ee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e489621sm5610188eec.6.2026.06.12.17.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:23:07 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:23:01 -0700
From: Isaac Manjarres <isaacmanjarres@google.com>
To: Dev Jain <dev.jain@arm.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	kaleshsingh@google.com, 21cnbao@gmail.com, david@kernel.org,
	will@kernel.org, catalin.marinas@arm.com
Subject: Re: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free
 time poisoning
Message-ID: <aiyi5flNkNNm0pSR@google.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260612044425.763060-3-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612044425.763060-3-dev.jain@arm.com>

On Fri, Jun 12, 2026 at 04:44:24AM +0000, Dev Jain wrote:
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index fc9169a547662..4fa8abb312faa 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
>  #ifdef CONFIG_KASAN_GENERIC
> @@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
>  
>  static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
> +	if (kasan_tag_only_on_alloc_enabled()) {
> +		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
> +			if (init)
> +				memset((void *)kasan_reset_tag(addr), 0, size);
> +			return;
> +		}
> +	}
> +
> +	value |= 0xF0;
> +

I wonder if it would make more sense to have this as:

if (kasan_tag_only_on_alloc_enabled() && (value == KASAN_SLAB_FREE ||
    value == KASAN_PAGE_FREE)) {
	if (init)
		memset((void *)kasan_reset_tag(addr), 0, size);
	return;
}

That seems a bit clearer to me as to what it is that you're doing, and
also makes it so that you don't have to do any bit manipulation
on the value when you're filling in the redzones.

Thanks,
Isaac
