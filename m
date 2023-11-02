Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13E11736
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="VT1P6la4"
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF11818E
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 13:50:24 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-41cc44736f2so7745271cf.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Nov 2023 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1698958224; x=1699563024; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjFA/lTrb2RR2WBQNGAEQ5Fm2mUeP6dfung0rZQmJYs=;
        b=VT1P6la4n/4Py7PLks1G/tORtMwmb2F5QCbIKM/LYcihoUVzNN0LnOXfd6/OBFv9O+
         v7lSclOsWWf8lmUVzw8lsR6T/r9H2Hf2KOyzDQ/TTpRCUcCd2ovNbBmBQz2STMdhd3/y
         rWcaTP+KXEeeovUq0qdWPTM7ElT9mg/QrTC/NjubTKut5fTJalOqeu6cFder8smxZJCs
         +L8NSZsu+mRsA2c02zJ3IWhMtGMKI/ItSSIp9KyvqCG3lqVIEvvktVN6RVmJNC5iSqgj
         ATxyrlrGzxpi07YQO+EQNVvLR5U5mYAgBJtD5mj6wjTe++XB+NiAzj3zKycGjsBc1m5W
         P9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698958224; x=1699563024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjFA/lTrb2RR2WBQNGAEQ5Fm2mUeP6dfung0rZQmJYs=;
        b=vNz3Tkjm7CnVs+nZvTCCvHux/5BfanELmG26aVbjxLcmnEYFrBxL1K1buFv/2HEAyx
         NGKTn6DDGBMBmyII4yq79plXWQpFrFsZQNiR4sxiQvanXk2osG6dkYmBjxiu0MFD43UZ
         y+hhM/1VVOK9yLWObwqJHyjw3ElMCgF6Fgr/z7Rho3yDlKw/qJJOWlUz/B+RG6Gku4nu
         S2fNF1iGXl22Esbi5utURqpsSZmEEgB5e8U1gWAmLdhmKMPKrxCBxhGyZMkd9r/khw3j
         otmqAW3PRDeDE+uDzd599Cau4+MhGmCMZGLDT/ikQuM9bIA0fMelg+ol1NNX0+OJIHRM
         Q04w==
X-Gm-Message-State: AOJu0YykIvgeXp8ODqsRUi6PBR45ENrsyqGxsTx7mWYWH9uwl4ViThzE
	fBuzuoZbZxOOtFAr94no4l1n3w==
X-Google-Smtp-Source: AGHT+IFGb/8wLOJtBh17J1Qw1Ibq47ILzQfU0jVLsKVmfCSc/2zYsX5gzXbTXKBKj/pIxvWyxCUarQ==
X-Received: by 2002:ac8:5cc7:0:b0:403:eb5b:1f6 with SMTP id s7-20020ac85cc7000000b00403eb5b01f6mr23952896qta.63.1698958223887;
        Thu, 02 Nov 2023 13:50:23 -0700 (PDT)
Received: from localhost ([2620:10d:c091:400::5:68cd])
        by smtp.gmail.com with ESMTPSA id jv12-20020a05622aa08c00b0041b016faf7esm76647qtb.58.2023.11.02.13.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 13:50:23 -0700 (PDT)
Date: Thu, 2 Nov 2023 16:50:22 -0400
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
	david@ixit.cz
Subject: Re: [RFC PATCH v2] zswap: memcontrol: implement zswap writeback
 disabling
Message-ID: <20231102205022.GA3265934@cmpxchg.org>
References: <20231102200202.920461-1-nphamcs@gmail.com>
 <CAJD7tkY8iPBo99+1gdsSRMNDu4jkVKz8rb=W+xk9=GE0y=kSuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkY8iPBo99+1gdsSRMNDu4jkVKz8rb=W+xk9=GE0y=kSuw@mail.gmail.com>

On Thu, Nov 02, 2023 at 01:27:24PM -0700, Yosry Ahmed wrote:
> On Thu, Nov 2, 2023 at 1:02 PM Nhat Pham <nphamcs@gmail.com> wrote:
> > @@ -201,6 +201,12 @@ int swap_writepage(struct page *page, struct writeback_control *wbc)
> >                 folio_end_writeback(folio);
> >                 return 0;
> >         }
> > +
> > +       if (!mem_cgroup_zswap_writeback_enabled(folio_memcg(folio))) {
> > +               folio_mark_dirty(folio);
> > +               return AOP_WRITEPAGE_ACTIVATE;
> > +       }
> > +
> 
> I am not a fan of this, because it will disable using disk swap if
> "zswap_writeback" is disabled, even if zswap is disabled or the page
> was never in zswap. The term zswap_writeback makes no sense here tbh.
> 
> I am still hoping someone else will suggest better semantics, because
> honestly I can't think of anything. Perhaps something like
> memory.swap.zswap_only or memory.swap.types which accepts a string
> (e.g. "zswap"/"all",..).

I had suggested the writeback name.

My thinking was this: from a user pov, the way zswap is presented and
described, is a fast writeback cache that sits on top of swap. It's
implemented as this lookaside thing right now, but that's never how it
was sold. And frankly, that's not how it's expected to work, either.

From the docs:

  Zswap is a lightweight compressed cache for swap pages.

  Zswap evicts pages from compressed cache on an LRU basis to the
  backing swap device when the compressed pool reaches its size limit.

When zswap is enabled, IO to the swap device is expected to come from
zswap. Everything else would be a cache failure. There are a few cases
now where zswap rejects and bypasses to swap. It's not a stretch to
call them accelerated writeback or writethrough. But also, these
represent failures and LRU inversions, we're working on fixing them.

So from a user POV it's reasonable to say if I have zswap enabled and
disable writeback, I don't expect swapfile IO.

But yes, if zswap isn't enabled at all, this shouldn't prevent pages
from going to swap.
