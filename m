Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE53A1C6
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Bl0k2Xua"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c55872d80so23149795e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 06:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1702910677; x=1703515477; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WE6lIWDf/kPieQyyeHfgiHrbETC606qdiK73vUfwMAY=;
        b=Bl0k2XuacIk4dzhLT342dPZj7iTOmFYOYh/uGZYDbOV3WiccnKah/iVvjWbrjSa4cR
         sTe1DUV73SRkSYX97rkM6Q63PsZBFBV2FIljcMvnz1rycu9bYrfzQT9NDmDK1fCAnnPd
         QfX1F50yXnk+0EgROg1xUQNoqQ8qI9OcfMBTCgzADm8MedEEB76VuCkIocUjt+kPNlJc
         0tNMRfN22VFI/wUeAhA9uOOxu4sIF9riduBecB68+lsWAhTf5T1qtHF/4h3TzzWHN8Qg
         DItxQhKmf38wFtlQjn2klJ2B6kkIfIl/bmb+TsnIvDv04DaIa/El7PnGxXP8BGBadNhT
         g4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910677; x=1703515477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE6lIWDf/kPieQyyeHfgiHrbETC606qdiK73vUfwMAY=;
        b=cH1oDrH/CL53N799cd0fVB9s6WWTqj79uCllqunut2faR4/vNs2o8HgFjFMcYy2yvm
         4pntVJ04i/HHmrLG7XuPvLL4py8JhiUUP+150UC1Z3zHcyeEZ3XU2x0OWKGPph48Ixev
         534rxSBkVLrqQrkjUbUoUpA/5yMiNLv4EOsIyVXWMxDS4jJDxFGxVNEZJu6F09PUkJoN
         dEyDLyflPMw09E0EtcbrlmfmXS+AINhZQspEE9lNlJC+j/nbA+xVbMnBZD07DYjC2+B8
         J74NvJj6rR+DGLmYGwrz1x7+P8WpK3IKjl9cGux+z6QcPgGhuZ7ZC4FMBR6JwEDb+99y
         xA9Q==
X-Gm-Message-State: AOJu0Yz9Tj3xEAbfiWKCrxsxb96CYADNYcc5KmD6GHltWeF/L5FHJJv5
	pVzOIvOcAgEdrTL3CQwOrBMoaw==
X-Google-Smtp-Source: AGHT+IFCF0xM4rxtEjkGeNdb1pqxvZqkgbp76i4kF8Ih7/vn1FDsVKwbLgmryjhQY8w6tSGBJegf/w==
X-Received: by 2002:a7b:cd8e:0:b0:40c:269c:518f with SMTP id y14-20020a7bcd8e000000b0040c269c518fmr8241906wmj.115.1702910676582;
        Mon, 18 Dec 2023 06:44:36 -0800 (PST)
Received: from localhost ([2620:10d:c091:400::5:44d1])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c0a0e00b0040b3867a297sm43245191wmp.36.2023.12.18.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 06:44:36 -0800 (PST)
Date: Mon, 18 Dec 2023 15:44:31 +0100
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org,
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com,
	sjenning@redhat.com, ddstreet@ieee.org, vitaly.wool@konsulko.com,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, hughd@google.com, corbet@lwn.net,
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	david@ixit.cz, chrisl@kernel.org
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
Message-ID: <20231218144431.GB19167@cmpxchg.org>
References: <20231207192406.3809579-1-nphamcs@gmail.com>
 <CAJD7tkZXS-UJVAFfvxJ0nNgTzWBiqepPYA4hEozi01_qktkitg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkZXS-UJVAFfvxJ0nNgTzWBiqepPYA4hEozi01_qktkitg@mail.gmail.com>

On Fri, Dec 15, 2023 at 01:21:57PM -0800, Yosry Ahmed wrote:
> On Thu, Dec 7, 2023 at 11:24 AM Nhat Pham <nphamcs@gmail.com> wrote:
> >
> > During our experiment with zswap, we sometimes observe swap IOs due to
> > occasional zswap store failures and writebacks-to-swap. These swapping
> > IOs prevent many users who cannot tolerate swapping from adopting zswap
> > to save memory and improve performance where possible.
> >
> > This patch adds the option to disable this behavior entirely: do not
> > writeback to backing swapping device when a zswap store attempt fail,
> > and do not write pages in the zswap pool back to the backing swap
> > device (both when the pool is full, and when the new zswap shrinker is
> > called).
> >
> > This new behavior can be opted-in/out on a per-cgroup basis via a new
> > cgroup file. By default, writebacks to swap device is enabled, which is
> > the previous behavior. Initially, writeback is enabled for the root
> > cgroup, and a newly created cgroup will inherit the current setting of
> > its parent.
> >
> > Note that this is subtly different from setting memory.swap.max to 0, as
> > it still allows for pages to be stored in the zswap pool (which itself
> > consumes swap space in its current form).
> >
> > This patch should be applied on top of the zswap shrinker series:
> >
> > https://lore.kernel.org/linux-mm/20231130194023.4102148-1-nphamcs@gmail.com/
> >
> > as it also disables the zswap shrinker, a major source of zswap
> > writebacks.
> >
> > Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> > Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
> 
> Taking a step back from all the memory.swap.tiers vs.
> memory.zswap.writeback discussions, I think there may be a more
> fundamental problem here. If the zswap store failure is recurrent,
> pages can keep going back to the LRUs and then sent back to zswap
> eventually, only to be rejected again. For example, this can if zswap
> is above the acceptance threshold, but could be even worse if it's the
> allocator rejecting the page due to not compressing well enough. In
> the latter case, the page can keep going back and forth between zswap
> and LRUs indefinitely.
> 
> You probably did not run into this as you're using zsmalloc, but it
> can happen with zbud AFAICT. Even with zsmalloc, a less problematic
> version can happen if zswap is above its acceptance threshold.
> 
> This can cause thrashing and ineffective reclaim. We have an internal
> implementation where we mark incompressible pages and put them on the
> unevictable LRU when we don't have a backing swapfile (i.e. ghost
> swapfiles), and something similar may work if writeback is disabled.
> We need to scan such incompressible pages periodically though to
> remove them from the unevictable LRU if they have been dirited.

I'm not sure this is an actual problem.

When pages get rejected, they rotate to the furthest point from the
reclaimer - the head of the active list. We only get to them again
after we scanned everything else.

If all that's left on the LRU is unzswappable, then you'd assume that
remainder isn't very large, and thus not a significant part of overall
scan work. Because if it is, then there is a serious problem with the
zswap configuration.

There might be possible optimizations to determine how permanent a
rejection is, but I'm not sure the effort is called for just
yet. Rejections are already failure cases that screw up the LRU
ordering, and healthy setups shouldn't have a lot of those. I don't
think this patch adds any sort of new complications to this picture.
