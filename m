Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB073487
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 21:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xda6bzNz"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4affeacaff9so504633e0c.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702936381; x=1703541181; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qL6Hfk+uqwtN0FGrPdWYTs1ebhUVgd8KgkwFHPg64Lk=;
        b=xda6bzNzzW4pHjiWl2cr4q27zwriv7Lk7nh0aRxd0rBKE6kbj+ahAU7eSpMapWCQF0
         7RnsjZzc7lG1v/hifT3VQfRBPSZrIRmogtNSPrXr+Pb95V5SVH6gAx9MFKj0jWGghwBz
         vNhy1UtOBO6flGlVW1dtKYYB5mEMAfpvXKMvF/tMRQVMmWVbeclg7UWpxT1nVXVriO/4
         aOczS8ov4WkjwAbSbcAfR2LUtguNo89UQbpUoX8O+rJ/c5mJxGnxmtpdAfZ0j5RK1Jh/
         01m62CuQz1hm1gFHaWO1Oj5nrsJQDWy88Hbu0+lZR+aX6+ll3isofKkrFcRti7UQjtQk
         rkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702936381; x=1703541181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qL6Hfk+uqwtN0FGrPdWYTs1ebhUVgd8KgkwFHPg64Lk=;
        b=kfWdh/ZPZRizeOjH35XlS7gmc++H/b3RfKCY2Z2uEiS08F3k6t9O1bobsFE0Lw+SL2
         +LxJueKo+jIVfOPNk1zwYzc/STr+89IqoQ/xlAUtji0ubiRR+kYzKRQNs03YPEwgFRqF
         5OOCQr4153GoGxwyAPMM9WypIPKGTuNUYN0WjDCL9aFPqtBZZqy0dBr8RA5yn5OuImZb
         HrxmAUjvODcxM9nK2lYlROYD2GfuWvQusCwXivy51wdQOZM1ilAQ2hDzVu4uIR5IT02d
         OVMZcJIpKtIN1l4oqkRxlt5nn5mXoyR9vK869nUSSpqJwJwbRWArTLQb4SyHSbU5/X5p
         mrxA==
X-Gm-Message-State: AOJu0YzAd5gJEs6P0Kig7RPn5froRHUJ2fEJsXSWJfv9PW05I2LOoDYN
	QEJ3Uh+2FexS5hSS9iqS5hnuGKifq80TnmZDUi0I+w==
X-Google-Smtp-Source: AGHT+IGcfs4lSTJfkLGXzFhIGnzieJHv5rnAJxXnS53tFTrXJm63SMA3fMbE6syGwJ8lzSzgsSoOhpYioFVHH40cxnc=
X-Received: by 2002:a05:6122:4e90:b0:4b6:bb4c:ce57 with SMTP id
 gf16-20020a0561224e9000b004b6bb4cce57mr1756085vkb.6.1702936381100; Mon, 18
 Dec 2023 13:53:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <CAJD7tkZXS-UJVAFfvxJ0nNgTzWBiqepPYA4hEozi01_qktkitg@mail.gmail.com>
 <20231218144431.GB19167@cmpxchg.org>
In-Reply-To: <20231218144431.GB19167@cmpxchg.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 18 Dec 2023 13:52:23 -0800
Message-ID: <CAJD7tkakMjE1sNfexLzooptDyQS4YZf5DmuoywnSFD7JTbh9BA@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	lizefan.x@bytedance.com, cerasuolodomenico@gmail.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, chrisl@kernel.org, Wei Xu <weixugc@google.com>, 
	Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"

> > Taking a step back from all the memory.swap.tiers vs.
> > memory.zswap.writeback discussions, I think there may be a more
> > fundamental problem here. If the zswap store failure is recurrent,
> > pages can keep going back to the LRUs and then sent back to zswap
> > eventually, only to be rejected again. For example, this can if zswap
> > is above the acceptance threshold, but could be even worse if it's the
> > allocator rejecting the page due to not compressing well enough. In
> > the latter case, the page can keep going back and forth between zswap
> > and LRUs indefinitely.
> >
> > You probably did not run into this as you're using zsmalloc, but it
> > can happen with zbud AFAICT. Even with zsmalloc, a less problematic
> > version can happen if zswap is above its acceptance threshold.
> >
> > This can cause thrashing and ineffective reclaim. We have an internal
> > implementation where we mark incompressible pages and put them on the
> > unevictable LRU when we don't have a backing swapfile (i.e. ghost
> > swapfiles), and something similar may work if writeback is disabled.
> > We need to scan such incompressible pages periodically though to
> > remove them from the unevictable LRU if they have been dirited.
>
> I'm not sure this is an actual problem.
>
> When pages get rejected, they rotate to the furthest point from the
> reclaimer - the head of the active list. We only get to them again
> after we scanned everything else.
>
> If all that's left on the LRU is unzswappable, then you'd assume that
> remainder isn't very large, and thus not a significant part of overall
> scan work. Because if it is, then there is a serious problem with the
> zswap configuration.
>
> There might be possible optimizations to determine how permanent a
> rejection is, but I'm not sure the effort is called for just
> yet. Rejections are already failure cases that screw up the LRU
> ordering, and healthy setups shouldn't have a lot of those. I don't
> think this patch adds any sort of new complications to this picture.

We have workloads where a significant amount (maybe 20%? 30% not sure
tbh) of the memory is incompressible. Zswap is still a very viable
option for those workloads once those pages are taken out of the
picture. If those pages remain on the LRUs, they will introduce a
regression in reclaim efficiency.

With the upstream code today, those pages go directly to the backing
store, which isn't ideal in terms of LRU ordering, but this patch
makes them stay on the LRUs, which can be harmful. I don't think we
can just assume it is okay. Whether we make those pages unevictable or
store them uncompressed in zswap, I think taking them out of the LRUs
(until they are redirtied), is the right thing to do.

Adding Wei and Yu for more data about incompressible memory in our
fleet. Keep in mind that we have internal patches to cap the
compression ratio (i.e. reject pages where the compressed size +
metadata is not worth it, or where zsmalloc will store it in a full
page anyway). But the same thing can happen upstream with zbud.
