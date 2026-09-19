Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8233B6F8
	for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789834096; cv=none; b=k9CARgMpGvVp48oM223l+FEC0D19Maz1/JRicOm3QbtgySKJNdEVGpipe8yxa8giW0MbhTsEOEJRZ82c7IhdhuZ1+D3GB9oAU7vpJ1DgxTCi+CEA+s2ibKJ5w/TmwXVg4EN6TMrn4/yvu5FD+qRkxuQijxjAAnSMAhK2oluKbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789834096; c=relaxed/simple;
	bh=EI5XLXPHTu/1vw3/pA66slomIjIqbs5I6JK37l78UKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/aC0xc+Apz01Q05OoloNoqzMcDhgJiq2WA6rYf/wq0NUa88WHDeCkIVH6VYT6Ik6tjOEhTEMCOETp9/2pZlz4KmqoY6ifFCRKnYjw1uplDcBezmY6p6AqZxQUu+ckOrZZrD0Nj5v/lOfm2XP5xpSPZU5zJJPAJGx79Of+OBqGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=krq+7ktc; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="krq+7ktc"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so159246585a.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789834094; x=1790438894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1ENvgPhr2wkBzngQIEflRDSjK2asd8jt545To7DKdg=;
        b=krq+7ktcJcLLxzPRR2XcRReeNPXnRQBlfY9D40yyZ1PoX6XqQrfVMQRq28NOhZu6nQ
         FxAEeEKHKoKC17VcAaJzcjBbqe6O4vOuJ7EmwhUAST8h+1YtrJjvUmcDNxetxKfQXa3X
         biLGbSMuG+EL7fNpdY70fn8l27CkAwtKZKtMEJTgUEeDSHuleryxJYC8naTW+CAeE7py
         jgow3/h5bieabnxtLl83h0WUXlYGVAycLao0fowUOk+1c6R8mtiaUAipg7MHO7ycoN1S
         DvRzj24bu4eKH+2TDkG3BUy8mGeRiAXTsCSpBPbQZtHZh7aD+fBOImapVUPz9QPYHpYP
         ZUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789834094; x=1790438894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1ENvgPhr2wkBzngQIEflRDSjK2asd8jt545To7DKdg=;
        b=HQJsBZE0GpDbz07oWUQ/h5TqgererLZSLiTcnKkjtVh3neKRLO45A+gODjnjXDyw3F
         ClhQ/87g9cvRBoi4IYhuRPbPEeQboiRU6q3B+fptgftnk3Ue2G5hyeEy8ABOs7FRX0Gm
         gtvIIIwpvVnvfwNu0GXbpfPLwm3BWn6f2h6dm4zOsoTQ2rAC2l7jMSfYbvqEIpCcj2o/
         i5c4j8SYIEfap5O7lK/1jMm3sXtdkXB6xyw+0JFTDOGTTBwthUFWZeUw1m33zgUfXLa2
         7MOnqvxnWB88r1yW2PDTrKhezMSPQzmM7nryjYf7iqFDpXkqDeL9twceuxh8DAKO3ACo
         wrmw==
X-Forwarded-Encrypted: i=1; AKwUvByBedt+jfGSqgNLix9+frsJeLOBC5HbxCHXqmc7XZaJXFd4Jd46WxVzd0n88B8xDplCJz9iHJu2u9I=@vger.kernel.org
X-Gm-Message-State: AFuF++mBgLtQs54Iu2EZQEDjpatH16mcPko8RNpkrgKlZNE5MJxhdYUB
	8vSO4OfhzQesf0CdhOOtnLssh9R4KOz7ZIRmDvzXOm+gX6hJDlULqLkKmTV/XtgBbHc=
X-Gm-Gg: AYBFou220F8MlK3O+GAR6BSa8sgkrT51x9Ub7tu1acgKYQY5AI1iqK+bdV4nc9D/10j
	8NQq1tq+k3unCAF92mV0kMxFjKsOkysKaRBrNy9O2C1h2bNgJ74nmSPJB3WLphoRumNo/bk7KMf
	p9ghFW5V0xKbHChiKaifFar8v9C2TAa5/D/jfe7E25NyJOrIW6Ip+eljQRq4pCxi8eC9Of4iCGp
	dhYOOyq6/H/otVU9PhDSfBEddc0W0hsjNwpGFc8JF/6ATdc59nUIlsCRt2W9uEO5UVs3aTsTEzd
	qeoajYMFouORU2ITlXTHhRzD6e8MDXQASpll6JbDjdZjpHNV/JxEmjA+vMcAm6yMb+L728DmfhG
	XOynRshjwijgT2xxkIYRFwnkD31OVLyblBKm45e2r4bdXeJvXQr8QR1OJrbgu7wAjfaWTa+gB47
	WUHoFmV3EIP6JwwF80QiA1z6rQrwKfscK9JrjC0JfjbhFgD8eqZHFrhTg6t6RTpVRy1S3Vat7Ba
	5UGA4dwJaCXIUVHbvFDQqk/BznIPUYMtwNKtIAbiq7p2zXzfep1RKA=
X-Received: by 2002:a05:620a:371e:b0:939:10dd:9c01 with SMTP id af79cd13be357-93bf5731121mr233734485a.38.1789834094077;
        Sat, 19 Sep 2026 09:08:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedb05a2esm213660485a.33.2026.09.19.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:08:13 -0700 (PDT)
Date: Sat, 19 Sep 2026 12:08:11 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Rik van Riel <riel@surriel.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>

On Sat, Sep 19, 2026 at 03:45:03AM -0500, Chris Li wrote:
> 
> I found this new concept of "compression space" very confusing to me.
> Can you explain the swap behavior and problem using only normal memory
> usage reduction and latency without introducing a new term or new
> metrics?
> 
> The normal user doesn't even know what compression space is, let alone
> what makes it transparent.
>

Sure they do - it's the amount of memory consumed by compressed data,
including the metadata associated with it.

converting Johannes statement to diagram:

>> Compression space is not a separate resource. It's page tables,
>> backing pages, and swap descriptors. It's just MEMORY. 

                          Page Data (PD)
  [page tables][                uncompressed page                  ]


                        Compressed Data (CD)
  [      recovered space     ][pte][swap meta data][compressed page]
                              |                                    |
                              |---------compression space----------|


                        Memory Pre-Compression
 |[  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ][  PD  ]|


			Memory Post-Compression
 |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
   ^----------------------------^
         Compression Space


It's actually really confusing to represent this space as a traditional
swap device - built on the assumption of a pre-defined size limit - when
that size limit has already been defined (the memory itself).

Baking any kind of pre-defined limit *into the infrastructure* (whether for
an optimization or ease of implementation) is what requires users to know
what compression space is.

Even using memory capacity at boot as a limit is wrong - hotplug exists.

> Why does the user need to care about compression space again?

They shouldn't need to, that's very much the point.

~Gregory
