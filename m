Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741F31C2301
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732009926; cv=none; b=uEGamA3GjV+5P8J3XCxsiCjv8RHQvgF1NzwoI2T99zoYVDBvaLL/KEyxUz+28kRgANGRJimkE8ceWU9mKqnsf7SB+M0c0k+vGzelIcrfxz/lM5bWlKyrKGP/GWzPHLK1VZkUaivF1E34UUveLPQQ1bwNzSddjE4HNs8Y9iN/R6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732009926; c=relaxed/simple;
	bh=8mLQ2rCBH+GAOi6Nk/uqU/Mp5uXAM/2ZRkosO31Nz5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUiRrvp7wpBdJ/VeV7bUUZ6XaNsw3lW7OWcjPt0M5SOn0+wgnUp9H1lezNZcL1oFB11X8t3JBH33du9BuRe7yit0MkSOM+lKro9N35B7uvXvyO4Io7bQVGtt98tlNUvKblPXk1JTX+2tuJp/o6M9+6Iunk9rCmKseW8IBJxTlOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ublkt8ed; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ublkt8ed"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5740a03bso52143791fa.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732009922; x=1732614722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnf8A/XqBcrdKsiQYU4vdncgVm2DMj0IsCfqAngF824=;
        b=Ublkt8edesJ/WXZ3VtEZuazOwMPFY4EZDPetHXKMW0cbJa1PCTvN5FUR2PnUS1syqh
         UgfZzSNJN3NdrfoQoeUumgeuTXaUhkhyI8i1tp9F0gDMa+Z1xN6r+6Vi0koJKZNKkvuD
         brxn4GxJ7XfX1JzmsWkVgvM0THjoXL5rTQPJle07S8uf2S8vizEb2DTItJWfc50I/pcp
         f15xUBgEnSq18BZGBbvGuaVrWFIFvVWuX8ryuxNXNGuzdejAsHW6h+eLV3WfJN7Z90aS
         mu1xayC1u/6n+vAhNKw3N5UhO+mNFUF8/w9jCBq3Az3kuSdhnxS1AWJPKA2sujbeEDFy
         lwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732009922; x=1732614722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnf8A/XqBcrdKsiQYU4vdncgVm2DMj0IsCfqAngF824=;
        b=huPXlIgkpZcrqVphufxEno1wT9DY3OZFsvsCFxc9Y7uTlx35/Dths3StIGSWThwyyN
         yv0VtRQevAIvvF32eHxcIfUQocwRW0Tllm9fGZqyMsETYbfgGPjhnvwKwRjpPqZMOg49
         SJ/tM5AFu6eNY+96tG64ls9R+dt5RY10qMTfuJUWjJDyrJR7tARgnYrmGcKwR03LVqjn
         XYJd2NHjXsmjCaC+VIABw9/dGQxaK7vg22E+6Q+JCb5Wj3cCN4HC28hePl4ARbiiceYD
         vBVYvNFtnzhOgdKMOyK2qPg+C9KF9Oc4vg01/Oy0sUrmLCMfXc45lWOkT9CRNY9tD7zO
         5LWg==
X-Forwarded-Encrypted: i=1; AJvYcCXocTPiJlMIDV31VU7OyAFcWZWrwsb+FLZpG8EqOTLF1Nfll+DwmwFCVA1r7WY8m/1OSjwY3dE5VwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmZ5coq37yM7zzkFm4d9+Fll4GEaJHJFQd7OfOxAIL2gIctY9
	+y2ZoGjSMc/vmtNY0QtHck56fT+Ts8ctBQH+MhO0rbg8x4kSU8Y9j1s/sYfC4PU=
X-Google-Smtp-Source: AGHT+IGaBooF4z57mSfTSSt+M5NqMxgVnmBtpaHdYbGWEwqn6QjzmTszZdYOAtQKpgTJTFo9p6NUTQ==
X-Received: by 2002:a2e:be12:0:b0:2fb:5f9d:c296 with SMTP id 38308e7fff4ca-2ff60610087mr66873961fa.4.1732009920038;
        Tue, 19 Nov 2024 01:52:00 -0800 (PST)
Received: from localhost (109-81-88-120.rct.o2.cz. [109.81.88.120])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfbba90daesm2569211a12.74.2024.11.19.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:51:59 -0800 (PST)
Date: Tue, 19 Nov 2024 10:51:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: core-api/gfp_mask-from-fs-io: indicate that
 vmalloc supports GFP_NOFS/GFP_NOIO
Message-ID: <ZzxfvpvfNz9uzkJC@tiehlicka>
References: <20241119093922.567138-1-ptikhomirov@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119093922.567138-1-ptikhomirov@virtuozzo.com>

On Tue 19-11-24 17:39:01, Pavel Tikhomirov wrote:
> After the commit 451769ebb7e79 ("mm/vmalloc: alloc GFP_NO{FS,IO} for
> vmalloc") in v5.17 it is now safe to use GFP_NOFS/GFP_NOIO flags
> in [k]vmalloc, let's reflect it in documentation.
> 
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  .../core-api/gfp_mask-from-fs-io.rst          | 20 ++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/core-api/gfp_mask-from-fs-io.rst b/Documentation/core-api/gfp_mask-from-fs-io.rst
> index e7c32a8de126a..858b2fbcb36c7 100644
> --- a/Documentation/core-api/gfp_mask-from-fs-io.rst
> +++ b/Documentation/core-api/gfp_mask-from-fs-io.rst
> @@ -55,14 +55,16 @@ scope.
>  What about __vmalloc(GFP_NOFS)
>  ==============================
>  
> -vmalloc doesn't support GFP_NOFS semantic because there are hardcoded
> -GFP_KERNEL allocations deep inside the allocator which are quite non-trivial
> -to fix up. That means that calling ``vmalloc`` with GFP_NOFS/GFP_NOIO is
> -almost always a bug. The good news is that the NOFS/NOIO semantic can be
> -achieved by the scope API.
> +Since v5.17, and specifically after the commit 451769ebb7e79 ("mm/vmalloc:
> +alloc GFP_NO{FS,IO} for vmalloc"), GFP_NOFS/GFP_NOIO are now supported in
> +``[k]vmalloc`` by implicitly using scope API.
> +
> +In earlier kernels ``vmalloc`` didn't support GFP_NOFS semantic because there
> +were hardcoded GFP_KERNEL allocations deep inside the allocator. That means
> +that calling ``vmalloc`` with GFP_NOFS/GFP_NOIO was almost always a bug.
>  
>  In the ideal world, upper layers should already mark dangerous contexts
> -and so no special care is required and vmalloc should be called without
> -any problems. Sometimes if the context is not really clear or there are
> -layering violations then the recommended way around that is to wrap ``vmalloc``
> -by the scope API with a comment explaining the problem.
> +and so no special care is required and ``vmalloc`` should be called without any
> +problems. Sometimes if the context is not really clear or there are layering
> +violations then the recommended way around that (on pre-v5.17 kernels) is to
> +wrap ``vmalloc`` by the scope API with a comment explaining the problem.
> -- 
> 2.47.0

-- 
Michal Hocko
SUSE Labs
