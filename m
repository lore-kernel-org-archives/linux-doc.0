Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0999AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 02:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCD3461260
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 02:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238605AbhI1CZG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Sep 2021 22:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238592AbhI1CZG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Sep 2021 22:25:06 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681FFC061575
        for <linux-doc@vger.kernel.org>; Mon, 27 Sep 2021 19:23:27 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 203so17575543pfy.13
        for <linux-doc@vger.kernel.org>; Mon, 27 Sep 2021 19:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ooN16JrioNGlmqQw6vIIMRaz6CAOTTB0/ZNT5KnAics=;
        b=CbzCgNDLkTLm8G2E0VoWVuFUyaVIHenmxwWwkTlyBgpHtRcCTdFuJ/lkMB67/qor6A
         ytP5Fh0YB6ntGqrUTYpPV7Sq0VtK6mNyg1tzzftzDwyIdU9ST353XlwCzut3ff6FI95S
         NzR9Ng0nvon4rGosrGv4luX9qY1/8dcFFgODI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ooN16JrioNGlmqQw6vIIMRaz6CAOTTB0/ZNT5KnAics=;
        b=k1JVMINhDoqN0NRydGLIVFmER/08JgTK1XN0eKjee7ifep9HKBvv1bswAJyOoG0OdN
         ytxepZYMd+WMaqND2Myzs2T7mwo3iwKHZUjhcQG2uTj7Fkvyayd1jSYX/WR/agMA0dsI
         6BUMR9npP+Y8Km4P488ClS1FaVSJ+BeUwP9HjRSSwugsry4N8o6E0v55CMLrMu41lEvp
         dOfyn+2QUQsFEq/sjWfKlVAtkmhWn9QjJV6U9lC9IN4lShY9GY27Xu0c48Z/y0qpagpb
         MugnkAejvvVftstdiSSIfuRLJ738JfbBigvdxvqB5eIvnIyZzMKwGubOlmvd/UYG2bnw
         f34A==
X-Gm-Message-State: AOAM533k6l2DTik/4rAxmRZ/4IaxuA8g3BRLhGsuK7y0tF9buheSIjiC
        QfujL5kVm4ZIbKYRFXhO/GvNKw==
X-Google-Smtp-Source: ABdhPJz9q7h1zZF0H1p2F4KtS1JXYzYTplO3rpAIOYs3PKgNcVZQZl2eehV117fSYU9EPuWI4EEM1w==
X-Received: by 2002:a62:9242:0:b0:446:5771:7901 with SMTP id o63-20020a629242000000b0044657717901mr3121242pfd.81.1632795806931;
        Mon, 27 Sep 2021 19:23:26 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:2c64:ca0e:433e:ef5b])
        by smtp.gmail.com with ESMTPSA id z33sm19060544pga.20.2021.09.27.19.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 19:23:26 -0700 (PDT)
Date:   Tue, 28 Sep 2021 11:23:21 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Brian Geffon <bgeffon@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        Suleiman Souhlal <suleiman@google.com>,
        Jesse Barnes <jsbarnes@google.com>
Subject: Re: [PATCH v5] zram: Introduce an aged idle interface
Message-ID: <YVJ8mSOwdWzyqIMz@google.com>
References: <20210917210640.214211-1-bgeffon@google.com>
 <20210924161128.1508015-1-bgeffon@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924161128.1508015-1-bgeffon@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (21/09/24 09:11), Brian Geffon wrote:
[..]

Some silly nits:

> +static void mark_idle(struct zram *zram, ktime_t cutoff)
>  {
> -	struct zram *zram = dev_to_zram(dev);
> +	int is_idle = 1;
>  	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
>  	int index;
>  
> -	if (!sysfs_streq(buf, "all"))
> -		return -EINVAL;
> -
> -	down_read(&zram->init_lock);
> -	if (!init_done(zram)) {
> -		up_read(&zram->init_lock);
> -		return -EINVAL;
> -	}
> -
>  	for (index = 0; index < nr_pages; index++) {
>  		/*
>  		 * Do not mark ZRAM_UNDER_WB slot as ZRAM_IDLE to close race.
> @@ -314,14 +308,49 @@ static ssize_t idle_store(struct device *dev,
>  		 */
>  		zram_slot_lock(zram, index);
>  		if (zram_allocated(zram, index) &&
> -				!zram_test_flag(zram, index, ZRAM_UNDER_WB))
> -			zram_set_flag(zram, index, ZRAM_IDLE);
> +				!zram_test_flag(zram, index, ZRAM_UNDER_WB)) {
> +#ifdef CONFIG_ZRAM_MEMORY_TRACKING
> +				is_idle = (!cutoff || ktime_after(cutoff, zram->table[index].ac_time));

checkpatch "WARNING: suspect code indent for conditional statements (16, 32)"

Looks like `is_idle` is at one extra indent level.

> +#endif
> +			if (is_idle)
> +				zram_set_flag(zram, index, ZRAM_IDLE);
> +		}
>  		zram_slot_unlock(zram, index);
>  	}
> +}
>  
> -	up_read(&zram->init_lock);
> +static ssize_t idle_store(struct device *dev,
> +		struct device_attribute *attr, const char *buf, size_t len)
> +{
> +	struct zram *zram = dev_to_zram(dev);
> +	ktime_t cutoff_time = 0;
> +	ssize_t rv = -EINVAL;
>  
> -	return len;
> +	if (!sysfs_streq(buf, "all")) {
> +		/*
> +		 * If it did not parse as 'all' try to treat it as an integer when
> +		 * we have memory tracking enabled.
> +		 */
> +		u64 age_sec;

checkpatch "WARNING: Missing a blank line after declarations"

> +		if (IS_ENABLED(CONFIG_ZRAM_MEMORY_TRACKING) && !kstrtoull(buf, 0, &age_sec))
> +			cutoff_time = ktime_sub(ktime_get_boottime(),
> +					ns_to_ktime(age_sec * NSEC_PER_SEC));
> +		else
> +			goto out;
> +	}
> +
> +	down_read(&zram->init_lock);
> +	if (!init_done(zram))
> +		goto out_unlock;
> +
> +	/* A age_sec of 0 marks everything as idle, this is the "all" behavior */

	s/age_sec/cutoff_time/

> +	mark_idle(zram, cutoff_time);
> +	rv = len;
