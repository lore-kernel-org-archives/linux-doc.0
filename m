Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608591;
	b=0c7gBzgbAqez4AFwTFOxooV6S37BFKijrx7TO8NI2u4VL1Sw8jldg1XEGiqywV7h41nH
	 SrLMqZZA6QhdLd+c4BMpJc5Ov3EZB6MUHTdUF+AX/TYBSEWGfuXQpwxeH2zooR3vXpB9r
	 p9cONrDRo7yxR9Qf/864G/Sfp4srKtJyxjMhVjDGxUMxPe+EBaBYccBroC8wIsw6nzeIf
	 JnZPGS+dh4kho0oa1wa0enDEmhdeEekqBjwxmwg0Agf+zpvBrmedlLJzEEbBWglymY25Z
	 dR01Uy2Nir9F7bS5OyFRUh16DPgVJvHXRQMJq5xMh6Hq0D2mfrocCL3IW5dazt3Z4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
	b=3mi41Xgb/nWAFqzWCKtEc6GuDXXjQLdds474b10r0ERmaQBDg6bKPVV6FFze/w+v7Bx3
	 OR+Ts3fUzhtG9jPFmUYNPXa/qXASyudiBKpzp1Y2/9wdp3oF9jKBq/5UwlUDNPrzBLa9q
	 xCyOHg95VapkDlwIoLMxFvj++GG1E/U/QVve1ttR+/j3jTAza/o3cA2Zb/NSx2Nyu0YsT
	 4x5icCseEdN8XIqTD1GLhJrXR8VpDLUVVEViSMbAwd7momb+ZCI8xaExqBrQV8sib28VU
	 yk+W7LxM2RnZ+3RzqV76MGmjGKIj1YKM2z1X8c92lbG296BpS+DIr2v1CSmTiuZ0wFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TOU/u0fl";
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F94606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOU/u0fl
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b30ff12f84so11734237b3.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608590; x=1795213390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
        b=TOU/u0fld60SXTMHQ8NJNR5E7iMK1H95CJMxqo3iI4aprrgzcUP9gzLuxwA839Zlb8
         SnXgHFBe0O5yJK6BWvYLu+1b5fpJAeWsRRorF9kWJp8+lXeGbAlj0ZZZZgz3ye3WfXMe
         IujJVBgb81C7nuLpgUW93wSAwqHzFQZjtrDUOoOCcQvL8OmF2BlLJi15jntGcjClFYkk
         4+1gNU8AgTdsKhgQ7ZlnPWHha/SQGa0paOyTaRWexyyr0+FkHaBNQfcLRAh4fu071kSX
         lqoZAm58/sYDhsYjJB5aBzIIMYjkLR0rtXlHTlFROsZGfG1a8hzeU2ZuNmqdj3z3x9rn
         hKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608590; x=1795213390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lt2oCclDDD+rP94lJg6vk9k+uikGlXnAQ4GsrH0NNrs=;
        b=Lc/7jJamV9HCrR1PR4eyi41fAjPZry2r7xdIEYxdBLV3X3dxlxz23m9Z8e32dhWDI8
         dtTuKUDgWNMylGHTLu8oqHvjjfOCLqPtbB3hV3ihclb+Ebv/W0JOfjzrA7/bxuJXe/de
         lJeaDZDg7psu+/upS7YY0tf7tiUIBK6pOl0G2mHTJz5uYeKGt7S9iWUPEgYL2TqOYrXg
         gbbQ/qHjxnDG7wAQceKqAYIxb8i4nZRlTEoT+xc6/rgiMAE0YHHyu90jJuf7Rck6Ryr/
         HzrPnHRMtGKNKNMq3bIgq5TOydfbW38MMrkSA8cD/Hq/I4n0Md8O/LvyvIWvMUrvxA4a
         j9Gw==
X-Forwarded-Encrypted: i=1; AL+hErH1nFlwrOMYcEYsNje/N2NrnHttb4/Xg3Lty1wzZZIEJ/ESwMpR0Tkv5nMGUtw90eAmDAyNSMp2yuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mw5G326QKgrcCa0PXj7GXc8HMr1KvdiApDTCE3ImvDC/G+3FL
	pGIQA4SbWaF0WD2iNrzNHVfcirgkK6WAu21N17+KumAZtYX2kJZ/e6QP
X-Gm-Gg: AYBFou2cLldtHWcP7rYgTrNK4R/kbuvUuM5D//MApWkflaYtLT3TuEHS7NRb4KCjszv
	Bcm2SL0TjXSlrg0q0vIS1SxGe8WdepTieSn1KBmHNAibRuf8wTpFa3K0JIwvX+nPLgxGpKu5o5g
	refIiyhSk1aXmWeGPjBgP6aFfH/J/aeWbGUgQivSj6QTKHLoRDOrCnayfOlF7ZjMTm46nAJMdTx
	ZrzG7nvRzAHZJWxPFaCnOfEups6dylG7zMJ9Xphp0BO02cdcSrIeuML07j26+MKWilIVeeBgPqr
	8y+NvL+bUJavNrt1MZMO0vTRqioj5YULDJxoTy0Ff0dl9pv3lnn1fHx0N6hZnFghCKXFRW7aeVy
	+c0kl0Fs4ema4OsOyDNVLTo0fAV1J0c2TeekzVrpnHm3fE9lw+serFVgG0tueRXcZYkC1mYkxTr
	Xjipwis+IFLxpF5BhUy6bG1tB+H6OniGkMvDHEkTCuSoVcTPJSzSmeTvk5OJJH8jJXfigT9xc2o
	6PpNxIzRSYez0EgtYb7G3y4XD00zsmgBW9/WtxiBOHDzG19zEMsXBCO2ndYYb0L+VSTCj5amka8
	ZExjMFJJkfzK8B8zXKv9EoKzMNFiUthWYdHTCBnTjHWQZ1rjVL8HuOOdlyVpyL8TAhGL6mnmDxF
	LoWbAiaM=
X-Received: by 2002:a05:690c:89:b0:8b1:233d:7054 with SMTP id 00721157ae682-8b4aa2f48ffmr31548167b3.32.1794608589587;
        Fri, 13 Nov 2026 14:23:09 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7eeaf9sm31201657b3.4.2026.11.13.14.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:23:09 -0800 (PST)
Date: Fri, 13 Nov 2026 14:23:08 -0800
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
	Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mempolicy: merge adjacent shared policy ranges
Message-ID: <aveNgfkmfZ2SMWK8@devbig011.atn3.facebook.com>
Mail-Followup-To: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, Rakie Kim <rakie.kim@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-mempolicy_limit-v1-1-16688b2644dc@kernel.org>

On Fri, Nov 13, 2026 at 10:36:12PM +0100, David Hildenbrand (Arm) wrote:
> Shared policies can retain separate tree nodes for adjacent ranges with
> identical policies. This can create unnecessary policy ranges especially
> when individual VMAs cover individual file ranges, and user space sets
> the policy on these VMAs independently.
> 
> Extend the existing replacement handling to merge ranges with equal policy
> at either boundary. The existing replacement loop will then remove the old
> nodes and installs a single node for the combined range. This also avoids
> splitting an existing node when setting the same policy on a subrange.
> 
> Extending either boundary rules out splitting an existing node, so the
> allocation retry can only occur with the originally requested range.

Hi David,

Independent of 2/2 I think this is a really great change. Thank you!
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

> This change will make it easier to cap the number of shared policy
> ranges per inode.
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  mm/mempolicy.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 06b90903e8794..183bc3bd077cd 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3208,6 +3208,23 @@ static int shared_policy_replace(struct shared_policy *sp, pgoff_t start,
>  
>  restart:
>  	write_lock(&sp->lock);
> +	if (new) {
> +		/* Try to merge ranges with same policies. */
> +		if (start) {
> +			n = sp_lookup(sp, start - 1, start);
> +			if (n && mpol_equal(n->policy, new->policy)) {
> +				new->start = n->start;
> +				start = new->start;
> +			}
> +		}
> +		if (end != ULONG_MAX) {
> +			n = sp_lookup(sp, end, end + 1);
> +			if (n && mpol_equal(n->policy, new->policy)) {
> +				new->end = n->end;
> +				end = new->end;
> +			}
> +		}
> +	}
>  	n = sp_lookup(sp, start, end);
>  	/* Take care of old policies in the same range. */
>  	while (n && n->start < end) {
> 
> -- 
> 2.43.0
> 
