Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F112A144
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 18:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711565400; cv=none; b=B/2K+HTKI0QovLzV5YBhDrxjdRrDavGbGG8fE5AUIlb/QITw5XGMhG90hs0uuJSdLNpKdkxrAORRnlO0N3UwT7gtygxaQqckCsnhWp/IHZfxSO6KsxmZA9Ewjve5S6N+oVHT1y+P+mATzdX65b2NFxaJT8iEq061mnxyQbicpuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711565400; c=relaxed/simple;
	bh=Mq5MyKrI1n5gzjykszF4YYzsRORKlxc5smD/C0xRtzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS4TCWQLUnJglRmZrKYir4B1GY0+P5hA8DNVeop98IvcMuTJOdOsI9GP/XRFbZk0sD6x2z6vtphRlFbL1bPzqtd4kuoZfaOl9uz5YwhrVb12D/Myd9lfiQoEKfyz58+LjifS6AGSclMZwqo5oK4+wxI5bjiMxEyCLkTLuX7MALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8o24K4i; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8o24K4i"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6b5432439so203152b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711565398; x=1712170198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h5t/AmTRdXvWmy+O2VC1lIN3rPn/dmvYiRzipUa/pgM=;
        b=L8o24K4ifnx/F+ZOaUNlfxMpuiNQuBCnIz5ca4sDo7fEqmkfMh31V8imHVQL7l6yMl
         KItOqRs3oOOjwBfZXU019IoGU77kEptX+jKLUNgxaTpjoZhoQb9EUxpTUaSb64rl+u1V
         1ZLuCKfjJlg7cdM8ik0WADeaZNHIurERfEWGrT7mZeuqOVkRAyzHPbZCWvq/W4H0fY1P
         UHrA/ESRN/NAlkIkcN8iggrcKX2jbGIX0dFA1SDehSufEwj4aDVGiOQTsaGg4pjq76/O
         WnRtJETiB+1+K63x82wX1h7GwimVaL8Ql/mfbwIXHesBoMyAmoFcenPo3hWCpMzBYek/
         +3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711565398; x=1712170198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5t/AmTRdXvWmy+O2VC1lIN3rPn/dmvYiRzipUa/pgM=;
        b=ajh6za7TXdy0irhV2AMN1bJt/PltisRLAGGNodin/i3DCtj0i08jHX89sB0KZP69e6
         ReT+dr9nqpG2JZiUG++gdN6FyU0pZ8KObfWD6Dur9DbH2v4asyp0BW9Uq+9AM3geVV98
         XxjI/n9VcEY6aWU9bJWvx4cCb5DBfcZA3YGJOHi2tyWtl8V1xeYvqmKPIDGBhWvH76yJ
         H5SSV9uKQfas6jD2aAQ2NM7XgLjvuzb1P1AUEQxqSsqd5K67fINen1ORs9VWLEeqdGzX
         ah2RjSR19d0XU9Kwvmqm5M7zEpsSBwv2+m0cU78PCj63Y7H4XEp+9z6fIvfSLOJUm5J+
         43lw==
X-Forwarded-Encrypted: i=1; AJvYcCV8jKDQGMwbq3fGYrjD8Jaf4nrY3VDMWaOvrGLsxENoTBIuVRFwdsbFCO8SCo44NcikBrMj5hz8Ie5R6HCEohFMsqY7+v1fi2hj
X-Gm-Message-State: AOJu0Yyi8l3XPHWgg6lEGtlcTlJ9Bljn2oVMirl0MOEMukybXsaV7UkQ
	9K8PPPbGoVMOmFRdPkOyKWfKAEhnCI1Qgzn2dDNJsqRokEsb3lsf
X-Google-Smtp-Source: AGHT+IH+0CgiGwGItqTd6o2x/EYRf2Sxp2VpbmlzyQceVg/Y1UGKcCUWhUXijSSiGBomRVH/ZkKsJA==
X-Received: by 2002:a05:6a20:8f05:b0:1a3:c266:e7bd with SMTP id b5-20020a056a208f0500b001a3c266e7bdmr875064pzk.38.1711565398292;
        Wed, 27 Mar 2024 11:49:58 -0700 (PDT)
Received: from fedora (c-73-170-51-167.hsd1.ca.comcast.net. [73.170.51.167])
        by smtp.gmail.com with ESMTPSA id d13-20020a62f80d000000b006e5a915a9e7sm8387554pfh.10.2024.03.27.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:49:57 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:49:55 -0700
From: Vishal Moola <vishal.moola@gmail.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, willy@infradead.org,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH 4/6] mm: compaction: use isolate_movable_folio() in
 isolate_migratepages_block()
Message-ID: <ZgRqU9EvZfWR0nP1@fedora>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-5-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327141034.3712697-5-wangkefeng.wang@huawei.com>

On Wed, Mar 27, 2024 at 10:10:32PM +0800, Kefeng Wang wrote:
> This moves folio_get_nontail_page() before non-lru movable pages check,
> and directly call isolate_movable_folio() to save compound_head() calls,
> since the reference count of the non-lru movable page is increased, a
> folio_put() is need() whether the folio is isolated or not.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/compaction.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 807b58e6eb68..74ac65daaed1 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -1097,41 +1097,41 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  			}
>  		}
>  
> +		/*
> +		 * Be careful not to clear PageLRU until after we're
> +		 * sure the page is not being freed elsewhere -- the
> +		 * page release code relies on it.
> +		 */
> +		folio = folio_get_nontail_page(page);
> +		if (unlikely(!folio))
> +			goto isolate_fail;
> +

If you wanted to move this, I think this should be part of your first
patch (or prior to it). It would make your first patch be more sensible as
is. You could then also consider making isolate_movable_folio() more similar
to folio_isolate_lru() if you really wanted to.

>  		/*
>  		 * Check may be lockless but that's ok as we recheck later.
>  		 * It's possible to migrate LRU and non-lru movable pages.
>  		 * Skip any other type of page
>  		 */
> -		if (!PageLRU(page)) {
> +		if (!folio_test_lru(folio)) {
>  			/*
>  			 * __PageMovable can return false positive so we need
>  			 * to verify it under page_lock.
>  			 */
> -			if (unlikely(__PageMovable(page)) &&
> -					!PageIsolated(page)) {
> +			if (unlikely(__folio_test_movable(folio)) &&
> +					!folio_test_isolated(folio)) {
>  				if (locked) {
>  					unlock_page_lruvec_irqrestore(locked, flags);
>  					locked = NULL;
>  				}
>  
> -				if (isolate_movable_page(page, mode)) {
> -					folio = page_folio(page);
> +				if (isolate_movable_folio(folio, mode)) {
> +					folio_put(folio);
>  					goto isolate_success;
>  				}
>  			}
>  
> -			goto isolate_fail;
> +			goto isolate_fail_put;
>  		}
>  
> -		/*
> -		 * Be careful not to clear PageLRU until after we're
> -		 * sure the page is not being freed elsewhere -- the
> -		 * page release code relies on it.
> -		 */
> -		folio = folio_get_nontail_page(page);
> -		if (unlikely(!folio))
> -			goto isolate_fail;
> -
>  		/*
>  		 * Migration will fail if an anonymous page is pinned in memory,
>  		 * so avoid taking lru_lock and isolating it unnecessarily in an
> -- 
> 2.27.0
> 
> 
